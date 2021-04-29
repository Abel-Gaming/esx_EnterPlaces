Config = {}

Config.EnableBlips = true                              -- Enable or disable blips on the map

Config.Locations = {
	{
		name = 'CEO Office',							-- Name that appears on the enter/exit text
		BlipCoord = vector3(-1371.06, -503.52, 33.16),  -- Location where blip on map is drown
		EnterCoord = vector3(-1371.06, -503.52, 33.16), -- Enter location (Usually the outside spot)
		ExitCoord = vector3(-1399.24, -480.44, 72.04)   -- Exit location (When entering, this is also where the player will spawn)
	},
	{
		name = 'CEO Garage',
		BlipCoord = vector3(-1361.19, -472.08, 31.6),
		EnterCoord = vector3(-1361.19, -472.08, 31.6),
		ExitCoord = vector3(794.23, -2992.76, -39.0)
	},
	{
		name = 'Office Roof',
		BlipCoord = vector3(-1392.82, -479.81, 72.04),
		EnterCoord = vector3(-1392.82, -479.81, 72.04),
		ExitCoord = vector3(-1369.18, -471.58, 84.45)
	},
	{
		name = 'Night Club',
		BlipCoord = vector3(-1211.69, -1070.28, 8.36),
		EnterCoord = vector3(-1211.69, -1070.28, 8.36),
		ExitCoord = vector3(-1604.664, -3012.583, -78.000)
	},
	{
		name = 'Airport Hanger',
		BlipCoord = vector3(-1045.08, -2750.4, 21.36),
		EnterCoord = vector3(-1045.08, -2750.4, 21.36),
		ExitCoord = vector3(-1234.6, -2982.04, -41.27)
	},
	{
		name = 'FIB Office',
		BlipCoord = vector3(136.19, -761.61, 45.75),
		EnterCoord = vector3(136.19, -761.61, 45.75),
		ExitCoord = vector3(136.04, -761.73, 234.15)
	}
}