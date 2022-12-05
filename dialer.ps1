#Yealink Dialler
#GPL3

#Phone Username / Password
[string]$userName = 'admin'
[string]$userPassword = 'admin'

#Phone IP Address
$ipPhone = "10.0.0.138"

#Phone SIP Account
$sipPhone = "2313199@103.253.118.8"

#Title of Window
$title = 'Dial - Whizz IT'

#Prompt
$msg   = 'Enter Number to call:'

[void][Reflection.Assembly]::LoadWithPartialName('Microsoft.VisualBasic')
$text = [Microsoft.VisualBasic.Interaction]::InputBox($msg, $title)
$text = $text -replace '\s','' #Strip whitespace
[securestring]$secStringPassword = ConvertTo-SecureString $userPassword -AsPlainText -Force
[pscredential]$credObject = New-Object System.Management.Automation.PSCredential ($userName, $secStringPassword)
Invoke-WebRequest -Uri "http://$ipPhone/servlet?key=number=$text&outgoing_uri=$sipPhone" -Credential $credObject
