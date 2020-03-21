roles = {
    "BCSO",
    "SASP",
    "SAFR"
}
RegisterServerEvent("checkRoles")
AddEventHandler("checkRoles", function(ped)
    for k, v in ipairs(GetNumPlayerIdentifiers(ped)) do
        if string.sub(v, 1, string.len("discord:")) == "discord:" then
            discordIdentifier = v
        end
    end

    if discordIdentifier then
        for i = 1, #roles do
            if exports.discord_perms:IsRolePresent(discordIdentifier, roles[i]) then
                leostuff = true
            else
                leostuff = false
            end
        end
    else
        leostuff = false
    end
end)