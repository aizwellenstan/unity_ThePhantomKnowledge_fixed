using System.Collections;
using System.Collections.Generic;
using UnityEngine;
using UnityEngine.Playables;
using UnityEngine.Timeline;
namespace UTJTimelineUtil
{ 
    [TrackClipType(typeof(MovieProxyPlayableAsset))]
    [TrackBindingType(typeof(MovieProxyNativeRenderer))]
    [TrackMediaType(TimelineAsset.MediaType.Script)]
    [TrackColor(0.776f, 0.263f, 0.09f)]
    public class MovieProxyTrack : TrackAsset
    {
        LoaderPeriodicJob m_LoaderPeriodicJob;
        public MovieProxyTrack()
        {
            Util.Log("MovieProxyTrack creating ObserverPeriodicJob");
            m_LoaderPeriodicJob = new LoaderPeriodicJob(this);
            m_LoaderPeriodicJob.AddToUpdateManger();
            // above job is removed when finished to load by calling RemoveIfFinished();
        }
        protected override Playable CreatePlayable(PlayableGraph graph, GameObject go, TimelineClip clip)
        {
            var playable = (ScriptPlayable<MovieProxyPlayableBehaviour>)base.CreatePlayable(graph, go, clip);
            var myBehaviour = playable.GetBehaviour() as MovieProxyPlayableBehaviour;
            myBehaviour.m_clip = clip;
            return playable;
        }

        public override Playable CreateTrackMixer(PlayableGraph graph, GameObject go, int inputCount)
        {
            var mixer = ScriptPlayable<MovieProxyPlayableMixer>.Create(graph, inputCount);
            var director = go.GetComponent<PlayableDirector>();
            if (director != null)
            {
                var outputGo = director.GetGenericBinding(this) as MovieProxyNativeRenderer;
                MovieProxyPlayableMixer bh = mixer.GetBehaviour();
                if (outputGo != null)
                {
                    bh.boundGameObject = outputGo.gameObject;
                }
                bh.m_PlayableDirector = director;

            }
            return mixer;
        }

    }

}