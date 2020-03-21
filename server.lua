roles = {
    "BCSO",
    "SASP",
    "SAFR"
}
RegisterServerEvent("checkRoles")
AddEventHandler("checkRoles", function()
	count = 0
    for i = 1, #roles do
        if exports.discord_perms:IsRolePresent(source, roles[i]) then
            leostuff = true
			count = count + 1
        end
    end
	if count == 0 then
		leostuff = false
	end
end)