/// @description Insert description here
// You can write your code in this editor

//Se o jogo esta pausado, eu não rodo nada daqui
if(global.pause) 
{
	velh = 0;
	velv = 0;
	exit;
}
if(keyboard_check_released(vk_tab)) global.debug = !global.debug;

//Checando se eu estou no gelo
//Vai retornar false (-4) e se eu não estou colidindo
//Vai retornar o id de quem colidiu comigo (Do gelo)
var _gelo = instance_place(x,y,obj_gelo_td);

//Checando se estou no gelo
if(_gelo)
{
	acel = _gelo.meu_acel;
}
else //Se eu não colidi, o valor do acel é o MEU acel
{
	acel = meu_acel;	
}

//Só faço isso se eu estou apertando alguma tecla
//Só quero que ele faça isso
//Se eu estou apertando para a esquerda ou direita, mas nao os dois
//Ao mesmo tempo



//show_debug_message(image_number);//Verifica quantas imagens esta sendo usada
//show_debug_message(imagem_index);//
show_debug_message(image_numb);
estado(); // Recebeu o metodo estado_parado e executa ele



















