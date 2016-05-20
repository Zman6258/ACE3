#include "script_component.hpp"

// Exit on Headless
if (!hasInterface) exitWith {};

["SettingsInitialized", {
    if ([[QUOTE(ADDON), QGVAR(enable)], ["acex_sitting", "acex_sitting_enable"], "3.8.0"] call EFUNC(common,deprecateComponent)) exitwith {};
    //If not enabled, then do not add CanInteractWith Condition or event handlers:
    if (!GVAR(enable)) exitWith {};

    // Add interaction menu exception
    ["isNotSitting", {isNil {(_this select 0) getVariable QGVAR(isSitting)}}] call EFUNC(common,addCanInteractWithCondition);

    // Handle interruptions
    ["medical_onUnconscious", {_this call DFUNC(handleInterrupt)}] call EFUNC(common,addEventhandler);
    ["SetHandcuffed", {_this call DFUNC(handleInterrupt)}] call EFUNC(common,addEventhandler);
}] call EFUNC(common,addEventHandler);
