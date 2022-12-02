// Upgrade NOTE: replaced 'mul(UNITY_MATRIX_MVP,*)' with 'UnityObjectToClipPos(*)'

// Shader created with Shader Forge v1.34 
// Shader Forge (c) Neat Corporation / Joachim Holmer - http://www.acegikmo.com/shaderforge/
// Note: Manually altering this data may prevent you from opening it in Shader Forge
/*SF_DATA;ver:1.34;sub:START;pass:START;ps:flbk:Legacy Shaders/VertexLit,iptp:0,cusa:False,bamd:0,lico:1,lgpr:1,limd:0,spmd:1,trmd:0,grmd:0,uamb:True,mssp:True,bkdf:False,hqlp:False,rprd:False,enco:False,rmgx:True,rpth:0,vtps:0,hqsc:True,nrmq:1,nrsp:0,vomd:0,spxs:False,tesm:0,olmd:1,culm:0,bsrc:0,bdst:1,dpts:2,wrdp:True,dith:0,atcv:False,rfrpo:True,rfrpn:Refraction,coma:15,ufog:True,aust:True,igpj:False,qofs:0,qpre:1,rntp:1,fgom:False,fgoc:False,fgod:False,fgor:False,fgmd:0,fgcr:0.5,fgcg:0.5,fgcb:0.5,fgca:1,fgde:0.01,fgrn:0,fgrf:300,stcl:False,stva:128,stmr:255,stmw:255,stcp:6,stps:0,stfa:0,stfz:0,ofsf:0,ofsu:0,f2p0:False,fnsp:False,fnfb:False;n:type:ShaderForge.SFN_Final,id:9361,x:35041,y:32561,varname:node_9361,prsc:2|normal-8327-RGB,custl-6218-OUT,olwid-5379-OUT,olcol-8873-OUT;n:type:ShaderForge.SFN_Tex2d,id:474,x:32762,y:32106,ptovrint:False,ptlb:BaseMap,ptin:_BaseMap,varname:node_474,prsc:2,glob:False,taghide:False,taghdr:False,tagprd:False,tagnsco:False,tagnrm:False,ntxv:0,isnm:False|UVIN-4128-OUT;n:type:ShaderForge.SFN_TexCoord,id:8272,x:32250,y:32448,varname:node_8272,prsc:2,uv:0,uaff:False;n:type:ShaderForge.SFN_Tex2d,id:9104,x:32762,y:32473,ptovrint:False,ptlb:1st_ShadeMap,ptin:_1st_ShadeMap,varname:node_9104,prsc:2,glob:False,taghide:False,taghdr:False,tagprd:False,tagnsco:False,tagnrm:False,ntxv:0,isnm:False|UVIN-4128-OUT;n:type:ShaderForge.SFN_Tex2d,id:8327,x:34763,y:32489,ptovrint:False,ptlb:NormalMap,ptin:_NormalMap,varname:node_8327,prsc:2,glob:False,taghide:False,taghdr:False,tagprd:False,tagnsco:False,tagnrm:False,ntxv:3,isnm:True|UVIN-8690-OUT;n:type:ShaderForge.SFN_NormalVector,id:18,x:32153,y:33324,prsc:2,pt:True;n:type:ShaderForge.SFN_LightVector,id:6581,x:32153,y:33506,varname:node_6581,prsc:2;n:type:ShaderForge.SFN_Dot,id:6928,x:32504,y:33489,cmnt:Half Lambert,varname:node_6928,prsc:2,dt:4|A-5770-OUT,B-6581-OUT;n:type:ShaderForge.SFN_Tex2d,id:7925,x:32710,y:33328,ptovrint:False,ptlb:ShadingGradeMap,ptin:_ShadingGradeMap,varname:node_7925,prsc:2,glob:False,taghide:False,taghdr:False,tagprd:False,tagnsco:False,tagnrm:False,ntxv:0,isnm:False|UVIN-9116-OUT;n:type:ShaderForge.SFN_Lerp,id:4770,x:33260,y:32419,varname:node_4770,prsc:2|A-6999-OUT,B-7531-OUT,T-6122-OUT;n:type:ShaderForge.SFN_Color,id:3134,x:32762,y:32295,ptovrint:False,ptlb:BaseColor,ptin:_BaseColor,varname:node_3134,prsc:2,glob:False,taghide:False,taghdr:False,tagprd:False,tagnsco:False,tagnrm:False,c1:1,c2:1,c3:1,c4:1;n:type:ShaderForge.SFN_Multiply,id:482,x:32965,y:32256,varname:node_482,prsc:2|A-474-RGB,B-3134-RGB;n:type:ShaderForge.SFN_Color,id:6298,x:32762,y:32656,ptovrint:False,ptlb:1st_ShadeColor,ptin:_1st_ShadeColor,varname:node_6298,prsc:2,glob:False,taghide:False,taghdr:False,tagprd:False,tagnsco:False,tagnrm:False,c1:1,c2:1,c3:1,c4:1;n:type:ShaderForge.SFN_Multiply,id:7531,x:32968,y:32556,varname:node_7531,prsc:2|A-9104-RGB,B-6298-RGB;n:type:ShaderForge.SFN_Multiply,id:328,x:32924,y:33391,cmnt:Shading Grade,varname:node_328,prsc:2|A-7925-R,B-8300-OUT;n:type:ShaderForge.SFN_Slider,id:2316,x:33214,y:33510,ptovrint:False,ptlb:1st_ShadeColor_Step,ptin:_1st_ShadeColor_Step,varname:node_2316,prsc:2,glob:False,taghide:False,taghdr:False,tagprd:False,tagnsco:False,tagnrm:False,min:0,cur:0.003,max:1;n:type:ShaderForge.SFN_NormalVector,id:3494,x:32163,y:33175,prsc:2,pt:False;n:type:ShaderForge.SFN_SwitchProperty,id:5770,x:32317,y:33281,ptovrint:False,ptlb:Is_NormalMap,ptin:_Is_NormalMap,varname:node_5770,prsc:2,glob:False,taghide:False,taghdr:False,tagprd:False,tagnsco:False,tagnrm:False,on:True|A-3494-OUT,B-18-OUT;n:type:ShaderForge.SFN_LightAttenuation,id:1706,x:31997,y:33801,varname:node_1706,prsc:2;n:type:ShaderForge.SFN_Multiply,id:8806,x:32588,y:33709,varname:node_8806,prsc:2|A-6928-OUT,B-1888-OUT;n:type:ShaderForge.SFN_SwitchProperty,id:8300,x:32760,y:33624,ptovrint:False,ptlb:Set_SystemShadowsToBase,ptin:_Set_SystemShadowsToBase,varname:node_8300,prsc:2,glob:False,taghide:False,taghdr:False,tagprd:False,tagnsco:False,tagnrm:False,on:True|A-6928-OUT,B-8806-OUT;n:type:ShaderForge.SFN_Lerp,id:7144,x:33276,y:32647,varname:node_7144,prsc:2|A-7531-OUT,B-5308-OUT,T-1887-OUT;n:type:ShaderForge.SFN_Color,id:9293,x:32762,y:33024,ptovrint:False,ptlb:2nd_ShadeColor,ptin:_2nd_ShadeColor,varname:node_9293,prsc:2,glob:False,taghide:False,taghdr:False,tagprd:False,tagnsco:False,tagnrm:False,c1:1,c2:1,c3:1,c4:1;n:type:ShaderForge.SFN_Lerp,id:7664,x:33592,y:32597,varname:node_7664,prsc:2|A-4770-OUT,B-7144-OUT,T-675-OUT;n:type:ShaderForge.SFN_Slider,id:9308,x:33894,y:33424,ptovrint:False,ptlb:2nd_ShadeColor_Step,ptin:_2nd_ShadeColor_Step,varname:node_9308,prsc:2,glob:False,taghide:False,taghdr:False,tagprd:False,tagnsco:False,tagnrm:False,min:0,cur:0.003,max:1;n:type:ShaderForge.SFN_Tex2d,id:6414,x:32762,y:32826,ptovrint:False,ptlb:2nd_ShadeMap,ptin:_2nd_ShadeMap,varname:node_6414,prsc:2,glob:False,taghide:False,taghdr:False,tagprd:False,tagnsco:False,tagnrm:False,ntxv:0,isnm:False|UVIN-4128-OUT;n:type:ShaderForge.SFN_Multiply,id:5308,x:32952,y:32870,varname:node_5308,prsc:2|A-6414-RGB,B-9293-RGB;n:type:ShaderForge.SFN_Slider,id:114,x:33214,y:33623,ptovrint:False,ptlb:1st_ShadeColor_Feather,ptin:_1st_ShadeColor_Feather,varname:node_114,prsc:2,glob:False,taghide:False,taghdr:False,tagprd:False,tagnsco:False,tagnrm:False,min:0.0001,cur:0.0001,max:1;n:type:ShaderForge.SFN_Subtract,id:5830,x:33528,y:33563,varname:node_5830,prsc:2|A-2316-OUT,B-114-OUT;n:type:ShaderForge.SFN_RemapRangeAdvanced,id:4995,x:33550,y:33148,varname:node_4995,prsc:2|IN-2956-OUT,IMIN-5830-OUT,IMAX-2316-OUT,OMIN-9557-OUT,OMAX-8308-OUT;n:type:ShaderForge.SFN_Vector1,id:9557,x:33582,y:33393,varname:node_9557,prsc:2,v1:1;n:type:ShaderForge.SFN_Vector1,id:8308,x:33582,y:33488,varname:node_8308,prsc:2,v1:0;n:type:ShaderForge.SFN_Slider,id:3277,x:33894,y:33527,ptovrint:False,ptlb:2nd_ShadeColor_Feather,ptin:_2nd_ShadeColor_Feather,varname:node_3277,prsc:2,glob:False,taghide:False,taghdr:False,tagprd:False,tagnsco:False,tagnrm:False,min:0.0001,cur:0.0001,max:1;n:type:ShaderForge.SFN_Subtract,id:7994,x:34232,y:33474,varname:node_7994,prsc:2|A-9308-OUT,B-3277-OUT;n:type:ShaderForge.SFN_RemapRangeAdvanced,id:8365,x:34256,y:33142,varname:node_8365,prsc:2|IN-6067-OUT,IMIN-7994-OUT,IMAX-9308-OUT,OMIN-4856-OUT,OMAX-4354-OUT;n:type:ShaderForge.SFN_Vector1,id:4856,x:34397,y:33331,varname:node_4856,prsc:2,v1:1;n:type:ShaderForge.SFN_Vector1,id:4354,x:34397,y:33391,varname:node_4354,prsc:2,v1:0;n:type:ShaderForge.SFN_Clamp01,id:7433,x:33723,y:33148,varname:node_7433,prsc:2|IN-4995-OUT;n:type:ShaderForge.SFN_Clamp01,id:2938,x:34419,y:33142,varname:node_2938,prsc:2|IN-8365-OUT;n:type:ShaderForge.SFN_Vector1,id:4711,x:31997,y:33939,varname:node_4711,prsc:2,v1:0.5;n:type:ShaderForge.SFN_Multiply,id:5790,x:32211,y:33801,varname:node_5790,prsc:2|A-1706-OUT,B-4711-OUT;n:type:ShaderForge.SFN_Add,id:1888,x:32375,y:33781,cmnt:System Shadow,varname:node_1888,prsc:2|A-5790-OUT,B-4711-OUT;n:type:ShaderForge.SFN_Set,id:533,x:32422,y:32448,varname:Set_UV0,prsc:2|IN-8272-UVOUT;n:type:ShaderForge.SFN_Get,id:4128,x:32485,y:32140,varname:node_4128,prsc:2|IN-533-OUT;n:type:ShaderForge.SFN_Get,id:8690,x:34545,y:32489,varname:node_8690,prsc:2|IN-533-OUT;n:type:ShaderForge.SFN_Get,id:9116,x:32504,y:33328,varname:node_9116,prsc:2|IN-533-OUT;n:type:ShaderForge.SFN_SwitchProperty,id:1024,x:33861,y:32530,ptovrint:False,ptlb:Is_1st_ShadeColorOnly,ptin:_Is_1st_ShadeColorOnly,varname:node_1024,prsc:2,glob:False,taghide:False,taghdr:False,tagprd:False,tagnsco:False,tagnrm:False,on:False|A-7664-OUT,B-4770-OUT;n:type:ShaderForge.SFN_Set,id:5403,x:34025,y:32530,varname:Set_FinalBaseColor,prsc:2|IN-1024-OUT;n:type:ShaderForge.SFN_Get,id:2795,x:33488,y:33888,varname:node_2795,prsc:2|IN-533-OUT;n:type:ShaderForge.SFN_Tex2d,id:7087,x:33690,y:33888,ptovrint:False,ptlb:Outline_Sampler,ptin:_Outline_Sampler,varname:node_7087,prsc:2,glob:False,taghide:False,taghdr:False,tagprd:False,tagnsco:False,tagnrm:False,ntxv:0,isnm:False|UVIN-2795-OUT;n:type:ShaderForge.SFN_ValueProperty,id:9804,x:33853,y:33734,ptovrint:False,ptlb:Outline_Width,ptin:_Outline_Width,varname:node_9804,prsc:2,glob:False,taghide:False,taghdr:False,tagprd:False,tagnsco:False,tagnrm:False,v1:1;n:type:ShaderForge.SFN_Vector1,id:8596,x:33853,y:33798,varname:node_8596,prsc:2,v1:0.001;n:type:ShaderForge.SFN_ValueProperty,id:4360,x:33853,y:33970,ptovrint:False,ptlb:Farthest_Distance,ptin:_Farthest_Distance,varname:node_4360,prsc:2,glob:False,taghide:False,taghdr:False,tagprd:False,tagnsco:False,tagnrm:False,v1:10;n:type:ShaderForge.SFN_ValueProperty,id:6070,x:33853,y:34053,ptovrint:False,ptlb:Nearest_Distance,ptin:_Nearest_Distance,varname:node_6070,prsc:2,glob:False,taghide:False,taghdr:False,tagprd:False,tagnsco:False,tagnrm:False,v1:0.5;n:type:ShaderForge.SFN_ObjectPosition,id:6131,x:33853,y:34123,varname:node_6131,prsc:2;n:type:ShaderForge.SFN_ViewPosition,id:2003,x:33853,y:34260,varname:node_2003,prsc:2;n:type:ShaderForge.SFN_Distance,id:192,x:34043,y:34199,varname:node_192,prsc:2|A-6131-XYZ,B-2003-XYZ;n:type:ShaderForge.SFN_Smoothstep,id:5241,x:34164,y:34042,varname:node_5241,prsc:2|A-4360-OUT,B-6070-OUT,V-192-OUT;n:type:ShaderForge.SFN_Multiply,id:409,x:34105,y:33746,varname:node_409,prsc:2|A-9804-OUT,B-8596-OUT,C-5241-OUT,D-7087-RGB;n:type:ShaderForge.SFN_ComponentMask,id:9419,x:34285,y:33746,varname:node_9419,prsc:2,cc1:0,cc2:-1,cc3:-1,cc4:-1|IN-409-OUT;n:type:ShaderForge.SFN_Set,id:2096,x:34474,y:33746,varname:Set_Outline_Width,prsc:2|IN-9419-OUT;n:type:ShaderForge.SFN_Color,id:3683,x:33852,y:34434,ptovrint:False,ptlb:Outline_Color,ptin:_Outline_Color,varname:node_3683,prsc:2,glob:False,taghide:False,taghdr:False,tagprd:False,tagnsco:False,tagnrm:False,c1:0.5,c2:0.5,c3:0.5,c4:1;n:type:ShaderForge.SFN_Multiply,id:8018,x:34085,y:34481,varname:node_8018,prsc:2|A-3683-RGB,B-627-OUT,C-627-OUT;n:type:ShaderForge.SFN_Get,id:627,x:33852,y:34596,varname:node_627,prsc:2|IN-1484-OUT;n:type:ShaderForge.SFN_SwitchProperty,id:6841,x:34250,y:34403,ptovrint:False,ptlb:Is_BrendBaseColor,ptin:_Is_BrendBaseColor,varname:node_6841,prsc:2,glob:False,taghide:False,taghdr:False,tagprd:False,tagnsco:False,tagnrm:False,on:True|A-3683-RGB,B-8018-OUT;n:type:ShaderForge.SFN_Set,id:1484,x:33140,y:32256,varname:Set_BaseColor,prsc:2|IN-482-OUT;n:type:ShaderForge.SFN_Set,id:3933,x:34448,y:34403,varname:Set_Outline_Color,prsc:2|IN-6841-OUT;n:type:ShaderForge.SFN_Get,id:5379,x:34815,y:32877,varname:node_5379,prsc:2|IN-2096-OUT;n:type:ShaderForge.SFN_Get,id:8873,x:34815,y:32939,varname:node_8873,prsc:2|IN-3933-OUT;n:type:ShaderForge.SFN_NormalVector,id:7322,x:32196,y:31719,prsc:2,pt:False;n:type:ShaderForge.SFN_NormalVector,id:4979,x:32196,y:31865,prsc:2,pt:True;n:type:ShaderForge.SFN_SwitchProperty,id:7272,x:32382,y:31817,ptovrint:False,ptlb:Is_NormalMapToHighColor,ptin:_Is_NormalMapToHighColor,varname:node_7272,prsc:2,glob:False,taghide:False,taghdr:False,tagprd:False,tagnsco:False,tagnrm:False,on:False|A-7322-OUT,B-4979-OUT;n:type:ShaderForge.SFN_Dot,id:6430,x:32578,y:31739,cmnt:Specular,varname:node_6430,prsc:2,dt:4|A-943-OUT,B-7272-OUT;n:type:ShaderForge.SFN_HalfVector,id:943,x:32382,y:31636,varname:node_943,prsc:2;n:type:ShaderForge.SFN_Slider,id:9325,x:32370,y:31512,ptovrint:False,ptlb:HighColor_Power,ptin:_HighColor_Power,varname:node_9325,prsc:2,glob:False,taghide:False,taghdr:False,tagprd:False,tagnsco:False,tagnrm:False,min:0,cur:0.1,max:1;n:type:ShaderForge.SFN_ConstantLerp,id:3321,x:32718,y:31510,varname:node_3321,prsc:2,a:11,b:1|IN-9325-OUT;n:type:ShaderForge.SFN_Exp,id:3690,x:32890,y:31510,varname:node_3690,prsc:2,et:1|IN-3321-OUT;n:type:ShaderForge.SFN_OneMinus,id:2407,x:32786,y:31704,varname:node_2407,prsc:2|IN-9325-OUT;n:type:ShaderForge.SFN_Step,id:7225,x:33027,y:31773,varname:node_7225,prsc:2|A-6430-OUT,B-2407-OUT;n:type:ShaderForge.SFN_Power,id:6818,x:33079,y:31510,varname:node_6818,prsc:2|VAL-6430-OUT,EXP-3690-OUT;n:type:ShaderForge.SFN_SwitchProperty,id:5143,x:33279,y:31565,ptovrint:False,ptlb:Is_SpecularToHighColor,ptin:_Is_SpecularToHighColor,varname:node_5143,prsc:2,glob:False,taghide:False,taghdr:False,tagprd:False,tagnsco:False,tagnrm:False,on:False|A-5912-OUT,B-6818-OUT;n:type:ShaderForge.SFN_OneMinus,id:5912,x:33079,y:31639,varname:node_5912,prsc:2|IN-7225-OUT;n:type:ShaderForge.SFN_Tex2d,id:2388,x:33279,y:31361,ptovrint:False,ptlb:Set_HighColorPosition,ptin:_Set_HighColorPosition,varname:node_2388,prsc:2,glob:False,taghide:False,taghdr:False,tagprd:False,tagnsco:False,tagnrm:False,ntxv:0,isnm:False|UVIN-7302-OUT;n:type:ShaderForge.SFN_Get,id:7302,x:33079,y:31361,varname:node_7302,prsc:2|IN-533-OUT;n:type:ShaderForge.SFN_OneMinus,id:8847,x:33455,y:31361,varname:node_8847,prsc:2|IN-2388-RGB;n:type:ShaderForge.SFN_ComponentMask,id:2515,x:33629,y:31361,varname:node_2515,prsc:2,cc1:0,cc2:-1,cc3:-1,cc4:-1|IN-8847-OUT;n:type:ShaderForge.SFN_Add,id:4643,x:33629,y:31540,varname:node_4643,prsc:2|A-2515-OUT,B-5143-OUT;n:type:ShaderForge.SFN_Set,id:5746,x:33878,y:33148,cmnt:Base and 1st Shade Mask,varname:Set_FinalShadowMask,prsc:2|IN-7433-OUT;n:type:ShaderForge.SFN_Get,id:7081,x:32950,y:31105,varname:node_7081,prsc:2|IN-5746-OUT;n:type:ShaderForge.SFN_OneMinus,id:7575,x:33190,y:31014,varname:node_7575,prsc:2|IN-7081-OUT;n:type:ShaderForge.SFN_Slider,id:1639,x:32828,y:31200,ptovrint:False,ptlb:TweakHighColorOnShadow,ptin:_TweakHighColorOnShadow,varname:node_1639,prsc:2,glob:False,taghide:False,taghdr:False,tagprd:False,tagnsco:False,tagnrm:False,min:0,cur:0,max:1;n:type:ShaderForge.SFN_Multiply,id:8373,x:33190,y:31156,varname:node_8373,prsc:2|A-7081-OUT,B-1639-OUT;n:type:ShaderForge.SFN_Add,id:7946,x:33381,y:31112,varname:node_7946,prsc:2|A-7575-OUT,B-8373-OUT;n:type:ShaderForge.SFN_Multiply,id:2397,x:33922,y:31472,varname:node_2397,prsc:2|A-8109-RGB,B-4643-OUT;n:type:ShaderForge.SFN_Color,id:8109,x:33897,y:31284,ptovrint:False,ptlb:HighColor,ptin:_HighColor,varname:node_8109,prsc:2,glob:False,taghide:False,taghdr:False,tagprd:False,tagnsco:False,tagnrm:False,c1:1,c2:1,c3:1,c4:1;n:type:ShaderForge.SFN_Multiply,id:6586,x:34093,y:31586,varname:node_6586,prsc:2|A-2397-OUT,B-7946-OUT;n:type:ShaderForge.SFN_SwitchProperty,id:4790,x:34293,y:31542,ptovrint:False,ptlb:Is_UseTweakHighColorOnShadow,ptin:_Is_UseTweakHighColorOnShadow,varname:node_4790,prsc:2,glob:False,taghide:False,taghdr:False,tagprd:False,tagnsco:False,tagnrm:False,on:False|A-2397-OUT,B-6586-OUT;n:type:ShaderForge.SFN_Get,id:3441,x:33265,y:31899,varname:node_3441,prsc:2|IN-5403-OUT;n:type:ShaderForge.SFN_Subtract,id:5358,x:33509,y:31778,varname:node_5358,prsc:2|A-3441-OUT,B-4643-OUT;n:type:ShaderForge.SFN_Clamp01,id:5917,x:33684,y:31778,varname:node_5917,prsc:2|IN-5358-OUT;n:type:ShaderForge.SFN_SwitchProperty,id:6570,x:33884,y:31778,ptovrint:False,ptlb:Is_BlendAddToHiColor,ptin:_Is_BlendAddToHiColor,varname:node_6570,prsc:2,glob:False,taghide:False,taghdr:False,tagprd:False,tagnsco:False,tagnrm:False,on:True|A-5917-OUT,B-3441-OUT;n:type:ShaderForge.SFN_Add,id:5386,x:34293,y:31770,varname:node_5386,prsc:2|A-6570-OUT,B-4790-OUT;n:type:ShaderForge.SFN_Set,id:3265,x:34466,y:31770,varname:Set_HighColor,prsc:2|IN-5386-OUT;n:type:ShaderForge.SFN_Get,id:6218,x:34815,y:32792,varname:node_6218,prsc:2|IN-4339-OUT;n:type:ShaderForge.SFN_NormalVector,id:2595,x:31997,y:34038,prsc:2,pt:False;n:type:ShaderForge.SFN_NormalVector,id:902,x:31997,y:34189,prsc:2,pt:True;n:type:ShaderForge.SFN_SwitchProperty,id:4356,x:32205,y:34091,ptovrint:False,ptlb:Is_NormalMapToRimLight,ptin:_Is_NormalMapToRimLight,varname:node_4356,prsc:2,glob:False,taghide:False,taghdr:False,tagprd:False,tagnsco:False,tagnrm:False,on:False|A-2595-OUT,B-902-OUT;n:type:ShaderForge.SFN_ViewVector,id:1503,x:32205,y:34231,varname:node_1503,prsc:2;n:type:ShaderForge.SFN_Dot,id:7752,x:32375,y:34146,varname:node_7752,prsc:2,dt:0|A-4356-OUT,B-1503-OUT;n:type:ShaderForge.SFN_OneMinus,id:4927,x:32551,y:34146,varname:node_4927,prsc:2|IN-7752-OUT;n:type:ShaderForge.SFN_Slider,id:241,x:32048,y:34390,ptovrint:False,ptlb:RimLight_Power,ptin:_RimLight_Power,varname:node_241,prsc:2,glob:False,taghide:False,taghdr:False,tagprd:False,tagnsco:False,tagnrm:False,min:0,cur:0.1,max:1;n:type:ShaderForge.SFN_ConstantLerp,id:1733,x:32375,y:34390,varname:node_1733,prsc:2,a:3,b:0|IN-241-OUT;n:type:ShaderForge.SFN_Exp,id:6712,x:32535,y:34390,varname:node_6712,prsc:2,et:1|IN-1733-OUT;n:type:ShaderForge.SFN_Power,id:3992,x:32734,y:34145,varname:node_3992,prsc:2|VAL-4927-OUT,EXP-6712-OUT;n:type:ShaderForge.SFN_Color,id:2051,x:32734,y:34003,ptovrint:False,ptlb:RimLightColor,ptin:_RimLightColor,varname:node_2051,prsc:2,glob:False,taghide:False,taghdr:False,tagprd:False,tagnsco:False,tagnrm:False,c1:1,c2:1,c3:1,c4:1;n:type:ShaderForge.SFN_Multiply,id:6024,x:32912,y:34081,varname:node_6024,prsc:2|A-2051-RGB,B-3992-OUT;n:type:ShaderForge.SFN_Set,id:8740,x:33091,y:34097,varname:Set_RimLight,prsc:2|IN-6024-OUT;n:type:ShaderForge.SFN_SwitchProperty,id:3612,x:33952,y:32013,ptovrint:False,ptlb:RimLight,ptin:_RimLight,varname:node_3612,prsc:2,glob:False,taghide:False,taghdr:False,tagprd:False,tagnsco:False,tagnrm:False,on:True|A-3159-OUT,B-9297-OUT;n:type:ShaderForge.SFN_Add,id:9297,x:33770,y:32074,varname:node_9297,prsc:2|A-3159-OUT,B-9510-OUT;n:type:ShaderForge.SFN_Get,id:9510,x:33549,y:32091,varname:node_9510,prsc:2|IN-8740-OUT;n:type:ShaderForge.SFN_Get,id:3159,x:33549,y:32012,varname:node_3159,prsc:2|IN-3265-OUT;n:type:ShaderForge.SFN_Set,id:4339,x:35626,y:32034,cmnt:Final Composition,varname:Set_FinalCompOut,prsc:2|IN-3462-OUT;n:type:ShaderForge.SFN_Get,id:675,x:33592,y:32735,varname:node_675,prsc:2|IN-5746-OUT;n:type:ShaderForge.SFN_Get,id:6122,x:33239,y:32559,varname:node_6122,prsc:2|IN-5746-OUT;n:type:ShaderForge.SFN_Get,id:6999,x:33060,y:32419,varname:node_6999,prsc:2|IN-1484-OUT;n:type:ShaderForge.SFN_Set,id:5726,x:34614,y:33142,cmnt:1st and 2nd Shades Mask,varname:Set_ShadeShadowMask,prsc:2|IN-2938-OUT;n:type:ShaderForge.SFN_Get,id:1887,x:33255,y:32784,varname:node_1887,prsc:2|IN-5726-OUT;n:type:ShaderForge.SFN_Set,id:4981,x:33115,y:33410,varname:Set_ShadingGrade,prsc:2|IN-328-OUT;n:type:ShaderForge.SFN_Get,id:2956,x:33488,y:33086,varname:node_2956,prsc:2|IN-4981-OUT;n:type:ShaderForge.SFN_Get,id:6067,x:34225,y:33055,varname:node_6067,prsc:2|IN-4981-OUT;n:type:ShaderForge.SFN_NormalVector,id:3483,x:32504,y:34716,prsc:2,pt:False;n:type:ShaderForge.SFN_SwitchProperty,id:5617,x:32749,y:34716,ptovrint:False,ptlb:Is_NormalMapForMatCap,ptin:_Is_NormalMapForMatCap,varname:node_5617,prsc:2,glob:False,taghide:False,taghdr:False,tagprd:False,tagnsco:False,tagnrm:False,on:False|A-3483-OUT,B-5200-XYZ;n:type:ShaderForge.SFN_Get,id:480,x:32270,y:34926,varname:node_480,prsc:2|IN-533-OUT;n:type:ShaderForge.SFN_Vector2,id:3368,x:32270,y:34992,varname:node_3368,prsc:2,v1:0.5,v2:0.5;n:type:ShaderForge.SFN_Rotator,id:9535,x:32538,y:34932,varname:node_9535,prsc:2|UVIN-480-OUT,PIV-3368-OUT,ANG-5753-OUT;n:type:ShaderForge.SFN_Slider,id:5325,x:32191,y:35141,ptovrint:False,ptlb:Rotate_NormalMapForMatCapUV,ptin:_Rotate_NormalMapForMatCapUV,varname:node_5325,prsc:2,glob:False,taghide:False,taghdr:False,tagprd:False,tagnsco:False,tagnrm:False,min:-1,cur:0,max:1;n:type:ShaderForge.SFN_Multiply,id:5753,x:32538,y:35151,varname:node_5753,prsc:2|A-5325-OUT,B-2130-OUT;n:type:ShaderForge.SFN_Pi,id:2130,x:32350,y:35215,varname:node_2130,prsc:2;n:type:ShaderForge.SFN_Tex2d,id:3003,x:32719,y:34932,ptovrint:False,ptlb:NormalMapForMatCap,ptin:_NormalMapForMatCap,varname:node_3003,prsc:2,glob:False,taghide:False,taghdr:False,tagprd:False,tagnsco:False,tagnrm:False,ntxv:3,isnm:True|UVIN-9535-UVOUT;n:type:ShaderForge.SFN_Transform,id:5200,x:32892,y:34932,varname:node_5200,prsc:2,tffrom:2,tfto:0|IN-3003-RGB;n:type:ShaderForge.SFN_Transform,id:4411,x:32915,y:34716,varname:node_4411,prsc:2,tffrom:0,tfto:3|IN-5617-OUT;n:type:ShaderForge.SFN_ComponentMask,id:8620,x:33077,y:34716,varname:node_8620,prsc:2,cc1:0,cc2:1,cc3:-1,cc4:-1|IN-4411-XYZ;n:type:ShaderForge.SFN_RemapRange,id:5376,x:33239,y:34716,varname:node_5376,prsc:2,frmn:-1,frmx:1,tomn:0,tomx:1|IN-8620-OUT;n:type:ShaderForge.SFN_Slider,id:5250,x:33115,y:34974,ptovrint:False,ptlb:Tweak_MatCapUV,ptin:_Tweak_MatCapUV,varname:node_5250,prsc:2,glob:False,taghide:False,taghdr:False,tagprd:False,tagnsco:False,tagnrm:False,min:-0.5,cur:0,max:0.5;n:type:ShaderForge.SFN_Vector1,id:4194,x:33272,y:35060,varname:node_4194,prsc:2,v1:0;n:type:ShaderForge.SFN_Vector1,id:885,x:33272,y:35114,varname:node_885,prsc:2,v1:1;n:type:ShaderForge.SFN_Add,id:1400,x:33471,y:34777,varname:node_1400,prsc:2|A-4194-OUT,B-5250-OUT;n:type:ShaderForge.SFN_Subtract,id:1068,x:33471,y:34930,varname:node_1068,prsc:2|A-885-OUT,B-5250-OUT;n:type:ShaderForge.SFN_RemapRangeAdvanced,id:1922,x:33735,y:34717,varname:node_1922,prsc:2|IN-5376-OUT,IMIN-1400-OUT,IMAX-1068-OUT,OMIN-4194-OUT,OMAX-885-OUT;n:type:ShaderForge.SFN_Vector2,id:6510,x:33700,y:34842,varname:node_6510,prsc:2,v1:0.5,v2:0.5;n:type:ShaderForge.SFN_Slider,id:6191,x:33621,y:34979,ptovrint:False,ptlb:Rotate_MatCapUV,ptin:_Rotate_MatCapUV,varname:node_6191,prsc:2,glob:False,taghide:False,taghdr:False,tagprd:False,tagnsco:False,tagnrm:False,min:-1,cur:0,max:1;n:type:ShaderForge.SFN_Multiply,id:8469,x:33969,y:34947,varname:node_8469,prsc:2|A-6191-OUT,B-1154-OUT;n:type:ShaderForge.SFN_Pi,id:1154,x:33768,y:35050,varname:node_1154,prsc:2;n:type:ShaderForge.SFN_Rotator,id:4345,x:33979,y:34717,varname:node_4345,prsc:2|UVIN-1922-OUT,PIV-6510-OUT,ANG-8469-OUT;n:type:ShaderForge.SFN_Tex2d,id:4835,x:34184,y:34717,ptovrint:False,ptlb:MatCap_Sampler,ptin:_MatCap_Sampler,varname:node_4835,prsc:2,glob:False,taghide:False,taghdr:False,tagprd:False,tagnsco:False,tagnrm:False,ntxv:2,isnm:False|UVIN-4345-UVOUT;n:type:ShaderForge.SFN_Multiply,id:4310,x:34398,y:34717,varname:node_4310,prsc:2|A-4835-RGB,B-1430-RGB;n:type:ShaderForge.SFN_Color,id:1430,x:34184,y:34915,ptovrint:False,ptlb:MatCapColor,ptin:_MatCapColor,varname:node_1430,prsc:2,glob:False,taghide:False,taghdr:False,tagprd:False,tagnsco:False,tagnrm:False,c1:1,c2:1,c3:1,c4:1;n:type:ShaderForge.SFN_Slider,id:9442,x:34152,y:35219,ptovrint:False,ptlb:TweakMatCapOnShadow,ptin:_TweakMatCapOnShadow,varname:node_9442,prsc:2,glob:False,taghide:False,taghdr:False,tagprd:False,tagnsco:False,tagnrm:False,min:0,cur:0,max:1;n:type:ShaderForge.SFN_Get,id:6614,x:34242,y:35108,varname:node_6614,prsc:2|IN-5746-OUT;n:type:ShaderForge.SFN_Multiply,id:2552,x:34496,y:35108,varname:node_2552,prsc:2|A-6614-OUT,B-9442-OUT;n:type:ShaderForge.SFN_OneMinus,id:8197,x:34496,y:34986,varname:node_8197,prsc:2|IN-6614-OUT;n:type:ShaderForge.SFN_Add,id:6634,x:34685,y:35035,varname:node_6634,prsc:2|A-8197-OUT,B-2552-OUT;n:type:ShaderForge.SFN_Multiply,id:4253,x:34859,y:34905,varname:node_4253,prsc:2|A-4310-OUT,B-6634-OUT;n:type:ShaderForge.SFN_SwitchProperty,id:7541,x:34859,y:34715,ptovrint:False,ptlb:Is_UseTweakMatCapOnShadow,ptin:_Is_UseTweakMatCapOnShadow,varname:node_7541,prsc:2,glob:False,taghide:False,taghdr:False,tagprd:False,tagnsco:False,tagnrm:False,on:False|A-4310-OUT,B-4253-OUT;n:type:ShaderForge.SFN_Set,id:6155,x:35064,y:34715,varname:Set_MatCap,prsc:2|IN-7541-OUT;n:type:ShaderForge.SFN_Multiply,id:4738,x:34205,y:32148,varname:node_4738,prsc:2|A-3612-OUT,B-3547-OUT;n:type:ShaderForge.SFN_Add,id:5945,x:34205,y:32281,varname:node_5945,prsc:2|A-3612-OUT,B-3547-OUT;n:type:ShaderForge.SFN_SwitchProperty,id:5517,x:34374,y:32191,ptovrint:False,ptlb:Is_BlendAddToMatCap,ptin:_Is_BlendAddToMatCap,varname:node_5517,prsc:2,glob:False,taghide:False,taghdr:False,tagprd:False,tagnsco:False,tagnrm:False,on:True|A-4738-OUT,B-5945-OUT;n:type:ShaderForge.SFN_SwitchProperty,id:3966,x:34556,y:32029,ptovrint:False,ptlb:MatCap,ptin:_MatCap,varname:node_3966,prsc:2,glob:False,taghide:False,taghdr:False,tagprd:False,tagnsco:False,tagnrm:False,on:False|A-3612-OUT,B-5517-OUT;n:type:ShaderForge.SFN_Get,id:3547,x:33931,y:32167,varname:node_3547,prsc:2|IN-6155-OUT;n:type:ShaderForge.SFN_Clamp01,id:4298,x:34753,y:32029,varname:node_4298,prsc:2|IN-3966-OUT;n:type:ShaderForge.SFN_Multiply,id:9263,x:34926,y:32029,varname:node_9263,prsc:2|A-4298-OUT,B-5781-RGB;n:type:ShaderForge.SFN_LightColor,id:5781,x:34753,y:32161,varname:node_5781,prsc:2;n:type:ShaderForge.SFN_Code,id:1776,x:35107,y:32275,varname:node_1776,prsc:2,code:cgBlAHQAdQByAG4AIABTAGgAYQBkAGUAUwBIADkAKABmAGwAbwBhAHQANAAoAE4ALAAxACkAKQA7AA==,output:10,fname:DecodeLightProbe,width:247,height:132,input:10,input_1_label:N|A-603-OUT;n:type:ShaderForge.SFN_NormalVector,id:603,x:34926,y:32275,prsc:2,pt:True;n:type:ShaderForge.SFN_Add,id:2741,x:35149,y:32029,varname:node_2741,prsc:2|A-9263-OUT,B-8174-OUT;n:type:ShaderForge.SFN_Slider,id:3177,x:35107,y:32443,ptovrint:False,ptlb:GI_Intensity,ptin:_GI_Intensity,varname:node_3177,prsc:2,glob:False,taghide:False,taghdr:False,tagprd:False,tagnsco:False,tagnrm:False,min:0,cur:0,max:1;n:type:ShaderForge.SFN_Multiply,id:8174,x:35480,y:32316,varname:node_8174,prsc:2|A-1776-OUT,B-3177-OUT;n:type:ShaderForge.SFN_NormalVector,id:3670,x:34759,y:31350,prsc:2,pt:False;n:type:ShaderForge.SFN_Transform,id:6618,x:34960,y:31350,varname:node_6618,prsc:2,tffrom:0,tfto:3|IN-3670-OUT;n:type:ShaderForge.SFN_Slider,id:2984,x:34775,y:31661,ptovrint:False,ptlb:AROfs,ptin:_AROfs,varname:node_611,prsc:2,glob:False,taghide:False,taghdr:False,tagprd:False,tagnsco:False,tagnrm:False,min:0,cur:0,max:0.5;n:type:ShaderForge.SFN_Vector3,id:5613,x:34944,y:31527,varname:node_5613,prsc:2,v1:0,v2:0,v3:1;n:type:ShaderForge.SFN_Lerp,id:9017,x:35634,y:31474,varname:node_9017,prsc:2|A-4209-V,B-9065-OUT,T-6022-OUT;n:type:ShaderForge.SFN_ComponentMask,id:3443,x:35278,y:31524,varname:node_3443,prsc:2,cc1:1,cc2:-1,cc3:-1,cc4:-1|IN-9490-OUT;n:type:ShaderForge.SFN_TexCoord,id:4209,x:35436,y:31347,varname:node_4209,prsc:2,uv:1,uaff:False;n:type:ShaderForge.SFN_RemapRange,id:9065,x:35436,y:31490,varname:node_9065,prsc:2,frmn:-1,frmx:1,tomn:0,tomx:1|IN-3443-OUT;n:type:ShaderForge.SFN_Lerp,id:9490,x:35121,y:31388,varname:node_9490,prsc:2|A-6618-XYZ,B-5613-OUT,T-2984-OUT;n:type:ShaderForge.SFN_Tex2d,id:8711,x:36033,y:31238,ptovrint:False,ptlb:AngelRing,ptin:_AngelRing,varname:node_4051,prsc:2,glob:False,taghide:False,taghdr:False,tagprd:False,tagnsco:False,tagnrm:False,ntxv:2,isnm:False|UVIN-8114-OUT;n:type:ShaderForge.SFN_Code,id:8114,x:35634,y:31233,varname:node_8114,prsc:2,code:ZgBsAG8AYQB0ADIAIABCACAAPQAgAEEAKgAwAC4ANQAtADAALgA1ADsACgBCAC4AeQAgAD0AIABDADsACgByAGUAdAB1AHIAbgAgAEIAOwA=,output:1,fname:Function_node_808,width:247,height:112,input:1,input:0,input_1_label:A,input_2_label:C|A-4692-OUT,B-9017-OUT;n:type:ShaderForge.SFN_ComponentMask,id:4692,x:35436,y:31183,varname:node_4692,prsc:2,cc1:0,cc2:1,cc3:-1,cc4:-1|IN-9490-OUT;n:type:ShaderForge.SFN_Add,id:3462,x:35388,y:32029,varname:node_3462,prsc:2|A-2741-OUT,B-8711-RGB;n:type:ShaderForge.SFN_Slider,id:6022,x:34775,y:31754,ptovrint:False,ptlb:ARVpower,ptin:_ARVpower,varname:_AROfs_copy,prsc:2,glob:False,taghide:False,taghdr:False,tagprd:False,tagnsco:False,tagnrm:False,min:0,cur:0.3,max:1;proporder:474-3134-9104-6298-6414-9293-8327-5770-8300-7925-1024-2316-114-9308-3277-8109-7272-9325-5143-6570-4790-1639-2388-3612-2051-241-4356-3966-4835-1430-5517-5250-6191-5617-3003-5325-7541-9442-9804-4360-6070-7087-3683-6841-3177-2984-8711-6022;pass:END;sub:END;*/

