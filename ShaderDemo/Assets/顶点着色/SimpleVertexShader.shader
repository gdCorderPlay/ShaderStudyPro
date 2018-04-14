// Upgrade NOTE: replaced 'mul(UNITY_MATRIX_MVP,*)' with 'UnityObjectToClipPos(*)'

Shader "GD/SimpleVertexShader" {

  properties{
  
  _Color("Color",Color)=(1,1,1,1)
  _Slider("Slider",Range(0,360))=180
  _Smothess("Smothess",Range(0,10))=0.5
  }

  SubShader
  {
  Tags{ 
   //"Queue" = "Transparent" //透明通道
  //"RenderType"="Opaque"//不透明
  }
  pass{
 //  Blend  SrcAlpha SrcAlpha  //透明通道
  
  CGPROGRAM
  #pragma vertex vert 
  #pragma fragment frag

  fixed4 _Color;
  float _Slider;
  fixed _Smothess;
  struct v2f {
  float4 _vert:SV_POSITION;
  fixed4 _color:COLOR0;
  };
  v2f  vert(float4 _vert:POSITION )
  {
  v2f _v2f;
  _vert.x*=saturate(cos( _vert.x*_Slider));

 //_vert.y=saturate(_vert.y);
  _vert.z*=saturate(cos( _vert.z*_Slider));
  
 _v2f._vert=UnityObjectToClipPos(_vert) ; //模型坐标系到裁剪空间系
 _v2f._color= _Color* fixed4(_vert.x*_Smothess,_vert.y*_Smothess,_vert.z*_Smothess,1);
 _v2f._color.w=_Color.w;
  return _v2f;
        
  }

  fixed4 frag(v2f _v2f):SV_TARGET0
  {
  return  _v2f._color;
  
  }

  ENDCG
  
  }
  }
}
