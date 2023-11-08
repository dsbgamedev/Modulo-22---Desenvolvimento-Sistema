/// @description Insert description here
// You can write your code in this editor

//Sistema de colisão e movimentação horizontal

movimentcao = function()
{
	repeat(abs(velh)) //Repete o codigo(ABS faz o valor sempre fica positivo)
{
	
	var _velh = sign(velh);	
	//Subindo a rampa
	//Chequei se estou colidindo E
	//Checando se na minha direção encima esta livre (Se eu nao estou colidindo)
	if(place_meeting(x +_velh, y, obj_chao_pl)	&& !place_meeting(x + _velh, y - 1, obj_chao_pl))
	{
		//show_message("Posso subir!");
		//Subindo 1 pixel
		y--;
	}
	
	//Descendo rampa
	//Se eu NÃO estou colidindo
	//Se na minha frente e embaixo esta livre tambem  (não estou colidindo)
	//Se na minha frente 2 degraus abaixo esta ocupado (estou colidindo)
	if(!place_meeting(x + _velh, y, obj_chao_pl) && 
	!place_meeting(x + _velh, y + 1, obj_chao_pl) &&
	place_meeting(x + _velh, y + 2, obj_chao_pl))
	{
		//Isso é uma rampa, eu devo descer
		y++;
		//show_message("Posso descer");
	}

	//Checando se eu vou bater na parede
	if(place_meeting(x + _velh, y, obj_chao_pl ))//checa colisão com a parede (Sign retorna 1 ou -1)
	{
		//Você via parar
		velh = 0;
		//Saindo do laço
		break;
	}
	else//Não bati na parede
	{
		//Eu posso me mover nessa direção, 1 pixel por vez
		x += _velh;
		
	}
}

//Colisão vertical
repeat(abs(velv))
{
	var _velv = sign(velv);
	if (place_meeting(x, y + _velv, obj_chao_pl))
	{
		_velv = 0;
		break;
	}
	else
	{
		y += _velv;	
	}
}

}

movimentcao();






















