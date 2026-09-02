scale = 1
draw_set_font(Font1)
draw_set_valign(fa_middle)
draw_set_halign(fa_center)
draw_healthbar(x-100, y+5, x, y, (c_Persistent.player_Charge / c_Persistent.player_maxCharge)*100,
c_black, c_blue, c_blue, 0, true, true);