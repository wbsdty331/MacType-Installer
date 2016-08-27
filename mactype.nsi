; MacType Installer
; Author: wbsdty331
Unicode true
LangString string1 1033 "MacType Install"
LangString string1 2052 "��ӭʹ�� MacType ��װ��"
LangString shortcut1 1033 "MacType Wizard"
LangString shortcut1 2052 "MacType �û���"
LangString shortcut2 1033 "MacType Configurator"
LangString shortcut2 2052 "MacType ���ó���"
LangString op1 1033 "MacType main application"
LangString op1 2052 "MacType ������"
LangString op2 1033 "Optional items"
LangString op2 2052 "������ѡ��"
LangString op3 1033 "Configuration template files"
LangString op3 2052 "����ģ���ļ�"
LangString op4 1033 "Visualized configurator"
LangString op4 2052 "ͼ�λ����ù���"
LangString op5 1033 "XMac configuration files"
LangString op5 2052 "XMac �����ļ�"
LangString un2 1033 "Uninstall MacType"
LangString un2 2052 "ж�� MacType"

LangString cfg1 1033 "Registry"
LangString cfg1 2052 "ע������"
LangString cfg2 1033 "Load with Windows Registry for the most seamless experiences. Any program will be fully renderred when starts.$\r$\nSystem reboot is required to enable or disable renderring."
LangString cfg2 2052 "ʹ�� Windows ע�����м��أ����Ի�����޷�����飬�κγ���������ʱ�Ϳ��Ի����ȫ�����Ż�Ч����$\r$\nͣ�ú�������Ҫ��������ϵͳ���ܽ��С�"
LangString cfg3 1033 "Run as service"
LangString cfg3 2052 "�������"
LangString cfg4 1033 "Run MacType as a service. Smooth loading. Neither GUI nor system icon will displays. As good as Registry mode.$\r$\nWindows Service Manager is required to enable or disable renderring for it lacks GUI settings."
LangString cfg4 2052 "�� MacType ��Ϊ�������У����м��ع��̱Ƚ�ƽ�����������κν����ϵͳͼ�꣬��ϵͳһ�廯Ч���Ϻá�$\r$\nͣ�ú����ö���Ҫʹ�� Windows �ķ�������������С�"
LangString cfg5 1033 "Manual"
LangString cfg5 2052 "��ʹ���Զ�����"
LangString cfg6 1033 "MacType will not run automatically, you could manually load Mactype into programs simply by drag them to MacType GUI."
LangString cfg6 2052 "MacType ���������������������Խ���Ҫ����ĳ����϶��� MacType.exe ���ֶ����ء�"




LangString REMOVEALL 1033 "Are you sure want to uninstall MacType?"
LangString REMOVEALL 2052 "��ȷ��Ҫж�� MacType ��"
LangString UNCOMPLATE 1033 "Uninstall successful."
LangString UNCOMPLATE 2052 "MacType ��ж�ء�"


LangString int1 1033 "MacType main application, required."
LangString int1 2052 "MacType �����򣬱��밲װ"
LangString int2 1033 "MacType configuration template files."
LangString int2 2052 "MacType ����ģ���ļ�"
LangString int3 1033 "A GUI configurator to tune MacType as you want."
LangString int3 2052 "һ�����ӻ����ù��ߣ�������Ľ� MacType ����������Ҫ������"
LangString int4 1033 "XMac configuration series provided by MaxChow"
LangString int4 2052 "�� MaxChow �ṩ�� XMac ϵ������"



!define PRODUCT_NAME "MacType"
!define PRODUCT_VERSION "2013.1231"
!define PRODUCT_PUBLISHER "FlyingSnow"
!define PRODUCT_WEB_SITE "http://www.mactype.tk"
!define PRODUCT_DIR_REGKEY "Software\Microsoft\Windows\CurrentVersion\App Paths\MacTray.exe"
!define PRODUCT_UNINST_KEY "Software\Microsoft\Windows\CurrentVersion\Uninstall\${PRODUCT_NAME}"
!define PRODUCT_UNINST_ROOT_KEY "HKLM"
!define MUI_WELCOMEFINISHPAGE_BITMAP "resources\logo.bmp" ; ������λͼ
!define MUI_WELCOMEPAGE_TITLE "$(string1)"
SetCompressor /SOLID lzma

; ------ MUI �ִ����涨�� (1.67 �汾���ϼ���) ------
!include "MUI2.nsh"
!include "x64.nsh"
!include "nsProcess.nsh"
!include LogicLib.nsh

; MUI Ԥ���峣��
!define MUI_ABORTWARNING
!define MUI_ICON "resources\Icon.ico"
!define MUI_UNICON "${NSISDIR}\Contrib\Graphics\Icons\orange-uninstall.ico"

