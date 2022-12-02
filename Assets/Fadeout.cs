using System.Collections;
using System.Collections.Generic;
using UnityEngine;
using UnityEngine.Playables;
using UnityEngine.Timeline;
using UnityEngine.UI;


[System.Serializable]
public class Fadeout : PlayableAsset, ITimelineClipAsset
{
	public ExposedReference<Image> image;
	public Color color = Color.black;
	public bool nofade = false;

	[SerializeField] FadeType type = FadeType.FadeIn;

	// Create the runtime version of the clip, by creating a copy of the template
	public override Playable CreatePlayable (PlayableGraph graph, GameObject go)
	{
		var playable = ScriptPlayable<FadeoutPlayable>.Create (graph);
		playable.GetBehaviour ().image = image.Resolve (graph.GetResolver ());
		playable.GetBehaviour ().fadeType = type;
		playable.GetBehaviour ().color = color;
		playable.GetBehaviour ().nofade = nofade;

		return playable;
	}

	public ClipCaps clipCaps {
		get { return ClipCaps.None; }
	}
}
