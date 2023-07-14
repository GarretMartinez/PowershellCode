#load the gems.xml file into a variable
$gemContent = [xml](Get-Content -Path C:\Users\mrkom\psfiles\data\gems.xml)

#select the node for gems that have a hardness greater than 7
$gems = $gemContent.SelectNodes("//gem[Hardness > 7]")

#create an array to store the gem information
$gemInfo = @()

#for each gem node that passed the test above, grab the value in the mineral node and save it
foreach ($gem in $gems) {
    $mineral = $gem.SelectSingleNode("Mineral").InnerText

    #create an object for each of the mineral nodes so it will display in the file
    $gemObject = [PSCustomObject]@{
        Mineral = $mineral
    }

    #add the gem object to the array
    $gemInfo += $gemObject
}

#turn the array into a csv file and create it in the path specified
$gemInfo | Export-Csv -Path C:\Users\mrkom\psfiles\data\martinez_garret-hardgems.csv -NoTypeInformation
