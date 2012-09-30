
#include "ofxHotKeys.h"

#ifdef TARGET_OSX

#include <Cocoa/Cocoa.h>

bool ofGetModifierSelection(){
	return ofGetModifierShiftPressed() || ofGetModifierSpecialPressed();
}

bool ofGetModifierShortcutKeyPressed(){
#ifdef MAC_USE_CONTROL
//		cout << "using command" << endl;
	return ofGetModifierControlPressed();
#else
//		cout << "using control" << endl;
	return ofGetModifierSpecialPressed();
#endif
}

bool ofGetModifierPressed(ofxModifierKey mod) {
	unsigned int t = 0;

	if ((OF_MODIFIER_KEY_CTRL & mod) == OF_MODIFIER_KEY_CTRL)
		t += NSControlKeyMask;
	
	if ((OF_MODIFIER_KEY_ALT & mod) == OF_MODIFIER_KEY_ALT)
		t += NSAlternateKeyMask;
	
	if ((OF_MODIFIER_KEY_SHIFT & mod) == OF_MODIFIER_KEY_SHIFT)
		t += NSShiftKeyMask;

	if ((OF_MODIFIER_KEY_SPECIAL & mod) == OF_MODIFIER_KEY_SPECIAL)
		t += NSCommandKeyMask;

	return [[NSApp currentEvent] modifierFlags] & t;
}



#endif