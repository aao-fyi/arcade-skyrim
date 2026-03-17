;BEGIN FRAGMENT CODE - Do not edit anything between this and the end comment
;NEXT FRAGMENT INDEX 2
Scriptname HTHSellerQuest01BranchSoldScript Extends TopicInfo Hidden

;BEGIN FRAGMENT Fragment_1
Function Fragment_1(ObjectReference akSpeakerRef)
Actor akSpeaker = akSpeakerRef as Actor
;BEGIN CODE
Game.GetPlayer().RemoveItem(Gold001,HTHSellerPrice.GetValueInt())
Game.GetPlayer().AddItem(HTHPlayerKey)
Game.GetPlayer().AddItem(HTHPlayerDeed)
HTHInterior01.SetFactionOwner(PlayerFaction)
Game.IncrementStat("Houses Owned")
GetOwningQuest().SetStage(10)
;END CODE
EndFunction
;END FRAGMENT

;END FRAGMENT CODE - Do not edit anything between this and the begin comment

MiscObject Property Gold001  Auto  

MiscObject Property HTHPlayerDeed  Auto  

Faction Property PlayerFaction  Auto  

GlobalVariable Property HTHSellerPrice  Auto  

Key Property HTHPlayerKey  Auto  

Cell Property HTHInterior01  Auto  
