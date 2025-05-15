Scriptname adesdungeondoorscript extends ObjectReference  

Event OnOpen(ObjectReference akActionRef)
	; Only open for player
	If (akActionRef == Game.GetPlayer())
		;Self.SetOpen(True)
		Utility.Wait(4)
	EndIf
	; Close and lock
	Utility.Wait(4)
	Self.SetOpen(False)
	Self.Lock()
EndEvent
