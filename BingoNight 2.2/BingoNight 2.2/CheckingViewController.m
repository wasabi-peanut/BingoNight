//
//  CheckingViewController.m
//  Bingo Night 3.0
//
//  Created by Adam Schor on 9/11/15.
//  Copyright (c) 2015 AandA Development. All rights reserved.
//

#import "CheckingViewController.h"
#import "DefaultsDataManager.h"
#import "checkingPatterns.h"



@interface CheckingViewController ()

@end

@implementation CheckingViewController


- (BOOL)prefersStatusBarHidden{
    return YES;
}


- (void)viewDidLoad {
    
    _height = [UIScreen mainScreen].bounds.size.height;
    _width = [UIScreen mainScreen].bounds.size.width;
    
    _keyForCalledNumbers = @"keyForCalledNumbers";
    
   _arrayCalledNumbers = [DefaultsDataManager getDataForKey:_keyForCalledNumbers];
    
  //FOR TESTING
    _arrayCalledNumbers = [[NSMutableArray alloc] init];
    for (int z=1; z<=75; z++) {
        [_arrayCalledNumbers addObject:@(z)];
        
    }
    //END TESTING
    
    
    _arrayCalledNumbersSorted = [_arrayCalledNumbers sortedArrayUsingSelector:@selector(compare:)];
    
    self.view.backgroundColor = [UIColor blueColor];
   
  
    

    [self setUpMenuBar];
    
    [self AnimationSelector];
    
    
    
    [super viewDidLoad];
    
    
    
    
    // Do any additional setup after loading the view.
}

-(void)viewDidAppear:(BOOL)animated{
    //[self.navigationController popToViewController:[self.navigationController.viewControllers objectAtIndex:1] animated:YES];
    [self createCalledDisplay];
    
}

- (void)didReceiveMemoryWarning {
    [super didReceiveMemoryWarning];
    // Dispose of any resources that can be recreated.
}

-(void)createCalledDisplay{
    
    
   
    
    float ballSize = (_height-50)/25;
    _textViewCalledNumbers = [[UITextView alloc] init];
    
    
    if (_arrayCalledNumbersSorted.count>0) {
        _widthOfCalledDisplay = ballSize*1;
    }
    
    if (_arrayCalledNumbersSorted.count>25) {
        _widthOfCalledDisplay = ballSize*2;
    }
    if (_arrayCalledNumbersSorted.count>50) {
        _widthOfCalledDisplay = ballSize*3;
    }

    _textViewCalledNumbers.frame =CGRectMake(0, 0, _widthOfCalledDisplay, _height);
    
    _textViewCalledNumbers.backgroundColor = [UIColor lightGrayColor];
    _textViewCalledNumbers.font = [UIFont fontWithName:@"Helvetica" size:28];
    _textViewCalledNumbers.textColor = [UIColor blueColor];
    _textViewCalledNumbers.layer.borderColor = [[UIColor blackColor] CGColor];
    _textViewCalledNumbers.layer.borderWidth = 2;
    _textViewCalledNumbers.textAlignment = NSTextAlignmentCenter;

     [self.view addSubview:_textViewCalledNumbers];
    
    UILabel *calledNumber = [[UILabel alloc] init];
    
    for (int i=0; i<_arrayCalledNumbersSorted.count; i++) {
       
        if (i>=0) {
           calledNumber = [[UILabel alloc] initWithFrame: CGRectMake(0,i*ballSize+50, ballSize, ballSize)];
            }
        if (i>=25) {
            calledNumber = [[UILabel alloc] initWithFrame:CGRectMake(ballSize,(i-25)*ballSize+50, ballSize, ballSize)];
        }
        if (i>=50) {
            calledNumber = [[UILabel alloc] initWithFrame:CGRectMake(2*ballSize,(i-50)*ballSize+50, ballSize, ballSize)];
        }
        
        if (i%2) {
            calledNumber.backgroundColor = [UIColor yellowColor];
        }
        else{
        calledNumber.backgroundColor = [UIColor whiteColor];
        }
        
        calledNumber.textColor = [UIColor blackColor];
        calledNumber.text= [NSString stringWithFormat:@"%@",[_arrayCalledNumbersSorted objectAtIndex:i]];
        calledNumber.textAlignment = NSTextAlignmentCenter;
        calledNumber.layer.cornerRadius = ballSize/2;
        calledNumber.clipsToBounds = YES;
        calledNumber.font = [UIFont fontWithName:@"Helvetica" size:ballSize/2];
        
        
        [self.view addSubview:calledNumber];
        [self.view bringSubviewToFront:calledNumber];
    }
    
 
    
}

