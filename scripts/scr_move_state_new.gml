///scr_move_state

scr_get_input();

// Get direction
var dir = point_direction(0, 0, xaxis, yaxis);

// Get length
if (xaxis == 0 && yaxis == 0) {
    len = 0;
} else {
    len = spd;
}

// Get the hspd and vspd
hspd = lengthdir_x(len, dir);
vspd = lengthdir_y(len, dir);

// Move

phy_position_x += hspd;
phy_position_y += vspd;

// Control sprite
image_speed = 0.2;
if (len == 0) {
    image_index = 0;
}

// Vertical Sprite
if (vspd > 0) {
    sprite_index = spr_player_down;
} else if (vspd < 0) {
    sprite_index = spr_player_up;
}

// Horizontal Sprite
if (hspd > 0) {
    sprite_index = spr_player_right;
} else if (hspd < 0) {
    sprite_index = spr_player_left;
}

