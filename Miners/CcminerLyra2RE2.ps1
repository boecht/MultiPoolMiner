using module ..\Include.psm1

$Path = ".\Bin\Lyra2RE2-NVIDIA\ccminer.exe"
$HashSHA256 = "998AEBAA80CD6D2B758A5B4798D6AC929745B88D81735587798F616D7E2F3B23"
$Uri = "https://github.com/nicehash/ccminer-nanashi/releases/download/1.7.6-r6/ccminer.zip"

$Commands = [PSCustomObject]@{
    "c11"       = "" #C11
    "groestl"   = "" #Groestl
    "keccak"    = "" #Keccak
    #"lyra2v2"   = "" #Lyra2RE2   <<< CcminerPolytimos < ExcavatorNvidia2 < CcminerCornzKeccakC < ExcavatorNvidia1 < CcminerXevan < CcminerAnxmodPhi < CcminerAlexis < CcminerNanashi < CcminerLyra2RE2 < CcminerSkunk < CcminerTpruvot < CcminerAllium < CcminerSuprMiner < CcminerNevermore < CcminerSib < CcminerKlaust < CcminerSp < CcminerLyra2z
    "neoscrypt" = "" #NeoScrypt
    "skein"     = "" #Skein
    "x17"       = "" #X17
    
    # ASIC - never profitable 12/05/2018
    #"blake2s"   = "" #Blake2s
    #"blakecoin" = "" #Blakecoin
    #"decred"   = "" #Decred
    #"myr-gr"   = "" #MyriadGroestl
    #"nist5"    = "" #Nist5
    #"qubit"    = "" #qubit
    #"quark"    = "" #Quark
    #"sib"      = "" #Sib
    
    # MPM forgot these
    #"blake"       = "" #Blake 256 (SFR)
    "bmw"         = "" #BMW 256
    "deep"        = "" #Deepcoin
    "dmd-gr"      = "" #Diamond-Groestl
    "fresh"       = "" #Freshcoin (shavite 80)
    "fugue256"    = "" #Fuguecoin
    "heavy"       = "" #Heavycoin
    "jackpot"     = "" #Jackpot
    "luffa"       = "" #Joincoin
    "lyra2"       = "" #LyraBar
    "mjollnir"    = "" #Mjollnircoin
    "penta"       = "" #Pentablake hash (5x Blake 512)
    #"scrypt"      = "" #Scrypt
    "scrypt-jane" = "" #Scrypt-jane Chacha
    "skein2"      = "" #Double Skein (Woodcoin)
    "s3"          = "" #S3 (1Coin)
    #"x11"         = "" #X11 (DarkCoin)
    #"x13"         = "" #X13 (MaruCoin)
    #"x14"         = "" #X14
    #"x15"         = "" #X15
    #"vanilla"     = "" #Blake256-8 (VNL)
    "whirlcoin"   = "" #Old Whirlcoin (Whirlpool algo)
    "whirlpool"   = "" #Whirlpool algo
    "zr5"         = "" #ZR5 (ZiftrCoin)
}

$Name = Get-Item $MyInvocation.MyCommand.Path | Select-Object -ExpandProperty BaseName

$Commands | Get-Member -MemberType NoteProperty | Select-Object -ExpandProperty Name | Where-Object {$Pools.(Get-Algorithm $_).Protocol -eq "stratum+tcp" <#temp fix#>} | ForEach-Object {

    $Algorithm_Norm = Get-Algorithm $_

    [PSCustomObject]@{
        Type = "NVIDIA"
        Path = $Path
        HashSHA256 = $HashSHA256
        Arguments = "-a $_ -o $($Pools.$Algorithm_Norm.Protocol)://$($Pools.$Algorithm_Norm.Host):$($Pools.$Algorithm_Norm.Port) -u $($Pools.$Algorithm_Norm.User) -p $($Pools.$Algorithm_Norm.Pass)$($Commands.$_)"
        HashRates = [PSCustomObject]@{$Algorithm_Norm = $Stats."$($Name)_$($Algorithm_Norm)_HashRate".Week}
        API = "Ccminer"
        Port = 4068
        URI = $Uri
    }
}
