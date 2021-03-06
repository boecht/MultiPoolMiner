using module ..\Include.psm1

$Path = ".\Bin\NVIDIA-Nevermore\ccminer.exe"
$HashSHA256 = "940EB4C246019216C8F95FFB2F2E65FA147B13A65756A38D660146672E47844B"
$Uri = "https://github.com/nemosminer/ccminerx16r-x16s/releases/download/v0.5/ccminerx16rx16s64-bit.7z"

$Commands = [PSCustomObject]@{
    "bitcore"         = "" #Bitcore   <<< CcminerSuprMiner < CcminerNanashi < CcminerSkunk < CcminerAllium < CcminerTpruvot < CcminerNevermore < CcminerZealot
    "c11"             = "" #C11   <<< CcminerLyra2RE2 < CcminerNanashi < CcminerSkunk < CcminerLyra2z < CcminerTpruvot < CcminerKlaust < CcminerNevermore < CcminerSuprMiner < CcminerSp < CcminerSib < CcminerAlexis
    "equihash"        = "" #Equihash - Beaten by Bminer by 30%   <<< CcminerNanashi < CcminerSkunk < CcminerNevermore < CcminerAllium < CcminerSuprMiner < CcminerTpruvot < ExcavatorNvidia1 < Dstm < Ewbf < ExcavatorNvidia2 < BMiner
    #"groestl"        = "" #Groestl   <<< CcminerNanashi < CcminerNevermore < CcminerLyra2RE2 < CcminerTpruvot < CcminerAllium < CcminerLyra2z < CcminerSuprMiner < CcminerSkunk < CcminerSp < CcminerKlaust
    "hmq1725"         = "" #HMQ1725   <<< CcminerNanashi < CcminerSkunk < CcminerAllium < CcminerTpruvot < CcminerSuprMiner < CcminerNevermore
    "hsr"             = "" #HSR   <<< CcminerSuprMiner < CcminerAllium < CcminerTpruvot < CcminerNevermore < CcminerAnxmodPhi < CcminerPolytimos < CcminerAlexis
    "jha"             = "" #JHA - NOT TESTED
    "keccak"          = "" #Keccak   <<< CcminerPolytimos < CcminerSkunk < CcminerNanashi < CcminerLyra2RE2 < CcminerLyra2z < CcminerSib < CcminerSuprMiner < CcminerAllium < CcminerSp < CcminerNevermore < CcminerAnxmodPhi < CcminerTpruvot < CcminerAlexis < CcminerKlaust < CcminerXevan < CcminerCornzKeccakC < ExcavatorNvidia1 < ExcavatorNvidia2
    "keccakc"         = "" #Keccakc   <<< CcminerNevermore < CcminerSuprMiner < CcminerTpruvot < CcminerAllium < CcminerCornzKeccakC < CcminerAlexis
    "lyra2v2"         = "" #Lyra2RE2   <<< CcminerPolytimos < ExcavatorNvidia2 < CcminerCornzKeccakC < ExcavatorNvidia1 < CcminerXevan < CcminerAnxmodPhi < CcminerAlexis < CcminerNanashi < CcminerLyra2RE2 < CcminerSkunk < CcminerTpruvot < CcminerAllium < CcminerSuprMiner < CcminerNevermore < CcminerSib < CcminerKlaust < CcminerSp < CcminerLyra2z
    "lyra2z"          = "" #Lyra2z   <<< CcminerSkunk < CcminerNevermore < CcminerLyra2z < CcminerNanashi < CcminerSuprMiner < CcminerTpruvot < CcminerAllium
    "neoscrypt"       = "" #NeoScrypt   <<< CcminerSp < CcminerLyra2RE2 < CcminerSuprMiner < CcminerSib < NsgminerNvidia < CcminerLyra2z < CcminerKlaust < CcminerTpruvot < CcminerAllium < CcminerNevermore < CcminerSkunk < CcminerNanashi < JustAMinerNeoScrypt < ExcavatorNvidia1
    "phi"             = "" #PHI   <<< CcminerAnxmodPhi < CcminerSuprMiner < CcminerTpruvot < CcminerAllium < CcminerNevermore < CcminerZealot
    "poly"            = "" #Polytmos - NOT TESTED
    "skein"           = "" #Skein   <<< CcminerNevermore < CcminerLyra2RE2 < CcminerAllium < CcminerSuprMiner < CcminerSkunk < CcminerLyra2z < CcminerNanashi < CcminerSib < CcminerAlexis < CcminerKlaust < CcminerSp < CcminerXevan < CcminerPolytimos < CcminerCornzKeccakC < CcminerAnxmodPhi
    "skunk"           = "" #Skunk   <<< CcminerAllium < CcminerNevermore < CcminerSuprMiner < CcminerNanashi < CcminerSkunk
    "timetravel"      = "" #Timetravel   <<< CcminerTpruvot < CcminerAllium < CcminerNanashi < CcminerSkunk < CcminerSuprMiner < CcminerNevermore
    "tribus"          = "" #Tribus   <<< CcminerSkunk < CcminerNanashi < CcminerNevermore < CcminerTpruvot < CcminerAllium < CcminerSuprMiner
    "veltor"          = "" #Veltor - NOT TESTED
    "x11evo"          = "" #X11evo   <<< CcminerNanashi < CcminerSkunk < CcminerTpruvot < CcminerAllium < CcminerSuprMiner < CcminerLyra2z < CcminerNevermore < CcminerSib < CcminerAlexis
    "x12"             = "" #X12 - NOT TESTED
    "x16r"            = "" #Raven
    "x16s"            = "" #Pigeon   <<< CcminerAllium < CcminerSuprMiner < CcminerNevermore < CcminerZealot
    "x17"             = "" #X17  <<< CcminerKlaust < CcminerLyra2RE2 < CcminerLyra2z < CcminerNanashi < CcminerSp < CcminerSuprMiner < CcminerSkunk < CcminerAllium < CcminerNevermore < CcminerAlexis < CcminerZealot
   
    # ASIC - never profitable 11/05/2018
    #"blake"          = "" #blake
    #"blakecoin"      = "" #Blakecoin
    #"blake2s"        = "" #Blake2s
    #"decred"         = "" #Decred
    #"decrednicehash" = "" #Decrednicehash 
    #"lbry"           = "" #Lbry
    #"myr-gr"         = "" #MyriadGroestl
    #"nist5"          = "" #Nist5
    #"quark"          = "" #Quark
    #"qubit"          = "" #Qubit
    #"scrypt"         = "" #Scrypt
    #"sha256d"        = "" #sha256d
    #"sia"            = "" #SiaCoin
    #"sib"            = "" #Sib
    #"vanilla"        = "" #BlakeVanilla
    #"x11"            = "" #X11
    #"x13"            = "" #x13
    #"x14"            = "" #x14
    #"x15"            = "" #x15
    
    # MPM forgot these
    "bastion"         = "" #Hefty bastion
    "bmw"             = "" #BMW 256
    "cryptolight"     = "" #AEON cryptonight (MEM/2)
    #"cryptonight"    = "" #XMR cryptonight   ---  PROFIT <<< CcminerTpruvot < ExcavatorNvidia1 < ExcavatorNvidia2 < CcminerAllium < CcminerNevermore
    "deep"            = "" #Deepcoin
    "dmd-gr"          = "" #Diamond-Groestl
    "fresh"           = "" #Freshcoin (shavite 80)
    "fugue256"        = "" #Fuguecoin
    "jackpot"         = "" #JHA v8
    "luffa"           = "" #Joincoin
    "lyra2"           = "" #CryptoCoin   <<< CcminerSp < CcminerSib < CcminerLyra2RE2 < CcminerLyra2z < CcminerSkunk < CcminerNanashi < CcminerSuprMiner < CcminerNevermore < CcminerTpruvot < CcminerAllium < CcminerXevan < CcminerPolytimos < CcminerCornzKeccakC < CcminerAlexis < CcminerAnxmodPhi
    "penta"           = "" #Pentablake hash (5x Blake 512)
    "polytimos"       = "" #Politimos
    #"sha256t"        = "" #SHA256 x3 (SHA256t=S3)   <<< CcminerNanashi < CcminerSkunk < CcminerSp < CcminerKlaust < CcminerLyra2RE2 < CcminerSuprMiner < CcminerNevermore < CcminerLyra2z < CcminerTpruvot < CcminerAllium
    "scrypt-jane"     = "" #Scrypt-jane Chacha
    "skein2"          = "" #Double Skein (Woodcoin)
    #"s3"             = "" #S3 (1Coin) (SHA256t=S3)   <<< CcminerNanashi < CcminerSkunk < CcminerSp < CcminerKlaust < CcminerLyra2RE2 < CcminerSuprMiner < CcminerNevermore < CcminerLyra2z < CcminerTpruvot < CcminerAllium
    "whirlcoin"       = "" #Old Whirlcoin (Whirlpool algo)
    "whirlpool"       = "" #Whirlpool algo
    "wildkeccak"      = "" #Boolberry
    "zr5"             = "" #ZR5 (ZiftrCoin)
}

