using System.Collections;
using System.Collections.Generic;
using System.IO;
using UnityEngine;
using UnityEngine.Playables;

public class Capturerer : MonoBehaviour {

    PlayableDirector m_director;
#if UNITY_EDITOR
    [FolderPathAttribute]
#endif
    public string m_FolderName;
    public string m_baseFileName;
    public int m_scale = 2;
    int m_index = 0;
	// Use this for initialization
	void Start () {
        m_director = GetComponent<PlayableDirector>();
        if (m_director == null)
            return;
        m_index = 0;
        int frameRate = 60 / QualitySettings.vSyncCount; //
        Time.captureFramerate = frameRate; // m_director.playableAsset.editorSettings
    }
	
	// Update is called once per frame
	void Update () {
        if (m_director == null )
        {
            return;
        }
		if ( Application.isPlaying )
        {
            if ( m_director.timeUpdateMode == DirectorUpdateMode.GameTime)
            {
                if (! m_director.playableGraph.IsValid())
                {
                    return;
                }
                if ( m_director.playableGraph.IsPlaying()  && !m_director.playableGraph.IsDone())
                {
                    string filename = Path.Combine(m_FolderName, m_baseFileName);
                    string digit = string.Format("{0:D10}", m_index++);

                    ScreenCapture.CaptureScreenshot(filename + digit + ".png");
                }
            }
        }
	}
}
