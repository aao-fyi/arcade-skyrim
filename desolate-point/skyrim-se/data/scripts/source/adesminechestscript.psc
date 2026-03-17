Scriptname adesminechestscript extends ObjectReference

GlobalVariable Property ADESMine01Count Auto
ObjectReference Property ADESMine01Chest Auto

LeveledItem Property LootBanditGems100 Auto
LeveledItem Property LootBanditIngots100 Auto
LeveledItem Property LItemOreCorundum Auto
LeveledItem Property LItemOreEbony Auto
LeveledItem Property LItemOreGold Auto
LeveledItem Property LItemOreIron Auto
LeveledItem Property LItemOreQuicksilver Auto

Function ADESMineChestAdd()
	Int aaCount = ADESMine01Count.GetValueInt()

	If (aaCount > 0)
		ADESMine01Chest.AddItem(LootBanditIngots100, (aaCount * 6))
		ADESMine01Chest.AddItem(LItemOreCorundum, (aaCount * 2))
		ADESMine01Chest.AddItem(LItemOreGold, (aaCount * 3))
		ADESMine01Chest.AddItem(LItemOreIron, (aaCount * 3))
		ADESMine01Chest.AddItem(LItemOreQuicksilver, (aaCount))
	EndIf
	If (aaCount > 4)
		ADESMine01Chest.AddItem(LootBanditGems100, 1)
		ADESMine01Chest.AddItem(LItemOreEbony, (aaCount))
	EndIf

	RegisterForUpdateGameTime(24.0)
EndFunction

Auto State MineChestWaiting
	Event OnTriggerEnter(ObjectReference aaActor)
		Actor aaActorRef = aaActor as Actor

		If (aaActorRef == Game.GetPlayer())
			ADESMineChestAdd()
			GoToState("MineChestActivated")
		EndIf
	EndEvent
EndState

State MineChestActivated
	Event OnUpdateGameTime()
		ADESMineChestAdd()
	EndEvent
EndState

