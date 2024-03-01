/// @description Insert description here
// You can write your code in this editor

alvo   = noone;
estado = noone;
escala = 1; // 1 é 100% do tamanho
cam_w  = camera_get_view_width(view_camera[0]); 
cam_h  = camera_get_view_height(view_camera[0]); 

zoom = function()
{
	//Definindo o tamanho da minha view
	camera_set_view_size(view_camera[0], cam_w * escala, cam_h * escala);
	
	//Alterando o valor da escala com a bolinha do mouse
	if(mouse_wheel_down())
	{
		escala += .1;
	}
	else if(mouse_wheel_up())
	{
		escala -= .1;
	}
}

segue_alvo = function()
{
	
	//Pegando o tamanho da camera
	var _view_w = camera_get_view_width(view_camera[0]);
	var _view_h = camera_get_view_height(view_camera[0]);
	
		
	var _cam_x = x -_view_w / 2;
	var _cam_y = y -_view_h / 2;
	
	//Impedindo que a camera mostre fora da room
	_cam_x = clamp(_cam_x, 0, room_width  - _view_w);
	_cam_y = clamp(_cam_y, 0, room_height - _view_h);
	
	x = lerp(x, alvo.x, .1);
	y = lerp(y, alvo.y, .1);
	
	//Definindo a posição da camera(Movendo a camera depois que o player se moveu)
	//camera_set_view_pos(view_camera[0], _cam_x, _cam_y);

}
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
	
	segue_alvo();
	
	//Se eu apertei espaço eu vou seguir o inimigo
	//if(keyboard_check_released(vk_space)) estado = segue_inimigo;
	
}

segue_nada = function()
{
	alvo = noone;	
}

segue_inimigo = function()
{
	alvo = obj_inimigo_cogumelo_td;
	
	segue_alvo();
	
	//Se eu apertei espaço eu vou seguir o player
	if(keyboard_check_released(vk_space)) estado = segue_player;
}

estado = segue_player;






















