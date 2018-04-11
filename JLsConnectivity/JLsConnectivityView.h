//
//  JLsConnectivityView.h
//  JLsConnectivity
//
//  Created by Georg Duemlein on 2/04/18.
//  Copyright © 2018 Georg Duemlein. All rights reserved.
//

#import <ScreenSaver/ScreenSaver.h>
#import <Speck.h>

@interface JLsConnectivityView : ScreenSaverView

@property (nonatomic, strong) NSMutableArray *specks;
@property (nonatomic, retain) NSBezierPath *connections;

@end
