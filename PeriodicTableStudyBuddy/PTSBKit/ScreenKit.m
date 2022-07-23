//
//  ScreenKit.m
//  PeriodicTableStudyBuddy
//
//  Created by Christopher Francisco on 7/21/22.
//

#import "ScreenKit.h"

@interface ScreenKitObjC()
    -(void) setWidth;
    -(void) setHeight;
@end

@implementation ScreenKitObjC

-(id)init {
    self.isLandscape = true;
    [self setWidth];
    [self setHeight];
    return self;
}

+(id)sharedScreenKit {
    static ScreenKitObjC *sharedScreenKit = nil;
    @synchronized (self) {
        if (sharedScreenKit == nil) {
            sharedScreenKit = [[self alloc] init];
        }
    }
    return sharedScreenKit;
}

-(CGFloat)getHeight:(CGFloat)factor {
    if (_isLandscape) {
        return _height * factor;
    } else {
        return _width * factor;
    }
}

-(CGFloat)getWidth:(CGFloat)factor {
    if (_isLandscape) {
        return _width * factor;
    } else {
        return _height * factor;
    }
}

-(CGFloat)getWidth {
    return 1;
}

-(void)setWidth {
    self.width = [UIScreen mainScreen].bounds.size.width;
    NSLog(@"f=%@", @(self.width));
}

-(void)setHeight {
    self.height = [UIScreen mainScreen].bounds.size.height;
    NSLog(@"f=%@", @(self.height));
}

@end

