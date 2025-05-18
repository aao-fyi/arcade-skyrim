;BEGIN FRAGMENT CODE - Do not edit anything between this and the end comment
;NEXT FRAGMENT INDEX 8
Scriptname ARTSQuest01Script Extends Quest Hidden

;BEGIN ALIAS PROPERTY ARTSQuest01MarkerAlias
;ALIAS PROPERTY TYPE ReferenceAlias
ReferenceAlias Property Alias_ARTSQuest01MarkerAlias Auto
;END ALIAS PROPERTY

;BEGIN ALIAS PROPERTY ARTS01BossItemMarkerAlias
;ALIAS PROPERTY TYPE ReferenceAlias
ReferenceAlias Property Alias_ARTS01BossItemMarkerAlias Auto
;END ALIAS PROPERTY

;BEGIN ALIAS PROPERTY ARTS03BossItemMarkerAlias
;ALIAS PROPERTY TYPE ReferenceAlias
ReferenceAlias Property Alias_ARTS03BossItemMarkerAlias Auto
;END ALIAS PROPERTY

;BEGIN ALIAS PROPERTY ARTS04BossItemAlias
;ALIAS PROPERTY TYPE ReferenceAlias
ReferenceAlias Property Alias_ARTS04BossItemAlias Auto
;END ALIAS PROPERTY

;BEGIN ALIAS PROPERTY ARTS03BossItemAlias
;ALIAS PROPERTY TYPE ReferenceAlias
ReferenceAlias Property Alias_ARTS03BossItemAlias Auto
;END ALIAS PROPERTY

;BEGIN ALIAS PROPERTY ARTS02BossItemAlias
;ALIAS PROPERTY TYPE ReferenceAlias
ReferenceAlias Property Alias_ARTS02BossItemAlias Auto
;END ALIAS PROPERTY

;BEGIN ALIAS PROPERTY ARTS02BossItemMarkerAlias
;ALIAS PROPERTY TYPE ReferenceAlias
ReferenceAlias Property Alias_ARTS02BossItemMarkerAlias Auto
;END ALIAS PROPERTY

;BEGIN ALIAS PROPERTY ARTS01BossItemAlias
;ALIAS PROPERTY TYPE ReferenceAlias
ReferenceAlias Property Alias_ARTS01BossItemAlias Auto
;END ALIAS PROPERTY

;BEGIN ALIAS PROPERTY ARTS04BossItemMarkerAlias
;ALIAS PROPERTY TYPE ReferenceAlias
ReferenceAlias Property Alias_ARTS04BossItemMarkerAlias Auto
;END ALIAS PROPERTY

;BEGIN FRAGMENT Fragment_2
Function Fragment_2()
;BEGIN CODE
; Collect items
SetObjectiveCompleted(1,false)
SetObjectiveCompleted(2,false)
SetObjectiveCompleted(3,false)
SetObjectiveCompleted(4,false)
SetObjectiveDisplayed(1,true)
SetObjectiveDisplayed(2,true)
SetObjectiveDisplayed(3,true)
SetObjectiveDisplayed(4,true)
;END CODE
EndFunction
;END FRAGMENT

;BEGIN FRAGMENT Fragment_4
Function Fragment_4()
;BEGIN CODE
; Clean up objkectives and move on
CompleteAllObjectives()
SetStage(50)
;END CODE
EndFunction
;END FRAGMENT

;BEGIN FRAGMENT Fragment_0
Function Fragment_0()
;BEGIN CODE
; Start quest and set stage
if (Alias_ARTSQuest01MarkerAlias.GetReference().IsDisabled())
  SetStage(50)
else
  SetStage(5)
endif
;END CODE
EndFunction
;END FRAGMENT

;BEGIN FRAGMENT Fragment_6
Function Fragment_6()
;BEGIN CODE
; End quest
Alias.ARTSQuest01MarkerAlias.GetReference.Disable()
Stop()
;END CODE
EndFunction
;END FRAGMENT

;END FRAGMENT CODE - Do not edit anything between this and the begin comment
