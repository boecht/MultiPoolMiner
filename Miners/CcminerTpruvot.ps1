﻿using module ..\Include.psm1

$Path = ".\Bin\NVIDIA-TPruvot\ccminer-x64.exe"
$Uri = "https://github.com/MSFTserver/ccminer/releases/download/2.2.5-rvn/ccminer-x64-2.2.5-rvn-cuda9.7z"

$Commands = [PSCustomObject]@{
    "bitcore" = "" #Bitcore
    "blake2s" = "" #Blake2s
    "blakecoin" = "" #Blakecoin
    "vanilla" = "" #BlakeVanilla
    #"c11" = "" #C11
    "cryptonight" = "" #CryptoNight
    "decred" = "" #Decred
    #"equihash" = "" #Equihash   <<< DSTM
    #"ethash" = "" #Ethash
    "groestl" = "" #Groestl
    "hmq1725" = "" #HMQ1725
    "jha" = "" #JHA
    "keccak" = "" #Keccak
    "lbry" = "" #Lbry
    #"lyra2v2" = "" #Lyra2RE2   <<<  CcminerLyra2RE2
    "lyra2z" = "" #Lyra2z
    "myr-gr" = "" #MyriadGroestl
    #"neoscrypt" = "" #NeoScrypt
    "nist5" = "" #Nist5
    #"pascal" = "" #Pascal   BROKEN
    "phi" = "" #PHI
    #"sib" = "" #Sib   <<< CcminerSib
    #"skein" = "" #Skein
    #"skunk" = "" #Skunk   <<< CcminerSkunk
    "timetravel" = "" #Timetravel
    "tribus" = "" #Tribus
    "veltor" = "" #Veltor
    "x11evo" = "" #X11evo
    #"x16r" = "" #Raven   <<< CcminerSuprMiner <<< CcminerNevermore
    #"x17" = "" #X17   <<<  CcminerSp
    #"yescrypt" = "" #Yescrypt
    #"xevan" = "" #Xevan
}

$Name = Get-Item $MyInvocation.MyCommand.Path | Select-Object -ExpandProperty BaseName

$Commands | Get-Member -MemberType NoteProperty | Select-Object -ExpandProperty Name | Where-Object {$Pools.(Get-Algorithm $_).Protocol -eq "stratum+tcp" <#temp fix#>} | ForEach-Object {
    [PSCustomObject]@{
        Type = "NVIDIA"
        Path = $Path
        Arguments = "-a $_ -o $($Pools.(Get-Algorithm $_).Protocol)://$($Pools.(Get-Algorithm $_).Host):$($Pools.(Get-Algorithm $_).Port) -u $($Pools.(Get-Algorithm $_).User) -p $($Pools.(Get-Algorithm $_).Pass)$($Commands.$_) --submit-stale"
        HashRates = [PSCustomObject]@{(Get-Algorithm $_) = $Stats."$($Name)_$(Get-Algorithm $_)_HashRate".Week}
        API = "Ccminer"
        Port = 4068
        URI = $Uri
    }
}
