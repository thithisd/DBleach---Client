--[[
  @Authors: Ben Dol (BeniS)
  @Details: Magic train event logic
]]

AfkModule.MagicTrain = {}
MagicTrain = AfkModule.MagicTrain

function MagicTrain.Event(event)
  if g_game.isOnline() then
    local player = g_game.getLocalPlayer()
    local manaRequired = AfkModule.getPanel():getChildById('MagicTrainManaRequired'):getValue()
    if player:getManaPercent() >= manaRequired then
      local words = AfkModule.getPanel():getChildById('MagicTrainSpellText'):getText()
      Helper.castSpell(player, words)
    end
  end

  return Helper.safeDelay(2000, 3000)
end