-(void)setUpMenuBar{
    UIBarButtonItem *winner = [[UIBarButtonItem alloc] initWithTitle:@"Winner" style:UIBarButtonItemStylePlain target:self action:@selector(winnerBtn)];
    UIBarButtonItem *flexSpace = [[UIBarButtonItem alloc] initWithBarButtonSystemItem:UIBarButtonSystemItemFlexibleSpace target:self action:nil];
    
    NSArray *menuChecking = @[ flexSpace, winner,flexSpace];
    
    self.navigationItem.rightBarButtonItems = menuChecking;
    
    

    
    
}

    -(void)winnerBtn{
        UIBarButtonItem *confirmWinner = [[UIBarButtonItem alloc] initWithTitle:@"Confirm Winner" style:UIBarButtonItemStylePlain target:self action:@selector(confirmWinner)];
        UIBarButtonItem *flexSpace = [[UIBarButtonItem alloc] initWithBarButtonSystemItem:UIBarButtonSystemItemFlexibleSpace target:self action:nil];
        
        NSArray *confirm = @[confirmWinner,flexSpace];
        
        
        
        self.navigationItem.rightBarButtonItems = confirm;
        
        
    }

-(void)confirmWinner{
    
    
    
    [self performSegueWithIdentifier:@"segueCheckingToWinner" sender:self];
    
    
    

}

-(void)AnimationSelector {
    
     int checkingNumber = +arc4random_uniform(7)+1;
    checkingNumber = 1;
    
    
    switch (checkingNumber) {
        
        case 1:
            [self checkingAnimation1];
            break;
        case 2:
            [self checkingAnimation2];
            break;
        case 3:
            [self checkingAnimation3];
            break;
        case 4:
            [self checkingAnimation4];
            break;
        case 5:
            [self checkingAnimation5];
            break;
        case 6:
            [self checkingAnimation6];
            break;
        case 7:
            [self checkingAnimation7];
            break;

        default:
            
            break;
    }
    
    
    
    
    
    
    
}

-(void)checkingAnimation1  {
    
    CGFloat navHeight = self.navigationController.navigationBar.frame.size.height;
    
   checkingPatterns *myView = [checkingPatterns frameWithPattern:1 frameX:_widthOfCalledDisplay frameY:navHeight width:_width-_widthOfCalledDisplay height:_height-navHeight];
    [self.view addSubview:myView];
    [myView runAnimation];
}


