﻿// This shader is used to write the "Ref" number, in the Stencil part, to the Stencil Buffer.
Shader "Stencils/StencilMask"
{
	// What variables do we want sent in to the shader?
	Properties
	{
		_StencilVal ("stencilVal", Range(0, 255)) = 1
	}
		
	SubShader 
	{
		Tags
		{
			"RenderType"="Opaque"
			"Queue"="Geometry-100"
		}
		ColorMask 0
		ZWrite off
		Stencil 
		{
			Ref [_StencilVal]
			Comp always
			Pass replace
		}
		
		Pass
		{
			CGPROGRAM
				// What functions should we use for the vertex and fragment shaders?
				#pragma vertex vert
				#pragma fragment frag
				
				// What gets sent in the vertex and fragment shaders?
				struct appdata 
				{
					float4 vertex : POSITION;
				};
				
				struct v2f 
				{
					float4 pos : SV_POSITION;
				};
				
				// The vertex shader
				v2f vert(appdata v) 
				{
					v2f o;
					o.pos = mul(UNITY_MATRIX_MVP, v.vertex);
					return o;
				}
				
				// The fragment shader
				half4 frag(v2f i) : COLOR 
				{
					return half4(1,1,0,1);
				}
			ENDCG
		}
	}
}