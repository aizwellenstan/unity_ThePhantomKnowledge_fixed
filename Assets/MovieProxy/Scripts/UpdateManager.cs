using System.Collections;
using System.Collections.Generic;
using System.Threading;
using UnityEngine;
using UnityEngine.Assertions;
using UnityEngine.Playables;
using System.Reflection;
using UnityEngine.Timeline;
using System;
using System.Text.RegularExpressions;
#if UNITY_EDITOR
using UnityEditor;
#endif

namespace UTJTimelineUtil
{
    
#if UNITY_EDITOR
    [InitializeOnLoad]
#endif
    public class UpdateManager
    {
        public enum JobOrder
        {
            Top,
            AboveNormal,
            Normal,
            BelowNormal,
            Final
        }
        
        public delegate void SetupBeforePlay();
        public delegate void SetupAfterPlay();

        public static double s_LasTime;
        public const uint NUM_THREAD = 3;
        private static Thread[] threads;
        private static int[] threadTickCounts;
        private static Thread mainThread = Thread.CurrentThread;
        private static List<BackGroundTask> s_BackGroundTaskQueue = new List<BackGroundTask>();
        private static Dictionary<JobOrder, List<PeriodicJob>> s_MainThreadJobQueue = new Dictionary<JobOrder, List<PeriodicJob>>();
        private static List<PeriodicJob> toBeAdded = new List<PeriodicJob>();
        private static bool m_bInitialized = false;
        private static bool s_bShutdown;
        private static Dictionary<PlayableDirector, PlayableDirectorStatus> s_directorStatusDictiornary = new Dictionary<PlayableDirector, PlayableDirectorStatus>();
        private static string s_AppDataPath;
        private static string s_StreamingAssetPath;
        public static event SetupBeforePlay m_SetupBeforePlayingDelegete = null;
        public static event SetupAfterPlay m_SetupAfterPlayingDelegete = null;
        private static JobOrder[] s_orders = new JobOrder[] {
            JobOrder.Top,
            JobOrder.AboveNormal,
            JobOrder.Normal,
            JobOrder.BelowNormal,
            JobOrder.Final,
        };
        static UpdateManager()
        {
#if UNITY_EDITOR
            foreach (var order in s_orders)
            {
                s_MainThreadJobQueue.Add(order, new List<PeriodicJob>());
            }
            InitInEditor();
#endif  //UNITY_EDITOR
        }



        static public bool IsInitialized()
        {
            return m_bInitialized;
        }

        [RuntimeInitializeOnLoadMethod(RuntimeInitializeLoadType.BeforeSceneLoad)]
        static internal void InitInRuntime()
        {

#if !UNITY_EDITOR
           UpdateManager.GetStreamingAssetPath(); // must be executed in main thread.          
           Assert.IsTrue(m_bInitialized == false);
           Util.Log("InitInRuntime()");
           StartThread();
           foreach (var order in s_orders)
           {
                s_MainThreadJobQueue.Add(order, new List<PeriodicJob>());
           }
           m_bInitialized = true;
#endif
        }


#if UNITY_EDITOR
        static void InitInEditor()
        {
            EditorApplication.playmodeStateChanged += ChangedPlaymodeState;
            EditorApplication.update += UpdateFromEditor;
        }


        static void ChangedPlaymodeState()
        {
            bool bIsPlaying = EditorApplication.isPlaying;
            bool bPlayingOrWillChangePlaymode = EditorApplication.isPlayingOrWillChangePlaymode;
            bool bIsPaused = EditorApplication.isPaused;

            if (bIsPaused )
            {
                return;
            }
            if ( bIsPlaying == false && bPlayingOrWillChangePlaymode == true )
            {
                StopThread();
                CallSetupBeforePlayingDelegate();
                // Util.Log("Play button was pressed.");
            }
            else if (bIsPlaying == true  && bPlayingOrWillChangePlaymode == true )
            {
                // Util.Log("Play was started.");
            }
            else if (bIsPlaying == true  && bPlayingOrWillChangePlaymode == false)
            {
                // started to play.
                // Util.Log("Stop is pressed");
            }
            else
            {
                CallSetupAfterPlayDelegate();
				// Util.Log("Play  stopped.");
            }


        }

        static void CallSetupBeforePlayingDelegate()
        {
            if (m_SetupBeforePlayingDelegete!= null)
            {
                m_SetupBeforePlayingDelegete();
            }
        }

