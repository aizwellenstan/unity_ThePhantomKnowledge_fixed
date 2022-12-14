using System.Collections;
using System.Collections.Generic;
using System;
using System.Threading;
using System.Runtime.InteropServices;
using UnityEngine;
using UnityEngine.Assertions;
using System.IO;

namespace UTJTimelineUtil
{


    public class BGJobCacheChecker : BackGroundTask
    {

        BGJobCacheParam m_param;

        public BGJobCacheChecker( BGJobCacheParam param )
        {
            m_param = param;
            UpdateManager.QueueBackGroundTask(this);
        }
        public override void Execute()
        {
            StReadResult tResult = new StReadResult();

            int loaded = 0;
            for ( int ii = 0; ii < m_param.m_collorArray.Length; ii++ )
            {
                string fileName = m_param.m_asset.Pictures[ii];
                //m_collorArray[ii] = notYet;
                if ( PluginUtil.GetNativTextureInfo(m_param.m_asset.GetCompleteFilePath(fileName), out tResult) != IntPtr.Zero)
                {
                    if ( tResult.readStatus == 2 )
                    {
                        m_param.m_collorArray[ii] = 0xffffffff;
                        loaded ++;
                    }
                }

            }

            int length = m_param.m_collorArray.Length;
            if (loaded == length)
            {
                m_param.m_allLoaded = true;
            }
            else if ( m_param.m_asset.m_loadingIndex == length)
            {
                // this is neccessary if script files are rebuilt while thread is execuiting in editor.
                m_param.m_asset.m_loadingIndex = -1;
#if UNITY_EDITOR
                //                Util.Log("Fetched the situation");
#endif
            }

        }
    }

    public class BGJobCacheParam
    {
        public MovieProxyPlayableAsset m_asset;
        public UInt32[] m_collorArray;
        public Texture2D m_tex2D;
        public bool m_allLoaded;

 //       public GUIStyle m_style;
        public BGJobCacheParam(MovieProxyPlayableAsset asset)
        {
           m_asset = asset;
            m_collorArray = new UInt32[m_asset.Pictures.Length];

            m_tex2D = new Texture2D(m_asset.Pictures.Length, 1);
            m_allLoaded = false;
 //           m_style = new GUIStyle(GUI.skin.box); 
        }
    }

}
