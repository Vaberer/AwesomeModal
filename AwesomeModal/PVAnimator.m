//
//  AnimatorModalSquare.m
//  Smart Record
//
//  Created by Patrik Vaberer on 4/4/15.
//  Copyright (c) 2015 Patrik Vaberer. All rights reserved.
//

#import "PVAnimator.h"
#import "EditItemVC.h"
@interface PVAnimator()
@property BOOL show;

@end
@implementation PVAnimator


- (instancetype)initWithShow:(BOOL)show {
    
    self = [super init];
    if (self) {
        self.show = show;
    }
    return self;
    
    
}

- (NSTimeInterval)transitionDuration:(id <UIViewControllerContextTransitioning>)transitionContext
{
    return 1;
}

- (void)animateTransition:(id<UIViewControllerContextTransitioning>)transitionContext
{
    
    
    
    
    UIView *containerView = [transitionContext containerView];
    
    
    UIView *view;
    UIView *vView;
    UIButton *bDismiss;
    if (self.show) {
        
        EditItemVC* toViewController   = (EditItemVC *)[transitionContext viewControllerForKey:UITransitionContextToViewControllerKey];
        
        
        
        vView = toViewController.vView;
        bDismiss = toViewController.bDismiss;
        view = toViewController.view;
        CGRect beforeAnimationView = vView.frame;
        CGRect beforeAnimationDismiss = bDismiss.frame;
        
        [vView setFrame:CGRectMake(vView.frame.origin.x, vView.frame.origin.y - 300, vView.frame.size.width, vView.frame.size.height)];
        [bDismiss setFrame:CGRectMake(bDismiss.frame.origin.x, bDismiss.frame.origin.y - 300, bDismiss.frame.size.width, bDismiss.frame.size.height)];
      
        
        //[containerView insertSubview:toViewController.view belowSubview:fromViewController.view];
        [containerView  addSubview:toViewController.view];
        view.alpha = 0;

        
        [UIView animateWithDuration:[self transitionDuration:transitionContext] delay:0.0 usingSpringWithDamping:0.6 initialSpringVelocity:0.9 options:0 animations:^{
            
            
           
                view.alpha = 1;
                [vView setFrame:beforeAnimationView];
                [bDismiss setFrame:beforeAnimationDismiss];
                
            
            
        } completion:^(BOOL finished) {
            
            [transitionContext completeTransition:![transitionContext transitionWasCancelled]];
        }];
    } else {
        
        
        UIViewController* toViewController   = [transitionContext viewControllerForKey:UITransitionContextFromViewControllerKey];

        
            
            EditItemVC * fromViewController   = (EditItemVC *)[transitionContext viewControllerForKey:UITransitionContextFromViewControllerKey];
            vView = fromViewController.vView;
            bDismiss = fromViewController.bDismiss;
            view = fromViewController.view;
            [containerView insertSubview:toViewController.view belowSubview:fromViewController.view];


        

        
        
        CGRect endPos =  vView.frame;
        endPos.origin.y = -endPos.size.height - 20;
        

        CGRect endPosForDismis = bDismiss.frame;
        endPosForDismis.origin.y = -endPos.size.height - 20;
        
        


        [UIView animateWithDuration:[self transitionDuration:transitionContext] animations:^{
           
            vView.frame = endPos;
            bDismiss.frame = endPosForDismis;
  
        } completion:^(BOOL finished) {
            [UIView animateWithDuration:.5 animations:^{
                view.alpha = 0;
            } completion:^(BOOL finished) {
                [transitionContext completeTransition:![transitionContext transitionWasCancelled]];

            }];

        }];
    }
    
    
    
    
    

}
@end
