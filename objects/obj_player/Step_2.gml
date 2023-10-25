/// @description Insert description here
// You can write your code in this editor

//Sistema de colisão e movimentação horizontal
repeat(abs(velh)) //Repete o codigo(ABS faz o valor sempre fica positivo)
{
	//Checando se eu vou bater na parede
	if(place_meeting(x + sign(velh), y, obj_chao ))//checa colisão com a parede (Sign retorna 1 ou -1)
	{
		//Você via parar
		velh = 0;
		//Saindo do laço
		break;
	}
	else//Não bati na parede
	{
		//Eu posso me mover nessa direção, 1 pixel por vez
		x += sign(velh);
		
	}
}


//Alterando o eixo X





















