using System.Collections;
using System.Collections.Generic;
using UnityEngine;
using UnityEngine.Playables;
using UnityEngine.Timeline;
using UnityEngine.UI;

namespace UTJTimelineUtil
{

    [TrackClipType(typeof(FaderPlayableAsset))]
    [TrackBindingType(typeof(Image))]
    [TrackMediaType(TimelineAsset.MediaType.Script)]
    [TrackColor(0.263f, 0.09f, 0.263f)]

    public class FaderTrack : TrackAsset
    {

        protected override Playable CreatePlayable(PlayableGraph graph, GameObject go, TimelineClip clip)
        {
            var playable = (ScriptPlayable<FaderPlayableBehaviour>)base.CreatePlayable(graph, go, clip);
            var myBehaviour = playable.GetBehaviour() as FaderPlayableBehaviour;
            myBehaviour.m_clip = clip;
            return playable;
        }

        public override Playable CreateTrackMixer(PlayableGraph graph, GameObject go, int inputCount)
        {
            var mixer = ScriptPlayable<FaderPlayableMixer>.Create(graph, inputCount);
            var director = go.GetComponent<PlayableDirector>();
            if ( director != null )
            {
                var outputGo = director.GetGenericBinding(this) as Image;
                FaderPlayableMixer bh = mixer.GetBehaviour();
                if ( outputGo != null )
                {
                    bh.boundGameObject = outputGo.gameObject;
                    bh.m_initialColor = outputGo.color;
                }
                bh.m_PlayableDirector = director;
            }
            return mixer;
        }
    }

}