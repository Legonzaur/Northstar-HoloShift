untyped
global function HolopilotIconChangeInit


void function HolopilotIconChangeInit()
{
	#if SERVER
		AddCallback_OnPlayerRespawned( HolopilotIconChange )
		//AddCallback_PlayerClassChanged( HolopilotIconChange )
		//AddCallback_OnPlayerLifeStateChanged( HolopilotIconChange )
	#endif
}

#if SERVER

void function HolopilotIconChange(entity player){
//void function HolopilotIconChange(entity player, int oldState, int newState){
	Assert( IsAlive( player ) )
	if(player.GetOffhandWeapons().len() > 1 && player.GetOffhandWeapons()[1].GetWeaponClassName() == "mp_ability_holopilot"){
		array <string> offhandMods = player.GetOffhandWeapons()[1].GetMods()
		offhandMods.append("mode_holoshift")
		player.GetOffhandWeapons()[1].SetMods(offhandMods)
	}
		
}
#endif