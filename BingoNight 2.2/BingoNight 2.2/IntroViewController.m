//
//  IntroViewController.m
//  Bingo Night 3.0
//
//  Created by Adam Schor on 7/19/15.
//  Copyright (c) 2015 AandA Development. All rights reserved.
//

#import "IntroViewController.h"

@interface IntroViewController ()

@end

@implementation IntroViewController

- (void)viewDidLoad {
   
    [self.navigationController setNavigationBarHidden:YES];
    
#pragma mark Set Up The Screen
   //Settings
    CGFloat height = [UIScreen mainScreen].bounds.size.height;
    CGFloat width = [UIScreen mainScreen].bounds.size.width;
    CGFloat horizontalPercentage = .1;
    UIColor *labelTextColor = [UIColor redColor];
    UIColor *buttonTextColor = [UIColor blueColor];
    
    NSString *labelFontName = @"Helvetica";
    NSString *buttonFontName = @"Helvetica";
    
    
   //Background Color
    UIView *background = [[UIView alloc] initWithFrame:CGRectMake(0, 0, width, height)];
    CAGradientLayer *gradient = [CAGradientLayer layer];
    gradient.frame = background.bounds;
    gradient.colors = [NSArray arrayWithObjects:(id)[[UIColor blackColor]CGColor],(id)[[UIColor grayColor]CGColor],(id)[[UIColor blueColor]CGColor], nil];
    [background.layer insertSublayer:gradient atIndex:0];
    [self.view addSubview:background];
    [self.view sendSubviewToBack:background];
    
    //Labels
    
    _labelTitleBox = [[UILabel alloc] initWithFrame:CGRectMake(horizontalPercentage*width, .1*height, width*(1-2*horizontalPercentage), .25*height)];
    _labelTitleBox.text = @"BINGO NIGHT";
    _labelTitleBox.textColor = labelTextColor;
    _labelTitleBox.backgroundColor = [UIColor clearColor];
    _labelTitleBox.font = [UIFont fontWithName:labelFontName size:width*.1];
    _labelTitleBox.adjustsFontSizeToFitWidth = YES;
    _labelTitleBox.textAlignment = NSTextAlignmentCenter;
    _labelTitleBox.layer.shadowColor = [[UIColor yellowColor] CGColor];
    _labelTitleBox.layer.shadowOffset = CGSizeMake(4.0f, 4.0f);
    _labelTitleBox.layer.shadowOpacity = 1;
    

    _labelBottomBox = [[UILabel alloc] initWithFrame:CGRectMake(horizontalPercentage*width, .75*height, width*(1-2*horizontalPercentage), .1*height)];
     _labelBottomBox.text = @"Your Bingo Night Event Companion";
     _labelBottomBox.textColor = labelTextColor;
     _labelBottomBox.backgroundColor = [UIColor clearColor];
     _labelBottomBox.font = [UIFont fontWithName:labelFontName size:width*.05];
     _labelBottomBox.adjustsFontSizeToFitWidth = YES;
     _labelBottomBox.textAlignment = NSTextAlignmentCenter;
     _labelBottomBox.layer.shadowColor = [[UIColor yellowColor] CGColor];
     _labelBottomBox.layer.shadowOffset = CGSizeMake(4.0f, 4.0f);
     _labelBottomBox.layer.shadowOpacity = 1;

    _labelCreditBox = [[UILabel alloc] initWithFrame:CGRectMake(horizontalPercentage*width, .90*height, width*(1-2*horizontalPercentage), .05*height)];
    _labelCreditBox.text = @"An A&A Developments Production";
    _labelCreditBox.textColor = labelTextColor;
    _labelCreditBox.backgroundColor = [UIColor clearColor];
    _labelCreditBox.font = [UIFont fontWithName:labelFontName size:width*.025];
    _labelCreditBox.adjustsFontSizeToFitWidth = YES;
    _labelCreditBox.textAlignment = NSTextAlignmentCenter;
 
    
 //SET UP BUTTONS
    
    _btnPlay = [[UIButton alloc] init];
    _btnPlay.frame = CGRectMake(.2*width, .5*height, .2*width, .075*width);
    _btnPlay.backgroundColor = [UIColor whiteColor];
    _btnPlay.layer.cornerRadius = 10;
    [_btnPlay setTitle:@"Play" forState:UIControlStateNormal];
    [_btnPlay setTitleColor:buttonTextColor forState:UIControlStateNormal];
    [_btnPlay setTitleColor:[UIColor redColor] forState:UIControlStateHighlighted];
    
   
    
    _btnPlay.titleLabel.textColor = buttonTextColor;
    _btnPlay.titleLabel.font = [UIFont fontWithName:buttonFontName size:.05 * width];
    [_btnPlay addTarget:self action:@selector(pushPlay) forControlEvents:UIControlEventTouchDown];
    
   
    _btnSetUp = [[UIButton alloc] init];
    _btnSetUp.frame = CGRectMake(.6*width, .5*height, .2*width, .075*width);
    _btnSetUp.backgroundColor = [UIColor whiteColor];
    _btnSetUp.layer.cornerRadius = 10;
    [_btnSetUp setTitle:@"Set Up" forState:UIControlStateNormal];
    [_btnSetUp setTitleColor:buttonTextColor forState:UIControlStateNormal];
    [_btnSetUp setTitleColor:[UIColor redColor] forState:UIControlStateHighlighted];
    
    
    
    _btnSetUp.titleLabel.textColor = buttonTextColor;
    _btnSetUp.titleLabel.font = [UIFont fontWithName:buttonFontName size:.05 * width];
    [_btnSetUp addTarget:self action:@selector(pushSetUp) forControlEvents:UIControlEventTouchDown];
    
    
    
    
    [self.view addSubview:_labelTitleBox];
    [self.view addSubview:_labelBottomBox];
    [self.view addSubview:_labelCreditBox];
    
    [self.view addSubview:_btnPlay];
    [self.view addSubview:_btnSetUp];
    
    
    
    [super viewDidLoad];
    // Do any additional setup after loading the view.
}

- (void)viewDidAppear:(BOOL)animated {

    [self.navigationController setNavigationBarHidden:YES];
    //[self.navigationController.navigationBar setBarTintColor:[UIColor lightGrayColor]];
    
}

- (void)didReceiveMemoryWarning {
    [super didReceiveMemoryWarning];
    // Dispose of any resources that can be recreated.
}

-(void)pushPlay{
    [self performSegueWithIdentifier:@"segueIntroToGamePlay" sender:self];
    
}
-(void)pushSetUp{
    [self performSegueWithIdentifier:@"segueIntroToSetUp" sender:self];
    
}

/*
#pragma mark - Navigation

// In a storyboard-based application, you will often want to do a little preparation before navigation
- (void)prepareForSegue:(UIStoryboardSegue *)segue sender:(id)sender {
    // Get the new view controller using [segue destinationViewController].
    // Pass the selected object to the new view controller.
}
*/

@end
