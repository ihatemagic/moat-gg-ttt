ITEM.Name = "Shy Bag"
ITEM.ID = 490
ITEM.Description = "Not to be confused with Shy Guy"
ITEM.Rarity = 5
ITEM.Collection = "Urban Style Collection"
ITEM.Skin = 3
ITEM.Model = "models/sal/halloween/bag.mdl"
ITEM.Attachment = "eyes"



function ITEM:ModifyClientsideModel(ply, model, pos, ang)

	model:SetSkin( 3 )
	model:SetModelScale( 1.05, 0 )
	pos = pos + (ang:Forward() * -4.225098) + (ang:Right() * 0.245583) +  (ang:Up() * -0.539162)
	
	return model, pos, ang
end

