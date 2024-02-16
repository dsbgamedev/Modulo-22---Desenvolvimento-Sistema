/// @description Insert description here
// You can write your code in this editor

//Pausando o jogo ao apertar esc

if(keyboard_check_released(vk_escape)) global.pause = !global.pause;

//Se o jogo esta pausado, eu vou parar todas as entidades
if(global.pause)
{
	if(instance_exists(obj_entidade))
	{
		with(obj_entidade)	
		{
			velh = 0;
			velv = 0;
			image_speed = 0;
		}
	}
}

