-(void)checkingAnimation2 {
    
    CABasicAnimation *shake = [CABasicAnimation animationWithKeyPath:@"transform.translation.y"];
 
    shake.toValue = [NSNumber numberWithFloat:10];
    shake.autoreverses = YES;
    shake.duration = 0.1;
    shake.repeatCount = HUGE_VALF;

    
    for (int c= 0; c<9; c++) {
    
        UILabel *letter = [[UILabel alloc]init];
        letter.font = [UIFont fontWithName:@"Courier" size:100];
        letter.textAlignment = NSTextAlignmentCenter;
        float letterWidth = _width/10;
        if (c%2) {
            letter.frame = CGRectMake(letterWidth+letterWidth*c, _height/2, 200, 200);
        }
        else{
            letter.frame = CGRectMake(letterWidth+letterWidth*c, _height/2+50, 200, 200);

        }
        
        letter.layer.cornerRadius = 100;
        letter.clipsToBounds = YES;
        
        switch (c) {
            case 0:
                letter.text = @"C";
                letter.backgroundColor = [UIColor whiteColor];
                break;
            case 1:
                letter.text = @"H";
                letter.backgroundColor = [UIColor redColor];
                break;
            case 2:
                letter.text = @"E";
                letter.backgroundColor = [UIColor greenColor];
                break;
            case 3:
                letter.text = @"C";
                letter.backgroundColor = [UIColor orangeColor];
                break;
            case 4:
                letter.text = @"K";
                letter.backgroundColor = [UIColor magentaColor];
                break;
            case 5:
                letter.text = @"I";
                letter.backgroundColor = [UIColor cyanColor];
                break;
            case 6:
                letter.text = @"N";
                letter.backgroundColor = [UIColor brownColor];
                break;
            case 7:
                letter.text = @"G";
                letter.backgroundColor = [UIColor lightGrayColor];
                break;
            case 8:
                letter.text = @"HOLD CARDS";
                letter.backgroundColor = [UIColor grayColor];
                letter.textColor = [UIColor redColor];
                letter.font = [UIFont fontWithName:@"Courier" size:90];
                letter.frame = CGRectMake(_width/2-350, 75, 700, 200);
                letter.textAlignment = NSTextAlignmentCenter;
                letter.numberOfLines = 0;
                
                

                break;

            default:
                break;
        }
        
        
        
        [self.view addSubview:letter];
        
        [letter.layer addAnimation:shake forKey:nil];
        [self.view sendSubviewToBack:letter];

        
        
        
    }
    
}

-(void)checkingAnimation3{
    
    CABasicAnimation *moveUpAndDown = [CABasicAnimation animationWithKeyPath:@"transform.translation.y" ];
    [moveUpAndDown setFromValue:[NSNumber numberWithFloat:0]];
    [moveUpAndDown setByValue:[NSNumber numberWithFloat:_height-350]];
    [moveUpAndDown setBeginTime:CACurrentMediaTime() ];
    [moveUpAndDown setDuration:2];
    moveUpAndDown.removedOnCompletion = NO;
    moveUpAndDown.autoreverses = YES;
    moveUpAndDown.fillMode = kCAFillModeForwards;
    moveUpAndDown.repeatCount =HUGE_VALF;
    
    UILabel *labelBackground = [[UILabel alloc] initWithFrame:CGRectMake(75, 0, _width-75, _height)];
    labelBackground.text = @"Hold Cards";
    labelBackground.font = [UIFont fontWithName:@"Helvetica" size:300];
    labelBackground.numberOfLines = 0;
    labelBackground.textColor = [UIColor yellowColor];
    labelBackground.textAlignment = NSTextAlignmentCenter;
    
    float letterWidth = _width/10;
    
    
    [self.view addSubview: labelBackground];

    
    
    for (int c= 0; c<8; c++) {
        
        UILabel *letter = [[UILabel alloc]init];
        letter.font = [UIFont fontWithName:@"Courier" size:100];
        letter.textAlignment = NSTextAlignmentCenter;
        if (c%2) {
            letter.frame = CGRectMake(letterWidth+letterWidth*c, 150, 200, 200);
                    }
        else{
            letter.frame = CGRectMake(letterWidth+letterWidth*c, 50, 200, 200);
            
        }
        
        letter.layer.cornerRadius = 100;
        letter.clipsToBounds = YES;
        
        switch (c) {
            case 0:
                letter.text = @"C";
                letter.backgroundColor = [UIColor whiteColor];
                break;
            case 1:
                letter.text = @"H";
                letter.backgroundColor = [UIColor redColor];
                break;
            case 2:
                letter.text = @"E";
                letter.backgroundColor = [UIColor greenColor];
                break;
            case 3:
                letter.text = @"C";
                letter.backgroundColor = [UIColor orangeColor];
                break;
            case 4:
                letter.text = @"K";
                letter.backgroundColor = [UIColor magentaColor];
                break;
            case 5:
                letter.text = @"I";
                letter.backgroundColor = [UIColor cyanColor];
                break;
            case 6:
                letter.text = @"N";
                letter.backgroundColor = [UIColor brownColor];
                break;
            case 7:
                letter.text = @"G";
                letter.backgroundColor = [UIColor lightGrayColor];
                break;
                
            default:
                break;
        }
        
        
        
        [self.view addSubview:letter];
        
        [letter.layer addAnimation:moveUpAndDown forKey:nil];
        
        
        
        
    }

    
}

