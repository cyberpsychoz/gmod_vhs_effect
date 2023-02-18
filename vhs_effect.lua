-- Define the VHS effect
local vhs_effect = {
    ["DrawColorModify"] = true,
    ["ColorModify"] = {
        ["brightness"] = -0.05,
        ["contrast"] = 1.1,
        ["color"] = 0,
        ["mulr"] = 1,
        ["mulg"] = 1,
        ["mulb"] = 1,
        ["addg"] = -0.1,
        ["addb"] = -0.1,
    },
    ["DrawBloom"] = true,
    ["Bloom"] = {
        ["passcount"] = 1,
        ["darken"] = 0.2,
        ["multiply"] = 0.2,
        ["color"] = 0.5,
        ["x"] = 0,
        ["y"] = 0,
        ["passes"] = 3,
        ["density"] = 0.8,
        ["size"] = 1,
        ["contrast"] = 1,
    },
    ["DrawSharpen"] = true,
    ["Sharpen"] = {
        ["contrast"] = 1.5,
        ["distance"] = 1.5,
        ["steps"] = 5,
    },
    ["DrawToyTown"] = true,
    ["ToyTown"] = {
        ["size"] = 3,
        ["bshift"] = 0,
        ["cshift"] = 0,
    },
    ["DrawMotionBlur"] = true,
    ["MotionBlur"] = {
        ["delay"] = 0.05,
        ["blur"] = 0.05,
        ["fadein"] = 0.05,
        ["fadeout"] = 0.05,
    },
    ["DrawMaterialOverlay"] = true,
    ["MaterialOverlay"] = {
        ["material"] = "effects/tp_eyefx/tpeye",
        ["ignorez"] = false,
        ["nocull"] = true,
    },
    ["DrawVignette"] = true,
    ["Vignette"] = {
        ["centerx"] = 0.5,
        ["centery"] = 0.5,
        ["radius"] = 1.2,
        ["brightness"] = -0.05,
        ["color"] = 1,
        ["alpha"] = 0.1,
    },
}

-- Add the effect to the context menu
hook.Add("PopulateToolMenu", "VHSEffect", function()
    spawnmenu.AddToolMenuOption("PostProcessing", "VHS Effect", "VHSEffect", "VHS Effect", "", "", function(panel)
        for k, v in pairs(vhs_effect) do
            panel:CheckBox(k, k)
        end
    end)
end)
