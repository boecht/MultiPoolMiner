using module ..\Include.psm1

$Path = ".\Bin\NVIDIA-Nanashi\ccminer.exe"
$HashSHA256 = "1974bab01a30826497a76b79e227f3eb1c9eb9ffa6756c801fcd630122bdb5c7"
$URI = "https://github.com/Nanashi-Meiyo-Meijin/ccminer/releases/download/v2.2-mod-r2/2.2-mod-r2-CUDA9.binary.zip"

$Commands = [PSCustomObject]@{
    #GPU - profitable 20/04/2018
    "bastion" = "" #bastion
    "bitcore" = "" #Bitcore   <<< CcminerTpruvot
    "bmw" = "" #bmw
    "c11" = "" #C11
    "deep" = "" #deep
    "dmd-gr" = "" #dmd-gr
    "equihash" = "" #Equihash   <<< Dstm
    "fresh" = "" #fresh
    "fugue256" = "" #Fugue256
    "groestl" = "" #Groestl
    "heavy" = "" #heavy
    "hmq1725" = "" #HMQ1725
    "jha" = "" #JHA
    "keccak" = "" #Keccak
    "luffa" = "" #Luffa
    "lyra2" = "" #lyra2re
    #"lyra2v2" = "" #Lyra2RE2   <<< CcminerPolytimos < ExcavatorNvidia2 < CcminerCornzKeccakC < ExcavatorNvidia1 < CcminerXevan < CcminerAnxmodPhi < CcminerAlexis < CcminerNanashi < CcminerLyra2RE2 < CcminerSkunk < CcminerTpruvot < CcminerAllium < CcminerSuprMiner < CcminerNevermore < CcminerSib < CcminerKlaust < CcminerSp < CcminerLyra2z
    "lyra2z" = "" #Lyra2z, ZCoin
    "mjollnir" = "" #Mjollnir
    "neoscrypt" = "" #NeoScrypt   <<< PalginNvidia <<< ExcavatorNvidia1
    "penta" = "" #Pentablake
    "sha256t" = "" #sha256t   <<< no profit
    "skein" = "" #Skein
    "skein2" = "" #skein2
    "skunk" = "" #Skunk
    "s3" = "" #S3   <<< no profit (sha256t)
    "timetravel" = "" #Timetravel
    "tribus" = "" #Tribus
    "veltor" = "" #Veltor
    "whirlpool" = "" #Whirlpool
    "wildkeccak" = "" #wildkeccak
    "x11evo" = "" #X11evo
    "x17" = "" #x17   <<< CcminerZealot.ps1
    "zr5" = "" #zr5
    
    # ASIC - never profitable 27/03/2018
    #"blake" = "" #blake
    #"blakecoin" = "" #Blakecoin
    #"blake2s" = "" #Blake2s
    #"cryptolight" = "" #cryptolight
    #"cryptonight" = "" #CryptoNight
    #"decred" = "" #Decred
    #"lbry" = "" #Lbry
    #"myr-gr" = "" #MyriadGroestl
    #"nist5" = "" #Nist5
    #"quark" = "" #Quark
    #"qubit" = "" #Qubit
    #"scrypt" = "" #Scrypt
    #"sha256d" = "" #sha256d
    #"sia" = "" #SiaCoin
    #"sib" = "" #Sib
    #"vanilla" = "" #BlakeVanilla
    #"x11" = "" #X11
    #"x13" = "" #x13
    #"x14" = "" #x14
    #"x15" = "" #x15
    
    # MPM forgot these
    "jackpot" = "" #Jackpotcoin
    "scrypt-jane" = "" #Scrypt-jane Chacha
    "whirlcoin" = "" #Old Whirlcoin (Whirlpool algo)
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