-(void)checkingAnimation4{
    
    UILabel *labelBackground = [[UILabel alloc] initWithFrame:CGRectMake(75, 0, _width-75, _height)];
    labelBackground.text = @"Hold Cards";
    labelBackground.font = [UIFont fontWithName:@"Helvetica" size:300];
    labelBackground.numberOfLines = 0;
    labelBackground.textColor = [UIColor yellowColor];
    labelBackground.textAlignment = NSTextAlignmentCenter;
    
    
    
    
    [self.view addSubview: labelBackground];

    CABasicAnimation *moveDown = [CABasicAnimation animationWithKeyPath:@"transform.translation.y" ];
    [moveDown setFromValue:[NSNumber numberWithFloat:0]];
    [moveDown setByValue:[NSNumber numberWithFloat:_height-200]];
    [moveDown setBeginTime:CACurrentMediaTime()];
    [moveDown setDuration:2];
    moveDown.removedOnCompletion = NO;
    moveDown.autoreverses = YES;
    moveDown.fillMode = kCAFillModeForwards;
    moveDown.repeatCount =HUGE_VALF;
 
    float letterWidth = _width/10;
    
    for (int c= 0; c<8; c++) {
        
        UILabel *letter = [[UILabel alloc]init];
        letter.font = [UIFont fontWithName:@"Courier" size:100];
        letter.textAlignment = NSTextAlignmentCenter;
        letter.frame = CGRectMake(letterWidth+letterWidth*c,0, 200, 200);
        letter.layer.cornerRadius = 100;
        letter.clipsToBounds = YES;
        
        switch (c) {
            case 0:
                letter.text = @"C";
                letter.backgroundColor = [UIColor whiteColor];
                [moveDown setBeginTime:CACurrentMediaTime()+c];
                [letter.layer addAnimation:moveDown forKey:nil];
                
                break;
            case 1:
                letter.text = @"H";
                letter.backgroundColor = [UIColor redColor];
                [moveDown setBeginTime:CACurrentMediaTime()+c];
                [letter.layer addAnimation:moveDown forKey:nil];
                break;
            case 2:
                letter.text = @"E";
                letter.backgroundColor = [UIColor greenColor];
                [moveDown setBeginTime:CACurrentMediaTime()+c];
                [letter.layer addAnimation:moveDown forKey:nil];

                break;
            case 3:
                letter.text = @"C";
                letter.backgroundColor = [UIColor orangeColor];
                [moveDown setBeginTime:CACurrentMediaTime()+c];
                [letter.layer addAnimation:moveDown forKey:nil];

                break;
            case 4:
                letter.text = @"K";
                letter.backgroundColor = [UIColor magentaColor];
                [moveDown setBeginTime:CACurrentMediaTime()+c];
                [letter.layer addAnimation:moveDown forKey:nil];

                break;
            case 5:
                letter.text = @"I";
                letter.backgroundColor = [UIColor cyanColor];
                [moveDown setBeginTime:CACurrentMediaTime()+c];
                [letter.layer addAnimation:moveDown forKey:nil];

                break;
            case 6:
                letter.text = @"N";
                letter.backgroundColor = [UIColor brownColor];
                [moveDown setBeginTime:CACurrentMediaTime()+c];
                [letter.layer addAnimation:moveDown forKey:nil];


                break;
            case 7:
                letter.text = @"G";
                letter.backgroundColor = [UIColor lightGrayColor];
                [moveDown setBeginTime:CACurrentMediaTime()+c];
                [letter.layer addAnimation:moveDown forKey:nil];

                break;
                
            default:
                break;
        }
        
        [self.view addSubview:letter];
        
        
    }
    
    
}
-(void)checkingAnimation5{
    
    UILabel *labelBackground = [[UILabel alloc] initWithFrame:CGRectMake(75, 0, _width-75, _height)];
    labelBackground.text = @"Hold Cards";
    labelBackground.font = [UIFont fontWithName:@"Helvetica" size:300];
    labelBackground.numberOfLines = 0;
    labelBackground.textColor = [UIColor redColor];
    labelBackground.textAlignment = NSTextAlignmentCenter;
   
    [self.view addSubview: labelBackground];

    CABasicAnimation *colorAnimation = [CABasicAnimation animationWithKeyPath:@"backgroundColor"];
    UIColor *fromColor = [UIColor yellowColor];
    UIColor *toColor = [UIColor blueColor];
    
    colorAnimation.duration = 3;
    colorAnimation.fromValue = (id)fromColor.CGColor;
    colorAnimation.toValue = (id)toColor.CGColor;
    colorAnimation.repeatCount = HUGE_VALF;
    colorAnimation.autoreverses = YES;

    [self.view.layer addAnimation:colorAnimation forKey:nil];
    
    
    
 
        
    
    
  /*  CABasicAnimation *moveHorizontal = [CABasicAnimation animationWithKeyPath:@"transform.translation.x" ];
    [moveHorizontal setFromValue:[NSNumber numberWithFloat:0]];
    [moveHorizontal setByValue:[NSNumber numberWithFloat:_width-275]];
    [moveHorizontal setBeginTime:CACurrentMediaTime()];
    [moveHorizontal setDuration:2];
    moveHorizontal.removedOnCompletion = NO;
    moveHorizontal.autoreverses = YES;
    moveHorizontal.fillMode = kCAFillModeForwards;
    moveHorizontal.repeatCount =HUGE_VALF;
    
    
    
    for (int c= 0; c<5; c++) {
        
        UILabel *letter = [[UILabel alloc]init];
        letter.font = [UIFont fontWithName:@"Courier" size:200];
        letter.textAlignment = NSTextAlignmentCenter;
        letter.frame = CGRectMake(75,100+100*c, 200, 200);
        letter.layer.cornerRadius = 100;
        letter.clipsToBounds = YES;
        
        switch (c) {
            case 0:
                letter.text = @"B";
                letter.backgroundColor = [UIColor whiteColor];
                [moveHorizontal setBeginTime:CACurrentMediaTime()+c];
                [letter.layer addAnimation:moveHorizontal forKey:nil];
                
                break;
            case 1:
                letter.text = @"I";
                letter.backgroundColor = [UIColor redColor];
                [moveHorizontal setBeginTime:CACurrentMediaTime()+c];
                [letter.layer addAnimation:moveHorizontal forKey:nil];
                break;
            case 2:
                letter.text = @"N";
                letter.backgroundColor = [UIColor greenColor];
                [moveHorizontal setBeginTime:CACurrentMediaTime()+c];
                [letter.layer addAnimation:moveHorizontal forKey:nil];
                
                break;
            case 3:
                letter.text = @"G";
                letter.backgroundColor = [UIColor orangeColor];
                [moveHorizontal setBeginTime:CACurrentMediaTime()+c];
                [letter.layer addAnimation:moveHorizontal forKey:nil];
                
                break;
            case 4:
                letter.text = @"O";
                letter.backgroundColor = [UIColor magentaColor];
                [moveHorizontal setBeginTime:CACurrentMediaTime()+c];
                [letter.layer addAnimation:moveHorizontal forKey:nil];
                
                break;
                */
                /*
            case 5:
                letter.text = @"I";
                letter.backgroundColor = [UIColor cyanColor];
                [moveHorizontal setBeginTime:CACurrentMediaTime()+c];
                [letter.layer addAnimation:moveHorizontal forKey:nil];
                
                break;
            case 6:
                letter.text = @"N";
                letter.backgroundColor = [UIColor brownColor];
                [moveHorizontal setBeginTime:CACurrentMediaTime()+c];
                [letter.layer addAnimation:moveHorizontal forKey:nil];
                
                
                break;
            case 7:
                letter.text = @"G";
                letter.backgroundColor = [UIColor lightGrayColor];
                [moveHorizontal setBeginTime:CACurrentMediaTime()+c];
                [letter.layer addAnimation:moveHorizontal forKey:nil];
                
                break;
                 */
                
        /*    default:
                break;
        }
        
        [self.view addSubview:letter];
        
        
    }*/
    
}

