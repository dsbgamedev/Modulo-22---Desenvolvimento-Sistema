/// @description Insert description here
// You can write your code in this editor

//Colisão horizontal
if(place_meeting(x + velh, y, obj_chao_td))
{
	//Pegando o sinal da velocidade horizontal
	var _velh = sin(velh);	
	//Enquanto eu NÃO estiver colidindo na parede no próximo pixel
	//Então eu avanço 1 pixel
	while(!place_empty(x + _velh, y, obj_chao_td))
	{
		//Avanço 1 pixel
		x += _velh;	
	}
	//Isso só quando o while deixar de rodar
	//Vou zerar a minha velh
	velh = 0;

}

//Movimenta no eixo X
x += velh;

//Colisao vertical

if(place_meeting(x, y + velv, obj_chao_td))
{
	var _velv = sign(velv);
	//Enquanto eu nao estiver colidindo no próximo pixel, eu avanço 1 pixel
	while(!place_empty(x, y + _velv, obj_chao_td))
	{
		//Avanço 1 pixel
		y += _velv;
	}
	
	velv = 0;
}

//Movo o eixo y
y += velv;

















