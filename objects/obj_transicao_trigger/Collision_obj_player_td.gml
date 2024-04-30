/// @description Insert description here
// You can write your code in this editor

//Se eu ainda não criei o obejto transição
//Eu crio ele
if(!transicao)
{
	//Destruindo a transição se alguma outra ja existiu
	if(instance_exists(obj_transicao)) instance_destroy(obj_transicao);
	
	transicao = instance_create_depth(0, 0, -1000000, obj_transicao);	
	transicao.room_destino = room_destino;	
	transicao.destino_x    = destino_x;
	transicao.destino_y    = destino_y;	
	transicao.player       = other;
}

//room_goto(room_destino);
//other.x = destino_x;
//other.y = destino_y;























