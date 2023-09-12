//UNITY_SHADER_NO_UPGRADE

Shader "Unlit/WaveShader"
{
	Properties
	{
		_MainTex ("Texture", 2D) = "white" {}
	}
	SubShader
	{
		Pass
		{
			Cull Off

			CGPROGRAM
			#pragma vertex vert
			#pragma fragment frag

			#include "UnityCG.cginc"

			uniform sampler2D _MainTex;	
			//uniform float4 _Time;

			struct vertIn
			{
				float4 vertex : POSITION;
				float2 uv : TEXCOORD0;
			};

			struct vertOut
			{
				float4 vertex : SV_POSITION;
				float2 uv : TEXCOORD0;
			};

			// Implementation of the vertex shader
			vertOut vert(vertIn v)
			{
				// Transform vertex position from model space to world space
                float4 worldPos = mul(UNITY_MATRIX_M, v.vertex);

                // Transform vertex position from world space to view space
                float4 viewPos = mul(UNITY_MATRIX_V, worldPos);

                // Displace the y-coordinate of the vertex in view space based on its x-coordinate
                viewPos.y += sin(viewPos.x);

                // Transform vertex position from view space to projection space
                float4 projPos = mul(UNITY_MATRIX_P, viewPos);

                vertOut o;
                o.vertex = projPos;
                o.uv = v.uv;
                return o;
			}
			
			// Implementation of the fragment shader
			fixed4 frag(vertOut v) : SV_Target
			{
				fixed4 col = tex2D(_MainTex, v.uv);
				return col;
			}
			ENDCG
		}
	}
}