Shader "UnityChanToonShader/ShadingGradeMap_AngelRing" {
    Properties {
        _BaseMap ("BaseMap", 2D) = "white" {}
        _BaseColor ("BaseColor", Color) = (1,1,1,1)
        _1st_ShadeMap ("1st_ShadeMap", 2D) = "white" {}
        _1st_ShadeColor ("1st_ShadeColor", Color) = (1,1,1,1)
        _2nd_ShadeMap ("2nd_ShadeMap", 2D) = "white" {}
        _2nd_ShadeColor ("2nd_ShadeColor", Color) = (1,1,1,1)
        _NormalMap ("NormalMap", 2D) = "bump" {}
        [MaterialToggle] _Is_NormalMap ("Is_NormalMap", Float ) = 0
        [MaterialToggle] _Set_SystemShadowsToBase ("Set_SystemShadowsToBase", Float ) = 0.25
        _ShadingGradeMap ("ShadingGradeMap", 2D) = "white" {}
        [MaterialToggle] _Is_1st_ShadeColorOnly ("Is_1st_ShadeColorOnly", Float ) = 0
        _1st_ShadeColor_Step ("1st_ShadeColor_Step", Range(0, 1)) = 0.003
        _1st_ShadeColor_Feather ("1st_ShadeColor_Feather", Range(0.0001, 1)) = 0.0001
        _2nd_ShadeColor_Step ("2nd_ShadeColor_Step", Range(0, 1)) = 0.003
        _2nd_ShadeColor_Feather ("2nd_ShadeColor_Feather", Range(0.0001, 1)) = 0.0001
        _HighColor ("HighColor", Color) = (1,1,1,1)
        [MaterialToggle] _Is_NormalMapToHighColor ("Is_NormalMapToHighColor", Float ) = 0
        _HighColor_Power ("HighColor_Power", Range(0, 1)) = 0.1
        [MaterialToggle] _Is_SpecularToHighColor ("Is_SpecularToHighColor", Float ) = 0
        [MaterialToggle] _Is_BlendAddToHiColor ("Is_BlendAddToHiColor", Float ) = 0
        [MaterialToggle] _Is_UseTweakHighColorOnShadow ("Is_UseTweakHighColorOnShadow", Float ) = 1
        _TweakHighColorOnShadow ("TweakHighColorOnShadow", Range(0, 1)) = 0
        _Set_HighColorPosition ("Set_HighColorPosition", 2D) = "white" {}
        [MaterialToggle] _RimLight ("RimLight", Float ) = 2
        _RimLightColor ("RimLightColor", Color) = (1,1,1,1)
        _RimLight_Power ("RimLight_Power", Range(0, 1)) = 0.1
        [MaterialToggle] _Is_NormalMapToRimLight ("Is_NormalMapToRimLight", Float ) = 0
        [MaterialToggle] _MatCap ("MatCap", Float ) = 2
        _MatCap_Sampler ("MatCap_Sampler", 2D) = "black" {}
        _MatCapColor ("MatCapColor", Color) = (1,1,1,1)
        [MaterialToggle] _Is_BlendAddToMatCap ("Is_BlendAddToMatCap", Float ) = 2
        _Tweak_MatCapUV ("Tweak_MatCapUV", Range(-0.5, 0.5)) = 0
        _Rotate_MatCapUV ("Rotate_MatCapUV", Range(-1, 1)) = 0
        [MaterialToggle] _Is_NormalMapForMatCap ("Is_NormalMapForMatCap", Float ) = 0
        _NormalMapForMatCap ("NormalMapForMatCap", 2D) = "bump" {}
        _Rotate_NormalMapForMatCapUV ("Rotate_NormalMapForMatCapUV", Range(-1, 1)) = 0
        [MaterialToggle] _Is_UseTweakMatCapOnShadow ("Is_UseTweakMatCapOnShadow", Float ) = 0
        _TweakMatCapOnShadow ("TweakMatCapOnShadow", Range(0, 1)) = 0
        _Outline_Width ("Outline_Width", Float ) = 1
        _Farthest_Distance ("Farthest_Distance", Float ) = 10
        _Nearest_Distance ("Nearest_Distance", Float ) = 0.5
        _Outline_Sampler ("Outline_Sampler", 2D) = "white" {}
        _Outline_Color ("Outline_Color", Color) = (0.5,0.5,0.5,1)
        [MaterialToggle] _Is_BrendBaseColor ("Is_BrendBaseColor", Float ) = 0
        _GI_Intensity ("GI_Intensity", Range(0, 1)) = 0
        _AROfs ("AROfs", Range(0, 0.5)) = 0
        _AngelRing ("AngelRing", 2D) = "black" {}
        _ARVpower ("ARVpower", Range(0, 1)) = 0.3
    }
    SubShader {
        Tags {
            "RenderType"="Opaque"
        }
        Pass {
            Name "Outline"
            Tags {
            }
            Cull Front
            
            CGPROGRAM
            #pragma vertex vert
            #pragma fragment frag
            #include "UnityCG.cginc"
            #pragma fragmentoption ARB_precision_hint_fastest
            #pragma multi_compile_shadowcaster
            #pragma multi_compile_fog
            #pragma only_renderers d3d9 d3d11 glcore gles gles3 metal xboxone ps4 
            #pragma target 3.0
            uniform sampler2D _BaseMap; uniform float4 _BaseMap_ST;
            uniform float4 _BaseColor;
            uniform sampler2D _Outline_Sampler; uniform float4 _Outline_Sampler_ST;
            uniform float _Outline_Width;
            uniform float _Farthest_Distance;
            uniform float _Nearest_Distance;
            uniform float4 _Outline_Color;
            uniform fixed _Is_BrendBaseColor;
            struct VertexInput {
                float4 vertex : POSITION;
                float3 normal : NORMAL;
                float2 texcoord0 : TEXCOORD0;
            };
            struct VertexOutput {
                float4 pos : SV_POSITION;
                float2 uv0 : TEXCOORD0;
                UNITY_FOG_COORDS(1)
            };
            VertexOutput vert (VertexInput v) {
                VertexOutput o = (VertexOutput)0;
                o.uv0 = v.texcoord0;
                float4 objPos = mul ( unity_ObjectToWorld, float4(0,0,0,1) );
                float2 Set_UV0 = o.uv0;
                float2 node_2795 = Set_UV0;
                float4 _Outline_Sampler_var = tex2Dlod(_Outline_Sampler,float4(TRANSFORM_TEX(node_2795, _Outline_Sampler),0.0,0));
                float Set_Outline_Width = (_Outline_Width*0.001*smoothstep( _Farthest_Distance, _Nearest_Distance, distance(objPos.rgb,_WorldSpaceCameraPos) )*_Outline_Sampler_var.rgb).r;
                o.pos = UnityObjectToClipPos(float4(v.vertex.xyz + v.normal*Set_Outline_Width,1) );
                UNITY_TRANSFER_FOG(o,o.pos);
                return o;
            }
            float4 frag(VertexOutput i) : COLOR {
                float4 objPos = mul ( unity_ObjectToWorld, float4(0,0,0,1) );
                float2 Set_UV0 = i.uv0;
                float2 node_4128 = Set_UV0;
                float4 _BaseMap_var = tex2D(_BaseMap,TRANSFORM_TEX(node_4128, _BaseMap));
                float3 Set_BaseColor = (_BaseMap_var.rgb*_BaseColor.rgb);
                float3 node_627 = Set_BaseColor;
                float3 Set_Outline_Color = lerp( _Outline_Color.rgb, (_Outline_Color.rgb*node_627*node_627), _Is_BrendBaseColor );
                return fixed4(Set_Outline_Color,0);
            }
            ENDCG
        }
        Pass {
            Name "FORWARD"
            Tags {
                "LightMode"="ForwardBase"
            }
            
            
            CGPROGRAM
            #pragma vertex vert
            #pragma fragment frag
            #define UNITY_PASS_FORWARDBASE
            #include "UnityCG.cginc"
            #include "AutoLight.cginc"
            #include "Lighting.cginc"
            #pragma multi_compile_fwdbase_fullshadows
            #pragma multi_compile_fog
            #pragma only_renderers d3d9 d3d11 glcore gles gles3 metal xboxone ps4 
            #pragma target 3.0
            uniform sampler2D _BaseMap; uniform float4 _BaseMap_ST;
            uniform sampler2D _1st_ShadeMap; uniform float4 _1st_ShadeMap_ST;
            uniform sampler2D _NormalMap; uniform float4 _NormalMap_ST;
            uniform sampler2D _ShadingGradeMap; uniform float4 _ShadingGradeMap_ST;
            uniform float4 _BaseColor;
            uniform float4 _1st_ShadeColor;
            uniform float _1st_ShadeColor_Step;
            uniform fixed _Is_NormalMap;
            uniform fixed _Set_SystemShadowsToBase;
            uniform float4 _2nd_ShadeColor;
            uniform float _2nd_ShadeColor_Step;
            uniform sampler2D _2nd_ShadeMap; uniform float4 _2nd_ShadeMap_ST;
            uniform float _1st_ShadeColor_Feather;
            uniform float _2nd_ShadeColor_Feather;
            uniform fixed _Is_1st_ShadeColorOnly;
            uniform fixed _Is_NormalMapToHighColor;
            uniform float _HighColor_Power;
            uniform fixed _Is_SpecularToHighColor;
            uniform sampler2D _Set_HighColorPosition; uniform float4 _Set_HighColorPosition_ST;
            uniform float _TweakHighColorOnShadow;
            uniform float4 _HighColor;
            uniform fixed _Is_UseTweakHighColorOnShadow;
            uniform fixed _Is_BlendAddToHiColor;
            uniform fixed _Is_NormalMapToRimLight;
            uniform float _RimLight_Power;
            uniform float4 _RimLightColor;
            uniform fixed _RimLight;
            uniform fixed _Is_NormalMapForMatCap;
            uniform float _Rotate_NormalMapForMatCapUV;
            uniform sampler2D _NormalMapForMatCap; uniform float4 _NormalMapForMatCap_ST;
            uniform float _Tweak_MatCapUV;
            uniform float _Rotate_MatCapUV;
            uniform sampler2D _MatCap_Sampler; uniform float4 _MatCap_Sampler_ST;
            uniform float4 _MatCapColor;
            uniform float _TweakMatCapOnShadow;
            uniform fixed _Is_UseTweakMatCapOnShadow;
            uniform fixed _Is_BlendAddToMatCap;
            uniform fixed _MatCap;
            fixed3 DecodeLightProbe( fixed3 N ){
            return ShadeSH9(float4(N,1));
            }
            
            uniform float _GI_Intensity;
            uniform float _AROfs;
            uniform sampler2D _AngelRing; uniform float4 _AngelRing_ST;
            float2 Function_node_808( float2 A , float C ){
            float2 B = A*0.5-0.5;
            B.y = C;
            return B;
            }
            
            uniform float _ARVpower;
            struct VertexInput {
                float4 vertex : POSITION;
                float3 normal : NORMAL;
                float4 tangent : TANGENT;
                float2 texcoord0 : TEXCOORD0;
                float2 texcoord1 : TEXCOORD1;
            };
            struct VertexOutput {
                float4 pos : SV_POSITION;
                float2 uv0 : TEXCOORD0;
                float2 uv1 : TEXCOORD1;
                float4 posWorld : TEXCOORD2;
                float3 normalDir : TEXCOORD3;
                float3 tangentDir : TEXCOORD4;
                float3 bitangentDir : TEXCOORD5;
                LIGHTING_COORDS(6,7)
                UNITY_FOG_COORDS(8)
            };
            VertexOutput vert (VertexInput v) {
                VertexOutput o = (VertexOutput)0;
                o.uv0 = v.texcoord0;
                o.uv1 = v.texcoord1;
                o.normalDir = UnityObjectToWorldNormal(v.normal);
                o.tangentDir = normalize( mul( unity_ObjectToWorld, float4( v.tangent.xyz, 0.0 ) ).xyz );
                o.bitangentDir = normalize(cross(o.normalDir, o.tangentDir) * v.tangent.w);
                o.posWorld = mul(unity_ObjectToWorld, v.vertex);
                float3 lightColor = _LightColor0.rgb;
                o.pos = UnityObjectToClipPos(v.vertex );
                UNITY_TRANSFER_FOG(o,o.pos);
                TRANSFER_VERTEX_TO_FRAGMENT(o)
                return o;
            }
            float4 frag(VertexOutput i) : COLOR {
                i.normalDir = normalize(i.normalDir);
                float3x3 tangentTransform = float3x3( i.tangentDir, i.bitangentDir, i.normalDir);
                float3 viewDirection = normalize(_WorldSpaceCameraPos.xyz - i.posWorld.xyz);
                float2 Set_UV0 = i.uv0;
                float2 node_8690 = Set_UV0;
                float3 _NormalMap_var = UnpackNormal(tex2D(_NormalMap,TRANSFORM_TEX(node_8690, _NormalMap)));
                float3 normalLocal = _NormalMap_var.rgb;
                float3 normalDirection = normalize(mul( normalLocal, tangentTransform )); // Perturbed normals
                float3 lightDirection = normalize(_WorldSpaceLightPos0.xyz);
                float3 lightColor = _LightColor0.rgb;
                float3 halfDirection = normalize(viewDirection+lightDirection);
////// Lighting:
                float attenuation = LIGHT_ATTENUATION(i);
                float2 node_4128 = Set_UV0;
                float4 _BaseMap_var = tex2D(_BaseMap,TRANSFORM_TEX(node_4128, _BaseMap));
                float3 Set_BaseColor = (_BaseMap_var.rgb*_BaseColor.rgb);
                float4 _1st_ShadeMap_var = tex2D(_1st_ShadeMap,TRANSFORM_TEX(node_4128, _1st_ShadeMap));
                float3 node_7531 = (_1st_ShadeMap_var.rgb*_1st_ShadeColor.rgb);
                float2 node_9116 = Set_UV0;
                float4 _ShadingGradeMap_var = tex2D(_ShadingGradeMap,TRANSFORM_TEX(node_9116, _ShadingGradeMap));
                float node_6928 = 0.5*dot(lerp( i.normalDir, normalDirection, _Is_NormalMap ),lightDirection)+0.5; // Half Lambert
                float node_4711 = 0.5;
                float Set_ShadingGrade = (_ShadingGradeMap_var.r*lerp( node_6928, (node_6928*((attenuation*node_4711)+node_4711)), _Set_SystemShadowsToBase ));
                float node_5830 = (_1st_ShadeColor_Step-_1st_ShadeColor_Feather);
                float node_9557 = 1.0;
                float Set_FinalShadowMask = saturate((node_9557 + ( (Set_ShadingGrade - node_5830) * (0.0 - node_9557) ) / (_1st_ShadeColor_Step - node_5830))); // Base and 1st Shade Mask
                float3 node_4770 = lerp(Set_BaseColor,node_7531,Set_FinalShadowMask);
                float4 _2nd_ShadeMap_var = tex2D(_2nd_ShadeMap,TRANSFORM_TEX(node_4128, _2nd_ShadeMap));
                float node_7994 = (_2nd_ShadeColor_Step-_2nd_ShadeColor_Feather);
                float node_4856 = 1.0;
                float Set_ShadeShadowMask = saturate((node_4856 + ( (Set_ShadingGrade - node_7994) * (0.0 - node_4856) ) / (_2nd_ShadeColor_Step - node_7994))); // 1st and 2nd Shades Mask
                float3 Set_FinalBaseColor = lerp( lerp(node_4770,lerp(node_7531,(_2nd_ShadeMap_var.rgb*_2nd_ShadeColor.rgb),Set_ShadeShadowMask),Set_FinalShadowMask), node_4770, _Is_1st_ShadeColorOnly );
                float3 node_3441 = Set_FinalBaseColor;
                float2 node_7302 = Set_UV0;
                float4 _Set_HighColorPosition_var = tex2D(_Set_HighColorPosition,TRANSFORM_TEX(node_7302, _Set_HighColorPosition));
                float node_6430 = 0.5*dot(halfDirection,lerp( i.normalDir, normalDirection, _Is_NormalMapToHighColor ))+0.5; // Specular
                float node_4643 = ((1.0 - _Set_HighColorPosition_var.rgb).r+lerp( (1.0 - step(node_6430,(1.0 - _HighColor_Power))), pow(node_6430,exp2(lerp(11,1,_HighColor_Power))), _Is_SpecularToHighColor ));
                float3 node_2397 = (_HighColor.rgb*node_4643);
                float node_7081 = Set_FinalShadowMask;
                float3 Set_HighColor = (lerp( saturate((node_3441-node_4643)), node_3441, _Is_BlendAddToHiColor )+lerp( node_2397, (node_2397*((1.0 - node_7081)+(node_7081*_TweakHighColorOnShadow))), _Is_UseTweakHighColorOnShadow ));
                float3 node_3159 = Set_HighColor;
                float3 Set_RimLight = (_RimLightColor.rgb*pow((1.0 - dot(lerp( i.normalDir, normalDirection, _Is_NormalMapToRimLight ),viewDirection)),exp2(lerp(3,0,_RimLight_Power))));
                float3 _RimLight_var = lerp( node_3159, (node_3159+Set_RimLight), _RimLight );
                float node_4345_ang = (_Rotate_MatCapUV*3.141592654);
                float node_4345_spd = 1.0;
                float node_4345_cos = cos(node_4345_spd*node_4345_ang);
                float node_4345_sin = sin(node_4345_spd*node_4345_ang);
                float2 node_4345_piv = float2(0.5,0.5);
                float node_9535_ang = (_Rotate_NormalMapForMatCapUV*3.141592654);
                float node_9535_spd = 1.0;
                float node_9535_cos = cos(node_9535_spd*node_9535_ang);
                float node_9535_sin = sin(node_9535_spd*node_9535_ang);
                float2 node_9535_piv = float2(0.5,0.5);
                float2 node_9535 = (mul(Set_UV0-node_9535_piv,float2x2( node_9535_cos, -node_9535_sin, node_9535_sin, node_9535_cos))+node_9535_piv);
                float3 _NormalMapForMatCap_var = UnpackNormal(tex2D(_NormalMapForMatCap,TRANSFORM_TEX(node_9535, _NormalMapForMatCap)));
                float node_4194 = 0.0;
                float node_1400 = (node_4194+_Tweak_MatCapUV);
                float node_885 = 1.0;
                float2 node_4345 = (mul((node_4194 + ( ((mul( UNITY_MATRIX_V, float4(lerp( i.normalDir, mul( _NormalMapForMatCap_var.rgb, tangentTransform ).xyz.rgb, _Is_NormalMapForMatCap ),0) ).xyz.rgb.rg*0.5+0.5) - node_1400) * (node_885 - node_4194) ) / ((node_885-_Tweak_MatCapUV) - node_1400))-node_4345_piv,float2x2( node_4345_cos, -node_4345_sin, node_4345_sin, node_4345_cos))+node_4345_piv);
                float4 _MatCap_Sampler_var = tex2D(_MatCap_Sampler,TRANSFORM_TEX(node_4345, _MatCap_Sampler));
                float3 node_4310 = (_MatCap_Sampler_var.rgb*_MatCapColor.rgb);
                float node_6614 = Set_FinalShadowMask;
                float3 Set_MatCap = lerp( node_4310, (node_4310*((1.0 - node_6614)+(node_6614*_TweakMatCapOnShadow))), _Is_UseTweakMatCapOnShadow );
                float3 node_3547 = Set_MatCap;
                float3 node_9490 = lerp(mul( UNITY_MATRIX_V, float4(i.normalDir,0) ).xyz.rgb,float3(0,0,1),_AROfs);
                float2 node_8114 = Function_node_808( node_9490.rg , lerp(i.uv1.g,(node_9490.g*0.5+0.5),_ARVpower) );
                float4 _AngelRing_var = tex2D(_AngelRing,TRANSFORM_TEX(node_8114, _AngelRing));
                float3 Set_FinalCompOut = (((saturate(lerp( _RimLight_var, lerp( (_RimLight_var*node_3547), (_RimLight_var+node_3547), _Is_BlendAddToMatCap ), _MatCap ))*_LightColor0.rgb)+(DecodeLightProbe( normalDirection )*_GI_Intensity))+_AngelRing_var.rgb); // Final Composition
                float3 finalColor = Set_FinalCompOut;
                fixed4 finalRGBA = fixed4(finalColor,1);
                UNITY_APPLY_FOG(i.fogCoord, finalRGBA);
                return finalRGBA;
            }
            ENDCG
        }
        Pass {
            Name "FORWARD_DELTA"
            Tags {
                "LightMode"="ForwardAdd"
            }
            Blend One One
            
            
            CGPROGRAM
            #pragma vertex vert
            #pragma fragment frag
            #define UNITY_PASS_FORWARDADD
            #include "UnityCG.cginc"
            #include "AutoLight.cginc"
            #include "Lighting.cginc"
            #pragma multi_compile_fwdadd_fullshadows
            #pragma multi_compile_fog
            #pragma only_renderers d3d9 d3d11 glcore gles gles3 metal xboxone ps4 
            #pragma target 3.0
            uniform sampler2D _BaseMap; uniform float4 _BaseMap_ST;
            uniform sampler2D _1st_ShadeMap; uniform float4 _1st_ShadeMap_ST;
            uniform sampler2D _NormalMap; uniform float4 _NormalMap_ST;
            uniform sampler2D _ShadingGradeMap; uniform float4 _ShadingGradeMap_ST;
            uniform float4 _BaseColor;
            uniform float4 _1st_ShadeColor;
            uniform float _1st_ShadeColor_Step;
            uniform fixed _Is_NormalMap;
            uniform fixed _Set_SystemShadowsToBase;
            uniform float4 _2nd_ShadeColor;
            uniform float _2nd_ShadeColor_Step;
            uniform sampler2D _2nd_ShadeMap; uniform float4 _2nd_ShadeMap_ST;
            uniform float _1st_ShadeColor_Feather;
            uniform float _2nd_ShadeColor_Feather;
            uniform fixed _Is_1st_ShadeColorOnly;
            uniform fixed _Is_NormalMapToHighColor;
            uniform float _HighColor_Power;
            uniform fixed _Is_SpecularToHighColor;
            uniform sampler2D _Set_HighColorPosition; uniform float4 _Set_HighColorPosition_ST;
            uniform float _TweakHighColorOnShadow;
            uniform float4 _HighColor;
            uniform fixed _Is_UseTweakHighColorOnShadow;
            uniform fixed _Is_BlendAddToHiColor;
            uniform fixed _Is_NormalMapToRimLight;
            uniform float _RimLight_Power;
            uniform float4 _RimLightColor;
            uniform fixed _RimLight;
            uniform fixed _Is_NormalMapForMatCap;
            uniform float _Rotate_NormalMapForMatCapUV;
            uniform sampler2D _NormalMapForMatCap; uniform float4 _NormalMapForMatCap_ST;
            uniform float _Tweak_MatCapUV;
            uniform float _Rotate_MatCapUV;
            uniform sampler2D _MatCap_Sampler; uniform float4 _MatCap_Sampler_ST;
            uniform float4 _MatCapColor;
            uniform float _TweakMatCapOnShadow;
            uniform fixed _Is_UseTweakMatCapOnShadow;
            uniform fixed _Is_BlendAddToMatCap;
            uniform fixed _MatCap;
            fixed3 DecodeLightProbe( fixed3 N ){
            return ShadeSH9(float4(N,1));
            }
            
            uniform float _GI_Intensity;
            uniform float _AROfs;
            uniform sampler2D _AngelRing; uniform float4 _AngelRing_ST;
            float2 Function_node_808( float2 A , float C ){
            float2 B = A*0.5-0.5;
            B.y = C;
            return B;
            }
            
            uniform float _ARVpower;
            struct VertexInput {
                float4 vertex : POSITION;
                float3 normal : NORMAL;
                float4 tangent : TANGENT;
                float2 texcoord0 : TEXCOORD0;
                float2 texcoord1 : TEXCOORD1;
            };
            struct VertexOutput {
                float4 pos : SV_POSITION;
                float2 uv0 : TEXCOORD0;
                float2 uv1 : TEXCOORD1;
                float4 posWorld : TEXCOORD2;
                float3 normalDir : TEXCOORD3;
                float3 tangentDir : TEXCOORD4;
                float3 bitangentDir : TEXCOORD5;
                LIGHTING_COORDS(6,7)
                UNITY_FOG_COORDS(8)
            };
            VertexOutput vert (VertexInput v) {
                VertexOutput o = (VertexOutput)0;
                o.uv0 = v.texcoord0;
                o.uv1 = v.texcoord1;
                o.normalDir = UnityObjectToWorldNormal(v.normal);
                o.tangentDir = normalize( mul( unity_ObjectToWorld, float4( v.tangent.xyz, 0.0 ) ).xyz );
                o.bitangentDir = normalize(cross(o.normalDir, o.tangentDir) * v.tangent.w);
                o.posWorld = mul(unity_ObjectToWorld, v.vertex);
                float3 lightColor = _LightColor0.rgb;
                o.pos = UnityObjectToClipPos(v.vertex );
                UNITY_TRANSFER_FOG(o,o.pos);
                TRANSFER_VERTEX_TO_FRAGMENT(o)
                return o;
            }
            float4 frag(VertexOutput i) : COLOR {
                i.normalDir = normalize(i.normalDir);
                float3x3 tangentTransform = float3x3( i.tangentDir, i.bitangentDir, i.normalDir);
                float3 viewDirection = normalize(_WorldSpaceCameraPos.xyz - i.posWorld.xyz);
                float2 Set_UV0 = i.uv0;
                float2 node_8690 = Set_UV0;
                float3 _NormalMap_var = UnpackNormal(tex2D(_NormalMap,TRANSFORM_TEX(node_8690, _NormalMap)));
                float3 normalLocal = _NormalMap_var.rgb;
                float3 normalDirection = normalize(mul( normalLocal, tangentTransform )); // Perturbed normals
                float3 lightDirection = normalize(lerp(_WorldSpaceLightPos0.xyz, _WorldSpaceLightPos0.xyz - i.posWorld.xyz,_WorldSpaceLightPos0.w));
                float3 lightColor = _LightColor0.rgb;
                float3 halfDirection = normalize(viewDirection+lightDirection);
////// Lighting:
                float attenuation = LIGHT_ATTENUATION(i);
                float2 node_4128 = Set_UV0;
                float4 _BaseMap_var = tex2D(_BaseMap,TRANSFORM_TEX(node_4128, _BaseMap));
                float3 Set_BaseColor = (_BaseMap_var.rgb*_BaseColor.rgb);
                float4 _1st_ShadeMap_var = tex2D(_1st_ShadeMap,TRANSFORM_TEX(node_4128, _1st_ShadeMap));
                float3 node_7531 = (_1st_ShadeMap_var.rgb*_1st_ShadeColor.rgb);
                float2 node_9116 = Set_UV0;
                float4 _ShadingGradeMap_var = tex2D(_ShadingGradeMap,TRANSFORM_TEX(node_9116, _ShadingGradeMap));
                float node_6928 = 0.5*dot(lerp( i.normalDir, normalDirection, _Is_NormalMap ),lightDirection)+0.5; // Half Lambert
                float node_4711 = 0.5;
                float Set_ShadingGrade = (_ShadingGradeMap_var.r*lerp( node_6928, (node_6928*((attenuation*node_4711)+node_4711)), _Set_SystemShadowsToBase ));
                float node_5830 = (_1st_ShadeColor_Step-_1st_ShadeColor_Feather);
                float node_9557 = 1.0;
                float Set_FinalShadowMask = saturate((node_9557 + ( (Set_ShadingGrade - node_5830) * (0.0 - node_9557) ) / (_1st_ShadeColor_Step - node_5830))); // Base and 1st Shade Mask
                float3 node_4770 = lerp(Set_BaseColor,node_7531,Set_FinalShadowMask);
                float4 _2nd_ShadeMap_var = tex2D(_2nd_ShadeMap,TRANSFORM_TEX(node_4128, _2nd_ShadeMap));
                float node_7994 = (_2nd_ShadeColor_Step-_2nd_ShadeColor_Feather);
                float node_4856 = 1.0;
                float Set_ShadeShadowMask = saturate((node_4856 + ( (Set_ShadingGrade - node_7994) * (0.0 - node_4856) ) / (_2nd_ShadeColor_Step - node_7994))); // 1st and 2nd Shades Mask
                float3 Set_FinalBaseColor = lerp( lerp(node_4770,lerp(node_7531,(_2nd_ShadeMap_var.rgb*_2nd_ShadeColor.rgb),Set_ShadeShadowMask),Set_FinalShadowMask), node_4770, _Is_1st_ShadeColorOnly );
                float3 node_3441 = Set_FinalBaseColor;
                float2 node_7302 = Set_UV0;
                float4 _Set_HighColorPosition_var = tex2D(_Set_HighColorPosition,TRANSFORM_TEX(node_7302, _Set_HighColorPosition));
                float node_6430 = 0.5*dot(halfDirection,lerp( i.normalDir, normalDirection, _Is_NormalMapToHighColor ))+0.5; // Specular
                float node_4643 = ((1.0 - _Set_HighColorPosition_var.rgb).r+lerp( (1.0 - step(node_6430,(1.0 - _HighColor_Power))), pow(node_6430,exp2(lerp(11,1,_HighColor_Power))), _Is_SpecularToHighColor ));
                float3 node_2397 = (_HighColor.rgb*node_4643);
                float node_7081 = Set_FinalShadowMask;
                float3 Set_HighColor = (lerp( saturate((node_3441-node_4643)), node_3441, _Is_BlendAddToHiColor )+lerp( node_2397, (node_2397*((1.0 - node_7081)+(node_7081*_TweakHighColorOnShadow))), _Is_UseTweakHighColorOnShadow ));
                float3 node_3159 = Set_HighColor;
                float3 Set_RimLight = (_RimLightColor.rgb*pow((1.0 - dot(lerp( i.normalDir, normalDirection, _Is_NormalMapToRimLight ),viewDirection)),exp2(lerp(3,0,_RimLight_Power))));
                float3 _RimLight_var = lerp( node_3159, (node_3159+Set_RimLight), _RimLight );
                float node_4345_ang = (_Rotate_MatCapUV*3.141592654);
                float node_4345_spd = 1.0;
                float node_4345_cos = cos(node_4345_spd*node_4345_ang);
                float node_4345_sin = sin(node_4345_spd*node_4345_ang);
                float2 node_4345_piv = float2(0.5,0.5);
                float node_9535_ang = (_Rotate_NormalMapForMatCapUV*3.141592654);
                float node_9535_spd = 1.0;
                float node_9535_cos = cos(node_9535_spd*node_9535_ang);
                float node_9535_sin = sin(node_9535_spd*node_9535_ang);
                float2 node_9535_piv = float2(0.5,0.5);
                float2 node_9535 = (mul(Set_UV0-node_9535_piv,float2x2( node_9535_cos, -node_9535_sin, node_9535_sin, node_9535_cos))+node_9535_piv);
                float3 _NormalMapForMatCap_var = UnpackNormal(tex2D(_NormalMapForMatCap,TRANSFORM_TEX(node_9535, _NormalMapForMatCap)));
                float node_4194 = 0.0;
                float node_1400 = (node_4194+_Tweak_MatCapUV);
                float node_885 = 1.0;
                float2 node_4345 = (mul((node_4194 + ( ((mul( UNITY_MATRIX_V, float4(lerp( i.normalDir, mul( _NormalMapForMatCap_var.rgb, tangentTransform ).xyz.rgb, _Is_NormalMapForMatCap ),0) ).xyz.rgb.rg*0.5+0.5) - node_1400) * (node_885 - node_4194) ) / ((node_885-_Tweak_MatCapUV) - node_1400))-node_4345_piv,float2x2( node_4345_cos, -node_4345_sin, node_4345_sin, node_4345_cos))+node_4345_piv);
                float4 _MatCap_Sampler_var = tex2D(_MatCap_Sampler,TRANSFORM_TEX(node_4345, _MatCap_Sampler));
                float3 node_4310 = (_MatCap_Sampler_var.rgb*_MatCapColor.rgb);
                float node_6614 = Set_FinalShadowMask;
                float3 Set_MatCap = lerp( node_4310, (node_4310*((1.0 - node_6614)+(node_6614*_TweakMatCapOnShadow))), _Is_UseTweakMatCapOnShadow );
                float3 node_3547 = Set_MatCap;
                float3 node_9490 = lerp(mul( UNITY_MATRIX_V, float4(i.normalDir,0) ).xyz.rgb,float3(0,0,1),_AROfs);
                float2 node_8114 = Function_node_808( node_9490.rg , lerp(i.uv1.g,(node_9490.g*0.5+0.5),_ARVpower) );
                float4 _AngelRing_var = tex2D(_AngelRing,TRANSFORM_TEX(node_8114, _AngelRing));
                float3 Set_FinalCompOut = (((saturate(lerp( _RimLight_var, lerp( (_RimLight_var*node_3547), (_RimLight_var+node_3547), _Is_BlendAddToMatCap ), _MatCap ))*_LightColor0.rgb)+(DecodeLightProbe( normalDirection )*_GI_Intensity))+_AngelRing_var.rgb); // Final Composition
                float3 finalColor = Set_FinalCompOut;
                fixed4 finalRGBA = fixed4(finalColor * 1,0);
                UNITY_APPLY_FOG(i.fogCoord, finalRGBA);
                return finalRGBA;
            }
            ENDCG
        }
    }
    FallBack "Legacy Shaders/VertexLit"
    CustomEditor "ShaderForgeMaterialInspector"
}
