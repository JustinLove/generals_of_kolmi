GOK_BIOME_WIDTH = BiomeMapGetSize() * 512

saved_locations[#saved_locations+1] =
	{ west={ name="No Kolmi",x=3500-GOK_BIOME_WIDTH,y=13000},
		main={ name="Kolmi",x=3500,y=13000},
		east={ name="No Kolmi",x=3500+GOK_BIOME_WIDTH,y=13000}}
