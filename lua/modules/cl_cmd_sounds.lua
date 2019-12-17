

--tables
	local repcaptable = {"repcapaudio.mp3","repcapaudio2.mp3"}
	local repaud = repcaptable[math.random( 1, 2 )]
	print(repaud)
	local replostable = {"replos1.mp3"}
	local replosaud = replostable[math.random( 1 )]

	local sepcaptable = {"ciscapaud1.mp3"}
	local sepaud = sepcaptable[math.random( 1 )]
	print(sepaud)
	local seplostable = {"cislosaud1.mp3"}
	local seplosaud = seplostable[math.random( 1 )]
	local impcaptable = {"impcapaudio1.mp3","impcapaudio2.mp3","impcapaudio3.mp3"}

--sound functions
function repcap()
	surface.PlaySound( "repcapaudio"..math.random(1,3)..".mp3" )
end
function replos()
	surface.PlaySound(replosaud)
end
function sepcap()
	surface.PlaySound(sepaud)
end
function seplos()
	surface.PlaySound(seplosaud)
end
function impcap()
	surface.PlaySound(table.Random(impcaptable))
end
function saber_hit_sound()
	surface.PlaySound("lightsaber/saber_hit_laser"..math.random(1,5)..".wav")
end

concommand.Add("repcap", repcap)
concommand.Add("replos", replos)
concommand.Add("sepcap", sepcap)
concommand.Add("seplos", seplos)
concommand.Add("impcap", impcap)
concommand.Add("saber_hit_sound",saber_hit_sound)