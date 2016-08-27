; MacType Installer
; Author: wbsdty331
Unicode true
LangString string1 1033 "MacType Install"
LangString string1 2052 "欢迎使用 MacType 安装向导"
LangString shortcut1 1033 "MacType Wizard"
LangString shortcut1 2052 "MacType 用户向导"
LangString shortcut2 1033 "MacType Configurator"
LangString shortcut2 2052 "MacType 配置程序"
LangString op1 1033 "MacType main application"
LangString op1 2052 "MacType 主程序"
LangString op2 1033 "Optional items"
LangString op2 2052 "其他可选项"
LangString op3 1033 "Configuration template files"
LangString op3 2052 "配置模版文件"
LangString op4 1033 "Visualized configurator"
LangString op4 2052 "图形化配置工具"
LangString op5 1033 "XMac configuration files"
LangString op5 2052 "XMac 配置文件"
LangString un2 1033 "Uninstall MacType"
LangString un2 2052 "卸载 MacType"

LangString cfg1 1033 "Registry"
LangString cfg1 2052 "注册表加载"
LangString cfg2 1033 "Load with Windows Registry for the most seamless experiences. Any program will be fully renderred when starts.$\r$\nSystem reboot is required to enable or disable renderring."
LangString cfg2 2052 "使用 Windows 注册表进行加载，可以获得最无缝的体验，任何程序在启动时就可以获得完全文字优化效果。$\r$\n停用和启用需要重新启动系统才能进行。"
LangString cfg3 1033 "Run as service"
LangString cfg3 2052 "服务加载"
LangString cfg4 1033 "Run MacType as a service. Smooth loading. Neither GUI nor system icon will displays. As good as Registry mode.$\r$\nWindows Service Manager is required to enable or disable renderring for it lacks GUI settings."
LangString cfg4 2052 "将 MacType 作为服务运行，运行加载过程比较平滑，看不到任何界面和系统图标，和系统一体化效果较好。$\r$\n停用和启用都需要使用 Windows 的服务管理器来进行。"
LangString cfg5 1033 "Manual"
LangString cfg5 2052 "不使用自动加载"
LangString cfg6 1033 "MacType will not run automatically, you could manually load Mactype into programs simply by drag them to MacType GUI."
LangString cfg6 2052 "MacType 将不会自行启动，您可以将需要处理的程序拖动到 MacType.exe 上手动加载。"




LangString REMOVEALL 1033 "Are you sure want to uninstall MacType?"
LangString REMOVEALL 2052 "您确认要卸载 MacType 吗？"
LangString UNCOMPLATE 1033 "Uninstall successful."
LangString UNCOMPLATE 2052 "MacType 已卸载。"


LangString int1 1033 "MacType main application, required."
LangString int1 2052 "MacType 主程序，必须安装"
LangString int2 1033 "MacType configuration template files."
LangString int2 2052 "MacType 配置模版文件"
LangString int3 1033 "A GUI configurator to tune MacType as you want."
LangString int3 2052 "一个可视化配置工具，更方便的将 MacType 调整到您需要的样子"
LangString int4 1033 "XMac configuration series provided by MaxChow"
LangString int4 2052 "由 MaxChow 提供的 XMac 系列配置"



!define PRODUCT_NAME "MacType"
!define PRODUCT_VERSION "2013.1231"
!define PRODUCT_PUBLISHER "FlyingSnow"
!define PRODUCT_WEB_SITE "http://www.mactype.tk"
!define PRODUCT_DIR_REGKEY "Software\Microsoft\Windows\CurrentVersion\App Paths\MacTray.exe"
!define PRODUCT_UNINST_KEY "Software\Microsoft\Windows\CurrentVersion\Uninstall\${PRODUCT_NAME}"
!define PRODUCT_UNINST_ROOT_KEY "HKLM"
!define MUI_WELCOMEFINISHPAGE_BITMAP "resources\logo.bmp" ; 左侧标题位图
!define MUI_WELCOMEPAGE_TITLE "$(string1)"
SetCompressor /SOLID lzma

; ------ MUI 现代界面定义 (1.67 版本以上兼容) ------
!include "MUI2.nsh"
!include "x64.nsh"
!include "nsProcess.nsh"
!include LogicLib.nsh

