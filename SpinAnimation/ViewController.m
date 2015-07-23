//
//  ViewController.m
//  SpinAnimation
//
//  Created by Victor Zhu on 7/23/15.
//  Copyright (c) 2015 IQI Studio. All rights reserved.
//

#import "ViewController.h"

@interface ViewController ()

@property (nonatomic, weak) IBOutlet UILabel *label;

@end

@implementation ViewController

- (void)viewDidLoad
{
	[super viewDidLoad];
//	[self showSpinAnimation1];
	[self showSpinAnimation2];
}

- (void)showSpinAnimation1
{
	CABasicAnimation *rotationAnimation = [CABasicAnimation animationWithKeyPath:@"transform.rotation"];
	rotationAnimation.toValue = [NSNumber numberWithFloat: M_PI * 2];
	rotationAnimation.duration = 1;
	rotationAnimation.repeatCount = CGFLOAT_MAX;
	[self.label.layer addAnimation:rotationAnimation forKey:@"rotationAnimation"];
}

- (void)showSpinAnimation2
{
	[UIView animateWithDuration:1 delay:1 options:UIViewAnimationOptionCurveEaseInOut animations:^{
		[self.label setTransform:CGAffineTransformRotate(self.label.transform, M_PI)];
	} completion:^(BOOL finished) {
		if (finished) {
			[self showSpinAnimation2];
		}
	}];
}

@end
