using System.Collections;
using System.Collections.Generic;
using UnityEngine;
using UnityEngine.Playables;
using UnityEngine.Timeline;

// The instance of the clip for a playing timeline
using UnityEngine.UI;


[System.Serializable]
public class FadeoutPlayable : PlayableBehaviour
{
	public Image image;
	public FadeType fadeType;
	public bool nofade = false;

	public Color color;

	public override void PrepareFrame (Playable playable, FrameData info)
	{
		float alpha = 0;
		if (nofade) {
			alpha = (float)(fadeType == FadeType.FadeOut ? 1 : 0);
		} else {
			var time = GetNormalizedTime (playable);
			alpha = (float)(fadeType == FadeType.FadeOut ? time : 1 - time);
		}

		color.a = alpha;
		image.color = color;
	}

	public override void OnBehaviourPlay (Playable playable, FrameData info)
	{
		var time = GetNormalizedTime (playable);
		if (time > 0.3f && fadeType == FadeType.FadeOut ||
		    time < 0.7f && fadeType == FadeType.FadeIn) {
			color.a = 1;
		} else {
			color.a = 0;
		}
		image.color = color;
	}

	public override void OnBehaviourPause (Playable playable, FrameData info)
	{
		var time = GetNormalizedTime (playable);
		if (time > 0.3f && fadeType == FadeType.FadeIn ||
		    time < 0.7f && fadeType == FadeType.FadeOut) {
			color.a = 0;
		} else {
			color.a = 1;
		}
		image.color = color;
	}

	double GetNormalizedTime (Playable playable)
	{
		return playable.GetTime () / playable.GetDuration ();
	}
}

public enum FadeType
{
	FadeIn,
	FadeOut
}