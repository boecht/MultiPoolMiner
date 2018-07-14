using module ..\Include.psm1

$Path = ".\Bin\NVIDIA-KlausT\ccminer.exe"
$HashSHA256 = "0345D2D274404F166C0927FC64683A6C86C2D0940E1518C6808244D6EFBB7F22"
$Uri = "https://github.com/nemosminer/ccminerKlausT-r11-fix/releases/download/r11-fix/ccminerKlausTr11.7z"

$Commands = [PSCustomObject]@{
    #GPU - profitable 20/04/2018
    "c11"           = "" #C11   <<< CcminerLyra2RE2 < CcminerNanashi < CcminerSkunk < CcminerLyra2z < CcminerTpruvot < CcminerKlaust < CcminerNevermore < CcminerSuprMiner < CcminerSp < CcminerSib < CcminerAlexis
    "deep"          = "" #deep
    "dmd-gr"        = "" #dmd-gr
    "fresh"         = "" #fresh
    "fugue256"      = "" #Fugue256
    #"groestl"      = "" #Groestl   --- PROFIT <<< CcminerNanashi < CcminerNevermore < CcminerLyra2RE2 < CcminerTpruvot < CcminerAllium < CcminerLyra2z < CcminerSuprMiner < CcminerSkunk < CcminerSp < CcminerKlaust
    "jackpot"       = "" #Jackpot
    "keccak"        = "" #Keccak   <<< CcminerPolytimos < CcminerSkunk < CcminerNanashi < CcminerLyra2RE2 < CcminerLyra2z < CcminerSib < CcminerSuprMiner < CcminerAllium < CcminerSp < CcminerNevermore < CcminerAnxmodPhi < CcminerTpruvot < CcminerAlexis < CcminerKlaust < CcminerXevan < CcminerCornzKeccakC < ExcavatorNvidia1 < ExcavatorNvidia2
    "luffa"         = "" #Luffa
    "lyra2v2"       = "" #Lyra2RE2   <<< CcminerPolytimos < ExcavatorNvidia2 < CcminerCornzKeccakC < ExcavatorNvidia1 < CcminerXevan < CcminerAnxmodPhi < CcminerAlexis < CcminerNanashi < CcminerLyra2RE2 < CcminerSkunk < CcminerTpruvot < CcminerAllium < CcminerSuprMiner < CcminerNevermore < CcminerSib < CcminerKlaust < CcminerSp < CcminerLyra2z
    "neoscrypt"     = "" #NeoScrypt   <<< CcminerSp < CcminerLyra2RE2 < CcminerSuprMiner < CcminerSib < NsgminerNvidia < CcminerLyra2z < CcminerKlaust < CcminerTpruvot < CcminerAllium < CcminerNevermore < CcminerSkunk < CcminerNanashi < JustAMinerNeoScrypt < ExcavatorNvidia1
    "penta"         = "" #Pentablake
    "skein"         = "" #Skein   <<< CcminerNevermore < CcminerLyra2RE2 < CcminerAllium < CcminerSuprMiner < CcminerSkunk < CcminerLyra2z < CcminerNanashi < CcminerSib < CcminerAlexis < CcminerKlaust < CcminerSp < CcminerXevan < CcminerPolytimos < CcminerCornzKeccakC < CcminerAnxmodPhi
    #"s3"           = "" #S3 (SHA256t=S3)   <<< CcminerNanashi < CcminerSkunk < CcminerSp < CcminerKlaust < CcminerLyra2RE2 < CcminerSuprMiner < CcminerNevermore < CcminerLyra2z < CcminerTpruvot < CcminerAllium
    "whirlpool"     = "whirl" #Whirlpool
    "whirlpoolx"    = "" #whirlpoolx
    "X17"           = "" #X17 Verge  <<< CcminerKlaust < CcminerLyra2RE2 < CcminerLyra2z < CcminerNanashi < CcminerSp < CcminerSuprMiner < CcminerSkunk < CcminerAllium < CcminerNevermore < CcminerAlexis < CcminerZealot
    "yescrypt"      = "" #yescrypt
    "yescryptR8"    = ""
    "yescryptR16"   = "" #YescryptR16 #Yenten
    "yescryptR16v2" = "" #PPN

    # ASIC - never profitable 20/04/2018
    #"blake"      = "" #blake
    #"blakecoin"  = "" #Blakecoin
    #"blake2s"    = "" #Blake2s
    #"myr-gr"     = "" #MyriadGroestl
    #"nist5"      = "" #Nist5
    #"quark"      = "" #Quark
    #"qubit"      = "" #Qubit
    #"vanilla"    = "" #BlakeVanilla
    #"sha256d"    = "" #sha256d
    #"sia"        = "" #SiaCoin
    #"x11"        = "" #X11
    #"x13"        = "" #x13
    #"x14"        = "" #x14
    #"x15"        = "" #x15
}

$Name = Get-Item $MyInvocation.MyCommand.Path | Select-Object -ExpandProperty BaseName

# Miner requires CUDA 9.2
$DriverVersion = (Get-Device | Where-Object Type -EQ "GPU" | Where-Object Vendor -EQ "NVIDIA Corporation").OpenCL.Platform.Version -replace ".*CUDA ",""
$RequiredVersion = "9.2.00"
if ($DriverVersion -and $DriverVersion -lt $RequiredVersion) {
    Write-Log -Level Warn "Miner ($($Name)) requires CUDA version $($RequiredVersion) or above (installed version is $($DriverVersion)). Please update your Nvidia drivers. "
    return
}

$Commands | Get-Member -MemberType NoteProperty | Select-Object -ExpandProperty Name | Where-Object {$Pools.(Get-Algorithm $_).Protocol -eq "stratum+tcp" <#temp fix#>} | ForEach-Object {

    $Algorithm_Norm = Get-Algorithm $_

    [PSCustomObject]@{
        Type       = "NVIDIA"
        Path       = $Path
        HashSHA256 = $HashSHA256
        Arguments  = "-a $_ -b 4068 -o $($Pools.$Algorithm_Norm.Protocol)://$($Pools.$Algorithm_Norm.Host):$($Pools.$Algorithm_Norm.Port) -u $($Pools.$Algorithm_Norm.User) -p $($Pools.$Algorithm_Norm.Pass)$($Commands.$_)"
        HashRates  = [PSCustomObject]@{$Algorithm_Norm = $Stats."$($Name)_$($Algorithm_Norm)_HashRate".Week}
        API        = "Ccminer"
        Port       = 4068
        URI        = $Uri
    }
}