        static void CallSetupAfterPlayDelegate()
        {
            if (m_SetupAfterPlayingDelegete != null)
            {
                m_SetupAfterPlayingDelegete();
            }
        }
        static void UpdateFromEditor()
        {
            
            if (!m_bInitialized)
            {
                StartThread();
                m_bInitialized = true;
            }
            var time = EditorApplication.timeSinceStartup;

            var timeDifference = time - s_LasTime;
            if (timeDifference < 0.016f)
            {
                return;
            }
            s_LasTime = time;

            List<PeriodicJob> toBeRemoved = new List<PeriodicJob>();
            foreach (var job in toBeAdded)
            {
                s_MainThreadJobQueue[job.m_order].Add(job);
            }
            toBeAdded.Clear();
            foreach (var order in s_orders)
            {
                var list = s_MainThreadJobQueue[order];
                foreach (var job in list)
                {
                    if (!job.m_InitializedFlag)
                    {
                        job.Initialize();
                        job.m_InitializedFlag = true;
                    }
                    job.Execute();
                    if (job.m_RemoveRequestFlag)
                    {
                        toBeRemoved.Add(job);
                    }
                }
            }


            foreach (var job in toBeRemoved)
            {
                RemovePeriodicJob(job);
            }

        }

#endif  //UNITY_EDITOR
        static internal int GetThreadTickCount(int index)
        {
            if ( threadTickCounts != null )
            {
                return threadTickCounts[index];
            }
            return -1;
        }


        public static bool QueueBackGroundTask(BackGroundTask task)
        {
            lock (s_BackGroundTaskQueue)
            {
                s_BackGroundTaskQueue.Add(task);
            }
            return true;
        }

        public static bool AddPeriodicJob(PeriodicJob job)
        {
            toBeAdded.Add(job);  
            return true;
        }

        public static bool RemovePeriodicJob( PeriodicJob job)
        {
            Assert.IsTrue(s_MainThreadJobQueue[job.m_order].Contains(job));
            s_MainThreadJobQueue[job.m_order].Remove(job);
            job.Cleanup();
            return true;
        }
        public static bool IsMainThread()
        {
            return (mainThread == Thread.CurrentThread);
        }

        static void StartThread()
        {
            threads = new Thread[NUM_THREAD];
            threadTickCounts = new int[NUM_THREAD];
            for (int i = 0; i < NUM_THREAD; i++)
            {
                threads[i] = new Thread(ThreadFunction);

            }
            for (int i = 0; i < NUM_THREAD; i++)
            {
                threads[i].Start(i);
            }
        }
             

    	static void ThreadFunction(object arg)
        {
            var id = Thread.CurrentThread.ManagedThreadId;

            while (!s_bShutdown)
            {
                int index = Convert.ToInt32(arg);
                int val = threadTickCounts[index]++;
                val++;
                threadTickCounts[index] = val;

                Util.Log("alive " + id);
                BackGroundTask task = null;
                
                if ( s_BackGroundTaskQueue.Count > 0)
                {
                    lock (s_BackGroundTaskQueue)
                    {
                        if (s_BackGroundTaskQueue.Count > 0)
                        {
                            task = s_BackGroundTaskQueue[0];
                            s_BackGroundTaskQueue.RemoveAt(0);
                        }
                    }
                    if (task != null)
                    {
                        task.Execute();
                    }
                }
                else
                {
                    Thread.Sleep(16);
                }
                if ( threads == null )
                {
                    return; // play button.
                }
                   


            }
        }

        static void StopThread()
        {

            s_bShutdown = true;
            if ( threads != null )
            {
                for (int ii = 0; ii < NUM_THREAD; ii++)
                {
                    if (threads[ii] != null)
                    {
                           threads[ii].Join();
                    }
                }
            }
            else
            {
                Util.Log("Unalbe to stop thread by user program!");

            }
            s_bShutdown = false;
        }
        static public string GetApplicationDataPath()
        {
            
            // Application.dataPath cant be used in back thread, so we cache it hire.
            if (s_AppDataPath == null)
            {
                s_AppDataPath = Application.dataPath;
            }
            return s_AppDataPath;
        }


        static public string GetProjectFolder()
        {
            Regex regAssetFolder = new Regex("/Assets$");
            var strPorjectFolder = UpdateManager.GetApplicationDataPath(); //  Application.dataPath; cant use this in back thread;
            strPorjectFolder = regAssetFolder.Replace(strPorjectFolder, "");

            return strPorjectFolder;
        }

