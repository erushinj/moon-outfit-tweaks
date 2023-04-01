if RequiredScript == "lib/tweak_data/levelstweakdata" then
	Hooks:PostHook( LevelsTweakData, "init", "outfit_tweaks_init", function(self)
		for _, level in pairs(self._level_index) do
			if self[level] and self[level].player_style then
				self[level].player_style = nil
			end
		end
	end )
elseif RequiredScript == "lib/tweak_data/tweakdatapd2" then
	Hooks:PostHook( TweakData, "_setup_scene_poses", "outfit_tweaks__setup_scene_poses", function(self)
		for menu_name, menu in pairs(self.scene_poses) do
			if menu_name == "player_style" or menu_name == "armor" then
				for wearable_name in pairs(menu) do
					menu[wearable_name] = {
						"suit"
					}
				end
			end
		end
	end )
elseif RequiredScript == "lib/managers/menu/menuscenemanager" then
	Hooks:PostHook( MenuSceneManager, "_set_up_templates", "outfit_tweaks__set_up_templates", function(self)
		self._scene_templates.blackmarket_armor.hide_mask = false
	end )
end