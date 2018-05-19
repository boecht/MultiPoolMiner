using module ..\Include.psm1

$Path = ".\Bin\Skunk-NVIDIA\ccminer.exe"
$HashSHA256 = "B0517639B174E2A7776A5567F566E1C0905A7FE439049D33D44A7502DE581F7B"
$URI = "https://github.com/scaras/ccminer-2.2-mod-r1/releases/download/2.2-r1/2.2-mod-r1.zip"

$Commands = [PSCustomObject]@{
    #"c11"         = "" #C11   <<< CcminerLyra2RE2 < CcminerNanashi < CcminerSkunk < CcminerLyra2z < CcminerTpruvot < CcminerKlaust < CcminerNevermore < CcminerSuprMiner < CcminerSp < CcminerSib < CcminerAlexis
    #"groestl"     = "" #Groestl   <<< CcminerNanashi < CcminerNevermore < CcminerLyra2RE2 < CcminerTpruvot < CcminerAllium < CcminerLyra2z < CcminerSuprMiner < CcminerSkunk < CcminerSp < CcminerKlaust
    #"hmq1725"    = "" #HMQ1725   <<< CcminerNanashi < CcminerSkunk < CcminerAllium < CcminerTpruvot < CcminerSuprMiner < CcminerNevermore
    #"lyra2v2"    = "" #Lyra2RE2   <<< CcminerPolytimos < ExcavatorNvidia2 < CcminerCornzKeccakC < ExcavatorNvidia1 < CcminerXevan < CcminerAnxmodPhi < CcminerAlexis < CcminerNanashi < CcminerLyra2RE2 < CcminerSkunk < CcminerTpruvot < CcminerAllium < CcminerSuprMiner < CcminerNevermore < CcminerSib < CcminerKlaust < CcminerSp < CcminerLyra2z
    #"lyra2z"     = "" #Lyra2z   <<< CcminerSkunk < CcminerNevermore < CcminerLyra2z < CcminerNanashi < CcminerSuprMiner < CcminerTpruvot < CcminerAllium
    #"neoscrypt"   = "" #NeoScrypt   <<< CcminerSp < CcminerLyra2RE2 < CcminerSuprMiner < CcminerSib < NsgminerNvidia < CcminerLyra2z < CcminerKlaust < CcminerTpruvot < CcminerAllium < CcminerNevermore < CcminerSkunk < CcminerNanashi < JustAMinerNeoScrypt < ExcavatorNvidia1
    #"skein"       = "" #Skein   <<< CcminerNevermore < CcminerLyra2RE2 < CcminerAllium < CcminerSuprMiner < CcminerSkunk < CcminerLyra2z < CcminerNanashi < CcminerSib < CcminerAlexis < CcminerKlaust < CcminerSp
    "skunk"       = "" #Skunk
    #"timetravel" = "" #Timetravel   <<< CcminerTpruvot < CcminerAllium < CcminerNanashi < CcminerSkunk < CcminerSuprMiner < CcminerNevermore
    #"tribus"     = "" #Tribus   <<< CcminerSkunk < CcminerNanashi < CcminerNevermore < CcminerTpruvot < CcminerAllium < CcminerSuprMiner
    #"x11evo"      = "" #X11evo   <<< CcminerNanashi < CcminerSkunk < CcminerTpruvot < CcminerAllium < CcminerSuprMiner < CcminerLyra2z < CcminerNevermore < CcminerSib < CcminerAlexis
    #"x17"         = "" #X17  <<< CcminerKlaust < CcminerLyra2RE2 < CcminerLyra2z < CcminerNanashi < CcminerSp < CcminerSuprMiner < CcminerSkunk < CcminerAllium < CcminerNevermore < CcminerAlexis < CcminerZealot
    
    # ASIC - never profitable 12/05/2018
    #"blake2s"    = "" #Blake2s
    #"blakecoin"  = "" #Blakecoin
    #"decred"     = "" #Decred
    #"lbry"       = "" #Lbry
    #"myr-gr"     = "" #MyriadGroestl
    #"nist5"      = "" #Nist5
    #"qubit"      = "" #qubit
    #"quark"      = "" #Quark
    #"sib"        = "" #Sib
    #"x11"        = "" #X11
    #"x13"        = "" #X13
    #"x14"        = "" #X14
    
    # MPM forgot these
    "bastion"     = "" #Hefty bastion
    #"bitcore"     = "" #Timetravel-10   <<< CcminerSuprMiner < CcminerNanashi < CcminerSkunk < CcminerAllium < CcminerTpruvot < CcminerNevermore < CcminerZealot
    #"blake"       = "" #Blake 256 (SFR)
    "bmw"         = "" #BMW 256
    "cryptolight" = "" #AEON cryptonight (MEM/2)
    #"cryptonight" = "" #XMR cryptonight   --- BROKEN
    "deep"        = "" #Deepcoin
    #"equihash"    = "" #Zcash Equihash   <<< CcminerNanashi < CcminerSkunk < CcminerNevermore < CcminerAllium < CcminerSuprMiner < CcminerTpruvot < ExcavatorNvidia1 < Dstm < Ewbf < ExcavatorNvidia2 < BMiner
    "dmd-gr"      = "" #Diamond-Groestl
    "fresh"       = "" #Freshcoin (shavite 80)
    "fugue256"    = "" #Fuguecoin
    "heavy"       = "" #Heavycoin
    "jackpot"     = "" #use to mine Jackpotcoin
    "jha"         = "" #JHA v8 (JackpotCoin)
    #"keccak"      = "" #Keccak-256 (Maxcoin)   <<< CcminerPolytimos < CcminerSkunk < CcminerNanashi < CcminerLyra2RE2 < CcminerLyra2z < CcminerSib < CcminerSuprMiner < CcminerAllium < CcminerSp < CcminerNevermore < CcminerAnxmodPhi < CcminerTpruvot < CcminerAlexis < CcminerKlaust < CcminerXevan < CcminerCornzKeccakC < ExcavatorNvidia1 < ExcavatorNvidia2
    "luffa"       = "" #Joincoin
    #"lyra2"       = "" #CryptoCoin   <<< CcminerSp < CcminerSib < CcminerLyra2RE2 < CcminerLyra2z < CcminerSkunk < CcminerNanashi < CcminerSuprMiner < CcminerNevermore < CcminerTpruvot < CcminerAllium < CcminerXevan < CcminerPolytimos < CcminerCornzKeccakC < CcminerAlexis < CcminerAnxmodPhi
    "mjollnir"    = "" #Mjollnircoin
    "penta"       = "" #Pentablake hash (5x Blake 512)
    #"sha256d"     = "" #SHA256d (bitcoin)
    #"sha256t"     = "" #SHA256 x3 (SHA256t=S3)   <<< CcminerNanashi < CcminerSkunk < CcminerSp < CcminerKlaust < CcminerLyra2RE2 < CcminerSuprMiner < CcminerNevermore < CcminerLyra2z < CcminerTpruvot < CcminerAllium
    #"sia"         = "" #SIA (Blake2B)
    #"scrypt"      = "" #Scrypt
    "scrypt-jane" = "" #Scrypt-jane Chacha
    "skein2"      = "" #Double Skein (Woodcoin)
    #"s3"          = "" #S3 (1Coin) (SHA256t=S3)   <<< CcminerNanashi < CcminerSkunk < CcminerSp < CcminerKlaust < CcminerLyra2RE2 < CcminerSuprMiner < CcminerNevermore < CcminerLyra2z < CcminerTpruvot < CcminerAllium
    #"vanilla"     = "" #Blake256-8 (VNL)
    "veltor"      = "" #Thorsriddle streebog
    "whirlcoin"   = "" #Old Whirlcoin (Whirlpool algo)
    "whirlpool"   = "" #Whirlpool algo
    #"x15"         = "" #X15
    "wildkeccak"  = "" #Boolberry
    "zr5"         = "" #ZR5 (ZiftrCoin)
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
