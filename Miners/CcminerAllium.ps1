using module ..\Include.psm1

$Path = ".\Bin\NVIDIA-Allium\ccminer-x64.exe"
$HashSHA256 = "70117C8CBADB642E5E1C587FA0CA3AE1B910FCC0A030CA8884750332DB89D95B"
$Uri = "http://ccminer.org/preview/ccminer-x64-2.2.6-xmr-allium-cuda9.7z"

$Commands = [PSCustomObject]@{
    "allium" = "" #Allium
    
    # MPM forgot these
    "bastion" = "" #Hefty bastion
    "bitcore" = "" #Timetravel-10
    #"blake" = "" #Blake 256 (SFR)
    #"blake2s" = "" #Blake2-S 256 (NEVA)
    #"blakecoin" = "" #Fast Blake 256 (8 rounds)
    "bmw" = "" #BMW 256
    "cryptolight" = "" #AEON cryptonight (MEM/2)
    #"cryptonight" = "" #XMR cryptonight v1 (old)   <<< CcminerTpruvot < ExcavatorNvidia1 < ExcavatorNvidia2 < CcminerAllium < CcminerNevermore
    "c11/flax" = "" #X11 variant
    #"decred" = "" #Decred Blake256
    "deep" = "" #Deepcoin
    "equihash" = "" #Zcash Equihash
    "dmd-gr" = "" #Diamond-Groestl
    "fresh" = "" #Freshcoin (shavite 80)
    "fugue256" = "" #Fuguecoin
    "graft" = "" #Cryptonight v8
    #"groestl" = "" #Groestlcoin   <<< CcminerNanashi < CcminerNevermore < CcminerLyra2RE2 < CcminerTpruvot < CcminerAllium < CcminerLyra2z < CcminerSuprMiner < CcminerSkunk < CcminerSp < CcminerKlaust
    #"hmq1725" = "" #Doubloons / Espers   <<< CcminerNanashi < CcminerSkunk < CcminerAllium < CcminerTpruvot < CcminerSuprMiner < CcminerNevermore
    "hsr" = "" #use to mine Hshare
    "jackpot" = "" #JHA v8
    #"keccak" = "" #Deprecated Keccak-256   <<< CcminerPolytimos < CcminerSkunk < CcminerNanashi < CcminerLyra2RE2 < CcminerLyra2z < CcminerSib < CcminerSuprMiner < CcminerAllium < CcminerSp < CcminerNevermore < CcminerAnxmodPhi < CcminerTpruvot < CcminerAlexis < CcminerKlaust < CcminerXevan < CcminerCornzKeccakC < ExcavatorNvidia1 < ExcavatorNvidia2
    #"keccakc" = "" #Keccak-256 (CreativeCoin)   <<< CcminerNevermore < CcminerSuprMiner < CcminerTpruvot < CcminerAllium < CcminerCornzKeccakC < CcminerAlexis
    #"lbry" = "" #LBRY Credits (Sha/Ripemd)
    "luffa" = "" #Joincoin
    #"lyra2" = "" #CryptoCoin   <<< CcminerSp < CcminerSib < CcminerLyra2RE2 < CcminerLyra2z < CcminerSkunk < CcminerNanashi < CcminerSuprMiner < CcminerNevermore < CcminerTpruvot < CcminerAllium < CcminerXevan < CcminerPolytimos < CcminerCornzKeccakC < CcminerAlexis < CcminerAnxmodPhi
    #"lyra2v2" = "" #VertCoin   <<< CcminerPolytimos < ExcavatorNvidia2 < CcminerCornzKeccakC < ExcavatorNvidia1 < CcminerXevan < CcminerAnxmodPhi < CcminerAlexis < CcminerNanashi < CcminerLyra2RE2 < CcminerSkunk < CcminerTpruvot < CcminerAllium < CcminerSuprMiner < CcminerNevermore < CcminerSib < CcminerKlaust < CcminerSp < CcminerLyra2z
    "lyra2z" = "" #ZeroCoin (3rd impl)   <<< CcminerSkunk < CcminerNevermore < CcminerLyra2z < CcminerNanashi < CcminerSuprMiner < CcminerTpruvot < CcminerAllium
    #"myr-gr" = "" #Myriad-Groestl
    "monero" = "" #XMR cryptonight (v7)
    "neoscrypt" = "" #FeatherCoin, Phoenix, UFO...
    #"nist5" = "" #NIST5 (TalkCoin)
    "penta" = "" #Pentablake hash (5x Blake 512)
    #"phi" = "" #BHCoin   <<< CcminerAnxmodPhi < CcminerSuprMiner < CcminerTpruvot < CcminerAllium < CcminerNevermore < CcminerZealot
    "polytimos" = "" #Politimos
    #"quark" = "" #Quark
    #"qubit" = "" #Qubit
    #"sha256d" = "" #SHA256d (bitcoin)
    "sha256t" = "" #SHA256 x3 (SHA256t=S3)   <<< CcminerNanashi < CcminerSkunk < CcminerSp < CcminerKlaust < CcminerLyra2RE2 < CcminerSuprMiner < CcminerNevermore < CcminerLyra2z < CcminerTpruvot < CcminerAllium
    #"sia" = "" #SIA (Blake2B)
    #"sib" = "" #Sibcoin (X11+Streebog)
    #"scrypt" = "" #Scrypt
    "scrypt-jane" = "" #Scrypt-jane Chacha
    #"scrypt:N" = "" #use to mine Scrypt-N (:10 for 2048 iterations)
    "skein" = "" #Skein SHA2 (Skeincoin)
    "skein2" = "" #Double Skein (Woodcoin)
    "skunk" = "" #Skein Cube Fugue Streebog
    "stellite" = "" #Cryptonight v3
    "s3" = "" #S3 (1Coin) (SHA256t=S3)   <<< CcminerNanashi < CcminerSkunk < CcminerSp < CcminerKlaust < CcminerLyra2RE2 < CcminerSuprMiner < CcminerNevermore < CcminerLyra2z < CcminerTpruvot < CcminerAllium
    #"timetravel" = "" #Machinecoin permuted x8   <<< CcminerTpruvot < CcminerAllium < CcminerNanashi < CcminerSkunk < CcminerSuprMiner < CcminerNevermore
    #"tribus" = "" #Denarius   <<< CcminerSkunk < CcminerNanashi < CcminerNevermore < CcminerTpruvot < CcminerAllium < CcminerSuprMiner
    #"vanilla" = "" #Blake256-8 (VNL)
    "veltor" = "" #Thorsriddle streebog
    "whirlcoin" = "" #Old Whirlcoin (Whirlpool algo)
    "whirlpool" = "" #Whirlpool algo
    "x11evo" = "" #Permuted x11 (Revolver)
    #"x11" = "" #X11 (DarkCoin)
    #"x12" = "" #X12 (GalaxyCash)
    #"x13" = "" #X13 (MaruCoin)
    #"x14" = "" #X14
    #"x15" = "" #X15
    "x16r" = "" #X16R (Raven)
    #"x16s" = "" #X16S   <<< CcminerAllium < CcminerSuprMiner < CcminerNevermore < CcminerZealot
    "x17" = "" #X17
    "wildkeccak" = "" #Boolberry
    "zr5" = "" #ZR5 (ZiftrCoin)
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
