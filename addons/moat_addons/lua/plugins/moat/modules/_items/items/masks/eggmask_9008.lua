ITEM.Name = 'Dark Crimson Egg Of Nemesis'
ITEM.ID = 9008
ITEM.Description = 'A rare cosmetic egg from the Easter holiday event! Right click while in loadout to customize position/size.'
ITEM.Rarity = 8
ITEM.Collection = 'Egg Hunt Collection'
ITEM.Model = 'models/roblox_assets/dark_crimson_egg_of_nemesis.mdl'
ITEM.Attachment = 'eyes'
function ITEM:ModifyClientsideModel(pl, mdl, pos, ang)
	mdl:SetModelScale(0.625)
	pos = pos + (ang:Forward() * -3.5049438476563) + (ang:Right() * 0.00201416015625) +  (ang:Up() * 0.56503295898438)
	
	return mdl, pos, ang
end