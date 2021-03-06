﻿using module ..\Include.psm1

param(
    [alias("Wallet")]
    [String]$BTC, 
    [alias("WorkerName")]
    [String]$Worker, 
    [TimeSpan]$StatSpan
)

$Name = Get-Item $MyInvocation.MyCommand.Path | Select-Object -ExpandProperty BaseName

$BlazePool_Request = [PSCustomObject]@{}

try {
    $BlazePool_Request = Invoke-RestMethod "http://api.blazepool.com/status" -UseBasicParsing -TimeoutSec 15 -ErrorAction Stop
}
catch {
    Write-Log -Level Warn "Pool API ($Name) has failed. "
    return
}

if (($BlazePool_Request | Get-Member -MemberType NoteProperty -ErrorAction Ignore | Measure-Object Name).Count -le 1) {
    Write-Log -Level Warn "Pool API ($Name) returned nothing. "
    return
}

$BlazePool_Regions = "us"
$BlazePool_Currencies = @("BTC") | Select-Object -Unique | Where-Object {Get-Variable $_ -ValueOnly -ErrorAction SilentlyContinue}

$BlazePool_Request | Get-Member -MemberType NoteProperty -ErrorAction Ignore | Select-Object -ExpandProperty Name | Where-Object {$BlazePool_Request.$_.hashrate -gt 0 -and [Double]$BlazePool_Request.$_.estimate_current  -gt 0} | ForEach-Object {
    $BlazePool_Host = "$_.mine.blazepool.com"
    $BlazePool_Port = $BlazePool_Request.$_.port
    $BlazePool_Algorithm = $BlazePool_Request.$_.name
    $BlazePool_Algorithm_Norm = Get-Algorithm $BlazePool_Algorithm
    $BlazePool_Coin = "$($BlazePool_Request.$_.coins)c [$($BlazePool_Request.$_.fees.ToString("N2"))%]"

    if ([Double]$BlazePool_Request.$_.estimate_current -eq 0.0) {
        Write-Log "Pool API ($Name, $BlazePool_Algorithm_Norm) returned price of zero. "
        return
    }

    $Divisor = 1000000 * [Double]$BlazePool_Request.$_.mbtc_mh_factor
    
    if ((Get-Stat -Name "$($Name)_$($BlazePool_Algorithm_Norm)_Profit") -eq $null) {$Stat = Set-Stat -Name "$($Name)_$($BlazePool_Algorithm_Norm)_Profit" -Value ([Double]$BlazePool_Request.$_.estimate_last24h / $Divisor *(1-($BlazePool_Request.$_.fees/100))) -Duration (New-TimeSpan -Days 1)}
    else {$Stat = Set-Stat -Name "$($Name)_$($BlazePool_Algorithm_Norm)_Profit" -Value ([Double]$BlazePool_Request.$_.estimate_current / $Divisor *(1-($BlazePool_Request.$_.fees/100))) -Duration $StatSpan -ChangeDetection $true}

    $BlazePool_Regions | ForEach-Object {
        $BlazePool_Region = $_
        $BlazePool_Region_Norm = Get-Region $BlazePool_Region

        $BlazePool_Currencies | Where-Object {Get-Variable $_ -ValueOnly} | ForEach-Object {
            [PSCustomObject]@{
                Algorithm     = $BlazePool_Algorithm_Norm
                CoinName      = $BlazePool_Coin
                Price         = $Stat.Live
                StablePrice   = $Stat.Week
                MarginOfError = $Stat.Week_Fluctuation
                Protocol      = "stratum+tcp"
                Host          = $BlazePool_Host
                Port          = $BlazePool_Port
                User          = Get-Variable $_ -ValueOnly
                Pass          = "ID=$Worker,c=$_"
                Region        = $BlazePool_Region_Norm
                SSL           = $false
                Updated       = $Stat.Updated
            }
        }
    }
}