        static public string ToRelativePath( string strAbsPath )
        {
            string newPath = strAbsPath.Remove(0, GetProjectFolder().Length);
            while ( newPath.StartsWith("/"))
            {
                newPath = newPath.Remove(0, 1);
            }
            return newPath;
        }

        static public string GetStreamingAssetPath()
        {
            if ( s_StreamingAssetPath == null )
            {
                s_StreamingAssetPath = Application.streamingAssetsPath;
            }
            return s_StreamingAssetPath;
        }
#if UNITY_EDITOR
        static public PlayableDirector GetCurrentDirector()
        {

            EditorWindow timelineWindow = UpdateManager.GetTimelineWindow();

            if (timelineWindow == null)
            {
                return null;
            }
            var bf = BindingFlags.Public | BindingFlags.NonPublic | BindingFlags.Instance | BindingFlags.GetField;
            var type = timelineWindow.GetType();
            var info = type.GetProperty("state", bf);
            var val = info.GetValue(timelineWindow, null);

            type = val.GetType();
            info = type.GetProperty("currentDirector", bf);
            val = info.GetValue(val, null);

            return val as PlayableDirector;
        }

        static public EditorWindow GetTimelineWindow()
        {
            EditorWindow timelineWindow = null;

            var sequenceWindowArray = Resources.FindObjectsOfTypeAll<EditorWindow>();
            if (sequenceWindowArray == null)
            {
                PluginUtil.HideAllOverwrapWindows();
                return null;
            }
            foreach (var w in sequenceWindowArray)
            {
                if (w.GetType().ToString() == "UnityEditor.Timeline.TimelineWindow")
                {
                    timelineWindow = w;
                    break;
                }
            }
            if (timelineWindow == null)
            {
                PluginUtil.HideAllOverwrapWindows();
            }
            return timelineWindow;
        }
#endif

        static public List<TrackAsset> GetTrackList(PlayableDirector director)
        {
            TimelineAsset playbleAsset = director.playableAsset as TimelineAsset;
            return GetTrackList(playbleAsset);
        }


        static public List<TrackAsset> GetTrackList(TimelineAsset timelineAsset)
        {
            Assert.IsTrue(timelineAsset == true);
            var bf = BindingFlags.Public | BindingFlags.NonPublic | BindingFlags.Instance | BindingFlags.GetField;
            var type = timelineAsset.GetType();
            var info = type.GetProperty("tracks", bf);
            Assert.IsTrue(info.PropertyType.IsGenericType);
            var list = (List<TrackAsset>)info.GetValue(timelineAsset, null);
            return list;
        }

        static public List<TrackAsset> GetTrackList(GroupTrack groupTrack)
        {

            var bf = BindingFlags.Public | BindingFlags.NonPublic | BindingFlags.Instance | BindingFlags.GetField;
            var type = groupTrack.GetType().BaseType;
            var fieldInfo = type.GetField("m_Children", bf);
            var clips = fieldInfo.GetValue(groupTrack);

            return clips as List<TrackAsset>;
        }

        public static bool IsDirectorIdle(PlayableDirector director)
        {
            if (director == null)
            {
                return true;
            }

            if (s_directorStatusDictiornary.ContainsKey(director))
            {


            }
            else
            {
                s_directorStatusDictiornary.Add(director, new PlayableDirectorStatus());
            }
            if (director.time - s_directorStatusDictiornary[director].m_lastDirectorTick < 0.01f)
            {
                s_directorStatusDictiornary[director].m_lastDirectorTick = director.time;
                return true;
            }
            s_directorStatusDictiornary[director].m_lastDirectorTick = director.time;
            return false;
        }

		static public bool useCoroutine
		{
			get {
				return false;
			}

		}
    }

    public class PlayableDirectorStatus
    {
        public double m_lastDirectorTick = -0.02f;
    }


    public abstract class BackGroundTask
    {
        public abstract void Execute();
    }

    public abstract class PeriodicJob
    {
        public UpdateManager.JobOrder m_order;
        internal bool m_RemoveRequestFlag;
        internal bool m_InitializedFlag;
        public abstract void Execute();
        public abstract void Initialize();
        public abstract void Cleanup(); // Uninitialize

        private PeriodicJob()
        {

        }
        public  PeriodicJob(UpdateManager.JobOrder order)
        {
            m_order = order;
        }
        public void AddToUpdateManger()
        {
            UpdateManager.AddPeriodicJob( this);
        }

        public void RemoveFromUpdateManager()
        {
            UpdateManager.RemovePeriodicJob(this);
        }

        public void RemoveIfFinished()
        {
            m_RemoveRequestFlag = true;
        }
    }

}
