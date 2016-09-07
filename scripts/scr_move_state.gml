///scr_move_state
movement = MOVE;
if (obj_input.dash_key) {
    var xdir = lengthdir_x(8, face * 90);
    var ydir = lengthdir_y(8, face * 90);
    var speaker = instance_place(x + xdir, y + ydir, obj_speaker);
    if (speaker != noone) {
        // Talk to speaker
        with (speaker) {
            if (!instance_exists(dialog)) {
                dialog = instance_create(x + xoffset, y + yoffset, obj_dialog);
                dialog.text = text;       
            } else {
                if (dialog.text_count < string_length(text[dialog.text_page]) - 1) {
                    dialog.text_count = string_length(text[dialog.text_page]) - 1;
                } else {
                    dialog.text_page++;
                    dialog.text_count = 0;
                    if (dialog.text_page > array_length_1d(dialog.text) - 1) {
                        with (dialog) {
                            instance_destroy();
                        }
                    }
                }
            }
        }
    } else {
        state = scr_dash_state;
        alarm[0] = room_speed / 6;
    }
}

if (obj_input.attack_key) {
    image_index = 0;
    state = scr_attack_state;
}

if (obj_input.spell_key && obj_player_stats.stamina >= SPELL_COST) {
    var p = instance_create(x, y, obj_projectile);
    var xforce = lengthdir_x(20, face * 90);
    var yforce = lengthdir_y(20, face * 90);
    p.creator = id;
    with (p) {
        physics_apply_impulse(x, y, xforce, yforce);
    }
    obj_player_stats.stamina -= SPELL_COST;
    obj_player_stats.alarm[0] = room_speed;
}
// Get direction
dir = point_direction(0, 0, obj_input.xaxis, obj_input.yaxis);

// Get length
if (obj_input.xaxis == 0 && obj_input.yaxis == 0) {
    len = 0;
} else {
    scr_get_face(dir);
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


