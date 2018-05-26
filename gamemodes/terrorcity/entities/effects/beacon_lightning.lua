function EFFECT:Init(data)
    self.lightning_time = CurTime()
    self.pos = data.death_position or data:GetOrigin() or Vector(0, 0, 0)
    sound.PlayURL("https://i.moat.gg/DRx6h.mp3", "3d", function(snd)
        if (IsValid(snd)) then
            snd:SetPos(self.pos)
            snd:Set3DFadeDistance(8000, 1000000000)
            snd:Play()
        end
    end)
end

-- from wiki!
local lightningMaterial = Material "sprites/lgtning"
function EFFECT:Render()
    local offset = CurTime() - self.lightning_time
    if (offset > 0.75 and offset < 1.25) then return end

    -- Calculate a random UV to use for the lightning to give it some movement
    local uv = math.Rand(0, 1)

    -- Enable blend override to interpret the color and alpha from the texture.
    --render.OverrideBlendFunc(true, BLEND_SRC_COLOR, BLEND_SRC_ALPHA, BLEND_ONE, BLEND_ZERO)

    render.SetMaterial(lightningMaterial)

    -- Render a lightning beam along points randomly offset from a line above the player.
    render.StartBeam(5)
        render.AddBeam(self.pos + Vector(0, 0, 035), 20, uv, Color( 255, 255, 255, 255 ) )
        render.AddBeam(self.pos + Vector(0, 0, 135) + Vector(math.Rand(-20, 20), math.Rand(-20, 20), 0), 20, uv * 2, color_white)
        render.AddBeam(self.pos + Vector(0, 0, 235) + Vector(math.Rand(-20, 20), math.Rand(-20, 20), 0), 20, uv * 3, color_white)
        render.AddBeam(self.pos + Vector(0, 0, 335) + Vector(math.Rand(-20, 20), math.Rand(-20, 20), 0), 20, uv * 4, color_white)
        render.AddBeam(self.pos + Vector(0, 0, 435) + Vector(math.Rand(-20, 20), math.Rand(-20, 20), 0), 20, uv * 5, color_white)
    render.EndBeam()

    -- Disable blend override
    --render.OverrideBlendFunc(false)
end

function EFFECT:Think()
    return CurTime() <= self.lightning_time + 2
end