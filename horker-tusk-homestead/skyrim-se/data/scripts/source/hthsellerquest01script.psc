;BEGIN FRAGMENT CODE - Do not edit anything between this and the end comment
;NEXT FRAGMENT INDEX 5
Scriptname HTHSellerQuest01Script Extends Quest Hidden

;BEGIN ALIAS PROPERTY HTHSellerMarkerAlias
;ALIAS PROPERTY TYPE ReferenceAlias
ReferenceAlias Property Alias_HTHSellerMarkerAlias Auto
;END ALIAS PROPERTY

;BEGIN ALIAS PROPERTY HTHStewardMarkerAlias
;ALIAS PROPERTY TYPE ReferenceAlias
ReferenceAlias Property Alias_HTHStewardMarkerAlias Auto
;END ALIAS PROPERTY

;BEGIN ALIAS PROPERTY HTHDoorAlias
;ALIAS PROPERTY TYPE ReferenceAlias
ReferenceAlias Property Alias_HTHDoorAlias Auto
;END ALIAS PROPERTY

;BEGIN ALIAS PROPERTY HTHLocationAlias
;ALIAS PROPERTY TYPE LocationAlias
LocationAlias Property Alias_HTHLocationAlias Auto
;END ALIAS PROPERTY

;BEGIN ALIAS PROPERTY HTHSellerAlias
;ALIAS PROPERTY TYPE ReferenceAlias
ReferenceAlias Property Alias_HTHSellerAlias Auto
;END ALIAS PROPERTY

;BEGIN FRAGMENT Fragment_0
Function Fragment_0()
;BEGIN CODE
if (Alias_HTHSellerMarkerAlias.GetReference().IsDisabled())
  SetStage(50)
else
  SetStage(5)
endif
;END CODE
EndFunction
;END FRAGMENT

;BEGIN FRAGMENT Fragment_3
Function Fragment_3()
;BEGIN CODE
Alias_HTHStewardMarkerAlias.GetReference().Enable()
Alias_HTHSellerMarkerAlias.GetReference().Disable()
CompleteAllObjectives()
Stop()
;END CODE
EndFunction
;END FRAGMENT

;BEGIN FRAGMENT Fragment_1
Function Fragment_1()
;BEGIN CODE
SetObjectiveCompleted(5,false)
SetObjectiveDisplayed(5,true)
;END CODE
EndFunction
;END FRAGMENT

;BEGIN FRAGMENT Fragment_2
Function Fragment_2()
;BEGIN CODE
SetObjectiveCompleted(5)
SetObjectiveCompleted(10,false)
SetObjectiveDisplayed(10,true)
;END CODE
EndFunction
;END FRAGMENT

;END FRAGMENT CODE - Do not edit anything between this and the begin comment
