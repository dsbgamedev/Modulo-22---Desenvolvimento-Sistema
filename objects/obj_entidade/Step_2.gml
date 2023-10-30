/// @description Insert description here
// You can write your code in this editor

//Colisão horizontal
if(place_meeting(x + velh, y, obj_chao_pl))
{
	//Pegando os dados do chão que eu vou bater
	var _chao = instance_place(x +velh, y, obj_chao_pl);
	
	if(_chao)
	{
		//Checando se eu estou indo para a direita ou para esquerda
		if(velh > 0)
		{
			//Estou indo para a direita	
	       //Eu vou grudar na esquerda do chao
		   x = _chao.bbox_left - sprite_width / 2;  
		}
		else//Estou indo para a esquerda
		{
			x = _chao.bbox_right + sprite_width / 2;
		}
	}
	//Zerar a minha velocidade horizontal
	velh = 0;
}

//Colisão vertical
if(place_meeting(x , y + velv, obj_chao_pl))
{
	//Pegando os dados do chão que eu vou bater
	var _chao = instance_place(x , y + velv, obj_chao_pl);
	
	if(_chao)
	{
		//Checando se eu estou indo para a direita ou para esquerda
		if(velv > 0)
		{
			//Estou indo para a direita	
	       //Eu vou grudar na esquerda do chao
		   y = _chao.bbox_top - sprite_width / 2;  
		}
		else//Estou indo para a esquerda
		{
			x = _chao.bbox_bottom + sprite_width / 2;
		}
	}
	//Zerar a minha velocidade horizontal
	velv = 0;
}











