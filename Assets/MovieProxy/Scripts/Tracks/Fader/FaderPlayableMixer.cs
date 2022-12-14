using System.Collections;
using System.Collections.Generic;
using UnityEngine;
using UnityEngine.UI;
using UnityEngine.Playables;
using UnityEngine.Timeline;

namespace UTJTimelineUtil
{
    // A behaviour that is attached to a playable
    public class FaderPlayableMixer : PlayableBehaviour
    {
        internal PlayableDirector m_PlayableDirector;
        internal TimelineClip m_clip;
        internal Color m_initialColor;
 
        private GameObject m_BoundGameObject;

        public GameObject boundGameObject
        {
            get { return m_BoundGameObject; }
            set
            {
                m_BoundGameObject = value;

            }
        }
        

        // Called when the owning graph starts playing
        public override void OnGraphStart(Playable playable)
        {
            SetInitialColor(playable);
        }

        // Called when the owning graph stops playing
        public override void OnGraphStop(Playable playable)
        {
            SetInitialColor(playable);
        }

#if false
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
#endif
        public override void ProcessFrame(Playable playable, FrameData info, object playerData)
        {
            int inputCount = playable.GetInputCount<Playable>();
            if (inputCount == 0 )
            {
                return; // it doesn't work as mixer.
            }
            if (boundGameObject == null )
            {
                return;
            }
            Image image = boundGameObject.GetComponent<Image>();
            if ( image == null )
            {
                return;
            }
            float fade = 1.0f;
            Color color = m_initialColor;
            // it is working as mixer.
            var time = m_PlayableDirector.time;
            for (int ii = 0; ii < inputCount; ii++)
            {
                var myScriptPlayable = (ScriptPlayable<FaderPlayableBehaviour>)playable.GetInput(ii);
                var myBehaviour = myScriptPlayable.GetBehaviour();
                var clip = myBehaviour.m_clip;
                var asset = clip.asset as FaderPlayableAsset;

                color = asset.m_color;
                if ( time >= clip.start && time <= clip.end)
                {
                    fade = (float)((time - clip.start) / clip.duration);
                    if ( asset.m_type == FadeType.FadeIn)
                    {
                        fade = 1.0f - fade;
                    }
                    break;
                }
                else if (time > clip.end)
                {
                    fade =  1.0f;
                    if (asset.m_type == FadeType.FadeIn)
                    {
                        fade = 1.0f - fade;
                    }
                }
            }
            color.a = fade;
            image.color = color;
        }
        private void SetInitialColor(Playable playable)
        {
            if (boundGameObject == null)
            {
                return;
            }

            Image image = boundGameObject.GetComponent<Image>();

            if (playable.GetInputCount<Playable>() > 0)
            {
                var myScriptPlayable = (ScriptPlayable<FaderPlayableBehaviour>)playable.GetInput(0);
                var myBehaviour = myScriptPlayable.GetBehaviour();
                if (myBehaviour == null )
                {
                    return;
                }
                var clip = myBehaviour.m_clip;
                var asset = clip.asset as FaderPlayableAsset;

                m_initialColor = asset.m_color;

                if (image != null )
                {
                    image.color = m_initialColor;
                }
            }

        }
    }
}