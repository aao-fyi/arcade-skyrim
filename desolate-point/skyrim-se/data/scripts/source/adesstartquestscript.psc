;BEGIN FRAGMENT CODE - Do not edit anything between this and the end comment
;NEXT FRAGMENT INDEX 7
Scriptname adesstartquestscript Extends Quest Hidden

;BEGIN ALIAS PROPERTY ADESStartQuestMarkerAlias
;ALIAS PROPERTY TYPE ReferenceAlias
ReferenceAlias Property Alias_ADESStartQuestMarkerAlias Auto
;END ALIAS PROPERTY

;BEGIN ALIAS PROPERTY ADESGeneralMarkerAlias
;ALIAS PROPERTY TYPE ReferenceAlias
ReferenceAlias Property Alias_ADESGeneralMarkerAlias Auto
;END ALIAS PROPERTY

;BEGIN FRAGMENT Fragment_0
Function Fragment_0()
;BEGIN CODE
;0
Alias_ADESStartQuestMarkerAlias.GetReference().Disable()
SetStage(10)
;END CODE
EndFunction
;END FRAGMENT

;BEGIN FRAGMENT Fragment_6
Function Fragment_6()
;BEGIN CODE
;6
Stop()
;END CODE
EndFunction
;END FRAGMENT

;BEGIN FRAGMENT Fragment_4
Function Fragment_4()
;BEGIN CODE
;4
SetStage(60)
;END CODE
EndFunction
;END FRAGMENT

;BEGIN FRAGMENT Fragment_3
Function Fragment_3()
;BEGIN CODE
;3
ADESGeneralQuest.Start()
SetStage(40)
;END CODE
EndFunction
;END FRAGMENT

;BEGIN FRAGMENT Fragment_2
Function Fragment_2()
;BEGIN CODE
;2
SetObjectiveCompleted(10, true)
Game.GetPlayer().AddItem(ADESPlayerKey, 1)
Game.GetPlayer().AddItem(ADESStartNote, 1)
Game.GetPlayer().AddItem(ADESArrestSpellTome, 1)
Game.GetPlayer().AddItem(ADESReleaseSpellTome, 1)
Game.GetPlayer().AddItem(ADESTransferSpellTome, 1)
Game.GetPlayer().AddItem(ADESTeleportSpellTome, 1)
SetStage(30)
;END CODE
EndFunction
;END FRAGMENT

;BEGIN FRAGMENT Fragment_1
Function Fragment_1()
;BEGIN CODE
;1
SetObjectiveCompleted(10, false)
SetObjectiveDisplayed(10, true)
;END CODE
EndFunction
;END FRAGMENT

;END FRAGMENT CODE - Do not edit anything between this and the begin comment

Quest Property ADESGeneralQuest  Auto  

Key Property ADESPlayerKey  Auto  

Book Property ADESArrestSpellTome  Auto  

Book Property ADESReleaseSpellTome  Auto  

Book Property ADESTransferSpellTome  Auto  

Book Property ADESStartNote  Auto  

Book Property ADESTeleportSpellTome  Auto  
