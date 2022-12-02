using System.Collections;
using System.Collections.Generic;
using System;
using System.IO;
using UnityEngine;
using UnityEngine.Playables;
using System.Text.RegularExpressions;
using UnityEngine.Assertions;
using System.Threading;
using System.Runtime.InteropServices;
using UnityEngine.UI;
using UnityEngine.Timeline;
#if UNITY_EDITOR
using UnityEditor;
#endif

namespace UTJTimelineUtil
{

    // A behaviour that is attached to a playable

    public class MovieProxyPlayableMixer : PlayableBehaviour
	{

		internal PlayableDirector m_PlayableDirector;

        private bool m_IsTexSet = false;
        private double m_loadStartOffsetTime = -1.0;
#if UNITY_EDITOR
        EditorWindow m_gameView;
#endif
        private GameObject m_BoundGameObject;
        private int[] m_nextInadvanceLoadingFrameArray;
        public GameObject boundGameObject
        {
            get { return m_BoundGameObject; }
            set
            {
                m_BoundGameObject = value;

            }
        }
        public MovieProxyPlayableMixer()
        {

#if UNITY_EDITOR
            System.Reflection.Assembly assembly = typeof(UnityEditor.EditorWindow).Assembly;
            Type type = assembly.GetType("UnityEditor.GameView");
            m_gameView = EditorWindow.GetWindow(type);
#endif
            m_loadStartOffsetTime = -1.0;
        }

#if false
        // Called when the owning graph starts playing
        public override void OnGraphStart(Playable playable)
        {

        }

        // Called when the owning graph stops playing
        public override void OnGraphStop(Playable playable)
        {

        }

        // Called when the state of the playable is set to Play
        public override void OnBehaviourPlay(Playable playable, FrameData info)
        {

        }

        // Called when the state of the playable is set to Paused
        public override void OnBehaviourPause(Playable playable, FrameData info)
        {

        }

        // Called each frame while the state is set to Play
        public override void PrepareFrame(Playable playable, FrameData info)
        {
        }

        public override void OnPlayableCreate(Playable playable)
        {
        }

        public override void OnPlayableDestroy(Playable playable)
        {
        }

#endif

        internal void InitTexture(TimelineClip clip)
        {
            if (!m_IsTexSet)
            {
                Assert.IsTrue(clip != null);
                var asset = clip.asset as MovieProxyPlayableAsset;
                m_IsTexSet = asset.SetTexture(m_BoundGameObject, 0, false, m_IsTexSet);
            }
        }



        public override void ProcessFrame(Playable playable, FrameData info, object playerData)
        {



            int inputCount = playable.GetInputCount<Playable>();
            if (inputCount == 0)
            {
                return; // it doesn't work as mixer.
            }

            if (m_nextInadvanceLoadingFrameArray == null)
            {
                m_nextInadvanceLoadingFrameArray = new int[inputCount];
                for ( int ii = 0;ii< inputCount;ii++)
                {
                    m_nextInadvanceLoadingFrameArray[ii] = 0;
                }
            }

            if (m_BoundGameObject == null)
            {
                var renderer = playerData as MovieProxyNativeRenderer;
                if (renderer != null)
                {
                    m_BoundGameObject = renderer.gameObject;
                }
            }

            if (m_BoundGameObject == null)
            {
                return;
            }



            if (
                (m_BoundGameObject.GetComponent<MeshRenderer>())  == null
                && (m_BoundGameObject.GetComponent<Image>()) == null 
                && (m_BoundGameObject.GetComponent<SpriteRenderer>()) == null)
            {
                return;
            }

            // it is working as mixer.
            var time = m_PlayableDirector.time;

			// find which index is the first.
			float startS = 999999999.0f;
			int startIndex = -1;
			for (int ii = 0; ii < inputCount; ii++) 
			{
				var myScriptPlayable = (ScriptPlayable<MovieProxyPlayableBehaviour>)playable.GetInput(ii);
				var myBehaviour = myScriptPlayable.GetBehaviour();
				var clip = myBehaviour.m_clip;

				float startTime = (float)clip.start;
				if (startTime < startS) 
				{
					startS = startTime;
					startIndex = ii;
				}
			}


            for (int ii = 0; ii < inputCount; ii++)
            {

                var myScriptPlayable = (ScriptPlayable<MovieProxyPlayableBehaviour>)playable.GetInput(ii);
                var myBehaviour = myScriptPlayable.GetBehaviour();
                var clip = myBehaviour.m_clip;




                var asset = clip.asset as MovieProxyPlayableAsset;
                float count = asset.Pictures.Length;
                int index = 0;
                var clipDuration = clip.duration;
                var startTime = clip.start;
                var endTime = clip.end;

                if (UpdateManager.useCoroutine )
                {
                    startTime -= 1.0 / 60.0;
                    endTime -= 1.0 / 60.0;
                }
                if ( m_loadStartOffsetTime < 0.0)
                {
                    m_loadStartOffsetTime = 1.0f + count * 0.1f;

                }

				if ( time >= startTime - m_loadStartOffsetTime && time < endTime)
                {
					if (ii == startIndex )
                    {
                        InitTexture(clip); // try to ceate texture instance.
                    }

                     ProcessInAdvanceLoading(time, clip, ii );
                }






				if (time >= startTime && time < endTime)
                {
					float rate = (float)(time - startTime);
					float now = (float)count * (float)rate / (float)clipDuration;
					index = (int)now;
					if (index < 0) 
					{
						index = 0;
					}
                    if (index >= count)
                    {
                        index = (int)count - 1;
                    }


                    m_IsTexSet = asset.SetTexture(m_BoundGameObject, index, false, m_IsTexSet);
#if UNITY_EDITOR
                    if (m_IsTexSet)
                    {
                        if (!EditorApplication.isPlaying)
                        {
                            m_gameView.Repaint();
                        }
                    }
#endif

                }
            }
        }

        private void ProcessInAdvanceLoading(double time, TimelineClip clip, int index)
        {
            var asset = clip.asset as MovieProxyPlayableAsset;
            int count = asset.Pictures.Length;


            if (m_nextInadvanceLoadingFrameArray[index] < count)
            {
                for (int check = 0; check < 4; check++)
                {

                    if (m_nextInadvanceLoadingFrameArray[index] >= 0 && m_nextInadvanceLoadingFrameArray[index] <= count)
                    {
                        if (!asset.IsLoadRequested(m_nextInadvanceLoadingFrameArray[index]))
                        {
                            StReadResult result = new StReadResult();
                            asset.LoadRequest(m_nextInadvanceLoadingFrameArray[index], false, out result);
                        }
                    }
                    m_nextInadvanceLoadingFrameArray[index]++;
                    if (m_nextInadvanceLoadingFrameArray[index] >= count)
                    {
                        break;
                    }

                }
            }

        }

        public void ResetTexturePtr()
        {
 
        }

        static public void ResetAllTexturePtr()
        {
            PluginUtil.ResetAllLoadedTexture();
        }


    }



}