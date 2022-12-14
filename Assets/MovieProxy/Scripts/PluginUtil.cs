using System.Collections;
using System.Collections.Generic;
using UnityEngine;
using System;
using System.Runtime.InteropServices;

namespace UTJTimelineUtil
{
    [StructLayout(LayoutKind.Sequential, CharSet = CharSet.Unicode, Pack = 8)]
    public struct StReadResult
    {
        public IntPtr buffer;
        [MarshalAs(UnmanagedType.I4)]
        public int width;
        [MarshalAs(UnmanagedType.I4)]
        public int height;
        [MarshalAs(UnmanagedType.I4)]
        public int readStatus;
    };

    public enum EnLoadStatus
    {
        Uninitialized,
        Requested,
        Loaded,
    };
    public class PluginUtil  {
    
#if UNITY_EDITOR_WIN || UNITY_STANDALONE_WIN
        // Impremented in Loader dll
        [DllImport("Loader", CharSet = CharSet.Unicode, ExactSpelling = true)]
        public extern static IntPtr LoadAndAlloc([MarshalAs(UnmanagedType.LPStr)]string fileName);

        [DllImport("Loader", CharSet = CharSet.Unicode, ExactSpelling = true)]
        public extern static void NativeFree(IntPtr ptr);

        [DllImport("Loader", CharSet = CharSet.Unicode, ExactSpelling = true)]
        public extern static IntPtr GetNativTextureInfo([MarshalAs(UnmanagedType.LPStr)]string fileName, out StReadResult tResult);

        [DllImport("Loader", CharSet = CharSet.Unicode, ExactSpelling = true)]
        public extern static int ResetNativeTexture([MarshalAs(UnmanagedType.LPStr)]string fileName);



        // Impremented in Drawer dll
        [DllImport("Drawer", CharSet = CharSet.Unicode, ExactSpelling = true)]
        public extern static void SetNativeTexturePtr(IntPtr Texture, UInt32 uWidth, UInt32 height, Int32 sObjectID);

        [DllImport("Drawer", CharSet = CharSet.Unicode, ExactSpelling = true)]
        public extern static void SetLoadedTexture([MarshalAs(UnmanagedType.LPStr)]string fileName, Int32 sObjectID);

        [DllImport("Drawer", CharSet = CharSet.Unicode, ExactSpelling = true)]
        public extern static void ResetLoadedTexture(Int32 sObjectID);

        [DllImport("Drawer", CharSet = CharSet.Unicode, ExactSpelling = true)]
        public extern static void ResetAllLoadedTexture();
        [DllImport("Drawer", CharSet = CharSet.Unicode, ExactSpelling = true)]
        public static extern IntPtr GetRenderEventFunc();

        [DllImport("DrawOverWindow", CharSet = CharSet.Unicode, ExactSpelling = true)]
        public static extern IntPtr TestDraw(int posX, int posY);

        [DllImport("DrawOverWindow", CharSet = CharSet.Unicode, ExactSpelling = true)]
        public static extern void LoadAndShowBitMap(int posX, int posY, [MarshalAs(UnmanagedType.LPStr)]string fileName);

        [DllImport("DrawOverWindow", CharSet = CharSet.Unicode, ExactSpelling = true)]
        public static extern void ShowOverwrapWindow(int sInstanceID, int posX, int posY, int sWidth, int sHeight, int forceDraw);

        [DllImport("DrawOverWindow", CharSet = CharSet.Unicode, ExactSpelling = true)]
        public static extern void HideOverwrapWindow(int sInstanceID);
        [DllImport("DrawOverWindow", CharSet = CharSet.Unicode, ExactSpelling = true)]
        public static extern void SetOverwrapWindowData(int sInstanceID, UInt32[] byteArray, int length );
        [DllImport("DrawOverWindow", CharSet = CharSet.Unicode, ExactSpelling = true)]
        public static extern void HideAllOverwrapWindows();


        [DllImport("DrawOverWindow", CharSet = CharSet.Unicode, ExactSpelling = true)]
        public static extern void SetAllAreLoaded(int sInstanceID,int flag);
        [DllImport("DrawOverWindow", CharSet = CharSet.Unicode, ExactSpelling = true)]
        public static extern int GetAllAreLoaded(int sInstanceID);

#elif UNITY_EDITOR_OSX || UNITY_STANDALONE_OSX
		// Impremented in Loader dll
		[DllImport("PictureLoaderNativePlugin", CharSet = CharSet.Unicode, ExactSpelling = true)]
		public extern static IntPtr LoadAndAlloc([MarshalAs(UnmanagedType.LPStr)]string fileName);


