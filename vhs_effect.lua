local effect = {}
local vignette = Material( "hud/vignette.png", "smooth" )
local scanline = Material( "hud/scanlines.png", "smooth" )
local overlay = Material( "hud/overlay.png", "smooth" )

function effect:Render()
    -- Draw a vignette effect around the edges of the screen
    surface.SetMaterial( vignette )
    surface.DrawTexturedRect( 0, 0, ScrW(), ScrH() )

    -- Draw scanlines across the screen
    surface.SetMaterial( scanline )
    surface.DrawTexturedRect( 0, 0, ScrW(), ScrH() )

    -- Draw an overlay texture on top of the screen
    surface.SetMaterial( overlay )
    surface.DrawTexturedRect( 0, 0, ScrW(), ScrH() )
end

function effect:Init()
    -- Do any initialization here, such as loading materials or setting up variables
end

function effect:Think()
    -- Do any logic here, such as updating variables or checking for events
end

function effect:OnDisable()
    -- Clean up any resources used by the effect when it is disabled
end

function effect:OnRemove()
    -- Clean up any resources used by the effect when it is removed
end

local player_effect = nil

-- Add the effect to the player's screen when they spawn
hook.Add( "PlayerSpawn", "VHSEffect", function( ply )
    player_effect = ply:AddEffects( "VHSEffect" )
end )

-- Remove the effect from the player's screen when they die
hook.Add( "PlayerDeath", "RemoveVHSEffect", function( ply )
    if ( player_effect ) then
        ply:RemoveEffects( player_effect )
        player_effect = nil
    end
end )

-- Register the effect with Garry's Mod
local effect_name = "VHSEffect"
local description = "Накладывает VHS эффект на ваш экран."
local author = "Крыжовник"
local version = "1.0"
local flags = EF_NODRAW

local new_effect = table.Copy( effect )
new_effect.Flags = flags
new_effect.Description = description
new_effect.Author = author
new_effect.Version = version

effects.Register( new_effect, effect_name )