; MUI 预定义常量
!define MUI_ABORTWARNING
!define MUI_ICON "resources\Icon.ico"
!define MUI_UNICON "${NSISDIR}\Contrib\Graphics\Icons\orange-uninstall.ico"

; 语言选择窗口常量设置
!define MUI_LANGDLL_REGISTRY_ROOT "${PRODUCT_UNINST_ROOT_KEY}"
!define MUI_LANGDLL_REGISTRY_KEY "${PRODUCT_UNINST_KEY}"


; 欢迎页面
!insertmacro MUI_PAGE_WELCOME
!insertmacro MUI_PAGE_COMPONENTS
Page Custom fnc_custom_Show

; 安装目录选择页面
!insertmacro MUI_PAGE_DIRECTORY
; 安装过程页面
!insertmacro MUI_PAGE_INSTFILES
; 安装完成页面
!insertmacro MUI_PAGE_FINISH

; 安装卸载过程页面
!insertmacro MUI_UNPAGE_INSTFILES

; 安装界面包含的语言设置
!insertmacro MUI_LANGUAGE "English"
!insertmacro MUI_LANGUAGE "SimpChinese"

; 安装预释放文件
ReserveFile /plugin "${NSISDIR}\Plugins\x86-unicode\LangDLL.dll"
ReserveFile /plugin "${NSISDIR}\Plugins\x86-unicode\InstallOptions.dll"
; ------ MUI 现代界面定义结束 ------



VIProductVersion "1.3.0.0"
VIAddVersionKey "ProductName" "MacType"
VIAddVersionKey "FileDescription" "MacType"
VIAddVersionKey  "LegalCopyright" "1"
VIAddVersionKey "Comments" "wbsdty331"
VIAddVersionKey "CompanyName" "wbsdty331"
VIAddVersionKey  "LegalTrademarks" "wbsdty331"
VIAddVersionKey  "FileVersion" "1.2013.1231.0"


Name "${PRODUCT_NAME} ${PRODUCT_VERSION}"
OutFile "MactypeSetup.exe"
Caption "MacType 安装"
InstallDir "$PROGRAMFILES\MacType"
InstallDirRegKey HKLM "${PRODUCT_UNINST_KEY}" "UninstallString"
BrandingText "MacType"
ShowInstDetails hide ;安装过程，该项默认为show，hide表示不显示安装信息，点击显示按钮后显示。
ShowUnInstDetails hide ;卸载过程，该项默认为show，hide表示不显示安装信息，点击显示按钮后显示。

RequestExecutionLevel admin

Section !$(op1) SEC01
SectionIn RO

  SetOutPath "$INSTDIR"
  SetOverwrite on
  CreateDirectory "$SMPROGRAMS\MacType"
  CreateShortCut "$smprograms\MacType\MacType Tray.lnk" "$INSTDIR\MacTray.exe" "" "" "" "" ""
  CreateShortCut "$SMPROGRAMS\MacType\$(shortcut1).lnk" "$INSTDIR\MacWiz.exe" "" "" "" "" ""
  CreateShortCut "$DESKTOP\$(shortcut1).lnk" "$INSTDIR\MacWiz.exe" "" "" "" "" ""
  SetOverwrite ifnewer
  File "files\MacType.ini"
  File "files\MacType.dll"
  File "files\MacTray.exe"
  File "files\MacLoader.exe"
  File "files\EasyHK32.dll"
  File "files\ChangeLog.txt"
  File "files\MacWiz.exe"
 ;检测到X64系统自动释放 64Bit MacType
  ${If} ${RunningX64}
    File "files\mt64agnt.exe"
    File "files\MacType64.dll"
    File "files\EasyHK64.dll"
  ${EndIf}
  SetOutPath "$INSTDIR\languages"
  File /r "files\languages\*.*"
SectionEnd


SubSection /e $(op2)  SEC0A
Section $(op3) SEC02
  SetOutPath "$INSTDIR\ini"
  SetOverwrite on
  File "files\ini\CRT.ini"
  File "files\ini\Default.ini"
  File "files\ini\iOS.ini"
  File "files\ini\LCD.ini"
  File "files\ini\LCD.W7.默认字体.仿Mac.ini"
  File "files\ini\new.ini"
  File "files\ini\win7.ini"
SectionEnd

