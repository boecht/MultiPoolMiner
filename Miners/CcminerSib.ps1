using module ..\Include.psm1

$Path = ".\Bin\Sib-NVIDIA\ccminer_x11gost.exe"
$HashSHA256 = "CD8602A080728894570C9D29FC1423FB62AF1FA9CAF3913E609BA21777284DEE"
$Uri = "https://github.com/nicehash/ccminer-x11gost/releases/download/ccminer-x11gost_windows/ccminer_x11gost.7z"

$Commands = [PSCustomObject]@{
    #"c11"       = "" #C11   <<< CcminerLyra2RE2 < CcminerNanashi < CcminerSkunk < CcminerLyra2z < CcminerTpruvot < CcminerKlaust < CcminerNevermore < CcminerSuprMiner < CcminerSp < CcminerSib < CcminerAlexis
    #"keccak"    = "" #Keccak   <<< CcminerPolytimos < CcminerSkunk < CcminerNanashi < CcminerLyra2RE2 < CcminerLyra2z < CcminerSib < CcminerSuprMiner < CcminerAllium < CcminerSp < CcminerNevermore < CcminerAnxmodPhi < CcminerTpruvot < CcminerAlexis < CcminerKlaust < CcminerXevan < CcminerCornzKeccakC < ExcavatorNvidia1 < ExcavatorNvidia2
    #"lyra2v2"   = "" #Lyra2RE2   <<< CcminerPolytimos < ExcavatorNvidia2 < CcminerCornzKeccakC < ExcavatorNvidia1 < CcminerXevan < CcminerAnxmodPhi < CcminerAlexis < CcminerNanashi < CcminerLyra2RE2 < CcminerSkunk < CcminerTpruvot < CcminerAllium < CcminerSuprMiner < CcminerNevermore < CcminerSib < CcminerKlaust < CcminerSp < CcminerLyra2z
    #"neoscrypt" = "" #NeoScrypt   <<< CcminerSp < CcminerLyra2RE2 < CcminerSuprMiner < CcminerSib < NsgminerNvidia < CcminerLyra2z < CcminerKlaust < CcminerTpruvot < CcminerAllium < CcminerNevermore < CcminerSkunk < CcminerNanashi < JustAMinerNeoScrypt < ExcavatorNvidia1
    #"skein"     = "" #Skein   <<< CcminerNevermore < CcminerLyra2RE2 < CcminerAllium < CcminerSuprMiner < CcminerSkunk < CcminerLyra2z < CcminerNanashi < CcminerSib < CcminerAlexis < CcminerKlaust < CcminerSp < CcminerXevan < CcminerPolytimos < CcminerCornzKeccakC < CcminerAnxmodPhi
    #"x11evo"    = "" #X11evo   <<< CcminerNanashi < CcminerSkunk < CcminerTpruvot < CcminerAllium < CcminerSuprMiner < CcminerLyra2z < CcminerNevermore < CcminerSib < CcminerAlexis

    # ASIC - never profitable 12/05/2018
    #"blake2s"   = "" #Blake2s
    #"blakecoin" = "" #Blakecoin
    #"decred" = "" #Decred
    #"lbry" = "" #Lbry
    #"myr-gr" = "" #MyriadGroestl
    #"nist5" = "" #Nist5
    #"sib" = "" #Sib
    
    # MPM forgot these
    #"blake"     = "" #Blake256-14rounds(SFR)
    "vcash"     = "" #Blake256-8rounds (XVC)
    #"lyra2"     = "" #(LyraBar)   <<< CcminerSp < CcminerSib < CcminerLyra2RE2 < CcminerLyra2z < CcminerSkunk < CcminerNanashi < CcminerSuprMiner < CcminerNevermore < CcminerTpruvot < CcminerAllium < CcminerXevan < CcminerPolytimos < CcminerCornzKeccakC < CcminerAlexis < CcminerAnxmodPhi
    "skein2"    = "" #Double Skein (Woodcoin)
    #"quark"     = "" #Quark (Quarkcoin)
    #"qubit"     = "" #Qubit
    #"x11"       = "" #X11 (DarkCoin)
    #"x13"       = "" #X13 (MaruCoin)
    #"x14"       = "" #X14 (BernCoin)
    #"x15"       = "" #X15 (Joincoin)
    #"x17"       = "" #X17 (XVG)   --- BROKEN
    "whirlpool" = "" #whirlpool (JoinCoin)
    #"sia"       = "" #Sia (SIAcoin)
    "veltor"    = "" #Thor's Riddle(?) (Veltor)
}

$Name = Get-Item $MyInvocation.MyCommand.Path | Select-Object -ExpandProperty BaseName

$Commands | Get-Member -MemberType NoteProperty | Select-Object -ExpandProperty Name | Where-Object {$Pools.(Get-Algorithm $_).Protocol -eq "stratum+tcp" <#temp fix#>} | ForEach-Object {
    [PSCustomObject]@{
        Type = "NVIDIA"
        Path = $Path
        HashSHA256 = $HashSHA256
        Arguments = "-a $_ -o $($Pools.(Get-Algorithm $_).Protocol)://$($Pools.(Get-Algorithm $_).Host):$($Pools.(Get-Algorithm $_).Port) -u $($Pools.(Get-Algorithm $_).User) -p $($Pools.(Get-Algorithm $_).Pass)$($Commands.$_)"
        HashRates = [PSCustomObject]@{(Get-Algorithm $_) = $Stats."$($Name)_$(Get-Algorithm $_)_HashRate".Week}
        API = "Ccminer"
        Port = 4068
        URI = $Uri
        PrerequisitePath = "$env:SystemRoot\System32\msvcr120.dll"
        PrerequisiteURI = "http://download.microsoft.com/download/2/E/6/2E61CFA4-993B-4DD4-91DA-3737CD5CD6E3/vcredist_x64.exe"
    }
}
