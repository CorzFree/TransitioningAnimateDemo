//
//  ViewController.m
//  UIViewControllerContextTransitioningDemo
//
//  Created by crw on 12/2/15.
//  Copyright © 2015 crw. All rights reserved.
//

#import "ViewController.h"
#import "TransitioningAnimate.h"
#import "TwoViewController.h"

@interface ViewController ()<UIViewControllerTransitioningDelegate,UINavigationControllerDelegate>

@property (nonatomic, strong) TransitioningAnimate     *animate;

@end

@implementation ViewController

- (void)viewDidLoad {
    [super viewDidLoad];
}

- (IBAction)push:(UIButton *)sender {
    TwoViewController *vc = [self.storyboard instantiateViewControllerWithIdentifier:@"TwoVc"];
    self.navigationController.delegate = self;
    [self.navigationController pushViewController:vc animated:YES];
}
- (IBAction)present:(UIButton *)sender {
    TwoViewController *vc = [self.storyboard instantiateViewControllerWithIdentifier:@"TwoVc"];
    vc.transitioningDelegate = self;
    [self presentViewController:vc animated:YES completion:nil];
}

//present
- (id <UIViewControllerAnimatedTransitioning>)animationControllerForPresentedController:(UIViewController *)presented presentingController:(UIViewController *)presenting sourceController:(UIViewController *)source{
    return self.animate;
}

//push
- (nullable id <UIViewControllerAnimatedTransitioning>)navigationController:(UINavigationController *)navigationController
                                            animationControllerForOperation:(UINavigationControllerOperation)operation
                                                         fromViewController:(UIViewController *)fromVC
                                                           toViewController:(UIViewController *)toVC{
    return self.animate;
}

- (TransitioningAnimate *)animate{
    if (!_animate) {
        _animate = ({
            [[TransitioningAnimate alloc] init];
        });
    }
    return _animate;
}


@end
