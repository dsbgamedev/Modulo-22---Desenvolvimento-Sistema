/// @description Insert description here
// You can write your code in this editor

//Checando se eu estou no cHão
var _chao = place_meeting(x, y + 1, obj_chao_pl); //Quando for 1 estou no chão

//Movimento
var _jump = keyboard_check_pressed(vk_space);//Pula apenas quando eu aparetar o botao
var _left  = keyboard_check(ord("A"));
var _rigth = keyboard_check(ord("D"));

//Aplicando os controle ao movimento
velh = (_rigth - _left) * max_velh;

//Checando se eu estou no chão
if(_chao)
{
	//Reseto a quantidade de pulos
	qtd_jump = 2;
}
else//Se eu não estou no chao
{
	//Aplicando a velocidade vertical (gravidade)
	velv += gravidade;
}

//Pulando
if(_jump && qtd_jump)//(_jump && _chao)
{
	velv = -max_velv;
	//Diminui a Quantidades de pulos
	qtd_jump--;
	
}
//Limitando a gravidade
/*if(velv > max_velv) velv = max_velv;
ou 
*/
velv = clamp(velv, -max_velv, max_velv * 2);//Cair mais rapido basta multiplicar


















