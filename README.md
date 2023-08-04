# Status Hud Template

This status hud is made for [ox_core](https://github.com/overextended/ox_core). The script provides with a bare bone template for further tweaking and development. Currently only incorporates the following statuses:

- health
- armor
- hunger
- thirst 
- stress
- stamina

![status](https://github.com/itzhapp/svelte_status_hud/assets/88381788/a69de22a-934c-4d97-b84d-d01f6f6506f9)\
The resource is not built to handle restart in-game.

# Documentation

### UI
The project uses Svelte and pnpm. For information about how to build the UI: [svelte-lua-boilerplate](https://github.com/project-error/svelte-lua-boilerplate), this is you intend to tweak the NUI and have the result appear in game. If you get the error "[ERR_MODULE_NOT_FOUND]" run `pnpm run dev`

### Adding another progression wheel

Firstly add the new data you want to add to client.lua, look at the other status as examples - Add a suiting threshhold for updating UI, don't update the UI every second. Then in Dashboard.svelte you need to add a useNuiEvent and a Circle, see previous implementations as examples. Then in Circle.svelte you need to import the [fontawesome](https://fontawesome.com/) you want to use, and add it to the switch statement. 

## Acknowledgements

 - [Progression Ring Svelte by 9t5c](https://github.com/9t5c/svelte-circle)
 - [project-error svelte-lua-boilerplate](https://github.com/project-error/svelte-lua-boilerplate)
