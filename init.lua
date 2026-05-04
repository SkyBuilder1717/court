local modname = core.get_current_modname()
local S = core.get_translator(modname)

core.register_node("court:gavel_block", {
	description = S("Gavel Block"),
	tiles = {"court_gavel_block.png"},
	drawtype = "nodebox",
	paramtype = "light",
	node_box = {
		type = "fixed",
		fixed = {
			{-0.1875, -0.5, -0.1875, 0.1875, -0.375, 0.1875},
			{-0.25, -0.5, -0.25, 0.25, -0.4375, 0.25}
		}
	},
	paramtype2 = "facedir",
	place_param2 = 0,
	groups = {choppy = 2, oddly_breakable_by_hand = 2, flammable = 2, attached_node = 1},
	is_ground_content = false,
	sounds = default.node_sound_wood_defaults(),
	on_rightclick = function(pos, _, _, itemstack)
		if itemstack:get_name() == "court:gavel" then
			core.sound_play("court_gavel_hit", {pos = pos, max_hear_distance = 128, gain = 2})
		end
	end
})

core.register_craftitem("court:gavel", {
	description = S("Gavel"),
	inventory_image = "court_gavel.png"
})

armor:register_armor(":3d_armor:judge_coat", {
	description = S("Judge Coat"),
	inventory_image = "court_coat_inv.png",
	groups = {armor_torso=1, armor_heal=0, armor_use=3000, flammable=1},
	armor_groups = {fleshy=1},
	damage_groups = {cracky=2, snappy = 2, choppy = 2, crumbly=2, level=1},
})

core.register_craft({
	output = "court:gavel",
	recipe = {
		{"default:wood", "default:tree", "default:wood"},
		{"", "default:stick", ""},
		{"", "default:stick", ""}
	}
})

core.register_craft({
	output = "court:gavel_block",
	recipe = {
		{"default:wood", "default:tree", "default:wood"}
	}
})

core.register_craft({
	output = "3d_armor:judge_coat",
	recipe = {
		{"wool:black", "", "wool:black"},
		{"wool:black", "wool:black", "wool:black"},
		{"wool:black", "wool:black", "wool:black"},
	}
})