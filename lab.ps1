Param (

    [Parameter(Mandatory = $true)]

    [string]

    $AzureUserName,

    [string]

    $AzurePassword

    )
    Function CreateCredFile($AzureUserName, $AzurePassword)

{
     $WebClient = New-Object System.Net.WebClient

    $WebClient.DownloadFile("https://experienceazure.blob.core.windows.net/templates/cloudlabs-common/AzureCreds.txt","C:\jashwanth12\AzureCreds.txt")

    $WebClient.DownloadFile("https://experienceazure.blob.core.windows.net/templates/cloudlabs-common/AzureCreds.ps1","C:\jashwanth12\AzureCreds.ps1")




    
    

  New-Item -ItemType directory -Path C:\jashwanth12 -force



    (Get-Content -Path "C:\jashwanth12\AzureCreds.txt") | ForEach-Object {$_ -Replace "AzureUserNameValue", "$AzureUserName"} | Set-Content -Path "C:\jashwanth12\AzureCreds.txt"

    (Get-Content -Path "C:\jashwanth12\AzureCreds.txt") | ForEach-Object {$_ -Replace "AzurePasswordValue", "$AzurePassword"} | Set-Content -Path "C:\jashwanth12\AzureCreds.txt"


}
CreateCredFile $AzureUserName $AzurePassword
