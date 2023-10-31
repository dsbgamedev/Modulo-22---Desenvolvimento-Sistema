/// @description Insert description here
// You can write your code in this editor
event_inherited()

max_vel = 1;

tempo_estado = room_speed * 1;
tempo = tempo_estado;

estado = "parado";//variavel vai controlar todos estados
debug = false;

muda_estado = function()
{
	
	//Checando se eu estou com mouse encima do inimigo
	var _mouse_sobre = position_meeting(mouse_x, mouse_y, id);

	//Checando se clicaram com o botao do meio
	var _click = mouse_check_button_released(mb_middle);

	//Se a pessoa clicou enqaunto o mouse estava sobre mim
	//Ou seja, clicou em mim
	//Ele muda meu estado
	if(_mouse_sobre && _click)
	{
		estado = get_string ("Digite o estado", "parado");
	}

}

controla_estado = function()
{
	//Controlando os estados do inimigo
	switch(estado)
	{
		#region parado
		case "parado":
			  //Diminuindo o tempo
			  tempo--;
			  //Ele deve ficar parado
			  velh = 0;
			  velv = 0;
			  
			  //Regra para sair desse estado
			  if(tempo <= 0)
			  {
				  //Mudando o tempo
				  estado = choose("parado","andando");
				  //Reseta o tempo
				  tempo = tempo_estado;
			  }
			  
		break;
		#endregion
		
		#region andando
		case "andando":
		tempo--;
		
		break;
		#endregion

	}	
}





















// Inherit the parent event
event_inherited();

