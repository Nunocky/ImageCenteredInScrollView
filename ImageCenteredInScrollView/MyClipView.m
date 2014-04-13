//
//  MyClipView.m
//  ImageCenteredInScrollView
//
//  Created by 布川祐人 on 2014/04/13.
//  Copyright (c) 2014年 NUNOKAWA Masato. All rights reserved.
//

#import "MyClipView.h"

@implementation MyClipView

- (void)drawRect:(NSRect)dirtyRect
{
    NSRect bound = self.bounds;
    
    [[NSColor greenColor] setFill];
    NSRectFill(bound);
}

- (BOOL)isFlipped
{
    return YES;
}

- (NSRect)constrainBoundsRect:(NSRect)proposedBounds
{
    NSRect documentBounds = [[self documentView] bounds];
    NSPoint delta         = NSMakePoint(NSWidth(documentBounds)  - NSWidth(proposedBounds),
                                        NSHeight(documentBounds) - NSHeight(proposedBounds));
    
    CGFloat x = (delta.x < 0) ? (delta.x / 2) : MAX(0, MIN(proposedBounds.origin.x, delta.x));
    CGFloat y = (delta.y < 0) ? (delta.y / 2) : MAX(0, MIN(proposedBounds.origin.y, delta.y));
    proposedBounds.origin = NSMakePoint(floor(x), floor(y));
    
    return proposedBounds;
}
@end
