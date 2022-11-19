--[[
 /\
/!!\	WARNING
----
- YOU MUST FIRST INPUT THE QUESTION AND ANSWERS IN SETTINGS!

> (Take Note:)
- You will create your own GUI, and connect them at "settings.Objects"

> (How to use this model?)
1. Place my child "Settings" at a ScreenGUI.

2. Open "Settings".

3. Search "settings.Objects" at "Settings".

4. Complete the table, there must be no "nil" unless the optional indexes.

> (if you want it to start already:)
5. Create a local script call it whatever you want, Type in the local script:
	```
		local form = require("path to settings".Form) --Example: local settings = require(script.Parent.Settings.Form)
		local StartForm = form:Start()
		
		-- if you want it to be random:
		StartForm:Random()
		
		-- if you want it to be in order:
		StartForm:Order()
	```

--]]

![Location.png]