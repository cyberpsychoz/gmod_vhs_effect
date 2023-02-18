local vhsEffect = {}
vhsEffect.Name = "VHSEffect"
vhsEffect.Material = "pp/toytown-top"
vhsEffect.DrawScreenspaceEffects = true
vhsEffect.DrawPostProcess = true
vhsEffect.Init = function()
end

function vhsEffect:RenderScreenspaceEffects()
    DrawToyTown( 3, ScrH() / 2 )
    DrawSharpen( 1.5, 0.5 )
    DrawMaterialOverlay( "models/debug/debugwhite", 0.04 )
    DrawMaterialOverlay( "models/debug/debugwhite", 0.02 )
end

local postProcessEnabled = false

hook.Add( "RenderScreenspaceEffects", "VHSEffect", function()
    if postProcessEnabled then
        vhsEffect:RenderScreenspaceEffects()
    end
end )

hook.Add( "PopulateToolMenu", "VHSEffect", function()
    spawnmenu.AddToolMenuOption( "PostProcessing", "VHS Effect", "VHSEffectSettings", "VHS Effect", "", "", function( panel )
        panel:ClearControls()
        panel:CheckBox( "Enabled", "vhs_postprocess_enabled", "1" )
    end )
end )

hook.Add( "Think", "VHSEffect", function()
    local postProcessConVar = GetConVar( "vhs_postprocess_enabled" )
    if postProcessConVar and postProcessConVar:GetBool() ~= postProcessEnabled then
        postProcessEnabled = postProcessConVar:GetBool()
    end
end )

effects.Register( vhsEffect, "VHSEffect" )
