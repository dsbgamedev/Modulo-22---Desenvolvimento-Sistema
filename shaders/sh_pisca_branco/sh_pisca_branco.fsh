//
// Simple passthrough fragment shader
//
varying vec2 v_vTexcoord;
varying vec4 v_vColour;

void main()
{
	//Pegar as cores e informaçõse da minha sprite
	vec4 minha_cor = v_vColour * texture2D( gm_BaseTexture, v_vTexcoord );
	//Mudar a minha cor para branco
	minha_cor.rgb = vec3(1);
	
	//Aplicando a minha cor
    gl_FragColor = minha_cor;
}
