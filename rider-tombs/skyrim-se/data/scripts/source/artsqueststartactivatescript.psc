Scriptname ARTSQuestStartActivateScript extends ObjectReference  

quest property ARTSQuest01 auto	

auto STATE waitingForPlayer
	EVENT onActivate(objectReference triggerRef)
		if (!ARTSQuest01.isRunning() && ARTSQuest01.getStageDone(50) == 0)
			ARTSQuest01.setStage(0)
		endif
		gotoState("hasBeenTriggered")
	endEVENT
endSTATE

STATE hasBeenTriggered
	; this is an empty state.
endSTATE