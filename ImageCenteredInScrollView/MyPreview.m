//
//  MyPreview.m
//  ImageCenteredInScrollView

#import "MyPreview.h"

@implementation MyPreview

- (void)drawRect:(NSRect)dirtyRect
{
    NSRect bound = self.bounds;
    
    [[NSColor greenColor] setFill];
    NSRectFill(bound);

    if (_image) {
        NSPoint origin = NSMakePoint((bound.size.width - _image.size.width)/2,
                                     (bound.size.height - _image.size.height)/2);
        
        [_image drawInRect:(NSRect){origin, _image.size}];
    }
}

-(void)magnifyWithEvent:(NSEvent *)theEvent
{
    if ([[self superview] superview]) {
        id ssv = [[self superview] superview];
        if ([ssv isKindOfClass:[NSScrollView class]]) {
            NSScrollView *scrollView = (NSScrollView*)ssv;
            scrollView.magnification += theEvent.magnification;
        }
    }
}

-(void)setImage:(NSImage *)image
{
    if (_image == image)
        return;
    
    _image = image;

    if (_image) {
        [self setFrameSize:_image.size];
    }
}


@end
