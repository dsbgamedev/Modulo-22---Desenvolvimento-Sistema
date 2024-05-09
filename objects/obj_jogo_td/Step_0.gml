/// @description Insert description here
// You can write your code in this editor

//Pausando o jogo ao apertar esc
if(keyboard_check_released(vk_escape)) global.pause = !global.pause;

//Testando o meu save
if(keyboard_check_released(vk_numpad0)) salva_jogo(global.save);
//Carrega jogo
if(keyboard_check_released(vk_numpad1)) carrega_jogo(global.save);

////Perdendo vida ao apertar backspace
//if(keyboard_check_released(vk_backspace)) 
//{
//	global.vida_player--;
//	global.vida_player = clamp(global.vida_player, 0, global.max_vida_player);
//}

if(keyboard_check_released(vk_shift))
{
	global.vida_player += 2;
	global.vida_player = global.max_vida_player;
}

//Se o jogo esta pausado, eu vou parar todas as entidades
if(global.pause)
{
	if(instance_exists(obj_entidade_td))
	{
		with(obj_entidade_td)	
		{
			velh = 0;
			velv = 0;
			image_speed = 0;
		}
	}
	
}

