		[DllImport("PictureLoaderNativePlugin", CharSet = CharSet.Unicode, ExactSpelling = true)]
		public extern static void NativeFree(IntPtr ptr);

		[DllImport("PictureLoaderNativePlugin", CharSet = CharSet.Unicode, ExactSpelling = true)]
		public extern static  IntPtr GetNativTextureInfo([MarshalAs(UnmanagedType.LPStr)]string fileName, out StReadResult tResult);

		// Impremented in Drawer dll
		[DllImport("PictureLoaderNativePlugin", CharSet = CharSet.Unicode, ExactSpelling = true)]
		public extern static void SetNativeTexturePtr(IntPtr Texture, UInt32 uWidth, UInt32 height, Int32 sObjectID);

		[DllImport("PictureLoaderNativePlugin", CharSet = CharSet.Unicode, ExactSpelling = true)]
		public extern static void SetLoadedTexture([MarshalAs(UnmanagedType.LPStr)]string fileName, Int32 sObjectID);

		[DllImport("PictureLoaderNativePlugin", CharSet = CharSet.Unicode, ExactSpelling = true)]
		public extern static void ResetLoadedTexture(Int32 sObjectID);

		[DllImport("PictureLoaderNativePlugin", CharSet = CharSet.Unicode, ExactSpelling = true)]
		public extern static void ResetAllLoadedTexture();
		[DllImport("PictureLoaderNativePlugin", CharSet = CharSet.Unicode, ExactSpelling = true)]
		public static extern IntPtr GetRenderEventFunc();

		public static  IntPtr TestDraw(int posX, int posY)
		{
		return IntPtr.Zero;
		}


		public static  void LoadAndShowBitMap(int posX, int posY, [MarshalAs(UnmanagedType.LPStr)]string fileName)
		{

		}

		public static  void ShowOverwrapWindow(int sInstanceID, int posX, int posY, int sWidth, int sHeight, int forceDraw)
		{

		}

		public static  void HideOverwrapWindow(int sInstanceID)
		{

		}
		public static  void SetOverwrapWindowData(int sInstanceID, UInt32[] byteArray, int length )
		{

		}
		public static  void HideAllOverwrapWindows()
		{

		}


		public static  void SetAllAreLoaded(int sInstanceID,int flag)
		{

		}
		public static  int GetAllAreLoaded(int sInstanceID)
		{
			return 0;
		}
#else
        // Impremented in Loader dll
        public  static IntPtr LoadAndAlloc([MarshalAs(UnmanagedType.LPStr)]string fileName)
        {
            return IntPtr.Zero;
        }

        public  static void NativeFree(IntPtr ptr){}

        public  static  IntPtr GetNativTextureInfo([MarshalAs(UnmanagedType.LPStr)]string fileName, out StReadResult tResult)
        {
            tResult.buffer = IntPtr.Zero;
            tResult.width = 0;
            tResult.height = 0;
            tResult.readStatus = 0;
            return IntPtr.Zero;
        }

        public  static void SetNativeTexturePtr(IntPtr Texture, UInt32 uWidth, UInt32 height, Int32 sObjectID)
        {

        }

        public  static void SetLoadedTexture([MarshalAs(UnmanagedType.LPStr)]string fileName, Int32 sObjectID)
        {
            
        }
        

        public  static void ResetLoadedTexture(Int32 sObjectID)
        {
            
        }
        

        public  static void ResetAllLoadedTexture()
        {
            
        }
        

        public static  IntPtr GetRenderEventFunc()
        {
            return IntPtr.Zero;
        }
       

        public static  IntPtr TestDraw(int posX, int posY)
        {
            return IntPtr.Zero;
        }
       

        public static  void LoadAndShowBitMap(int posX, int posY, [MarshalAs(UnmanagedType.LPStr)]string fileName)
        {

        }

        public static  void ShowOverwrapWindow(int sInstanceID, int posX, int posY, int sWidth, int sHeight, int forceDraw)
        {

        }

        public static  void HideOverwrapWindow(int sInstanceID)
        {

        }
        public static  void SetOverwrapWindowData(int sInstanceID, UInt32[] byteArray, int length )
        {

        }
        public static  void HideAllOverwrapWindows()
        {

        }


        public static  void SetAllAreLoaded(int sInstanceID,int flag)
        {

        }
        public static  int GetAllAreLoaded(int sInstanceID)
        {
            return 0;
        }
#endif


    }

}
