


if (keyboard_check(vk_left) && !instance_place(x-move_speed, y, obj_block)) {
	
	if (!climbing) {
	x += -move_speed
	image_xscale = -1
	}
}

if (keyboard_check(vk_right) && !instance_place(x+move_speed, y, obj_block)) {
	if (!climbing) {
	x += move_speed
	image_xscale = 1
	}
}

if (!climbing) {
	if (keyboard_check_pressed(ord("Z"))) { 
		instance_create_layer(x, y, "Instances", obj_sword);
	}
}
if (keyboard_check(vk_up)) {
	if (!climbing){
	if (instance_place(x, y+1, obj_block)) {
		vspeed = jump_height
	}
	}
}

if (!climbing) {
	if (instance_place(x, y+1, obj_block)) {
				gravity = 0
	}
	else {
		gravity = 0.25
	}
	vspeed = min(vspeed, 12)
}

if (instance_place(x, y+1, obj_ladder)) {
	if (keyboard_check(vk_up) || keyboard_check(vk_down)) {
		climbing = true
		vspeed = 0
		gravity = 0
		sprite_index = spr_climbing
		
	}

}
else {
	climbing = false
	sprite_index = spr_player
}
if (climbing) {
	if (keyboard_check(vk_up)) {
		y += climb_speed
	}
	if (keyboard_check(vk_down)) {
		if (!instance_place(x, y+4,  obj_block)) {
			y -= climb_speed
		}
		else {
		climbing = false
		sprite_index = spr_player		
		}
	}

		
}