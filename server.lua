roles = {
    "BCSO",
    "SASP",
    "SAFR"
}
RegisterServerEvent("checkRoles")
AddEventHandler("checkRoles", function()
	count = 0
	local src = source
    for i = 1, #roles do
        if (exports.discord_perms:IsRolePresent(src, roles[i]) == true) then
			count = count + 1
        end
    end
	if count == 0 then
		return false
	else
		return true
	end
end)