;BEGIN FRAGMENT CODE - Do not edit anything between this and the end comment
;NEXT FRAGMENT INDEX 1
Scriptname adesgeneralquestresetspellsscript Extends TopicInfo Hidden

;BEGIN FRAGMENT Fragment_0
Function Fragment_0(ObjectReference akSpeakerRef)
Actor akSpeaker = akSpeakerRef as Actor
;BEGIN CODE
Game.GetPlayer().RemoveSpell(ADESArrestSpell)
Game.GetPlayer().RemoveSpell(ADESReleaseSpell)
Game.GetPlayer().RemoveSpell(ADESTransferSpell)
Game.GetPlayer().RemoveSpell(ADESTeleportSpell)

Game.GetPlayer().RemoveItem(ADESArrestSpellTome)
Game.GetPlayer().RemoveItem(ADESReleaseSpellTome)
Game.GetPlayer().RemoveItem(ADESTransferSpellTome)
Game.GetPlayer().RemoveItem(ADESTeleportSpellTome)

Game.GetPlayer().AddItem(ADESArrestSpellTome, 1)
Game.GetPlayer().AddItem(ADESReleaseSpellTome, 1)
Game.GetPlayer().AddItem(ADESTransferSpellTome, 1)
Game.GetPlayer().AddItem(ADESTeleportSpellTome, 1)
;END CODE
EndFunction
;END FRAGMENT

;END FRAGMENT CODE - Do not edit anything between this and the begin comment

SPELL Property ADESArrestSpell  Auto  

SPELL Property ADESTransferSpell  Auto  

SPELL Property ADESReleaseSpell  Auto  

SPELL Property ADESTeleportSpell  Auto  

Book Property ADESArrestSpellTome  Auto  

Book Property ADESReleaseSpellTome  Auto  

Book Property ADESTeleportSpellTome  Auto  

Book Property ADESTransferSpellTome  Auto  
