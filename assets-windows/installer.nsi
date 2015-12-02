!include "MUI2.nsh"

Name "PrintSepeti"
BrandingText "printsepeti.com"

# set the icon
!define MUI_ICON "icon.ico"

# define the resulting installer's name:
OutFile "..\dist\printsepeti.exe"

# set the installation directory
InstallDir "$PROGRAMFILES\printsepeti\"

# app dialogs
!insertmacro MUI_PAGE_WELCOME
!insertmacro MUI_PAGE_INSTFILES

!define MUI_FINISHPAGE_RUN_TEXT "Start PrintSepeti"
!define MUI_FINISHPAGE_RUN "$INSTDIR\printsepeti.exe"

!insertmacro MUI_PAGE_FINISH
!insertmacro MUI_LANGUAGE "English"

# default section start
Section

  # delete the installed files
  RMDir /r $INSTDIR

  # define the path to which the installer should install
  SetOutPath $INSTDIR

  # specify the files to go in the output path
  File /r ..\build\printsepeti\win32\*

  # create the uninstaller
  WriteUninstaller "$INSTDIR\Uninstall PrintSepeti for Desktop.exe"

  # create shortcuts in the start menu and on the desktop
  CreateShortCut "$SMPROGRAMS\PrintSepeti.lnk" "$INSTDIR\printsepeti.exe"
  CreateShortCut "$SMPROGRAMS\Kaldır PrintSepeti.lnk" "$INSTDIR\uninstall_printsepeti.exe"
  CreateShortCut "$DESKTOP\PrintSepeti.lnk" "$INSTDIR\printsepeti.exe"

SectionEnd

# create a section to define what the uninstaller does
Section "Uninstall"

  # delete the installed files
  RMDir /r $INSTDIR

  # delete the shortcuts
  Delete "$SMPROGRAMS\PrintSepeti.lnk"
  Delete "$SMPROGRAMS\Kaldır PrintSepeti.lnk"
  Delete "$DESKTOP\PrintSepeti.lnk"

SectionEnd
