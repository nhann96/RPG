///scr_knockback_helper(dir)
var dir = argument0;

var xforce = lengthdir_x(knockback, dir);
var yforce = lengthdir_y(knockback, dir);

with (other) {
    physics_apply_impulse(x, y, xforce, yforce);
}
