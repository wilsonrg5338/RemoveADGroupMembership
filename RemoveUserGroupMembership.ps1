#Author: Reggie Wilson
#Last Edited: 6/2/2022
#This script will remove a user from all groups except the default Domain Users group

cls

import-Module ActiveDirectory

Add-Type -AssemblyName System.Web


#Input username of user to be removed from AD groups
	$Username = Read-Host -Prompt "Enter username of AD account to be removed from AD groups"
	
#Confirm and Verify the user account
	get-aduser $Username
	write-host "Press Enter to Continue if you would like to remove this user from all groups they are a member of. Otherwise close this window."


#Comment
	get-aduser $Username -properties memberof | select-object memberof -expandproperty memberof | remove-adgroupmember -members $Username
	
pause


