local function VhsEffect()
    DrawColorModify({
        ["brightness"] = -0.05,
        ["contrast"] = 1.1,
        ["color"] = 0,
        ["mulr"] = 1,
        ["mulg"] = 1,
        ["mulb"] = 1,
        ["addg"] = -0.1,
        ["addb"] = -0.1,
    })

    DrawSharpen(2, 2, 0.5)

    DrawMotionBlur(0.1, 0.7, 0.01)

    DrawMaterialOverlay("models/props_lab/Tank_Glass001", 0)

    DrawToyTown(3, 0.5)
end

hook.Add("RenderScreenspaceEffects", "VhsEffect", VhsEffect)
