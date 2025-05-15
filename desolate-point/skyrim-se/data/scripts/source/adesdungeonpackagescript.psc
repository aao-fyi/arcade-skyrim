Scriptname adesdungeonpackagescript extends ObjectReference  

GlobalVariable Property ADESDebug Auto

Event OnPackageStart()
	; Debug
	If (ADESDebug.GetValueInt() == 1)
		Debug.Notification("Package Start: "+akPackage)
	EndIf
EndEvent

Event OnPackageChange(Package akPackage)

EndEvent

Event OnPackageEnd(Package akPackage)

EndEvent