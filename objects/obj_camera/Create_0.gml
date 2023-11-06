/// @description Insert description here
// You can write your code in this editor

alvo   = noone;
estado = noone;

//Seguindo o player
segue_player = function()
{
	//Checando se o player existe
	if(instance_exists(obj_player_td))
	{
		alvo = obj_player_td;
	}
	else
	{
		estado = segue_nada;
	}
	
	x = lerp(x, alvo.x, .1);
	y = lerp(y, alvo.y, .1);
}

segue_nada = function()
{
	alvo = noone;	
}

estado = segue_player;




















