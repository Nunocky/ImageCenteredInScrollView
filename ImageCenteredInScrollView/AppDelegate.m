//
//  AppDelegate.m
//  ImageCenteredInScrollView

#import "AppDelegate.h"
#import "MyPreview.h"

@implementation AppDelegate

- (void)applicationDidFinishLaunching:(NSNotification *)aNotification
{
    // Insert code here to initialize your application
    self.preview.image = [NSImage imageNamed:@"mata-ri"];
}

-(IBAction)performMagnification:(id)sender
{
    NSInteger idx = [sender selectedColumn];
    CGFloat mag = (idx == 0)? -0.1 : 0.1;
    self.scrollView.magnification += mag;
    [self.scrollView.documentView setNeedsDisplay:YES];
}
@end
