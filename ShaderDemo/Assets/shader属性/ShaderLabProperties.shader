// Upgrade NOTE: replaced 'defined _BOOL_ON' with 'defined (_BOOL_ON)'

Shader "GD/ ShaderLabProperties"
{
	//属性表 为了显示在面板上 即使
	properties{
		[Header(materials propertys setting panel)] //在设置面板中添加注释 
		[Space(50)]
		_Int("Int",int) = 2
			//特性区分大小写 需要首字母大写
		[Space] //空出空间
		[Space(50)] //空出50个单位上下方向
		[Toggle] 
		_Bool("Bool",int) =1 //面板显示为勾选状态 默认是勾选的  
		[Toggle()] // 括号里可填可不填
		[Space(50)]
		_Fancy("Fancy?",Float)=1 

			[Toggle(ENABLE_FANCY)] //默认是不勾选的 括号里可填可不填
		[Space(50)]
		_Fancy2("Fancy",Float) = 1
			//枚举型
			[Enum(UnityEngine.Rendering.BlendMode)] //初始值为0 使用系统的枚举类型
		_SrcBlend("SrcBlendMode",int)=2
			[Enum(UnityEngine.Rendering.BlendMode)]//初始值为1 
		_Dst("dst Blend Mode",int)=1
		//自定义枚举类型
			[Enum(Off,0,On,1)] // 显示名称 对应数值
		_ZWrite("ZWrite",float)=2

			[Enum(UnityEngine.Rendering.CompareFunction)]
		_ZTest("ZTest",float)=0
			[Enum(UnityEngine.Rendering.CullMode)]
			_Cull("Cull",float)=1

				[KeywordEnum(None,Add,Multiply)] //在面板上显示 自定义的三个选项
			_Overlay("Overlay mode",float)=1

				[PowerSlider(3.0)]
			_Shininess("Shininess",Range(0.01,1))=0.08

		_Float("Float",float) = 2.5
		
		_Range("Range",RANGE(1,10)) = 3 //不区分大小写
		_Color("Color",color) = (1,1,1,1)
		_Vector("Vector",vector) = (2,3,6,1)
			
		_2D("2D",2d) = "red"
		_Cube("Cube",cube) = "white"
		_3D("3D",3d) = "black"
		
		//_Bool("Bool",boolean)=false
	}
	/*	CustomEditor
	{

	}*/
		subshader{
			
		pass{
				CGPROGRAM

#pragma vertex vert
#pragma fragment frag 
					//定义按钮的宏 
        #pragma shader_feature _BOOL_ON
      //关键字 定义宏shader_feature
          //定义按键枚举的宏 也可以用来定义按钮的宏 当需要在代码种动态的开启和关闭时最好使用本方法来定义按钮
            #pragma multi_compile _OVERLAY_NONE _OVERLAY_ADD _OVERLAY_MULTIPLY
#if _BOOL_ON
//判断条件
#endif
#ifdef _BOOL_ON
//另一种写法
#endif

#if defined (_BOOL_ON)
//第三种写法
#endif

float4 vert(float4 vert:POSITION ) :SV_POSITION{

					return UnityObjectToClipPos(vert);
}
fixed4 frag():SV_TARGET0
{


	return fixed4(1,1,1,1);
}

					ENDCG


            }

	}

		fallback "VertexLit"

}