Section  $(op4)  SEC03
  SetOutPath "$INSTDIR"
  File "files\MacTuner.exe"
  CreateShortCut "$DESKTOP\$(shortcut2).lnk" "$INSTDIR\MacTuner.exe" "" "" "" "" ""
  CreateShortCut "$SMPROGRAMS\MacType\$(shortcut2).lnk" "$INSTDIR\MacTuner.exe" "" "" "" "" ""
SectionEnd

Section  $(op5)  SEC04
  SetOutPath "$INSTDIR\ini\XMac"
  File "files\ini\XMac\!XMac.配置文件说明.txt"
  File "files\ini\XMac\1.渲染效果对比CRT.png"
  File "files\ini\XMac\2.渲染效果对比LCD.png"
  File "files\ini\XMac\XMac.CRT.Default.ini"
  File "files\ini\XMac\XMac.ico"
  File "files\ini\XMac\XMac.LCD.Default.ini"
  File "files\ini\XMac\XMac.LCD.HotShift@XHei(Android^Boldface^Ubuntu).ini"
  File "files\ini\XMac\XMac.LCD.HotShift@XHei(iOS^MacOS).ini"
  File "files\ini\XMac\XMac.LCD.HotShift@XHei.ini"
SectionEnd

SubSectionEnd
Section -AdditionalIcons
  CreateShortCut "$SMPROGRAMS\MacType\$(un2).lnk" "$INSTDIR\uninst.exe"
SectionEnd

Section -Post
  WriteUninstaller "$INSTDIR\uninst.exe"
  WriteRegStr HKLM "${PRODUCT_DIR_REGKEY}" "" "$INSTDIR\MacTray.exe"
  WriteRegStr ${PRODUCT_UNINST_ROOT_KEY} "${PRODUCT_UNINST_KEY}" "DisplayName" "$(^Name)"
  WriteRegStr ${PRODUCT_UNINST_ROOT_KEY} "${PRODUCT_UNINST_KEY}" "UninstallString" "$INSTDIR\uninst.exe"
  WriteRegStr ${PRODUCT_UNINST_ROOT_KEY} "${PRODUCT_UNINST_KEY}" "DisplayIcon" "$INSTDIR\MacTray.exe"
  WriteRegStr ${PRODUCT_UNINST_ROOT_KEY} "${PRODUCT_UNINST_KEY}" "DisplayVersion" "${PRODUCT_VERSION}"
  WriteRegStr ${PRODUCT_UNINST_ROOT_KEY} "${PRODUCT_UNINST_KEY}" "URLInfoAbout" "${PRODUCT_WEB_SITE}"
  WriteRegStr ${PRODUCT_UNINST_ROOT_KEY} "${PRODUCT_UNINST_KEY}" "Publisher" "${PRODUCT_PUBLISHER}"
SectionEnd

#-- 根据 NSIS 脚本编辑规则，所有 Function 区段必须放置在 Section 区段之后编写，以避免安装程序出现未可预知的问题。--#

; 区段组件描述
!insertmacro MUI_FUNCTION_DESCRIPTION_BEGIN
  !insertmacro MUI_DESCRIPTION_TEXT ${SEC01} $(int1)
  !insertmacro MUI_DESCRIPTION_TEXT ${SEC02} $(int2)
  !insertmacro MUI_DESCRIPTION_TEXT ${SEC03} $(int3)
  !insertmacro MUI_DESCRIPTION_TEXT ${SEC04} $(int4)
!insertmacro MUI_FUNCTION_DESCRIPTION_END

Function .onInit
 ${nsProcess::FindProcess} "MacTray.exe" $R0

 ${If} $R0 == 0
 Messagebox MB_ICONSTOP "MacType 正在运行，请关闭后再安装！"
 abort
  ${EndIf}
${nsProcess::Unload}

  !insertmacro MUI_LANGDLL_DISPLAY
FunctionEnd

; =========================================================
; This file was generated by NSISDialogDesigner 1.4.2.0
; http://coolsoft.altervista.org/nsisdialogdesigner
;
; Do not edit it manually, use NSISDialogDesigner instead!
; =========================================================

; handle variables
Var hCtl_custom
Var hCtl_custom_Label3
Var hCtl_custom_RadioButton3
Var hCtl_custom_Bitmap3
Var hCtl_custom_Bitmap3_hImage
Var hCtl_custom_Bitmap2
Var hCtl_custom_Bitmap2_hImage
Var hCtl_custom_Label2
Var hCtl_custom_RadioButton2
Var hCtl_custom_Label1
Var hCtl_custom_RadioButton1
Var hCtl_custom_Bitmap1
Var hCtl_custom_Bitmap1_hImage
Var hCtl_custom_Font1


