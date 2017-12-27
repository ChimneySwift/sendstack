# Send Stack
Adds a command to Minetest which enables you to send the stack you are currently holding to another player's inventory.

## Usage
`/sendstack <playername>`

Takes the item you are holding and sends it to `playername`, setting the stack you are holding to what couldn't be added to the player's inventory (none if all was added, partial stack if partially added and a full stack if none was added)

## Privs
By default the command will require the `interact` priv. On lines 1 to 4 you can enable or disable and set an additional privilage (such as ban) to also be required. 
