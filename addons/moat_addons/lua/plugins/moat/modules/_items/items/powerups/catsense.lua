
ITEM.ID = 24

ITEM.Name = "Cat Sense"

ITEM.NameColor = Color( 139, 0, 166 )

ITEM.Description = "Fall damage is reduced by %s_ when using this power-up"

ITEM.Image = "https://static.moat.gg/f/e62954919e052ed558d6b2e451badd24.png" 

ITEM.Rarity = 2

ITEM.Collection = "Alpha Collection"

ITEM.Stats = {

	{ min = -35, max = -75 }

}

function ITEM:OnDamageTaken( ply, dmginfo, powerup_mods )

	if ( dmginfo:IsFallDamage() ) then

		local damage_scale = 1 + ( ( self.Stats[1].min + ( ( self.Stats[1].max - self.Stats[1].min ) * math.min(1, powerup_mods[1]) ) ) / 100 )

		dmginfo:ScaleDamage( damage_scale )

	end

end