;BEGIN FRAGMENT CODE - Do not edit anything between this and the end comment
;NEXT FRAGMENT INDEX 1
Scriptname adesgeneralquestallyimperialscript Extends TopicInfo Hidden

;BEGIN FRAGMENT Fragment_0
Function Fragment_0(ObjectReference akSpeakerRef)
Actor akSpeaker = akSpeakerRef as Actor
;BEGIN CODE
; Disable ally markers
ADESAllyDefaultMarker.Disable()
ADESAllyImperialMarker.Disable()
ADESAllyStormcloakMarker.Disable()
ADESAllyThalmorMarker.Disable()

; Enable ally marker
ADESAllyImperialMarker.Enable()

; Change Outfits
FormList GeneralOutfit = ADESGeneralOutfitImperialList
FormList GuardOutfit = ADESGuardOutfitImperialList

ADESGuardOutfit.Revert()
ADESGeneralOutfit.Revert()

Int FormCounter = 0
While FormCounter < GuardOutfit.GetSize()
ADESGuardOutfit.AddForm(GuardOutfit.GetAt(FormCounter) As Armor, 1, 1)
FormCounter += 1
EndWhile

FormCounter = 0
While FormCounter < GeneralOutfit.GetSize()
ADESGeneralOutfit.AddForm(GeneralOutfit.GetAt(FormCounter) As Armor, 1, 1)
FormCounter += 1
EndWhile

ADESGuardMarker.Disable()
ADESGuardMarker.Enable()
;END CODE
EndFunction
;END FRAGMENT

;END FRAGMENT CODE - Do not edit anything between this and the begin comment

ObjectReference Property ADESAllyDefaultMarker Auto
ObjectReference Property ADESAllyImperialMarker Auto
ObjectReference Property ADESAllyStormcloakMarker Auto
ObjectReference Property ADESAllyThalmorMarker Auto

ObjectReference Property ADESGuardMarker Auto

LeveledItem Property ADESGeneralOutfit Auto
FormList Property ADESGeneralOutfitSteelList Auto
FormList Property ADESGeneralOutfitImperialList Auto
FormList Property ADESGeneralOutfitStormcloakList Auto
FormList Property ADESGeneralOutfitThalmorList Auto

LeveledItem Property ADESGuardOutfit Auto
FormList Property ADESGuardOutfitSteelList Auto
FormList Property ADESGuardOutfitImperialList Auto
FormList Property ADESGuardOutfitStormcloakList Auto
FormList Property ADESGuardOutfitThalmorList Auto
