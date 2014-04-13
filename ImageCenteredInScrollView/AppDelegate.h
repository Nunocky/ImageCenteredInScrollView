//
//  AppDelegate.h
//  ImageCenteredInScrollView

#import <Cocoa/Cocoa.h>
@class MyPreview;

@interface AppDelegate : NSObject <NSApplicationDelegate>

@property (assign) IBOutlet NSWindow *window;
@property (weak) IBOutlet NSScrollView *scrollView;
@property (weak) IBOutlet MyPreview *preview;

@end
