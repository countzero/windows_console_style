# Stop on any errors.
$ErrorActionPreference = 'Stop'

# Terminate with a non-zero exit code on any errors.
trap {
    write-output $_
    exit 1
}

#
# Unzip all files within the zip directory "Meslo LG DZ v1.2.1" directly into ".\fonts".
#

function Unzip-File([String] $file, [String] $destination) {

    $shell = New-Object -ComObject Shell.Application
    $zip = $shell.NameSpace($file)
    ForEach ($item in $zip.items()) {

        $shell.NameSpace($destination).CopyHere($item, 0x14)
    }
}

$zipFile = Join-Path $pwd "vendor\Meslo-Font\dist\v1.2.1\Meslo LG DZ v1.2.1.zip\Meslo LG DZ v1.2.1"
$fontsDirectory = Join-Path $pwd "fonts"

Write-Host "Extracting ${zipFile} to ${fontsDirectory}..."
Unzip-File -File "${zipFile}" -Destination "${fontsDirectory}"


#
# Install the extracted fonts by copying them into the special fonts folder.
#
# @see https://technet.microsoft.com/en-us/library/ee176604.aspx
#

$shell = New-Object -ComObject Shell.Application
$specialFontsFolder = $Shell.Namespace(0x14)

$fontFiles = Get-ChildItem -Path "./fonts/*" -Include "*.ttf"

ForEach ($fontFile in $fontFiles) {

    $fontFileName = $fontFile.Name
    $targetPath = Join-Path $specialFontsFolder.Self.Path $fontFile.Name

    if (Test-Path $targetPath) {

        Write-Host "Font ${fontFileName} already installed, moving on..."

    } else {

        Write-Host "Installing ${$fontFile.Name} to ${targetPath}..."
        $specialFontsFolder.CopyHere($fontFile.FullName)
    }
}

# Exit with a zero exit code.
exit 0
