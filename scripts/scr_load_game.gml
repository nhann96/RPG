///scr_load_game

var file = file_text_open_read(working_directory + "mySaveGame.txt");
var save_string = file_text_read_string(file);
file_text_close(file);
save_string = base64_decode(save_string);

var save_data = json_decode(save_string);

var save_room = save_data[? "room"];
if (room != save_room) {
    room_goto(save_room);
}

with (obj_player_stats) {
    player_xstart = save_data[? "x"];
    player_ystart = save_data[? "y"];
    if (instance_exists(obj_player)) {
        obj_player.x = player_xstart;
        obj_player.y = player_ystart;
        obj_player.phy_position_x = player_xstart;
        obj_player.phy_position_y = player_ystart;
    } else {
        instance_create(player_xstart, player_ystart, obj_player);
    }
    
    hp = save_data[? "hp"];
    max_hp = save_data[? "max_hp"];
    stamina = save_data[? "stamina"];
    max_stamina = save_data[? "max_stamina"];
    attack = save_data[? "attack"];
    expr = save_data[? "expr"];
    max_expr = save_data[? "max_expr"];
    level = save_data[? "level"];
}

ds_map_destroy(save_data);
