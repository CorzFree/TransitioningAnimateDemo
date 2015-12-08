//
//  TransitioningAnimate.m
//  UIViewControllerContextTransitioningDemo
//
//  Created by crw on 12/2/15.
//  Copyright © 2015 crw. All rights reserved.
//

#import "TransitioningAnimate.h"

@implementation TransitioningAnimate

- (NSTimeInterval)transitionDuration:(nullable id <UIViewControllerContextTransitioning>)transitionContext{
    return 2.0;
}

- (void)animateTransition:(id <UIViewControllerContextTransitioning>)transitionContext{
    UIViewController *toView = [transitionContext viewControllerForKey:UITransitionContextToViewControllerKey];
    
    UIViewController *fromView = [transitionContext viewControllerForKey:UITransitionContextFromViewControllerKey];
    
    CGRect rect = fromView.view.bounds;
    rect.origin.x -= rect.size.width;
    
    toView.view.frame = rect;
    
    [[transitionContext containerView] addSubview:toView.view];
    
    CGRect finalRect = [transitionContext finalFrameForViewController:toView];
    
    [UIView animateWithDuration:[self transitionDuration:transitionContext] delay:0.0 usingSpringWithDamping:0.6 initialSpringVelocity:0.5 options:UIViewAnimationOptionCurveLinear animations:^{
        toView.view.frame = finalRect;
    }completion:^(BOOL finished) {
        [transitionContext completeTransition:YES];
    }];
    
   
    
}

@end
