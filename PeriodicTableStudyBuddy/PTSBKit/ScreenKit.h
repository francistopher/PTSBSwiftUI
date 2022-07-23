//
//  ScreenKit.h
//  PeriodicTableStudyBuddy
//
//  Created by Christopher Francisco on 7/22/22.
//
#import <Foundation/Foundation.h>
#import <UIKit/UIKit.h>

@interface ScreenKitObjC : NSObject


@property (nonatomic, assign) CGFloat height;
@property (nonatomic, assign) CGFloat width;

@property (nonatomic, assign) BOOL isLandscape;

+(id)sharedScreenKit;
-(CGFloat) getWidth:(CGFloat)factor;
-(CGFloat) getHeight:(CGFloat)factor;

@end
