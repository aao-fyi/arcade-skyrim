Scriptname hthstewardscript extends ObjectReference

ObjectReference Property HTHStewardMarker Auto
ObjectReference Property HTHStewardDeadMarker Auto
GlobalVariable Property HTHStewardDeadDelay Auto

Event OnDeath(Actor akKiller)
		Utility.WaitGameTime(HTHStewardDeadDelay.GetValue())
		HTHStewardMarker.Disable()
		HTHStewardDeadMarker.Enable()
endEvent