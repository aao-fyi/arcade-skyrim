Scriptname adesactivatortogglescript extends ObjectReference  

ObjectReference Property aaToggleTarget Auto
Int Property aaToggleWait = 1 Auto

Event OnActivate(ObjectReference aaActionRef)
	If (!aaToggleTarget)
		; Fail
		Return
	ElseIf (aaToggleTarget.IsEnabled())
		; Enabled, wait and disable
		Utility.Wait(aaToggleWait)
		aaToggleTarget.Disable()
	ElseIf (aaToggleTarget.IsDisabled())
		; Disabled, wait and enable
		Utility.Wait(aaToggleWait)
		aaToggleTarget.Enable()
	EndIf
EndEvent