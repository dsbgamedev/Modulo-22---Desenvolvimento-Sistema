/// @description Insert description here
// You can write your code in this editor

var _up    = keyboard_check(vk_up);
var _down  = keyboard_check(vk_down);
var _left  = keyboard_check(vk_left);
var _right = keyboard_check(vk_right);

//velh = (_right - _left) * max_vel;
//velv = (_down - _up) * max_vel;

//Ajustando a face
if(_up)      face = 1;
if(_down)    face = 3;
if(_left)    face = 2;
if(_right)   face = 0;



//Checando se eu estou no gelo
//Vai retornar false (-4) e se eu não estou colidindo
//Vai retornar o id de quem colidiu comigo (Do gelo)
var _gelo = instance_place(x,y,obj_gelo_td);

//Checando se estou no gelo
if(_gelo)
{
	acel = _gelo.meu_acel;
}
else //Se eu não colidi, o valormdo acel é o MEU acel
{
	acel = meu_acel;	
}

//Só faço isso se eu estou apertando alguma tecla
//Só quero que ele faça isso
//Se eu estou apertando para a esquerda ou direita, mas nao os dois
//Ao mesmo tempo

if((_up xor _down) or (_left xor _right))
{
//Descobrir a direção em que o player esta indo
	//Point direction
	var _dir = point_direction( 0, 0, (_right - _left), (_down - _up));
	//show_debug_message(_dir);

	//Pegando o valor do velh
	var _max_velh = lengthdir_x(max_vel, _dir);
	velh = lerp(velh, _max_velh, acel); //0 ou 5
	//Pegando o valro do velv
	var _max_velv = lengthdir_y(max_vel, _dir);
	velv = lerp(velv, _max_velv, acel); //0 ou 5
	//show_message(velv);
}
else   //Não estou apertando nenhuma tecla de movimento
{
	//Perdendo velocidade
	velh = lerp(velh, 0, acel);
	velv = lerp(velv, 0, acel);
}
estado(); // Recebeu o metodo estado_parado e executa ele



















