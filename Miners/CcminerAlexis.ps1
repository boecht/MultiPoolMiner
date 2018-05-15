using module ..\Include.psm1

$Path = ".\Bin\NVIDIA-Alexis78hsr\ccminer-alexis.exe"
$HashSHA256 = "1075FE6CBD4227AEA85188E90FD4432B6D39966AF305A2A43247C03DA914260C"
$Uri = "https://github.com/nemosminer/ccminer-hcash/releases/download/alexishsr/ccminer-hsr-alexis-x86-cuda8.7z"

$Commands = [PSCustomObject]@{
    #GPU - profitable 20/04/2018
    #"c11" = "" #c11   --- BROKEN
    "hsr" = "" #HSR, HShare
    "keccak" = "" #Keccak
    "lyra2" = "" #Lyra2
    "lyra2v2" = "" #lyra2v2
    #"neoscrypt" = "" #NeoScrypt   --- BROKEN
    "skein" = "" #Skein
    "skein2" = "" #skein2
    "veltor" = "" #Veltor
    #"whirlpool" = "" #Whirlpool
    #"x11evo" = "" #X11evo   --- BROKEN
    #"x17" = "" #x17   --- BROKEN

    # ASIC - never profitable 20/04/2018
    #"blake2s" = "" #Blake2s
    #"blake" = "" #blake
    #"blakecoin" = "" #Blakecoin
    #"decred" = "" #Decred
    #"lbry" = "" #Lbry
    #"myr-gr" = "" #MyriadGroestl
    #"nist5" = "" #Nist5
    #"quark" = "" #Quark
    #"qubit" = "" #Qubit
    #"sia" = "" #SiaCoin
    #"sib" = "" #Sib
    #"x11" = "" #X11
    #"x13" = "" #x13
    #"x14" = "" #x14
    #"x15" = "" #x15
    
    # MPM forgot these
    "vcash" = "" #Blake256-8rounds (XVC)
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
