//
//  WinnerViewController.m
//  BingoNightFinal
//
//  Created by Adam Schor on 10/21/16.
//  Copyright © 2016 AandA Development. All rights reserved.
//

#import "WinnerViewController.h"

@interface WinnerViewController ()
{AVAudioPlayer *avPlayer;
}


@end

@implementation WinnerViewController

- (void)viewDidLoad {
     [self.navigationController setNavigationBarHidden:YES];
    
    _keyForCoordinatesWinnerSounds = @"keyForCoordinatesWinnerSounds";
    _arrayCoordinatesWinnerSounds = [DefaultsDataManager getArrayForKey:_keyForCoordinatesWinnerSounds];
    _winnerSoundNumber = [_arrayCoordinatesWinnerSounds[_gameNumber-1] integerValue];
    
  
    
    [super viewDidLoad];
    // Do any additional setup after loading the view.
    
    [self displayWinnerLogo];
}

- (void)didReceiveMemoryWarning {
    [super didReceiveMemoryWarning];
    // Dispose of any resources that can be recreated.
}

-(void)viewDidDisappear:(BOOL)animated{
    [avPlayer stop];
}

-(void)displayWinnerLogo{
    
    switch (_winnerSoundNumber) {
        case 0:
            _winnerSound = @"applause";
            break;
        case 1:
            _winnerSound = @"computer";
            break;
        case 2:
            _winnerSound = @"lion";
            break;
        case 3:
            _winnerSound = @"rooster";
            break;
        case 4:
            _winnerSound = @"stadium";
            break;
        case 5:
            _winnerSound = @"tada";
            break;
    }
    
   
    
    
    
    NSString *songPath;
    
    songPath =[[NSBundle mainBundle]pathForResource:_winnerSound ofType:@"mp3"];
    NSURL *url = [NSURL fileURLWithPath:songPath];
    
    NSError *error;
    
    avPlayer= [[AVAudioPlayer alloc]initWithContentsOfURL:url error:&error];
    
    [avPlayer setNumberOfLoops:-1];
    [avPlayer setVolume:5];
    [avPlayer play];

    
    
    
    
    float width = [UIScreen mainScreen].bounds.size.width;
    float height = [UIScreen mainScreen].bounds.size.height;
    
    
    
    NSMutableArray *fireworkImages = [NSMutableArray array];
    
    for (int x=1; x<=20; x++) {
        NSString *imageName = [NSString stringWithFormat:@"fireworks%i",x];
        
        [fireworkImages addObject:[UIImage imageWithContentsOfFile:[[NSBundle mainBundle]pathForResource:imageName ofType:@"png"]]];
              }
    
    UIImageView *fireworks1 = [[UIImageView alloc] initWithFrame:CGRectMake(0, 0, width, height)];
    [self.view addSubview:fireworks1];
    
    fireworks1.animationImages = fireworkImages;
    fireworks1.animationDuration = 3;
    [fireworks1 startAnimating]; 
    
    
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
