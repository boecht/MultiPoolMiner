using module ..\Include.psm1

$Path = ".\Bin\NVIDIA-PHI\ccminer.exe"
$HashSHA256 = "6C3AFFABBD39566F4AE3B78CF55BFEA06BE98C1D48FDDB27DEE406DB87B7663F"
$URI = "https://github.com/216k155/ccminer-phi-anxmod/releases/download/ccminer%2Fphi-1.0/ccminer-phi-1.0.zip"

$Commands = [PSCustomObject]@{
    "Phi" = "" #Phi Phi1612 LUX
    
    # MPM forgot these
    #"blake" = "" #Blake256-14rounds(SFR)
    #"decred" = "" #Blake256-14rounds(DCR)
    #"blakecoin" = "" #Blake256-8rounds (BLC)
    "vcash" = "" #Blake256-8rounds (XVC)
    #"blake2s" = "" #Blake2s (NEVA/XVG)
    "keccak" = "" #keccak256 (Maxcoin)
    "hsr" = "" #X13+SM3 (Hshare)
    "lyra2" = "" #(LyraBar)
    "lyra2v2" = "" #(VertCoin)
    "skein" = "" #Skein SHA2 (AUR/DGB/SKC)
    "skein2" = "" #Double Skein (Woodcoin)
    #"nist5" = "" #NIST5 (Talkcoin/Power)
    #"quark" = "" #Quark (Quarkcoin)
    #"qubit" = "" #Qubit
    #"x11" = "" #X11 (DarkCoin)
    #"c11" = "" #C11 (Chaincoin)   --- BROKEN
    #"sib" = "" #X11+gost (Sibcoin)
    #"x11evo" = "" #Permuted x11 (Revolver)   --- BROKEN
    #"x13" = "" #X13 (MaruCoin)
    #"x14" = "" #X14 (BernCoin)
    #"x15" = "" #X15 (Joincoin)
    #"x17" = "" #X17 (XVG)   --- BROKEN
    "whirlpool" = "" #whirlpool (JoinCoin)
    #"lbry" = "" #Lbry (Library Credits)
    #"neoscrypt" = "" #Neoscrypt (FTC/PXC/UFO)   --- BROKEN
    #"sia" = "" #Sia (SIAcoin)
    #"myr-gr" = "" #Myriad-Groestl (SFR/AUR/DGB/XVG/MYR)
    "veltor" = "" #Thor's Riddle(?) (Veltor)
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
