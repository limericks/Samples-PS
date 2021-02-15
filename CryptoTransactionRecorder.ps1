class CryptoBuy{
[string] $db = "[dbo.Buys]"
[string] $coin = ""
[string] $USDSpent = ""
[string] $CoinsReceived = ""
[string] $CoinSymbol = ""
}

class CryptoSales{
[string] $db = "[dbo.Sales]"
[string] $coin = ""
[string] $USDReceived = ""
[string] $CoinsSold  = ""
[string] $CoinSymbol = ""

}

function Buy-Crypto{
Write-Host "Crypto Purchase Engaged!"
$Purchase = [CryptoBuy]::new()
$Purchase.coin = Read-Host -Prompt "Enter Coin's name: "
$Purchase.USDSpent = Read-Host -Prompt "Enter USD Spent: "
$Purchase.CoinsReceived = Read-Host -Prompt "Enter number of coins received: "
$Purchase.CoinSymbol = Read-Host -Prompt "Enter coin symbol: "


$query = "INSERT INTO [dbo].[Buys]
          ([Coin],
           [USD Spent],
           [Coins Received],
           [Coin Symbol])
           VALUES 
           ('$($Purchase.coin)',
           $($Purchase.USDSpent),
           $($Purchase.CoinsReceived),
           '$($Purchase.CoinSymbol)')
           "
Invoke-Sqlcmd -ServerInstance $server -Database $db -Query $query
}

function Sell-Crypto{

Write-Host "Crypto Sales Engaged!"

$Sale = [CryptoSales]::new()
$Sale.coin = Read-Host -Prompt "Enter the coin's name: "
$Sale.CoinsSold = Read-Host -Prompt "Enter the number of coins sold: "
$Sale.USDReceived = Read-Host -Prompt "Enter the USD Received: "
$Sale.CoinSymbol = Read-Host -Prompt "Enter coin symbol: "

$query = "INSERT INTO [dbo].[Sales]
          ([Coin],
          [USD Received],
          [Coins Sold],
          [Coin Symbol])
          VALUES
          ('$($Sale.coin)',
          $($Sale.USDReceived),
          $($Sale.CoinsSold),
          '$($Sale.CoinSymbol)')
          "
Invoke-Sqlcmd -ServerInstance $server -Database $db -Query $query

}

function Get-CryptoPrice{

Write-Host "Welcome to the Crypto Price Checker"
Write-Host "Please note the high market volatility. Prices may flucuate quickly."

$CoinToCheck = Read-Host -Prompt "Enter the the coin symbol to check: "

$url = "https://api.coinbase.com/v2/prices/$($CoinToCheck)-USD/buy"

$Response = Invoke-WebRequest -Uri $url -Method Get -ContentType "application/json" -UseBasicParsing | ConvertFrom-Json

$Price = $Response.data.amount

Write-Host "The current $($CoinToCheck) price is: " $Price

}

function Main{

$server = ""
$db = "CrypTransactions"


$userChoice = Read-Host -Prompt "Would you like to (B)uy, (S)ell, or (C)heck Price?"
$FunctionToRun = $userChoice.ToUpper()

if($FunctionToRun -eq "B"){

Buy-Crypto

}elseif($FunctionToRun -eq "S"){

Sell-Crypto

}elseif($functionToRun -eq "C"){
Get-CryptoPrice
}else{
Write-Host "You entered an invalid transaction type"
}


}

Main
