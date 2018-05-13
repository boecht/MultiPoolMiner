using module ..\Include.psm1

$Path = ".\Bin\Polytimos-NVIDIA\ccminer.exe"
$HashSHA256 = "3B9F6A607F0E66974FFB1880B1E89062AC7D0794BE6CC596493CC475EE36DA6F"
$URI = "https://github.com/punxsutawneyphil/ccminer/releases/download/polytimosv2/ccminer-polytimos_v2.zip"

$Commands = [PSCustomObject]@{
    "hsr"       = "" #HSR
    "keccak"    = "" #Keccak
    "lyra2v2"   = "" #Lyra2RE2
    "poly"      = "" #Polytimos
    "skein"     = "" #Skein

    # ASIC - never profitable 12/05/2018
    #"blake2s"   = "" #Blake2s
    #"blakecoin" = "" #Blakecoin
    #"decred"   = "" #Decred
    #"lbry"     = "" #Lbry
    #"myr-gr"   = "" #MyriadGroestl
    #"nist5"    = "" #Nist5
    #"qubit"    = "" #qubit
    #"quark"    = "" #Quark
    #"x14"      = "" #X14
    
    # MPM forgot these
    #"blake"     = "" #Blake256-14rounds(SFR)
    "vcash"     = "" #Blake256-8rounds (XVC)
    "lyra2"     = "" #(LyraBar)
    "skein2"    = "" #Double Skein (Woodcoin)
    #"x11"       = "" #X11 (DarkCoin)
    "c11"       = "" #C11 (Chaincoin)
    "x11evo"    = "" #Permuted x11 (Revolver)
    #"x13"       = "" #X13 (MaruCoin)
    #"x15"       = "" #X15 (Joincoin)
    "x17"       = "" #X17 (XVG)
    "whirlpool" = "" #whirlpool (JoinCoin)
    #"neoscrypt" = "" #Neoscrypt (FTC/PXC/UFO)   --- BROKEN
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
    }
}
