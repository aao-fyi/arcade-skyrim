Scriptname adescleanerspawnscript extends ObjectReference  

Actor Property ADESArenaCleanerActor Auto

Event OnActivate(ObjectReference akActionRef)
	If (ADESArenaCleanerActor.IsEnabled() == true) && (ADESArenaCleanerActor.IsDead() == false)
		; Enabled and alive; disable
		ADESArenaCleanerActor.Disable()
	Else
		; Disabled or dead; Reset
		ADESArenaCleanerActor.Disable()
		ADESArenaCleanerActor.Resurrect()
		ADESArenaCleanerActor.Enable()
	EndIf
EndEvent