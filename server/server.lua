-- Voeg dit toe aan je server.lua

-- Register the command /reply
RegisterCommand('reply', function(source, args, rawCommand)
    -- Check if the player has permission to use this command (replace with your own permission check)
    if IsPlayerAdmin(source) then
        -- Get the target player ID from the arguments
        local targetId = tonumber(args[1])
        -- Get the message from the arguments
        local message = table.concat(args, " ", 2)

        -- Check if the target player ID and message are valid
        if targetId and message and message ~= "" then
            -- Send the message to the target player
            TriggerClientEvent('chat:addMessage', targetId, {
                color = {255, 0, 0},
                multiline = true,
                args = {"Admin", message}
            })
            -- Notify the admin that the message was sent
            TriggerClientEvent('chat:addMessage', source, {
                color = {0, 255, 0},
                multiline = true,
                args = {"System", "Message sent to player ID " .. targetId}
            })
        else
            -- Notify the admin about incorrect usage
            TriggerClientEvent('chat:addMessage', source, {
                color = {255, 0, 0},
                multiline = true,
                args = {"System", "Usage: /reply [player ID] [message]"}
            })
        end
    else
        -- Notify the player that they do not have permission
        TriggerClientEvent('chat:addMessage', source, {
            color = {255, 0, 0},
            multiline = true,
            args = {"System", "You do not have permission to use this command."}
        })
    end
end, false)

-- Function to check if the player is an admin (replace this with your own implementation)
function IsPlayerAdmin(playerId)
    -- Example implementation, replace with your actual admin check logic
    local playerIdentifier = GetPlayerIdentifiers(playerId)[1]
    local admins = {"steam:110000123456789", "license:abcdef1234567890"} -- Replace with actual admin identifiers
    for _, admin in ipairs(admins) do
        if playerIdentifier == admin then
            return true
        end
    end
    return false
end
