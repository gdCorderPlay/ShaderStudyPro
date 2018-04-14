Shader "GD/VertexShader"
{
	subshader{

		pass {

		CGPROGRAM //必须大写
#include "UnityCG.cginc"
#pragma vertex vert
#pragma fragment frag

			struct v2f {

			float4 pos:SV_POSITION;
			float4 time:color;

};

			float time;
			float4 vert(float4 v:position):SV_POSITION //表示该函数的传出的数据传至裁剪空间使用
		{
			//	v2f o;
			//o.pos= UnityObjectToClipPos(v);
			//o.time = _Time;
			return UnityObjectToClipPos(v);

}
		fixed4 frag():sv_target {
	//float4 time = _SinTime;
	//time += _Time.w;
//float x = sin(time);
	return fixed4(_SinTime.w, _CosTime.w, _SinTime.w/_CosTime.w, 1);
}

			ENDCG




}



	}



}
