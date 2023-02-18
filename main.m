//
//  main.m
//  objcTemplate
//
//  Created by vsquared.
//

#import <Cocoa/Cocoa.h>

@interface AppDelegate : NSObject <NSApplicationDelegate> {
NSWindow *window;
}
- (void) myBtnAction: (id)sender;
- (void) buildMenu;
- (void) buildWindow;
@end

@implementation AppDelegate

- (void) myBtnAction: (id)sender {
printf ("Hello!\n");
NSBeep();
}

- (void) buildMenu {
// **** Menu Bar **** //
NSMenu *menubar = [NSMenu new];
[NSApp setMainMenu:menubar];
// **** App Menu **** //
NSMenuItem *appMenuItem = [NSMenuItem new];
NSMenu *appMenu = [NSMenu new];
[appMenu addItemWithTitle: @"Quit" action:@selector(terminate:) keyEquivalent:@"q"];
[menubar setSubmenu:appMenu forItem:appMenuItem];
}

- (void) buildWindow {

#define _wndW  700
#define _wndH  550

window = [[NSWindow alloc] initWithContentRect: NSMakeRect( 0, 0, _wndW, _wndH )
styleMask: NSWindowStyleMaskTitled | NSWindowStyleMaskMiniaturizable | NSWindowStyleMaskClosable | NSWindowStyleMaskResizable
backing: NSBackingStoreBuffered defer: NO];

[window center];
[window setTitle: @"Test window"];
[window makeKeyAndOrderFront: nil];

// ****** Button ****** //
NSButton *myBtn =[[NSButton alloc]initWithFrame:NSMakeRect( 30, 30, 95, 30 )];
[myBtn setBezelStyle:NSBezelStyleRounded ];
[myBtn setTitle: @"Beep"];
[myBtn setAction: @selector (myBtnAction:)];
[[window contentView] addSubview: myBtn];

// ***** Quit btn ***** //
NSButton *quitBtn = [[NSButton alloc]initWithFrame:NSMakeRect( _wndW - 50, 5, 40, 40 )];
[quitBtn setBezelStyle:NSBezelStyleCircular ];
[quitBtn setTitle: @"Q" ];
[quitBtn setAutoresizingMask: NSViewMinXMargin];
[quitBtn setAction:@selector(terminate:)];
[[window contentView] addSubview: quitBtn];
}

- (void) applicationWillFinishLaunching: (NSNotification *)notification {
[self buildMenu];
[self buildWindow];
}

- (void) applicationDidFinishLaunching: (NSNotification *)notification {
}

@end

int main () {
NSApplication *application = [NSApplication sharedApplication];
AppDelegate *appDelegate = [[AppDelegate alloc] init];
[application setDelegate:appDelegate];
[application run];
return 0;
}

