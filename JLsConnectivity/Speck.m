//
//  Speck.m
//  JLsConnectivity
//
//  Created by Georg Duemlein on 2/04/18.
//  Copyright © 2018 Georg Duemlein. All rights reserved.
//

#import "Speck.h"

@implementation Speck

+ (instancetype) speckWithLife:(float)life andX:(int)x andY:(int)y
{
    Speck *item = [[Speck alloc] initWithLife:life andX:x andY:y];
    return item;
}

- (id) initWithLife:(float)life andX:(int)x andY:(int)y{
    self = [super init];
    if (self)
    {
        self.posX = x;
        self.posY = y;
        self.life = life;
        self.age = 0.0;
        self.size = 0;
        
        self.colors = [NSMutableArray arrayWithCapacity:(4)];
        [self.colors addObject:[NSColor blackColor]];
        [self.colors addObject:[NSColor whiteColor]];
        [self.colors addObject:[NSColor colorWithCalibratedRed:97.0 / 255.0
                                                         green:35.0 / 255.0
                                                          blue:159.0 / 255.0
                                                         alpha:1.0]];
        
        [self.colors addObject:[NSColor colorWithCalibratedRed:240.0 / 255.0
                                                         green:78.0 / 255.0
                                                          blue:152.0 / 255.0
                                                         alpha:1.0]];
        // Pick a random color
        self.color =  [self.colors objectAtIndex:arc4random_uniform([self.colors count])];
        // NSRect rect = NSMakeRect(self.posX, self.posY, 10, 10);
        self.shape = [[NSBezierPath alloc] init];
        [self.shape setLineWidth:5.0];
    }
    return self;
}

-(float) step
{
    ++self.age;
    if (self.age > self.life)
    {
        self.age = 0.0;
    }
    self.posX += (((float)arc4random() / UINT32_MAX) * 2 - 1) * 2;
    self.posY += (((float)arc4random() / UINT32_MAX) * 2 - 1) * 2;
    
    return self.age / self.life;
}

-(void) draw
{
    [self.shape removeAllPoints];
    
    float scale = (self.size) * 0.25;
    [[self.color colorWithAlphaComponent:1] set];
    [self.shape moveToPoint:CGPointMake(self.posX - 10 * scale, self.posY)];
    [self.shape lineToPoint:CGPointMake(self.posX + 10 * scale, self.posY)];
    [self.shape moveToPoint:CGPointMake(self.posX, self.posY - 10 * scale)];
    [self.shape lineToPoint:CGPointMake(self.posX, self.posY + 10 * scale)];
    [self.shape closePath];
    [self.shape stroke];
}

@end