-(void)checkingAnimation6 {
    UILabel *checkingTopLabel = [[UILabel alloc] initWithFrame:CGRectMake(100, 0, _width-100, _height/2)];
    checkingTopLabel.text = @"Checking";
    checkingTopLabel.font = [UIFont fontWithName:@"Courier" size:100];
    // spinLabel.backgroundColor = [UIColor yellowColor];
    checkingTopLabel.textAlignment = NSTextAlignmentCenter;
    checkingTopLabel.layer.cornerRadius = 25;
    checkingTopLabel.clipsToBounds = YES;
    
    
    checkingTopLabel.layer.borderColor = [[UIColor lightGrayColor] CGColor];
    checkingTopLabel.layer.borderWidth = 2;
    
    
    UILabel *checkingBottomLabel = [[UILabel alloc] initWithFrame:CGRectMake(100, _height/2, _width-100, _height/2)];
    checkingBottomLabel.text = @"Hold Your Cards";
    checkingBottomLabel.font = [UIFont fontWithName:@"Courier" size:100];
    // spinLabel.backgroundColor = [UIColor yellowColor];
    checkingBottomLabel.textAlignment = NSTextAlignmentCenter;
    checkingBottomLabel.layer.cornerRadius = 25;
    checkingBottomLabel.clipsToBounds = YES;
    
    
    checkingBottomLabel.layer.borderColor = [[UIColor lightGrayColor] CGColor];
    checkingBottomLabel.layer.borderWidth = 2;
    
    [self.view addSubview:checkingTopLabel];
    [self.view addSubview:checkingBottomLabel];
    
    
    UILabel *labelBackground = [[UILabel alloc] initWithFrame:CGRectMake(75, 0, _width-75, _height)];
    // labelBackground.text = @"Hold Cards";
    labelBackground.font = [UIFont fontWithName:@"Helvetica" size:300];
    labelBackground.numberOfLines = 0;
    labelBackground.textColor = [UIColor yellowColor];
    labelBackground.textAlignment = NSTextAlignmentCenter;
    
    
    
    
    [self.view addSubview: labelBackground];
    
    
    CABasicAnimation *spinning = [CABasicAnimation animationWithKeyPath:@"transform.rotation.y"];
    //for backward text
    spinning.toValue = [NSNumber numberWithFloat:2*M_PI];
    //only forward text
    //spinning.toValue = [NSNumber numberWithFloat:.5*M_PI];
    
    spinning.autoreverses = YES;
    spinning.duration = 4;
    spinning.repeatCount = HUGE_VALF;
    
    CABasicAnimation *colorAnimation = [CABasicAnimation animationWithKeyPath:@"backgroundColor"];
    UIColor *fromColor = [UIColor redColor];
    UIColor *toColor = [UIColor greenColor];
    
    colorAnimation.duration = 2.0;
    colorAnimation.fromValue = (id)fromColor.CGColor;
    colorAnimation.toValue = (id)toColor.CGColor;
    colorAnimation.repeatCount = HUGE_VALF;
    colorAnimation.autoreverses = YES;
    
    
    CABasicAnimation *colorAnimation2 = [CABasicAnimation animationWithKeyPath:@"backgroundColor"];
    UIColor *fromColor2 = [UIColor greenColor];
    UIColor *toColor2 = [UIColor redColor];
    
    colorAnimation2.duration = 2.0;
    colorAnimation2.fromValue = (id)fromColor2.CGColor;
    colorAnimation2.toValue = (id)toColor2.CGColor;
    colorAnimation2.repeatCount = HUGE_VALF;
    colorAnimation2.autoreverses = YES;
    
    
    [checkingTopLabel.layer addAnimation:spinning forKey:nil];
    [checkingTopLabel.layer addAnimation:colorAnimation forKey:nil];
    
    [checkingBottomLabel.layer addAnimation:spinning forKey:nil];
    [checkingBottomLabel.layer addAnimation:colorAnimation2 forKey:nil];
    
    
}