; ����ѡ�񴰿ڳ�������
!define MUI_LANGDLL_REGISTRY_ROOT "${PRODUCT_UNINST_ROOT_KEY}"
!define MUI_LANGDLL_REGISTRY_KEY "${PRODUCT_UNINST_KEY}"


; ��ӭҳ��
!insertmacro MUI_PAGE_WELCOME
!insertmacro MUI_PAGE_COMPONENTS
Page Custom fnc_custom_Show

; ��װĿ¼ѡ��ҳ��
!insertmacro MUI_PAGE_DIRECTORY
; ��װ����ҳ��
!insertmacro MUI_PAGE_INSTFILES
; ��װ���ҳ��
!insertmacro MUI_PAGE_FINISH

; ��װж�ع���ҳ��
!insertmacro MUI_UNPAGE_INSTFILES

; ��װ�����������������
!insertmacro MUI_LANGUAGE "English"
!insertmacro MUI_LANGUAGE "SimpChinese"

; ��װԤ�ͷ��ļ�
ReserveFile /plugin "${NSISDIR}\Plugins\x86-unicode\LangDLL.dll"
ReserveFile /plugin "${NSISDIR}\Plugins\x86-unicode\InstallOptions.dll"
; ------ MUI �ִ����涨����� ------



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
Caption "MacType ��װ"
InstallDir "$PROGRAMFILES\MacType"
InstallDirRegKey HKLM "${PRODUCT_UNINST_KEY}" "UninstallString"
BrandingText "MacType"
ShowInstDetails hide ;��װ���̣�����Ĭ��Ϊshow��hide��ʾ����ʾ��װ��Ϣ�������ʾ��ť����ʾ��
ShowUnInstDetails hide ;ж�ع��̣�����Ĭ��Ϊshow��hide��ʾ����ʾ��װ��Ϣ�������ʾ��ť����ʾ��

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
 ;��⵽X64ϵͳ�Զ��ͷ� 64Bit MacType
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
  File "files\ini\LCD.W7.Ĭ������.��Mac.ini"
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
  File "files\ini\XMac\!XMac.�����ļ�˵��.txt"
  File "files\ini\XMac\1.��ȾЧ���Ա�CRT.png"
  File "files\ini\XMac\2.��ȾЧ���Ա�LCD.png"
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

#-- ���� NSIS �ű��༭�������� Function ���α�������� Section ����֮���д���Ա��ⰲװ�������δ��Ԥ֪�����⡣--#

; �����������
!insertmacro MUI_FUNCTION_DESCRIPTION_BEGIN
  !insertmacro MUI_DESCRIPTION_TEXT ${SEC01} $(int1)
  !insertmacro MUI_DESCRIPTION_TEXT ${SEC02} $(int2)
  !insertmacro MUI_DESCRIPTION_TEXT ${SEC03} $(int3)
  !insertmacro MUI_DESCRIPTION_TEXT ${SEC04} $(int4)
!insertmacro MUI_FUNCTION_DESCRIPTION_END

Function .onInit
 ${nsProcess::FindProcess} "MacTray.exe" $R0

 ${If} $R0 == 0
 Messagebox MB_ICONSTOP "MacType �������У���رպ��ٰ�װ��"
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
  !insertmacro MUI_HEADER_TEXT "���ط�ʽѡ��" "��ѡ���ʺ����� MacType ���ط�ʽ"

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
 *  �����ǰ�װ�����ж�ز���  *
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
  Delete "$INSTDIR\ini\XMac\2.��ȾЧ���Ա�LCD.png"
  Delete "$INSTDIR\ini\XMac\1.��ȾЧ���Ա�CRT.png"
  Delete "$INSTDIR\ini\XMac\!XMac.�����ļ�˵��.txt"
  Delete "$INSTDIR\MacTuner.exe"
  Delete "$INSTDIR\ini\win7.ini"
  Delete "$INSTDIR\ini\new.ini"
  Delete "$INSTDIR\ini\LCD.W7.Ĭ������.��Mac.ini"
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
  Delete "$DESKTOP\MacType �û���.lnk"
  Delete "$DESKTOP\MacType ���ó���.lnk"
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

#-- ���� NSIS �ű��༭�������� Function ���α�������� Section ����֮���д���Ա��ⰲװ�������δ��Ԥ֪�����⡣--#

  
Function un.onInit

!insertmacro MUI_UNGETLANGUAGE
 MessageBox MB_ICONQUESTION|MB_YESNO|MB_DEFBUTTON2 $(REMOVEALL)  IDYES +2
 Abort
FunctionEnd


Function un.onUninstSuccess
  MessageBox MB_ICONINFORMATION|MB_OK "$(UNCOMPLATE)"
FunctionEnd




