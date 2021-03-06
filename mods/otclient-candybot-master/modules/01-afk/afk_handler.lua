--[[
  @Authors: Ben Dol (BeniS)
  @Details: Afk bot module handler for module registration
            and control.
]]

dofile('afk.lua')

-- required by the event handler
function AfkModule.getModuleId()
  return "AfkModule"
end

AfkModule.dependencies = {
  "BotModule"
}

--[[ Default Options ]]

AfkModule.options = {
  ['CreatureAlert'] = false,
  ['BlackList'] = '',
  ['WhiteList'] = '',

  ['AutoEat'] = false,
  ['AutoEatSelect'] = 'Meat',

  ['AutoFishingCheckCap'] = false,
  ['AutoFishing'] = false,

  ['RuneMake'] = false,
  ['RuneSpellText'] = 'adori gran',
  ['RuneMakeOpenContainer'] = true,
  
  ['AutoReplaceWeapon'] = false,
  ['AutoReplaceWeaponSelect'] = 'Left Hand',
  ['ItemToReplace'] = 3277,

  ['MagicTrain'] = false,
  ['MagicTrainSpellText'] = 'utana vid',
  ['MagicTrainManaRequired'] = 50,
  ['AntiKick'] = false,
  ['AutoSay'] = false,
  ['AutoSayText'] = 'Texto',
  ['AutoBuff'] = false,
  ['AutoBuffText'] = 'Open Gates'
}

--[[ Register Events ]]

table.merge(AfkModule, {
  creatureAlertEvent = 1,
  antiKickEvent = 2,
  autoFishingEvent = 3,
  autoEatEvent = 4,
  runeMakeEvent = 5,
  autoReplaceWeaponEvent = 6,
  magicTrainEvent = 7,
  autoSayEvent = 8,
  autoBuffEvent = 9
})

AfkModule.events = {
  [AfkModule.creatureAlertEvent] = {
    option = "CreatureAlert", 
    callback = AfkModule.CreatureAlert.Event
  },
  [AfkModule.antiKickEvent] = {
    option = "AntiKick", 
    callback = AfkModule.AntiKick.Event
  },
  [AfkModule.autoFishingEvent] = {
    option = "AutoFishing", 
    callback = AfkModule.AutoFishing.Event
  },
  [AfkModule.autoEatEvent] = {
    option = "AutoEat", 
    callback = AfkModule.AutoEat.Event
  },
  [AfkModule.runeMakeEvent] = {
    option = "RuneMake", 
    callback = AfkModule.RuneMake.Event
  },
  [AfkModule.autoReplaceWeaponEvent] = {
    option = "AutoReplaceWeapon", 
    callback = AfkModule.AutoReplaceHands.Event
  },
  [AfkModule.magicTrainEvent] = {
    option = "MagicTrain", 
    callback = AfkModule.MagicTrain.Event
  },
  [AfkModule.autoSayEvent] = {
    option = "AutoSay", 
    callback = AfkModule.AutoSay.Event
  },
  [AfkModule.autoBuffEvent] = {
    option = "AutoBuff", 
    callback = AfkModule.AutoBuff.Event
  }
}

--[[ Register Listeners ]]

table.merge(AfkModule, {
  --
})

AfkModule.listeners = {
  --
}

--[[ Functions ]]

function AfkModule.stop()
  EventHandler.stopEvents(AfkModule.getModuleId())
  ListenerHandler.stopListeners(AfkModule.getModuleId())
end

-- Start Module
AfkModule.init()