// Upgrade NOTE: replaced 'mul(UNITY_MATRIX_MVP,*)' with 'UnityObjectToClipPos(*)'
//模型的点位信息是被归一化到一个单位为1的空间内
Shader "GD/HightLihtLine" {

Properties
{

_Current("Current",Range(-10,10))=0

_Top("Top",Range(0,1))=0

_Buttom("Buttom",Range(0,1))=0

_BackGround("BackGround",COLOR)=(1,1,1,1)

_Width("Width",Range(0,1) )=0
_Hight("Hight",COLOR)=(1,1,1,1)
}

SubShader{
//Cull front //剔除前面
//Cull back//剔除后面 默认状态
//Cull Off //剔除关闭
pass{

CGPROGRAM
#include "UnityCG.cginc"
#pragma vertex vert
#pragma fragment frag
float _Width;
fixed4 _BackGround;
float _Buttom;
float _Top;
float _Current;
fixed4 _Hight;

struct v2f
{
float4 pos :SV_POSITION ;
fixed4 _color :COLOR0;

} ;
 v2f vert(float4 _vert:POSITION)
{
		v2f o;
		o.pos=UnityObjectToClipPos(_vert ) ;
		o._color=fixed4(_vert.x,1,_vert.z,1);//测试模型的顶点信息
		//o._color=vert;
		return o;
}
fixed4 frag(v2f _v2f ):SV_TARGET0{

//if()
float2 v2t;
v2t.x=_Current+ _Top-_v2f._color.x;

v2t.y=0.5-_v2f._color.z;
//v2t.z=0;
//v2t.w=0;
//(_Current+ _Top-v2f._color.x,0.5-_v2f._color.z);
v2t=normalize(v2t);
float2 v2b;
v2b.x=_Current+_Buttom-_v2f._color.x;
v2b.y=-0.5-_v2f._color.z;
v2b=normalize(v2b);
float length=dot(v2b,v2t)+_Width;
if(length<0)
{
return _BackGround* (_Hight*-length/(1-_Width));

}

//v2b.z=0;
//v2b.w=0;
//(_Current+_Buttom-v2f._color.x,-0.5-v2f._color.z);

//if(dot(normalize(v2t),normalize(v2d))<-_Width ){
//return fixed4(1,1,1,1);

//};

//return _v2f._color;
return _BackGround;
}

ENDCG
}

}



	
}
