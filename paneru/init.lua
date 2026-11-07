-- Paneru Lua configuration (hot-reloaded on save).
--
-- Hook into window-manager events:
--   paneru.on("window_focused", function(e) paneru.log("focused " .. e.window_id) end)
--
-- Bind keys to commands (chord syntax matches [bindings]):
--   paneru.bind("alt - b", "window balance")
--
-- ...or to a function. Handlers are given the whole layout as a value they can
-- transform; nothing moves until you return one, so computing a layout and
-- discarding it costs nothing. See CONFIGURATION.md.
--   paneru.bind("alt - j", function(ws)
--     return ws:focus(ws:east(ws:focused()))
--   end)

local gap = 8
-- Friction: finger travel in cm for each three-finger window step.
-- A lower value gives a shorter stroke. The value must be more than 0.
local friction = 0.8

paneru.setup({
	options = {
		-- Paneru moves each window through Accessibility on every frame.
		-- A higher value gives a shorter animation with fewer frames.
		animation_speed = 15.0,
	},
	-- Edge padding matches the gap between two windows (2 x horizontal_padding).
	padding = { left = gap, right = gap },
	swipe = {
		sensitivity = 0.5,
		deceleration = 8.0,
		-- Paging needs a Paneru build newer than v0.5.2.
		gesture = { fingers_count = 3, paging = true, page_distance_cm = friction },
	},
	bindings = {
		["window focus west"] = "alt - h",
		["window focus south"] = "alt - j",
		["window focus north"] = "alt - k",
		["window focus east"] = "alt - l",
		["window swap west"] = "alt + shift - h",
		["window swap south"] = "alt + shift - j",
		["window swap north"] = "alt + shift - k",
		["window swap east"] = "alt + shift - l",
	},
	windows = {
		-- horizontal_padding applies to each side of a window.
		-- The width applies only when Paneru first manages a window.
		all = { title = ".*", width = 0.75, horizontal_padding = gap },
		-- The quick terminal takes the shell title. Its subrole is the stable match.
		ghostty_quick_terminal = {
			title = ".*",
			bundle_id = "com.mitchellh.ghostty",
			subrole = "AXFloatingWindow",
			floating = true,
		},
	},
})