$Name = Get-Item $MyInvocation.MyCommand.Path | Select-Object -ExpandProperty BaseName

$Commands | Get-Member -MemberType NoteProperty | Select-Object -ExpandProperty Name | Where-Object {$Pools.(Get-Algorithm $_).Protocol -eq "stratum+tcp" <#temp fix#>} | ForEach-Object {
    
    $Algorithm_Norm = Get-Algorithm $_

    Switch ($Algorithm_Norm) {
        "PHI"   {$ExtendInterval = 3}
        "X16R"  {$ExtendInterval = 10}
        default {$ExtendInterval = 0}
    }

    [PSCustomObject]@{
        Type             = "NVIDIA"
        Path             = $Path
        HashSHA256       = $HashSHA256
        Arguments        = "-a $_ -o $($Pools.$Algorithm_Norm.Protocol)://$($Pools.$Algorithm_Norm.Host):$($Pools.$Algorithm_Norm.Port) -u $($Pools.$Algorithm_Norm.User) -p $($Pools.$Algorithm_Norm.Pass)$($Commands.$_)"
        HashRates        = [PSCustomObject]@{$Algorithm_Norm = $Stats."$($Name)_$($Algorithm_Norm)_HashRate".Week}
        API              = "Ccminer"
        Port             = 4068
        URI              = $Uri
        ExtendInterval   = $ExtendInterval
        PrerequisitePath = "$env:SystemRoot\System32\msvcr120.dll"
        PrerequisiteURI  = "http://download.microsoft.com/download/2/E/6/2E61CFA4-993B-4DD4-91DA-3737CD5CD6E3/vcredist_x64.exe"
    }
}
