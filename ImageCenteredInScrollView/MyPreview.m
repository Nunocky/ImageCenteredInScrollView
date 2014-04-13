//
//  MyPreview.m
//  ImageCenteredInScrollView

#import "MyPreview.h"

@implementation MyPreview

- (void)drawRect:(NSRect)dirtyRect
{
    [super drawRect:dirtyRect];
    
    NSRect bound;
    if ([self superview]) {
        bound = self.superview.bounds;
    }
    else {
        bound = self.bounds;
    }
    
    id ssv = [[self superview] superview];
    if (_image && ssv && [ssv isKindOfClass:[NSScrollView class]]) {
        NSScrollView *scrollView = (NSScrollView*)ssv;
        bound.size.width  = MAX(bound.size.width,  _image.size.width * scrollView.magnification);
        bound.size.height = MAX(bound.size.height, _image.size.height * scrollView.magnification);
    }
    
    [self setFrameSize:bound.size];
    
    [[NSColor greenColor] setFill];
    NSRectFill(bound);
     
    if (_image) {
        NSPoint origin = NSMakePoint((bound.size.width - _image.size.width)/2, (bound.size.height - _image.size.height)/2);
        
        [_image drawAtPoint:origin
                   fromRect:NSZeroRect
                  operation:NSCompositeSourceOver
                   fraction:1.0];
    }
}

-(void)magnifyWithEvent:(NSEvent *)event
{
    if ([[self superview] superview]) {
        id ssv = [[self superview] superview];
        if ([ssv isKindOfClass:[NSScrollView class]]) {
            NSScrollView *scrollView = (NSScrollView*)ssv;
            scrollView.magnification += event.magnification;
        }
    }
}

-(void)setImage:(NSImage *)image
{
    if (_image == image)
        return;
    
    _image = image;
    
    [self setFrameSize:_image.size]; // TODO :
}
@end
