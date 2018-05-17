using module ..\Include.psm1

$Path = ".\Bin\NVIDIA-SuprMiner\ccminer.exe"
$HashSHA256 = "6DE5DC4F109951AE1591D083F5C2A6494C9B59470C15EF6FBE5D38C50625304B"
$Uri = "https://github.com/ocminer/suprminer/releases/download/1.5/suprminer-1.5.7z"

$Commands = [PSCustomObject]@{
    "bitcore"   = "" #Bitcore
    "c11"       = "" #C11
    "groestl"   = "" #Groestl
    "hmq1725"   = "" #HMQ1725
    "hsr"       = "" #HSR
    "keccak"    = "" #Keccak
    "keccakc"   = "" #Keccakc
    #"lyra2v2"   = "" #Lyra2RE2   <<< CcminerPolytimos < ExcavatorNvidia2 < CcminerCornzKeccakC < ExcavatorNvidia1 < CcminerXevan < CcminerAnxmodPhi < CcminerAlexis < CcminerNanashi < CcminerLyra2RE2 < CcminerSkunk < CcminerTpruvot < CcminerAllium < CcminerSuprMiner < CcminerNevermore < CcminerSib < CcminerKlaust < CcminerSp < CcminerLyra2z
    "lyra2z"    = "" #Lyra2z
    "neoscrypt" = "" #NeoScrypt
    "phi"       = "" #PHI
    "skein"     = "" #Skein
    "skunk"     = "" #Skunk
    "timetravel"= "" #Timetravel
    "tribus"    = "" #Tribus
    "x11evo"    = "" #X11evo
    "x16r"      = "" #Raven
    #"x16s"      = "" #Pigeon   <<< CcminerAllium < CcminerSuprMiner < CcminerNevermore < CcminerZealot
    "x17"       = "" #X17
    
    # ASIC - never profitable 12/05/2018
    #"blake2s"   = "" #Blake2s
    #"blakecoin" = "" #Blakecoin
    #"decred"   = "" #Decred
    #"lbry"     = "" #Lbry
    #"myr-gr"   = "" #MyriadGroestl
    #"nist5"    = "" #Nist5
    #"qubit"    = "" #Qubit
    #"quark"    = "" #Quark
    #"sib"      = "" #Sib
    #"x11"      = "" #X11
    #"x13"      = "" #X13
    #"x14"      = "" #X14
    
    # MPM forgot these
    "bastion"     = "" #Joincoin
    #"blake"       = "" #Saffroncoin (Blake256)
    "bmw"         = "" #Midnight
    "cryptolight" = "" #AEON cryptonight (MEM/2)
    #"cryptonight" = "" #XMR cryptonight, Bytecoin, Dash, DigitalNote, etc   --- BROKEN
    "deep"        = "" #Deepcoin
    "dmd-gr"      = "" #Diamond-Groestl
    "equihash"    = "" #ZEC, HUSH and KMD
    "fresh"       = "" #Freshcoin
    "fugue256"    = "" #Fuguecoin
    "jackpot"     = "" #Sweepcoin
    "luffa"       = "" #Joincoin
    "lyra2"       = "" #CryptoCoin
    "penta"       = "" #Joincoin / Pentablake
    "polytimos"   = "" #Polytimos
    #"scrypt"      = "" #Scrypt coins (Litecoin, Dogecoin, etc)
    #"scrypt:N"    = "" #Scrypt-N (:10 for 2048 iterations)
    "scrypt-jane" = "" #Chacha coins like Cache and Ultracoin
    "s3"          = "" #1coin (ONE)
    "sha256t"     = "" #OneCoin (OC)
    #"sia"         = "" #SIA
    "skein2"      = "" #Woodcoin
    #"x15"         = "" #Halcyon
    #"vanilla"     = "" #Vanilla (Blake256)
    "veltor"      = "" #VeltorCoin
    "whirlpool"   = "" #Joincoin
    "wildkeccak"  = "" #Boolberry (Stratum only)
    "zr5"         = "" #ZiftrCoin
    #"sha256d"     = "" #SHA256d (bitcoin)
    "whirlcoin"   = "" #Old Whirlcoin (Whirlpool algo)
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
