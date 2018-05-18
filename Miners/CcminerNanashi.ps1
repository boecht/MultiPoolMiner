using module ..\Include.psm1

$Path = ".\Bin\NVIDIA-Nanashi\ccminer.exe"
$HashSHA256 = "1974bab01a30826497a76b79e227f3eb1c9eb9ffa6756c801fcd630122bdb5c7"
$URI = "https://github.com/Nanashi-Meiyo-Meijin/ccminer/releases/download/v2.2-mod-r2/2.2-mod-r2-CUDA9.binary.zip"

$Commands = [PSCustomObject]@{
    #GPU - profitable 20/04/2018
    "bastion"         = "" #bastion
    #"bitcore"         = "" #Bitcore   <<< CcminerSuprMiner < CcminerNanashi < CcminerSkunk < CcminerAllium < CcminerTpruvot < CcminerNevermore < CcminerZealot
    "bmw"             = "" #bmw
    #"c11"             = "" #C11   <<< CcminerLyra2RE2 < CcminerNanashi < CcminerSkunk < CcminerLyra2z < CcminerTpruvot < CcminerKlaust < CcminerNevermore < CcminerSuprMiner < CcminerSp < CcminerSib < CcminerAlexis
    "deep"            = "" #deep
    "dmd-gr"          = "" #dmd-gr
    "equihash"        = "" #Equihash   <<< Dstm
    "fresh"           = "" #fresh
    "fugue256"        = "" #Fugue256
    #"groestl"         = "" #Groestl   <<< CcminerNanashi < CcminerNevermore < CcminerLyra2RE2 < CcminerTpruvot < CcminerAllium < CcminerLyra2z < CcminerSuprMiner < CcminerSkunk < CcminerSp < CcminerKlaust
    "heavy"           = "" #heavy
    #"hmq1725"        = "" #HMQ1725   <<< CcminerNanashi < CcminerSkunk < CcminerAllium < CcminerTpruvot < CcminerSuprMiner < CcminerNevermore
    "jha"             = "" #JHA
    #"keccak"          = "" #Keccak   <<< CcminerPolytimos < CcminerSkunk < CcminerNanashi < CcminerLyra2RE2 < CcminerLyra2z < CcminerSib < CcminerSuprMiner < CcminerAllium < CcminerSp < CcminerNevermore < CcminerAnxmodPhi < CcminerTpruvot < CcminerAlexis < CcminerKlaust < CcminerXevan < CcminerCornzKeccakC < ExcavatorNvidia1 < ExcavatorNvidia2
    "luffa"           = "" #Luffa
    #"lyra2"          = "" #lyra2re   <<< CcminerSp < CcminerSib < CcminerLyra2RE2 < CcminerLyra2z < CcminerSkunk < CcminerNanashi < CcminerSuprMiner < CcminerNevermore < CcminerTpruvot < CcminerAllium < CcminerXevan < CcminerPolytimos < CcminerCornzKeccakC < CcminerAlexis < CcminerAnxmodPhi
    #"lyra2v2"        = "" #Lyra2RE2   <<< CcminerPolytimos < ExcavatorNvidia2 < CcminerCornzKeccakC < ExcavatorNvidia1 < CcminerXevan < CcminerAnxmodPhi < CcminerAlexis < CcminerNanashi < CcminerLyra2RE2 < CcminerSkunk < CcminerTpruvot < CcminerAllium < CcminerSuprMiner < CcminerNevermore < CcminerSib < CcminerKlaust < CcminerSp < CcminerLyra2z
    #"lyra2z"          = "" #Lyra2z, ZCoin   <<< CcminerSkunk < CcminerNevermore < CcminerLyra2z < CcminerNanashi < CcminerSuprMiner < CcminerTpruvot < CcminerAllium
    "mjollnir"        = "" #Mjollnir
    #"neoscrypt"       = "" #NeoScrypt   <<< CcminerSp < CcminerLyra2RE2 < CcminerSuprMiner < CcminerSib < NsgminerNvidia < CcminerLyra2z < CcminerKlaust < CcminerTpruvot < CcminerAllium < CcminerNevermore < CcminerSkunk < CcminerNanashi < JustAMinerNeoScrypt < ExcavatorNvidia1
    "penta"           = "" #Pentablake
    #"sha256t"         = "" #sha256t (SHA256t=S3)   <<< CcminerNanashi < CcminerSkunk < CcminerSp < CcminerKlaust < CcminerLyra2RE2 < CcminerSuprMiner < CcminerNevermore < CcminerLyra2z < CcminerTpruvot < CcminerAllium
    #"skein"           = "" #Skein   <<< CcminerNevermore < CcminerLyra2RE2 < CcminerAllium < CcminerSuprMiner < CcminerSkunk < CcminerLyra2z < CcminerNanashi < CcminerSib < CcminerAlexis < CcminerKlaust < CcminerSp
    "skein2"          = "" #skein2
    "skunk"           = "" #Skunk
    #"s3"             = "" #S3 (SHA256t=S3)   <<< CcminerNanashi < CcminerSkunk < CcminerSp < CcminerKlaust < CcminerLyra2RE2 < CcminerSuprMiner < CcminerNevermore < CcminerLyra2z < CcminerTpruvot < CcminerAllium
    #"timetravel"     = "" #Timetravel   <<< CcminerTpruvot < CcminerAllium < CcminerNanashi < CcminerSkunk < CcminerSuprMiner < CcminerNevermore
    #"tribus"         = "" #Tribus   <<< CcminerSkunk < CcminerNanashi < CcminerNevermore < CcminerTpruvot < CcminerAllium < CcminerSuprMiner
    "veltor"          = "" #Veltor
    "whirlpool"       = "" #Whirlpool
    "wildkeccak"      = "" #wildkeccak
    "x11evo"          = "" #X11evo
    "x17"             = "" #x17   <<< CcminerZealot.ps1
    "zr5"             = "" #zr5
    
    # ASIC - never profitable 27/03/2018
    #"blake"          = "" #blake
    #"blakecoin"      = "" #Blakecoin
    #"blake2s"        = "" #Blake2s
    #"cryptolight"    = "" #cryptolight
    #"cryptonight"    = "" #CryptoNight
    #"decred"         = "" #Decred
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
    "jackpot"         = "" #Jackpotcoin
    "scrypt-jane"     = "" #Scrypt-jane Chacha
    "whirlcoin"       = "" #Old Whirlcoin (Whirlpool algo)
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
