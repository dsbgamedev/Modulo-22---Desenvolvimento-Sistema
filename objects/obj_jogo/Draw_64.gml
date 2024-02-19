/// @description Insert description here
// You can write your code in this editor

draw_text(20,20, global.pause);

//Escurecendo a tela se o jogo esta pausado

if(global.pause)
{
	desenha_pause();
	
	//Desenha inventario
}
else
{
	//Destruindo a camada do efeito se o jogo não esta pausado
	if(layer_exists("efeito_pause"))
	{
		layer_destroy("efeito_pause");	
	}
}






















