Scriptname adesactivatorteleportscript extends ObjectReference  

ObjectReference Property aaTeleportRef Auto

Event OnActivate(ObjectReference aaActionRef)
	If (aaTeleportRef)
		aaActionRef.MoveTo(aaTeleportRef, 0, 0, 1, true)
	EndIf
EndEvent