; dialog create function
Function fnc_custom_Create

  ; custom font definitions
  CreateFont $hCtl_custom_Font1 "Microsoft YaHei" "9" "400"

  ; === custom (type: Dialog) ===
  nsDialogs::Create 1018
  Pop $hCtl_custom
  ${If} $hCtl_custom == error
    Abort
  ${EndIf}
  SendMessage $hCtl_custom ${WM_SETFONT} $hCtl_custom_Font1 0
  !insertmacro MUI_HEADER_TEXT "加载方式选择" "请选择适合您的 MacType 加载方式"

  ; === Label3 (type: Label) ===
  ${NSD_CreateLabel} 46.75u 116u 242.55u 25.33u $(cfg6)
  Pop $hCtl_custom_Label3
  SendMessage $hCtl_custom_Label3 ${WM_SETFONT} $hCtl_custom_Font1 0
  SetCtlColors $hCtl_custom_Label3 0x808080 0xF0F0F0

  ; === RadioButton3 (type: RadioButton) ===
  ${NSD_CreateRadioButton} 36.59u 102u 110.44u 12u $(cfg5)
  Pop $hCtl_custom_RadioButton3
  ${NSD_AddStyle} $hCtl_custom_RadioButton3 ${WS_GROUP}
  SendMessage $hCtl_custom_RadioButton3 ${WM_SETFONT} $hCtl_custom_Font1 0

  ; === Bitmap3 (type: Bitmap) ===
  ${NSD_CreateBitmap} 9.49u 102u 21.68u 21.33u ""
  Pop $hCtl_custom_Bitmap3
  SendMessage $hCtl_custom_Bitmap3 ${WM_SETFONT} $hCtl_custom_Font1 0
  File "/oname=$PLUGINSDIR\notload.bmp" "resources\notload.bmp"
  ${NSD_SetImage} $hCtl_custom_Bitmap3 "$PLUGINSDIR\notload.bmp" $hCtl_custom_Bitmap3_hImage

  ; === Bitmap2 (type: Bitmap) ===
  ${NSD_CreateBitmap} 9.49u 51.33u 21.68u 21.33u ""
  Pop $hCtl_custom_Bitmap2
  SendMessage $hCtl_custom_Bitmap2 ${WM_SETFONT} $hCtl_custom_Font1 0
  File "/oname=$PLUGINSDIR\service.bmp" "resources\service.bmp"
  ${NSD_SetImage} $hCtl_custom_Bitmap2 "$PLUGINSDIR\service.bmp" $hCtl_custom_Bitmap2_hImage

  ; === Label2 (type: Label) ===
  ${NSD_CreateLabel} 46.75u 65.33u 242.55u 34.67u $(cfg4)
  Pop $hCtl_custom_Label2
  SendMessage $hCtl_custom_Label2 ${WM_SETFONT} $hCtl_custom_Font1 0
  SetCtlColors $hCtl_custom_Label2 0x808080 0xF0F0F0

  ; === RadioButton2 (type: RadioButton) ===
  ${NSD_CreateRadioButton} 36.59u 51.33u 110.44u 12u $(cfg3)
  Pop $hCtl_custom_RadioButton2
  SendMessage $hCtl_custom_RadioButton2 ${WM_SETFONT} $hCtl_custom_Font1 0

  ; === Label1 (type: Label) ===
  ${NSD_CreateLabel} 46.75u 13.33u 242.55u 34.67u $(cfg2)
  Pop $hCtl_custom_Label1
  SendMessage $hCtl_custom_Label1 ${WM_SETFONT} $hCtl_custom_Font1 0
  SetCtlColors $hCtl_custom_Label1 0x808080 0xF0F0F0

  ; === RadioButton1 (type: RadioButton) ===
  ${NSD_CreateRadioButton} 36.59u 0.67u 110.44u 12u $(cfg1)
  Pop $hCtl_custom_RadioButton1
  SendMessage $hCtl_custom_RadioButton1 ${WM_SETFONT} $hCtl_custom_Font1 0

  ; === Bitmap1 (type: Bitmap) ===
  ${NSD_CreateBitmap} 9.49u 0.67u 21.68u 21.33u ""
  Pop $hCtl_custom_Bitmap1
  SendMessage $hCtl_custom_Bitmap1 ${WM_SETFONT} $hCtl_custom_Font1 0
  File "/oname=$PLUGINSDIR\registry.bmp" "resources\registry.bmp"
  ${NSD_SetImage} $hCtl_custom_Bitmap1 "$PLUGINSDIR\registry.bmp" $hCtl_custom_Bitmap1_hImage

