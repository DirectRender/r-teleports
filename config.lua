Config = Config or {}


-- MAIN ----------------------------------------------------------------------------------------------------------------
Config.notify = true -- If you want notifications when teleporting (uses notifyText, notifytime, notifytype)
-- Config.notify Only supports QBCore's notifications and okokNotify atm :)
Config.pressButton = 51 -- What button to teleport? (https://docs.fivem.net/docs/game-references/controls/)
Config.textButton = "~b~[E]~w~ " -- Example: "[E] " -- Out: [E] text (Don't forget that space in the end)
------------------------------------------------------------------------------------------------------------------------

-- Text ----------------------------------------------------------------------------------------------------------------
Config.useBackground = true -- Do we want a background in the text?
Config.scale = 0.35 -- Text scale
Config.textColor = {255, 255, 255, 200} -- Text color (RGBA - red, green, blue, alpha)
Config.backgroundColor = {0, 0, 0, 75} -- Text color (RGBA - red, green, blue, alpha)

--[[

[1] = { -- This is unqiue and can't ever be duplicated! Always use 1, 2, 3, 4, 5, 69..
   [1] = { -- Teleport 1
      coords = vector4(0, 0, 0, 0), -- x, y, z, heading (z)
      text = 'Go up', -- Text
      viewDistance = 5.0, -- Distance to see text (If vieDistance is under or equals useDistance then only useDistance will be showned)
      useDistance = 1, -- Distance to see text + Config.textButton (Text goes after Config.textButton)
      notifyText = "Teleported!", -- (If Config.notify) Text for notification
      notifyTime = 5, -- (If Config.notify) Time for notification (In seconds)
      notifyType = "success" -- (If Config.notify) Type for notification (success, error, info) - Look at QB or okokNotify docs for more information
      },
   [2] = { -- Teleport 2
   },
},

--]]


Config.textLocations = {
   [1] = {
      [1] = {
         coords = vector4(259.67, -783.17, 30.51, 248.96),
         text = 'Go up',
         viewDistance = 5.0,
         useDistance = 1,
         notifyTime = 5,
         notifyText = "Teleported!",
         notifyType = "success"
      },
      [2] = {
         coords = vector4(285.0, -759.05, 63.47, 161.44),
         text = 'Go down',
         viewDistance = 5.0,
         useDistance = 1,
         notifyText = "Teleported!",
         notifyTime = 5,
         notifyType = "success"
      },
   },
}
