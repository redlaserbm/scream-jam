/// @description This object determines where to place items on screen so they can be clicked on and interacted with by the player.

room_setup = false;

// For each room, list the items that can be interacted with in that room
room_items = ds_map_create();
ds_map_add(room_items, rm_test_shop, [itm_poster]);
ds_map_add(room_items, rm_chinese, [itm_sign]);
// ds_map_add(room_items, rm_road, [itm_leif, itm_tree, itm_car, itm_jakkop]);

active_items = []; // Array of items in the current room.
created_items = []; // This tracks the instances of the items that were actually created. 

// Variable which tracks the index (in active_items) of the item being hovered over.
// Reads -1 if no such item exists
highlighted_ind = -1;

fudge_factor = 0;