Scriptname adesactorbasespawnscript extends ObjectReference
  
; Cooldown Properties
Int Property CooldownTime Auto

; Spawn Properties
ActorBase Property SpawnBase01 Auto
ActorBase Property SpawnBase02 Auto
ActorBase Property SpawnBase03 Auto
ActorBase Property SpawnBase04 Auto
ActorBase Property SpawnBase05 Auto
ActorBase Property SpawnBase06 Auto

Int Property SpawnCount01 Auto
Int Property SpawnCount02 Auto
Int Property SpawnCount03 Auto
Int Property SpawnCount04 Auto
Int Property SpawnCount05 Auto
Int Property SpawnCount06 Auto

ObjectReference Property SpawnStateMarker Auto

ObjectReference Property SpawnMarker Auto

; Door Properties
ObjectReference Property SpawnDoor Auto

; ADES Spawn Bases
; Return list of spawn bases
ActorBase[] Function ADESSpawnBases()
	ActorBase[] SpawnBaseList = new ActorBase[6] ;(0-5)

	SpawnBaseList[0] = SpawnBase01
	SpawnBaseList[1] = SpawnBase02
	SpawnBaseList[2] = SpawnBase03
	SpawnBaseList[3] = SpawnBase04
	SpawnBaseList[4] = SpawnBase05
	SpawnBaseList[5] = SpawnBase06

	Return SpawnBaseList
EndFunction

; ADES Spawn Counts
; Return list of spawn counts
Int[] Function ADESSpawnCounts()
	Int[] SpawnCountList = new Int[6] ;(0-5)

	SpawnCountList[0] = SpawnCount01
	SpawnCountList[1] = SpawnCount02
	SpawnCountList[2] = SpawnCount03
	SpawnCountList[3] = SpawnCount04
	SpawnCountList[4] = SpawnCount05
	SpawnCountList[5] = SpawnCount06

	Return SpawnCountList
EndFunction

Event OnActivate(ObjectReference akActionRef)
	; Lists
	ActorBase[] SpawnBaseList = ADESSpawnBases()
	Int[] SpawnCountList = ADESSpawnCounts()
	; Scratch
	Int SpawnBaseCount = SpawnBaseList.Length
	Int SpawnCounter = 0

	; Disable button
	Self.Disable()

	; Enable state marker
	If SpawnStateMarker
		SpawnStateMarker.Enable()
	EndIf

	; Spawn actors
	While SpawnCounter < SpawnBaseCount
		ActorBase SpawnBase = SpawnBaseList[SpawnCounter]
		Int SpawnCount = SpawnCountList[SpawnCounter]

		If (SpawnBase == None)
			; Stop loop when a base is empty, skips remaining
			SpawnCounter = SpawnBaseCount
		Else
			SpawnMarker.PlaceAtMe(SpawnBase, SpawnCount)
		EndIf

		SpawnCounter += 1
	EndWhile

	; Open doors
	If (SpawnDoor != None)
		SpawnDoor.SetOpen(true)
		Utility.Wait(11)
		SpawnDoor.SetOpen(false)
		SpawnDoor.Lock(true)
	EndIf

	; Disable state marker
	If SpawnStateMarker
		SpawnStateMarker.Disable()
	EndIf

	Utility.Wait(CooldownTime)
	Self.Enable()
EndEvent