using module ..\Include.psm1

$Path = ".\Bin\NVIDIA-Nevermore\ccminer.exe"
#Original
$HashSHA256 = "913DBACE37949F2BB718E3C57C9A080C3040454E5D4E27244E1CB2F785DFD9AF"
$Uri = "https://github.com/nemosminer/ccminernevermorex16r/releases/download/nevermorex16rv0.3/ccminernevermorex16rx64v0.3.zip"
#Mine
$HashSHA256 = "BB4D7748BCBD85C60BD74D2C7E3FE0B49A41834F69131682CA35087C932D178B"
$Uri = "https://github.com/nemosminer/ccminerx16r-x16s/releases/download/x16rx16sv0.4/ccminerx16rx16sv0.4.zip"

$Commands = [PSCustomObject]@{
    "X16r" = "" #X16r RavenCoin
    "X16s" = "" #X16s PigeonCoin   <<< ccminerZealot
    
    # MPM forgot these
    "bastion" = "" #Hefty bastion
    "bitcore" = "" #Timetravel-10
    #"blake" = "" #Blake 256 (SFR)
    #"blake2s" = "" #Blake2-S 256 (NEVA)
    #"blakecoin" = "" #Fast Blake 256 (8 rounds)
    "bmw" = "" #BMW 256
    "cryptolight" = "" #AEON cryptonight (MEM/2)
    "cryptonight" = "" #XMR cryptonight
    "c11/flax" = "" #X11 variant
    #"decred" = "" #Decred Blake256
    "deep" = "" #Deepcoin
    "equihash" = "" #Zcash Equihash
    "dmd-gr" = "" #Diamond-Groestl
    "fresh" = "" #Freshcoin (shavite 80)
    "fugue256" = "" #Fuguecoin
    "groestl" = "" #Groestlcoin
    "hmq1725" = "" #Doubloons / Espers
    "jackpot" = "" #JHA v8
    "keccak" = "" #Deprecated Keccak-256
    "keccakc" = "" #Keccak-256 (CreativeCoin)
    #"lbry" = "" #LBRY Credits (Sha/Ripemd)
    "luffa" = "" #Joincoin
    "lyra2" = "" #CryptoCoin
    "lyra2v2" = "" #VertCoin
    "lyra2z" = "" #ZeroCoin (3rd impl)
    #"myr-gr" = "" #Myriad-Groestl
    "neoscrypt" = "" #FeatherCoin, Phoenix, UFO...
    #"nist5" = "" #NIST5 (TalkCoin)
    "penta" = "" #Pentablake hash (5x Blake 512)
    "phi" = "" #BHCoin
    "polytimos" = "" #Politimos
    #"quark" = "" #Quark
    #"qubit" = "" #Qubit
    #"sha256d" = "" #SHA256d (bitcoin)
    "sha256t" = "" #SHA256 x3
    #"sia" = "" #SIA (Blake2B)
    #"sib" = "" #Sibcoin (X11+Streebog)
    #"scrypt" = "" #Scrypt
    "scrypt-jane" = "" #Scrypt-jane Chacha
    "skein" = "" #Skein SHA2 (Skeincoin)
    "skein2" = "" #Double Skein (Woodcoin)
    "skunk" = "" #Skein Cube Fugue Streebog
    "s3" = "" #S3 (1Coin)
    "timetravel" = "" #Machinecoin permuted x8
    "tribus" = "" #Denarius
    #"vanilla" = "" #Blake256-8 (VNL)
    "veltor" = "" #Thorsriddle streebog
    "whirlcoin" = "" #Old Whirlcoin (Whirlpool algo)
    "whirlpool" = "" #Whirlpool algo
    "x11evo" = "" #Permuted x11 (Revolver)
    #"x11" = "" #X11 (DarkCoin)
    #"x13" = "" #X13 (MaruCoin)
    #"x14" = "" #X14
    #"x15" = "" #X15
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
        PrerequisitePath = "$env:SystemRoot\System32\msvcr120.dll"
        PrerequisiteURI = "http://download.microsoft.com/download/2/E/6/2E61CFA4-993B-4DD4-91DA-3737CD5CD6E3/vcredist_x64.exe"
    }
}
