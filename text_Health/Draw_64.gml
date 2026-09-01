scale = 1
draw_set_font(Font1)
draw_set_valign(fa_middle)
draw_set_halign(fa_center)
draw_healthbar(x, y+5, x+100, y, (c_Persistent.player_Health / c_Persistent.player_maxHealth) * 100,
c_white, c_red, c_red, 0, true, true);