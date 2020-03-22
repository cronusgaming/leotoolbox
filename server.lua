roles = {
    "BCSO",
    "SASP",
    "SAFR"
}
RegisterServerEvent("checkRoles")
AddEventHandler("checkRoles", function(from)
	count = 0
	local src = source
	nFrom = from
    for i = 1, #roles do
        if (exports.discord_perms:IsRolePresent(src, roles[i]) == true) then
			count = count + 1
        end
    end
	if (count >= 1) then
		if (nFrom == "leoloadout") then
			TriggerClientEvent("lloadout", src)
		end
		if (nFrom == "leovehicles") then
			TriggerClientEvent("lvehicles", src)
		end
		if (nFrom == "leomenu") then
			TriggerClientEvent("lmenu", src)
		end
	end
end)