Scriptname adescontrolallyscript extends TopicInfo

ObjectReference Property ADESAllyDefaultMarker Auto
ObjectReference Property ADESAllyImperialMarker Auto
ObjectReference Property ADESAllyStormcloakMarker Auto
ObjectReference Property ADESAllyThalmoarMarker Auto

; 0 = Default
; 1 = Imperial
; 2 = Stormcloak
; 3 = Thalmor
Int Property AllyInt Auto

ObjectReference[] Function AllyMarkers()
	ObjectReference[] AllyMarkerList = new ObjectReference[4] ;(0-3)
	AllyMarkerList[0] = ADESAllyDefaultMarker
	AllyMarkerList[1] = ADESAllyImperialMarker
	AllyMarkerList[2] = ADESAllyStormcloakMarker
	AllyMarkerList[3] = ADESAllyThalmoarMarker

	Return AllyMarkerList
EndFunction

Bool Function TestFunction()
	Return true
EndFunction

Bool test2 = TestFunction()

;ObjectReference[] AllyMarkerList = AllyMarkers()
;Int AllyCounter = AllyMarkerList.Length