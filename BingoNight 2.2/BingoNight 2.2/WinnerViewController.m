//
//  WinnerViewController.m
//  BingoNightFinal
//
//  Created by Adam Schor on 10/21/16.
//  Copyright © 2016 AandA Development. All rights reserved.
//

#import "WinnerViewController.h"

@interface WinnerViewController ()

@end

@implementation WinnerViewController

- (void)viewDidLoad {
     [self.navigationController setNavigationBarHidden:YES];
    
    [super viewDidLoad];
    // Do any additional setup after loading the view.
    
    [self displayWinnerLogo];
}

- (void)didReceiveMemoryWarning {
    [super didReceiveMemoryWarning];
    // Dispose of any resources that can be recreated.
}

-(void)displayWinnerLogo{
    
    float width = [UIScreen mainScreen].bounds.size.width;
    float height = [UIScreen mainScreen].bounds.size.height;
    
    
   
    UILabel *winnerLabel = [[UILabel alloc] initWithFrame:CGRectMake(.1*width, .2*height, .8*width, .6*height)];
    
    winnerLabel.text = @"WINNER";
    winnerLabel.textColor = [UIColor redColor];
    winnerLabel.font = [UIFont fontWithName:@"BradleyHandITCTT-Bold"  size:.5*height];
    winnerLabel.adjustsFontSizeToFitWidth = YES;
    winnerLabel.textAlignment = NSTextAlignmentCenter;
    winnerLabel.backgroundColor = [UIColor clearColor];
    winnerLabel.layer.cornerRadius = 50;
    winnerLabel.clipsToBounds = YES;
    
    UIView *frame = [[UIView alloc] initWithFrame:CGRectMake(0, 0, width, height)];
    frame.backgroundColor = [UIColor yellowColor];
    frame.layer.borderWidth = 2;
    frame.layer.borderColor = [[UIColor blackColor] CGColor];
    
    
    [self.view addSubview:frame];
    
    [self.view sendSubviewToBack:frame];
    
    
    [self.view addSubview:winnerLabel];
    
    CABasicAnimation *colorAnimation = [CABasicAnimation animationWithKeyPath:@"backgroundColor"];
    UIColor *fromColor = [UIColor yellowColor];
    UIColor *toColor = [UIColor blackColor];
    
    colorAnimation.duration = .1;
    colorAnimation.fromValue = (id)fromColor.CGColor;
    colorAnimation.toValue = (id)toColor.CGColor;
    colorAnimation.repeatCount = HUGE_VALF;
    colorAnimation.autoreverses = YES;
    
    [frame.layer addAnimation:colorAnimation forKey:nil];

    
    
    
    
    
    [UIView animateWithDuration:2 delay:2 options:UIViewAnimationOptionTransitionNone animations:^{
        winnerLabel.alpha = 0;
    } completion:^(BOOL finished) {
        [self performSegueWithIdentifier:@"segueWinnerToStart" sender:self];
    }];
    
                            
    
    
    
}

@end
