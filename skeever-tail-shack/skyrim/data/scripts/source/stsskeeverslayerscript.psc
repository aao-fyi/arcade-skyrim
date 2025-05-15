Scriptname STSSkeeverSlayerScript extends ActiveMagicEffect  

ingredient property SkeeverTail auto

Event OnEffectFinish(actor target, actor caster)
	game.getPlayer().addItem(SkeeverTail)
EndEvent