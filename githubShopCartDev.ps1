$publishUrl="https://github.com/GarretMartinez/PowershellCode/"
$packageName = "C:\Users\mrkom\OneDrive\Documents\Spring 2023\CIT361 Advanced Scripting\githubShopCartDev.ps1"
$username="GarretMartinez"
$password="Pr0gram$22"

$params = @{
  UseBasicParsing = $true
  Uri             = $publishUrl
  Method          = "PUT"
  InFile          = $packageName
  Headers         = @{
    ContentType   = "application/gzip"
    Authorization = "Basic $([System.Convert]::ToBase64String([System.Text.Encoding]::ASCII.GetBytes("$username`:$password")))" 
  }
  Verbose         = $true
}
Invoke-WebRequest @params