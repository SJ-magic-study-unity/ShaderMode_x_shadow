/************************************************************
■[Unity][Unity3d]内蔵シェーダのコード解説(3) - Unlit/Transparent Cutout
	http://d.hatena.ne.jp/nakamura001/20130208/1360346901
************************************************************/
Shader "Unlit/Transparent Cutout (Shadow)" {
	Properties {
		_Color ("Main Color", Color) = (1,1,1,1)
		_MainTex ("Base (RGB)", 2D) = "white" {}
		_Cutoff  ("Alpha cutoff", Range(0,1)) = 0.5
	}
	SubShader {
		Tags {"Queue"="AlphaTest" "IgnoreProjector"="True" "RenderType"="TransparentCutout"}
		LOD 100
		
		Pass {
			Lighting Off
			Alphatest Greater [_Cutoff]
			SetTexture [_MainTex] { combine texture } 
		}
	}

	Fallback "Transparent/Cutout/VertexLit"
}

/************************************************************
added Fallback to sample below.
************************************************************/

/************************************************************
// Unlit alpha-cutout shader.
// - no lighting
// - no lightmap support
// - no per-material color

Shader "Unlit/ Transparent Cutout" {
	Properties {
		_MainTex ("Base (RGB) Trans (A)", 2D) = "white" {}
		_Cutoff ("Alpha cutoff", Range(0,1)) = 0.5
	}
	
	SubShader {
		Tags {"Queue"="AlphaTest" "IgnoreProjector"="True" "RenderType"="TransparentCutout"}
		LOD 100
		
		Pass {
			Lighting Off
			Alphatest Greater [_Cutoff]
			SetTexture [_MainTex] { combine texture } 
		}
	}
}
************************************************************/
