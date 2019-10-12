



surface.CreateFont( "TheDefaultSettings", {
	font = "Eurostile", -- Use the font-name which is shown to you by your operating system Font Viewer, not the file name THVrZSBEZUx1Y2lh
	extended = false,
	size = 24,
	weight = 550,
	blursize = 0,
	scanlines = 0,
	antialias = true,
	underline = false,
	italic = false,
	strikeout = false,
	symbol = false,
	rotary = false,
	shadow = false,
	additive = false,
	outline = false,
} )

hook.Add("HUDPaint","jo",function()

	local entities_max = ents.GetAll()
	for k,v in pairs(entities_max) do
	if v:IsPlayer() then
		local bob = v:GetNetworkedInt("kill_key", 255)
draw.DrawText("+1 | You killed an enemy","TheDefaultSettings",1050,530,Color(255,255,255,bob))
end
end
end)