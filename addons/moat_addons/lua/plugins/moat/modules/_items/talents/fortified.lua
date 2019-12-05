
TALENT.ID = 26
TALENT.Suffix = "Fortification"
TALENT.Name = 'Fortification'
TALENT.NameColor = Color(200, 200, 200)
TALENT.Description = 'After killing a player, you have a %s_^ chance to receive a %s_^ damage reduction for %s^ seconds'
TALENT.Tier = 2
TALENT.LevelRequired = {min = 15, max = 20}

TALENT.Modifications = {}
TALENT.Modifications[1] = {min = 50, max = 80} -- Chance to trigger
TALENT.Modifications[2] = {min = 5,  max = 10} -- Percent damage reduction
TALENT.Modifications[3] = {min = 5,  max = 20} -- Duration

TALENT.Melee = true
TALENT.NotUnique = true

function TALENT:OnPlayerDeath(vic, inf, att, talent_mods)
	local chance = self.Modifications[1].min + ((self.Modifications[1].max - self.Modifications[1].min) * talent_mods[1])
	if (chance > math.random() * 100) then
		local percent = (self.Modifications[2].min + ((self.Modifications[2].max - self.Modifications[2].min) * talent_mods[2])) / 100
		local duration = self.Modifications[3].min + ((self.Modifications[3].max - self.Modifications[3].min) * talent_mods[3])

		status.Inflict("Fortified", {Time = duration, Player = att, Percent = percent})
	end
end

if (SERVER) then
	local STATUS = status.Create "Fortification"
	function STATUS:Invoke(data)
		local effect = self:GetEffectFromPlayer("Fortification", data.Player)
		if (effect) then
			effect:AddTime(data.Time)
		else
			self:CreateEffect "Fortification":Invoke(data, data.Time, data.Player)
		end
	end

	local EFFECT = STATUS:CreateEffect "Fortification"
	EFFECT.Message = "Fortification"
	EFFECT.Color = TALENT.NameColor
	EFFECT.Material = "icon16/shield.png"
	function EFFECT:Init(data)
		local att = data.Player
		att.Fortified = 1 - data.Percent

		self:CreateEndTimer(data.Time, data)
	end

	function EFFECT:OnEnd(data)
		if (not IsValid(data.Player)) then return end

		local att = data.Player
		att.Fortified = nil
	end
end