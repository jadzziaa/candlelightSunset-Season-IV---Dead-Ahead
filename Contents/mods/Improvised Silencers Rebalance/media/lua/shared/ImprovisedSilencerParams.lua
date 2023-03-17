local ImprovisedSilencerParams = {
	-- Item name = {volume mult, radius mult, sound}
	["ImprovisedSilencers.Silencer"] = {
        volume = 0.5,
        radius = 0.4,
        sound = 'suppressedshot2',
        maxDamage = 400,
    },
	["ImprovisedSilencers.SilencerPistol"] = {
        volume = 0.5,
        radius = 0.4,
        sound = 'suppressedshot',
        maxDamage = 400,
    },
	["ImprovisedSilencers.MetalPipeSilencer"] = {
        volume = 0.5,
        radius = 0.5,
        sound = 'suppressedshot2',
        maxDamage = 200,
    },
	["ImprovisedSilencers.TorchSilencer"] = {
        volume = 0.7,
        radius = 0.7,
        sound = 'crafted_silenced_shot',
        maxDamage = 50,
    },
	["ImprovisedSilencers.WaterBottleSilencer"] = {
        volume = 0.7,
        radius = 0.7,
        sound = 'crafted_silenced_shot',
        maxDamage = 30
    },
}

return ImprovisedSilencerParams