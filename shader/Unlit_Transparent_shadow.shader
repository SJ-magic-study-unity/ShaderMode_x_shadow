/************************************************************
■[Unity][Unity3d]内蔵シェーダのコード解説(2) - Unlit/Transparent
	http://d.hatena.ne.jp/nakamura001/20130205/1360083263
************************************************************/
Shader "Unlit/Transparent  (Shadow)" {
	Properties {
		_Color ("Main Color", Color) = (1,1,1,1)
		_MainTex ("Base (RGB)", 2D) = "white" {}
		_Cutoff  ("Alpha cutoff", Range(0,1)) = 0.5
	}
	SubShader {
		Tags {"Queue"="Transparent" "IgnoreProjector"="True" "RenderType"="Transparent"}
		LOD 100
		
		ZWrite Off
		Blend SrcAlpha OneMinusSrcAlpha 
	
		Pass {
			Lighting Off
			SetTexture [_MainTex] { combine texture } 
		}
	}

	Fallback "Transparent/Cutout/VertexLit"
}

/************************************************************
added Fallback to sample below.
************************************************************/

/************************************************************
// Unlit alpha-blended shader.
// - no lighting
// - no lightmap support
// - no per-material color

Shader "Unlit/Transparent" {
	Properties {
		_MainTex ("Base (RGB) Trans (A)", 2D) = "white" {}
	}
	
	SubShader {
		Tags {"Queue"="Transparent" "IgnoreProjector"="True" "RenderType"="Transparent"}
		LOD 100
		
		ZWrite Off
		Blend SrcAlpha OneMinusSrcAlpha 
	
		Pass {
			Lighting Off
			SetTexture [_MainTex] { combine texture } 
		}
	}
}
************************************************************/
