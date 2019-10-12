
hook.Add("Tick","TickBlah",function()

for k, v in pairs( player.GetAll() ) do
if v:Frags() > 9 then
	v:Freeze( true )
	RunConsoleCommand("ai_disabled","1")

end
if v:Deaths() > 9 then
	v:Freeze( true )
	RunConsoleCommand("ai_disabled","1")

end
end
end)