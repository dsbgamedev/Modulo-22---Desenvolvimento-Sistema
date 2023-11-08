/// @description Insert description here
// You can write your code in this editor

//Colisão horizontal
if(place_meeting(x + velh, y, obj_chao_td))
{
	//Pegando os dados do chão que eu vou bater
	var _chao = instance_place(x + velh, y, obj_chao_td);
	
	if(_chao)
	{
		//Checando se eu estou indo para a direita ou para esquerda
		if(velh > 0)
		{
			//Estou indo para a direita	
	       //Eu vou grudar na esquerda do chao
		   x = _chao.bbox_left - sprite_width / 2;  
		}
		else if(velh < 0)//Estou indo para a esquerda
		{
		   x = _chao.bbox_right + sprite_width / 2;
		}
	}
	//Zerar a minha velocidade horizontal
	velh = 0;
}

x += velh;

//Colisão vertical
//Pegando os dados do chão que eu vou bater
var _chao = instance_place(x , y + velv, obj_chao_td);
if(_chao)
{

	//Checando se eu estou indo para a direita ou para esquerda
	if(velv > 0)
	{
		//Estou indo para a direita	
	    //Eu vou grudar na esquerda do chao
		y = _chao.bbox_top;  
	}
	else if(velv < 0)//Estou indo para a esquerda
	{
		y = _chao.bbox_bottom + 11;
	}

	//Zerar a minha velocidade horizontal vertical
	velv = 0;
}

y += velv;




