FunctionEnd

; dialog show function
Function fnc_custom_Show
  Call fnc_custom_Create
  nsDialogs::Show
FunctionEnd











/******************************
 *  以下是安装程序的卸载部分  *
 ******************************/

Section Uninstall


  Delete "$INSTDIR\uninst.exe"
  Delete "$INSTDIR\EasyHK64.dll"
  Delete "$INSTDIR\MacType64.dll"
  Delete "$INSTDIR\mt64agnt.exe"
  Delete "$INSTDIR\ini\XMac\XMac.LCD.HotShift@XHei.ini"
  Delete "$INSTDIR\ini\XMac\XMac.LCD.HotShift@XHei(iOS^MacOS).ini"
  Delete "$INSTDIR\ini\XMac\XMac.LCD.HotShift@XHei(Android^Boldface^Ubuntu).ini"
  Delete "$INSTDIR\ini\XMac\XMac.LCD.Default.ini"
  Delete "$INSTDIR\ini\XMac\XMac.ico"
  Delete "$INSTDIR\ini\XMac\XMac.CRT.Default.ini"
  Delete "$INSTDIR\ini\XMac\2.渲染效果对比LCD.png"
  Delete "$INSTDIR\ini\XMac\1.渲染效果对比CRT.png"
  Delete "$INSTDIR\ini\XMac\!XMac.配置文件说明.txt"
  Delete "$INSTDIR\MacTuner.exe"
  Delete "$INSTDIR\ini\win7.ini"
  Delete "$INSTDIR\ini\new.ini"
  Delete "$INSTDIR\ini\LCD.W7.默认字体.仿Mac.ini"
  Delete "$INSTDIR\ini\LCD.ini"
  Delete "$INSTDIR\ini\iOS.ini"
  Delete "$INSTDIR\ini\Default.ini"
  Delete "$INSTDIR\ini\CRT.ini"
  Delete "$INSTDIR\MacWiz.exe"
  Delete "$INSTDIR\ChangeLog.txt"
  Delete "$INSTDIR\EasyHK32.dll"
  Delete "$INSTDIR\MacLoader.exe"
  Delete "$INSTDIR\MacTray.exe"
  Delete "$INSTDIR\MacType.dll"
  Delete "$INSTDIR\MacType.ini"
  Delete "$INSTDIR\languages\*.*"
  Delete "$SMPROGRAMS\MacType\*.lnk"
  Delete "$DESKTOP\MacType 用户向导.lnk"
  Delete "$DESKTOP\MacType 配置程序.lnk"
  Delete "$DESKTOP\MacType Wizard.lnk"
  Delete "$DESKTOP\MacType Configurator.lnk"
  RMDir "$SMPROGRAMS\MacType"

  RMDir "$INSTDIR"
  
  WriteRegStr   HKLM "SOFTWARE\Microsoft\Windows NT\CurrentVersion\Windows" "AppInit_DLLs" "MacType64.dll"
 	WriteRegDWORD HKLM "SOFTWARE\Microsoft\Windows NT\CurrentVersion\Windows" "LoadAppInit_DLLs" 0x00000000
  DeleteRegKey ${PRODUCT_UNINST_ROOT_KEY} "${PRODUCT_UNINST_KEY}"
  DeleteRegKey HKLM "${PRODUCT_DIR_REGKEY}"
  SetAutoClose false
SectionEnd

#-- 根据 NSIS 脚本编辑规则，所有 Function 区段必须放置在 Section 区段之后编写，以避免安装程序出现未可预知的问题。--#

  
Function un.onInit

!insertmacro MUI_UNGETLANGUAGE
 MessageBox MB_ICONQUESTION|MB_YESNO|MB_DEFBUTTON2 $(REMOVEALL)  IDYES +2
 Abort
FunctionEnd


Function un.onUninstSuccess
  MessageBox MB_ICONINFORMATION|MB_OK "$(UNCOMPLATE)"
FunctionEnd




