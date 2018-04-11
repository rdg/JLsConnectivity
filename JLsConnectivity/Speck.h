//
//  Speck.h
//  JLsConnectivity
//
//  Created by Georg Duemlein on 2/04/18.
//  Copyright © 2018 Georg Duemlein. All rights reserved.
//

#import <Foundation/Foundation.h>
#import <AppKit/Appkit.h>

@interface Speck : NSObject

@property (assign) float posX;
@property (assign) float posY;
@property (assign) float life;
@property (assign) float age;
@property (assign) int size;
@property (nonatomic, retain) NSMutableArray *colors;
@property (nonatomic, strong) NSColor *color;
@property (nonatomic, retain) NSBezierPath *shape;

+ (instancetype) speckWithLife:(float)life andX:(int)x andY:(int)y;
- (id) initWithLife:(float)life andX:(int)x andY:(int)y;

- (float) step;
- (void) draw;

@end
