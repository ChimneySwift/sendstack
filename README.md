# Send Stack
Adds a command to Minetest which enables you to send the stack you are currently holding to another player's inventory.

## Usage
`/sendstack <playername>`

Takes the item you are holding and sends it to `playername`, setting the stack you are holding to what couldn't be added to the player's inventory (none if all was added, partial stack if partially added and a full stack if none was added)