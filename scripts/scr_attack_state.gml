///scr_attack_state
movement = ATTACK;
image_speed = 0.8;

if (image_index >= 3 && !attacked) {
    switch (face) {
        case DOWN:
            xx = x;
            yy = y + 14;
            break;
        case UP:
            xx = x;
            yy = y - 10;
            break;
        case RIGHT:
            xx = x + 12;
            yy = y + 2;
            break;
        case LEFT:
            xx = x - 12;
            yy = y + 2;
            break;
    }
    var damage = instance_create(xx, yy, obj_player_damage);
    damage.creator = id;
    damage.damage = obj_player_stats.attack;
    attacked = true;
}
