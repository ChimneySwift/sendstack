minetest.register_chatcommand("sendstack", {
    params = "<player>",
    description = "Send the item you are currently holding to the receiver's inventory.",
    privs = {ban = true,}
    func = function(name, param)
        local sender = minetest.get_player_by_name(name)
        local receiver = minetest.get_player_by_name(param)
        if not receiver then
            return false, "\""..param.."\" is not a valid player."
        end

        if name == param then
            return false, "You cannot send items to yourself."
        end

        local sendstack = sender:get_wielded_item()
        if sendstack:is_empty() then
            return false, "You must be holding the item you wish to send."
        end
        local sendstackname = sendstack:get_name()
        local sendstackcount = sendstack:get_count()
        local stackstring = sendstackname.." "..sendstackcount

        local leftover = receiver:get_inventory():add_item("main", sendstack)
        sender:set_wielded_item(leftover)

        local partiality = ""
        if leftover:is_empty() then
            partiality = ""
        elseif leftover:get_count() == sendstack:get_count() then
            partiality = "could not be "
        else
            partiality = "partially "
        end
        minetest.log("action", ("%s %ssent to %s from %s"):format(stackstring, partiality, param, name))
        minetest.chat_send_player(param, ("%q %ssent to inventory from player %s."):format(stackstring, partiality, name))
        return true, ("%q %ssent to %s."):format(stackstring, partiality, param)
    end,
})