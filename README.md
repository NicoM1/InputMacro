#InputMacro

######a simple macro-based system for JSON-based, remappable input handling

**Dependencies**: requires Luxe for input handling and codes, but can be easily changed for other frameworks

######Usage: 
- add an `input.json` file to your project:

```
{
	"actions": [
		{
			"name": "playerleft",
			"codes": ["key_a", "left"] //codes are by the name they have in 'snow.input.Keycodes'
		},
		{
			"name": "playerright",
			"codes": ["key_d", "right"]
		},
		{
			"name": "playerup",
			"codes": ["key_w", "up"]
		},
		{
			"name": "playerdown",
			"codes": ["key_s", "down"]
		},
		{
			"name": "playerjump",
			"codes": ["space"]
		}
	]
}
```

- type `InputManager.*`, all your actions will show up as members, each having `pressed()`, `released()`, and `down()` functions for checking state


- if you wish to allow the player to remap keys (will not work by default), add `InputRemapper.reMap();` somewhere in your startup functions, this will cause any actions that are changed in the JSON file to be overridden at runtime. currently this will throw an error on web targets, as the sys package is unavailable, just add an `#if !web` before calling