$cartItems = @()
$prices = @()

Write-Host 'Welcome to your shopping cart!'
Write-Host

Write-Host 'Choose from the following actions:'
Write-Host '1. Add Item'
Write-Host '2. View Cart'
Write-Host '3. Remove Item'
Write-Host '4. Compute Total'
Write-Host '5. Quit'
$action = Read-Host 'Please enter the action'
Write-Host

while (($action -eq '1' -or $action.ToLower() -eq 'add item') -or ($action -eq '2' -or $action.ToLower() -eq 'view cart') -or ($action -eq '3' -or $action.ToLower() -eq 'remove item') -or ($action -eq '4' -or $action.ToLower() -eq 'compute total'))
{
    if ($action -eq '1' -or $action.ToLower() -eq 'add item')
    {
        $addItem = Read-Host 'What item would you like to add?'
        $cartItems += $addItem
        $itemPrice = [double](Read-Host "What is the price of the" $addItem.ToString().ToUpper() "?")
        $prices += $itemPrice
        Write-Host "$($addItem.ToUpper()) has been added to your cart."
        Write-Host
    }
    elseif ($action -eq '2' -or $action.ToLower() -eq 'view cart')
    {
        for ($i = 0; $i -lt $cartItems.Count; $i++)
        {
            $index = $i + 1
            Write-Host "$index. $($cartItems[$i].ToString().ToUpper()) -- $($prices[$i])"
        }
        Write-Host
    }
    elseif ($action -eq '3' -or $action.ToLower() -eq 'remove item')
    {
        Write-Host 'Here are the current items in your cart:'
        Write-Host
        for ($i = 0; $i -lt $cartItems.Count; $i++)
        {
            $index = $i + 1
            Write-Host "$index. $($cartItems[$i].ToString().ToUpper()) -- $($prices[$i])"
        }
        Write-Host
        $remove = [int](Read-Host 'Which item index would you like to remove?')
        Write-Host "$($cartItems[$remove - 1].ToUpper()) has been removed."
        $cartItems = $cartItems | Where-Object { $_ -ne $cartItems[$remove - 1] }
        $prices = $prices | Where-Object { $_ -ne $prices[$remove - 1] }
        Write-Host
    }
    elseif ($action -eq '4' -or $action.ToLower() -eq 'compute total')
    {
        $total = $prices | Measure-Object -Sum | Select-Object -ExpandProperty Sum
        Write-Host "Your current total is $total"
        Write-Host
    }
    else
    {
        Write-Host 'Thank you for using the Shopping Cart!'
    }

    Write-Host 'Choose from the following actions:'
    Write-Host '1. Add Item'
    Write-Host '2. View Cart'
    Write-Host '3. Remove Item'
    Write-Host '4. Compute Total'
    Write-Host '5. Quit'
    $action = Read-Host 'Please enter the action'
    Write-Host
}

Write-Host 'Thank you for using the Shopping Cart!'
