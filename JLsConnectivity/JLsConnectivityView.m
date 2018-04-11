//
//  JLsConnectivityView.m
//  JLsConnectivity
//
//  Created by Georg Duemlein on 2/04/18.
//  Copyright © 2018 Georg Duemlein. All rights reserved.
//

#import "JLsConnectivityView.h"

@implementation JLsConnectivityView

- (instancetype)initWithFrame:(NSRect)frame isPreview:(BOOL)isPreview
{
    self = [super initWithFrame:frame isPreview:isPreview];

    if (self) {
        [self setAnimationTimeInterval:1/30.0];
        
        float width = self.bounds.size.width / 16;
        float height  = self.bounds.size.height / 10;
        
        self.specks =  [NSMutableArray arrayWithCapacity:(16 * 10)];
        for (int row=0; row < 10; row++) {
            for(int col=0; col < 16; col++) {
                [self.specks addObject: [Speck speckWithLife:SSRandomIntBetween(10, 100) andX:(col * width) andY:(row * height)]];
            }
        }
        self.connections = [[NSBezierPath alloc] init];
        [self.connections setLineWidth:2.0];
    }
    return self;
}

- (void)startAnimation
{
    [super startAnimation];
}

- (void)stopAnimation
{
    [super stopAnimation];
}

- (void)drawRect:(NSRect)rect
{
    [super drawRect:rect];
}

- (void)animateOneFrame
{
    [[NSColor colorWithRed:0.1 green:0.1 blue:0.1 alpha:1] set];
    NSRect bounds = [self bounds];
    [[NSBezierPath bezierPathWithRect:bounds] fill];
   
    for (Speck *speck in self.specks) {
        [speck step];
    }

    for (int i = 0; i < [self.specks count]; i++) {
        Speck *source = self.specks[i];
        [self.connections removeAllPoints];
        source.size = 1;
        for (int j = 0; j < [self.specks count]; j++) {
            Speck *target = self.specks[j];

            float dist = pow((source.posX - target.posX), 2) + pow((source.posY - target.posY), 2);
            if ( dist > 8000) {
                continue;
            }
            source.size += 1;
            [self.connections moveToPoint:CGPointMake(source.posX, source.posY)];
            [self.connections lineToPoint:CGPointMake(target.posX, target.posY)];
       }
        [self.connections closePath];
        [[source.color colorWithAlphaComponent:0.3] set];
        CGFloat dash_pattern[]={3., 2.};
        [self.connections setLineDash:dash_pattern count:1 phase:1];
        [self.connections stroke];
    }
    for (Speck *speck in self.specks) {
        [speck draw];
    }
}

- (BOOL)hasConfigureSheet
{
    return NO;
}

- (NSWindow*)configureSheet
{
    return nil;
}

@end
