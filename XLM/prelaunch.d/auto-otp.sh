#!/usr/bin/env bash

OTPSECRET="InsertSecretHere"

{
sleep 7 &&
exec /home/deck/.steam/steam/compatibilitytools.d/XLM/xivlauncher-auto-otp $OTPSECRET
} &
