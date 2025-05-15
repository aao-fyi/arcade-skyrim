Scriptname adeseffectreleasescript extends adeseffectscript 

Event OnEffectStart(Actor akTarget, Actor akCaster)
	ADESArrest(akTarget, ADESDungeon0101Quest, ADESDungeon0101Count, ADESDungeonMaxCount)
EndEvent

Event OnEffectFinish(Actor akTarget, Actor akCaster)
	
EndEvent