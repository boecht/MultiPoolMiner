using module ..\Include.psm1

$Path = ".\Bin\NVIDIA-TPruvot\ccminer-x64.exe"
$HashSHA256 = "9156D5FC42DAA9C8739D04C3456DA8FBF3E9DC91D4894D351334F69A7CEE58C5"
$Uri = "https://github.com/tpruvot/ccminer/releases/download/2.2.5-tpruvot/ccminer-x64-2.2.5-cuda9.7z"

$Commands = [PSCustomObject]@{
    #GPU - profitable 20/04/2018
    "bastion"         = "" #bastion
    "bitcore"         = "" #Bitcore   <<< ccminerZealot
    "bmw"             = "" #bmw
    "c11"             = "" #C11
    "deep"            = "" #deep
    "dmd-gr"          = "" #dmd-gr
    "equihash"        = "" #Equihash - Beaten by Bminer by 30%   <<< DSTM
    "fresh"           = "" #fresh
    "fugue256"        = "" #Fugue256
    "groestl"         = "" #Groestl
    "hmq1725"         = "" #HMQ1725
    "jackpot"         = "" #JackPot
    "keccak"          = "" #Keccak
    "keccakc"         = "" #keccakc
    "luffa"           = "" #Luffa
    "lyra2"           = "" #lyra2re
    #"lyra2v2"        = "" #Lyra2RE2   <<< CcminerPolytimos < ExcavatorNvidia2 < CcminerCornzKeccakC < ExcavatorNvidia1 < CcminerXevan < CcminerAnxmodPhi < CcminerAlexis < CcminerNanashi < CcminerLyra2RE2 < CcminerSkunk < CcminerTpruvot < CcminerAllium < CcminerSuprMiner < CcminerNevermore < CcminerSib < CcminerKlaust < CcminerSp < CcminerLyra2z
    "lyra2z"          = "" #Lyra2z, ZCoin
    "neoscrypt"       = "" #NeoScrypt
    "penta"           = "" #Pentablake
    "phi"             = "" #PHI   <<< CcminerAnxmodPhi
    "polytimos"       = "" #Polytimos
    "scryptjane:nf"   = "" #scryptjane:nf
    "sha256t"         = "" #sha256t   <<< no profit
    #"skein"          = "" #Skein
    "skein2"          = "" #skein2
    #"skunk"          = "" #Skunk   <<< CcminerSkunk
    "s3"              = "" #S3   <<< no profit (sha256t)
    "timetravel"      = "" #Timetravel
    "tribus"          = "" #Tribus
    "veltor"          = "" #Veltor
    #"whirlpool"      = "" #Whirlpool
    #"whirlpoolx"     = "" #whirlpoolx
    "wildkeccak"      = "" #wildkeccak
    "x11evo"          = "" #X11evo
    "x16r"            = "" #X16r   <<< CcminerSuprMiner <<< CcminerNevermore
    #"X16s"           = "" #X16s
    #"x17"            = "" #x17
    "zr5"             = "" #zr5

    # ASIC - never profitable 20/04/2018
    #"blake"          = "" #blake
    #"blakecoin"      = "" #Blakecoin
    #"blake2s"        = "" #Blake2s
    #"lbry"           = "" #Lbry
    #"decred"         = "" #Decred
    #"myr-gr"         = "" #MyriadGroestl
    #"nist5"          = "" #Nist5
    #"quark"          = "" #Quark
    #"qubit"          = "" #Qubit
    #"scrypt"         = "" #Scrypt
    #"scrypt:N"       = "" #scrypt:N
    #"sha256d"        = "" #sha256d
    #"sib"            = "" #Sib
    #"vanilla"        = "" #BlakeVanilla
    #"x11"            = "" #X11
    #"x12"            = "" #X12
    #"x13"            = "" #x13
    #"x14"            = "" #x14
    #"x15"            = "" #x15
    
    # MPM forgot these
    "cryptolight"     = "" #AEON cryptonight (MEM/2)
    "cryptonight"     = "" #XMR cryptonight, Bytecoin, Dash, DigitalNote, etc
    "hsr"             = "" #Hshare
    #"sia"            = "" #SIA
    "whirlcoin"       = "" #Old Whirlcoin (Whirlpool algo)
}

$Name = Get-Item $MyInvocation.MyCommand.Path | Select-Object -ExpandProperty BaseName

$Commands | Get-Member -MemberType NoteProperty | Select-Object -ExpandProperty Name | Where-Object {$Pools.(Get-Algorithm $_).Protocol -eq "stratum+tcp" <#temp fix#>} | ForEach-Object {

    $Algorithm_Norm = Get-Algorithm $_

    [PSCustomObject]@{
        Type = "NVIDIA"
        Path = $Path
        HashSHA256 = $HashSHA256
        Arguments = "-a $_ -o $($Pools.$Algorithm_Norm.Protocol)://$($Pools.$Algorithm_Norm.Host):$($Pools.$Algorithm_Norm.Port) -u $($Pools.$Algorithm_Norm.User) -p $($Pools.$Algorithm_Norm.Pass)$($Commands.$_) --submit-stale"
        HashRates = [PSCustomObject]@{$Algorithm_Norm = $Stats."$($Name)_$($Algorithm_Norm)_HashRate".Week}
        API = "Ccminer"
        Port = 4068
        URI = $Uri
    }
}
