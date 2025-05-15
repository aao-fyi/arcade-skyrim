Scriptname adesdeathdeletescript extends ObjectReference  

Int Property WaitTime = 33 Auto

Event OnDeath(Actor akKiller)
	Utility.Wait(WaitTime)
	Self.Disable()
	Self.DeleteWhenAble()
EndEvent