//
//  AnimatorModalSquare.h
//  Smart Record
//
//  Created by Patrik Vaberer on 4/4/15.
//  Copyright (c) 2015 Patrik Vaberer. All rights reserved.
//

#import <Foundation/Foundation.h>
#import <UIKit/UIKit.h>

@interface PVAnimator : NSObject<UIViewControllerAnimatedTransitioning>
- (instancetype)initWithShow:(BOOL)show;

@end
