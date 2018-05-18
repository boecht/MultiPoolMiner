using module ..\Include.psm1

$Path = ".\Bin\Lyra2z-NVIDIA\ccminer.exe"
$HashSHA256 = "F9A69BA3C00E80BBBE7054E8705FE07DC23B7C408FA5405B778441A24D1AD223"
$Uri = "https://github.com/djm34/ccminer-msvc2015/releases/download/v0.3.0/ccminer.rar"

$Commands = [PSCustomObject]@{
    "c11"             = "" #C11
    #"groestl"         = "" #Groestl   <<< CcminerNanashi < CcminerNevermore < CcminerLyra2RE2 < CcminerTpruvot < CcminerAllium < CcminerLyra2z < CcminerSuprMiner < CcminerSkunk < CcminerSp < CcminerKlaust
    "keccak"          = "" #Keccak
    "lyra2h"          = "" #Lyra2h
    #"lyra2v2"        = "" #Lyra2RE2   <<< CcminerPolytimos > ExcavatorNvidia2 > CcminerCornzKeccakC > ExcavatorNvidia1 > CcminerXevan > CcminerAnxmodPhi > CcminerAlexis > CcminerNanashi > CcminerLyra2RE2 > CcminerSkunk > CcminerTpruvot > CcminerAllium > CcminerSuprMiner > CcminerNevermore > CcminerSib > CcminerKlaust > CcminerSp > CcminerLyra2z
    #"lyra2z"          = "" #Lyra2z   <<< CcminerSkunk < CcminerNevermore < CcminerLyra2z < CcminerNanashi < CcminerSuprMiner < CcminerTpruvot < CcminerAllium
    "neoscrypt"       = "" #NeoScrypt
    "skein"           = "" #Skein
    "x11evo"          = "" #X11evo
    "x17"             = "" #X17
    
    # ASIC - never profitable 12/05/2018
    #"blake2s"        = "" #Blake2s
    #"blakecoin"      = "" #Blakecoin
    #"decred"         = "" #Decred
    #"lbry"           = "" #Lbry
    #"myr-gr"         = "" #MyriadGroestl
    #"nist5"          = "" #Nist5
    #"qubit"          = "" #Qubit
    #"quark"          = "" #Quark
    #"sib"            = "" #Sib
    #"x11"            = "" #X11
    #"x13"            = "" #X13
    #"x14"            = "" #X14
    
    # MPM forgot these
    #"blake"          = "" #Blake 256 (SFR)
    "bmw"             = "" #BMW 256
    "deep"            = "" #Deepcoin
    "dmd-gr"          = "" #Diamond-Groestl
    "fresh"           = "" #Freshcoin (shavite 80)
    "fugue256"        = "" #Fuguecoin
    "heavy"           = "" #Heavycoin
    "jackpot"         = "" #Jackpot
    "luffa"           = "" #Joincoin
    #"lyra2"           = "" #CryptoCoin   <<< CcminerSp < CcminerSib < CcminerLyra2RE2 < CcminerLyra2z < CcminerSkunk < CcminerNanashi < CcminerSuprMiner < CcminerNevermore < CcminerTpruvot < CcminerAllium < CcminerXevan < CcminerPolytimos < CcminerCornzKeccakC < CcminerAlexis < CcminerAnxmodPhi
    "m7"              = "" #m7 (crytonite) hash
    "mjollnir"        = "" #Mjollnircoin
    "penta"           = "" #Pentablake hash (5x Blake 512)
    #"sia"            = "" #SIA (Blake2B)
    #"scrypt"         = "" #Scrypt
    "scrypt-jane"     = "" #Scrypt-jane Chacha
    "skein2"          = "" #Double Skein (Woodcoin)
    #"s3"              = "" #S3 (1Coin) (SHA256t=S3)   <<< CcminerNanashi < CcminerSkunk < CcminerSp < CcminerKlaust < CcminerLyra2RE2 < CcminerSuprMiner < CcminerNevermore < CcminerLyra2z < CcminerTpruvot < CcminerAllium
    #"vanilla"        = "" #Blake256-8 (VNL)
    "veltor"          = "" #Thorsriddle streebog
    "whirlcoin"       = "" #Old Whirlcoin (Whirlpool algo)
    "whirlpool"       = "" #Whirlpool algo
    #"x15"            = "" #X15
    "zr5"             = "" #ZR5 (ZiftrCoin)
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
