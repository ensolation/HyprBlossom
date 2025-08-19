// ==WindhawkMod==
// @name            Remove Window Border
// @id              remove-window-border
// @description     Removes the 1 pixel window border around windows
// @version         1.0.0
// @author          ItsProfessional
// @github          https://github.com/ItsProfessional
// @include         dwm.exe
// ==/WindhawkMod==

// Source code is published under The GNU General Public License v3.0.

// ==WindhawkModReadme==
/*
# Remove Window Border
This mod removes the 1 pixel window border around windows.

Before: https://i.imgur.com/pooVb5O.png
After: https://i.imgur.com/mJ5gol2.png
*/
// ==/WindhawkModReadme==

#include <Windows.h>
#include <D3D9Types.h>
#include <windhawk_api.h>
#include <windhawk_utils.h>

#ifdef _WIN64
#define THISCALL  __cdecl
#define STHISCALL L"__cdecl"
#else
#define THISCALL  __thiscall
#define STHISCALL L"__thiscall"
#endif

_D3DCOLORVALUE g_colorValue = { 0.0f, 0.0f, 0.0f, 0.0f };

typedef _D3DCOLORVALUE* (THISCALL *GetRoundedBorderColor_t)(void*, _D3DCOLORVALUE*);
GetRoundedBorderColor_t GetRoundedBorderColor_orig;
_D3DCOLORVALUE* THISCALL GetRoundedBorderColor_hook(void *pThis, _D3DCOLORVALUE *colorValue)
{
    return &g_colorValue;
}

BOOL Wh_ModInit(void)
{
    Wh_Log(L">");

    HMODULE huDWM = GetModuleHandle(L"uDWM.dll");
    if (!huDWM)
    {
        Wh_Log(L"Failed to load uDWM.dll");
        return FALSE;
    }

    WindhawkUtils::SYMBOL_HOOK hook = {
        {
            L"private: struct _D3DCOLORVALUE " STHISCALL " CTopLevelWindow::GetRoundedBorderColor(void)"
        },
        &GetRoundedBorderColor_orig,
        GetRoundedBorderColor_hook,
        false
    };

    if (!WindhawkUtils::HookSymbols(huDWM, &hook, 1))
    {
        Wh_Log(L"Failed to hook one or more functions");
        return FALSE;
    }

    return TRUE;
}

void Wh_ModUninit() {
    Wh_Log(L">");
}