-(void)checkingAnimation7 {
    UILabel *checkingTopLabel = [[UILabel alloc] initWithFrame:CGRectMake(100, 0, _width-100, _height/2)];
    checkingTopLabel.text = @"Checking";
    checkingTopLabel.font = [UIFont fontWithName:@"Courier" size:100];
   
    checkingTopLabel.textAlignment = NSTextAlignmentCenter;
    checkingTopLabel.layer.cornerRadius = 25;
    checkingTopLabel.clipsToBounds = YES;
    
    
    checkingTopLabel.layer.borderColor = [[UIColor lightGrayColor] CGColor];
    checkingTopLabel.layer.borderWidth = 2;
    
    
    UILabel *checkingBottomLabel = [[UILabel alloc] initWithFrame:CGRectMake(100, _height/2, _width-100, _height/2)];
    checkingBottomLabel.text = @"Hold Your Cards";
    checkingBottomLabel.font = [UIFont fontWithName:@"Courier" size:100];
    
    checkingBottomLabel.textAlignment = NSTextAlignmentCenter;
    checkingBottomLabel.layer.cornerRadius = 25;
    checkingBottomLabel.clipsToBounds = YES;
    
    
    checkingBottomLabel.layer.borderColor = [[UIColor lightGrayColor] CGColor];
    checkingBottomLabel.layer.borderWidth = 2;
    
    [self.view addSubview:checkingTopLabel];
    [self.view addSubview:checkingBottomLabel];
    
    
    UILabel *labelBackground = [[UILabel alloc] initWithFrame:CGRectMake(75, 0, _width-75, _height)];
   
    labelBackground.font = [UIFont fontWithName:@"Helvetica" size:300];
    labelBackground.numberOfLines = 0;
    labelBackground.textColor = [UIColor yellowColor];
    labelBackground.textAlignment = NSTextAlignmentCenter;
    
    
    
    
    [self.view addSubview: labelBackground];
    
    
    CABasicAnimation *spinning = [CABasicAnimation animationWithKeyPath:@"transform.rotation.x"];
    //for backward text
    spinning.toValue = [NSNumber numberWithFloat:2*M_PI];
    //only forward text
    //spinning.toValue = [NSNumber numberWithFloat:.5*M_PI];
    
    spinning.autoreverses = YES;
    spinning.duration = 4;
    spinning.repeatCount = HUGE_VALF;
    
    CABasicAnimation *colorAnimation = [CABasicAnimation animationWithKeyPath:@"backgroundColor"];
    UIColor *fromColor = [UIColor redColor];
    UIColor *toColor = [UIColor greenColor];
    
    colorAnimation.duration = 2.0;
    colorAnimation.fromValue = (id)fromColor.CGColor;
    colorAnimation.toValue = (id)toColor.CGColor;
    colorAnimation.repeatCount = HUGE_VALF;
    colorAnimation.autoreverses = YES;
    
    
    CABasicAnimation *colorAnimation2 = [CABasicAnimation animationWithKeyPath:@"backgroundColor"];
    UIColor *fromColor2 = [UIColor greenColor];
    UIColor *toColor2 = [UIColor redColor];
    
    colorAnimation2.duration = 2.0;
    colorAnimation2.fromValue = (id)fromColor2.CGColor;
    colorAnimation2.toValue = (id)toColor2.CGColor;
    colorAnimation2.repeatCount = HUGE_VALF;
    colorAnimation2.autoreverses = YES;
    
    
    [checkingTopLabel.layer addAnimation:spinning forKey:nil];
    [checkingTopLabel.layer addAnimation:colorAnimation forKey:nil];
    
    [checkingBottomLabel.layer addAnimation:spinning forKey:nil];
    [checkingBottomLabel.layer addAnimation:colorAnimation2 forKey:nil];
    
    
}



@end
