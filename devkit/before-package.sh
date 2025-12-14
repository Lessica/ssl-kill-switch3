#!/bin/bash

set -e

if [ "$THEOS_PACKAGE_SCHEME" = "rootless" ]; then
    /usr/libexec/PlistBuddy -c 'Set :items:0:footerText "SSL Kill Switch 3 (rootless)"' "$THEOS_STAGING_DIR/Library/PreferenceBundles/SSLKillSwitchPrefs.bundle/Root.plist"
fi

if [ "$THEOS_PACKAGE_SCHEME" = "roothide" ]; then
    /usr/libexec/PlistBuddy -c 'Set :items:0:footerText "SSL Kill Switch 3 (roothide)"' "$THEOS_STAGING_DIR/Library/PreferenceBundles/SSLKillSwitchPrefs.bundle/Root.plist"
fi

if [ "$FISHHOOK" = "1" ]; then
    /usr/libexec/PlistBuddy -c 'Set :items:0:footerText "SSL Kill Switch 3 (fishhook)"' "$THEOS_STAGING_DIR/Library/PreferenceBundles/SSLKillSwitchPrefs.bundle/Root.plist"
fi
