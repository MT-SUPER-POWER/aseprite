#ifndef AppVersion
  #define AppVersion "1.3.18.6"
#endif

#ifndef SourceDir
  #define SourceDir "..\..\build\bin"
#endif

#ifndef OutputDir
  #define OutputDir "."
#endif

[Setup]
AppId={{D37D0BC3-A33F-4D2A-949B-C50D32B8B9B1}
AppName=Aseprite
AppVersion={#AppVersion}
AppVerName=Aseprite {#AppVersion}
AppPublisher=Igara Studio S.A.
AppPublisherURL=https://www.aseprite.org/
AppSupportURL=https://community.aseprite.org/
AppUpdatesURL=https://www.aseprite.org/
DefaultDirName={autopf}\Aseprite
DefaultGroupName=Aseprite
AllowNoIcons=yes
OutputDir={#OutputDir}
OutputBaseFilename=Aseprite-Windows-x64-Setup
SetupIconFile=..\..\data\icons\ase.ico
Compression=lzma2/ultra64
SolidCompression=yes
WizardStyle=modern
ArchitecturesInstallIn64BitMode=x64compatible
PrivilegesRequiredOverridesAllowed=dialog commandline
ChangesAssociations=yes
UninstallDisplayIcon={app}\ase.ico

[Languages]
Name: "chinesesimplified"; MessagesFile: "ChineseSimplified.isl"
Name: "english"; MessagesFile: "compiler:Default.isl"

[Tasks]
Name: "desktopicon"; Description: "{cm:CreateDesktopIcon}"; GroupDescription: "{cm:AdditionalIcons}"
Name: "associatefiles"; Description: "关联 .ase 与 .aseprite 文件 (Associate .ase & .aseprite files)"; GroupDescription: "文件关联 (File associations):"; Flags: checkedonce

[Files]
Source: "{#SourceDir}\aseprite.exe"; DestDir: "{app}"; Flags: ignoreversion
Source: "{#SourceDir}\data\*"; DestDir: "{app}\data"; Flags: ignoreversion recursesubdirs createallsubdirs
Source: "..\..\data\icons\ase.ico"; DestDir: "{app}"; Flags: ignoreversion
Source: "..\..\data\icons\doc.ico"; DestDir: "{app}"; Flags: ignoreversion

[Icons]
Name: "{autoprograms}\Aseprite"; Filename: "{app}\aseprite.exe"; IconFilename: "{app}\ase.ico"
Name: "{autodesktop}\Aseprite"; Filename: "{app}\aseprite.exe"; IconFilename: "{app}\ase.ico"; Tasks: desktopicon

[Registry]
; .ase association
Root: HKA; Subkey: "Software\Classes\.ase"; ValueType: string; ValueName: ""; ValueData: "AsepriteFile"; Flags: uninsdeletevalue; Tasks: associatefiles
Root: HKA; Subkey: "Software\Classes\.ase\OpenWithProgids"; ValueType: string; ValueName: "AsepriteFile"; ValueData: ""; Flags: uninsdeletevalue; Tasks: associatefiles
; .aseprite association
Root: HKA; Subkey: "Software\Classes\.aseprite"; ValueType: string; ValueName: ""; ValueData: "AsepriteFile"; Flags: uninsdeletevalue; Tasks: associatefiles
Root: HKA; Subkey: "Software\Classes\.aseprite\OpenWithProgids"; ValueType: string; ValueName: "AsepriteFile"; ValueData: ""; Flags: uninsdeletevalue; Tasks: associatefiles
; ProgID details
Root: HKA; Subkey: "Software\Classes\AsepriteFile"; ValueType: string; ValueName: ""; ValueData: "Aseprite Sprite"; Flags: uninsdeletekey; Tasks: associatefiles
Root: HKA; Subkey: "Software\Classes\AsepriteFile\DefaultIcon"; ValueType: string; ValueName: ""; ValueData: "{app}\doc.ico,0"; Flags: uninsdeletekey; Tasks: associatefiles
Root: HKA; Subkey: "Software\Classes\AsepriteFile\shell"; ValueType: string; ValueName: ""; ValueData: "open"; Flags: uninsdeletekey; Tasks: associatefiles
Root: HKA; Subkey: "Software\Classes\AsepriteFile\shell\open"; ValueType: string; ValueName: ""; ValueData: "&Open with Aseprite"; Flags: uninsdeletekey; Tasks: associatefiles
Root: HKA; Subkey: "Software\Classes\AsepriteFile\shell\open\command"; ValueType: string; ValueName: ""; ValueData: """{app}\aseprite.exe"" ""%1"""; Flags: uninsdeletekey; Tasks: associatefiles

[Run]
Filename: "{app}\aseprite.exe"; Description: "{cm:LaunchProgram,Aseprite}"; Flags: nowait postinstall skipifsilent
