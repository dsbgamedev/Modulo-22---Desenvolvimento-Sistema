/// @description Insert description here
// You can write your code in this editor

var _up    = keyboard_check(vk_up);
var _down  = keyboard_check(vk_down);
var _left  = keyboard_check(vk_left);
var _right = keyboard_check(vk_right);

//velh = (_right - _left) * max_vel;
//velv = (_down - _up) * max_vel;

//Descobrir a direção em que o player esta indo
//Point direction
var _dir = point_direction( 0, 0, (_right - _left), (_down - _up));
//show_debug_message(_dir);

//Pegando o valor do velh




















