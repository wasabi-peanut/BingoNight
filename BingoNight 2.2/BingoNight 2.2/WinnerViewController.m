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
    
    
   
    UILabel *winnerLabel = [[UILabel alloc] initWithFrame:CGRectMake(.2*width, .3*height, .6*width, .4*height)];
    
    winnerLabel.text = @"WINNER";
    winnerLabel.textColor = [UIColor redColor];
    winnerLabel.font = [UIFont fontWithName:@"Helvetica" size:125];
    winnerLabel.textAlignment = NSTextAlignmentCenter;
    winnerLabel.backgroundColor = [UIColor blueColor];
    winnerLabel.layer.cornerRadius = 50;
    winnerLabel.clipsToBounds = YES;
    
    UIView *frame = [[UIView alloc] initWithFrame:CGRectMake(0, 0, width, height)];
    frame.backgroundColor = [UIColor yellowColor];
    frame.layer.borderWidth = 2;
    frame.layer.borderColor = [[UIColor blackColor] CGColor];
    
    
    [self.view addSubview:frame];
    
    [self.view sendSubviewToBack:frame];
    
    
    [self.view addSubview:winnerLabel];
    
    
    [UIView animateWithDuration:5 delay:2 options:UIViewAnimationOptionTransitionNone animations:^{
        winnerLabel.alpha = 0;
    } completion:^(BOOL finished) {
        [self performSegueWithIdentifier:@"segueWinnerToStart" sender:self];
    }];
    
                            
    
    
    
}

@end
