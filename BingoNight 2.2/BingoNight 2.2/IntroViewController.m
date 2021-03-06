//
//  IntroViewController.m
//  Bingo Night 3.0
//
//  Created by Adam Schor on 7/19/15.
//  Copyright (c) 2015 AandA Development. All rights reserved.
//

#import "IntroViewController.h"
#import "StartViewController.h"
#import "MKiCloudSync.h"

@interface IntroViewController ()

@end

@implementation IntroViewController

- (BOOL)prefersStatusBarHidden{
    return YES;
}

- (void)viewDidLoad {
   
    [self.navigationController setNavigationBarHidden:YES];
    
   

 //   [self.navigationController prefersStatusBarHidden];
  
    _restoreMode = 0;
    
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
    _labelTitleBox.text = @"My Bingo Event";
    _labelTitleBox.textColor = labelTextColor;
    _labelTitleBox.backgroundColor = [UIColor clearColor];
    _labelTitleBox.font = [UIFont fontWithName:labelFontName size:width*.1];
    _labelTitleBox.adjustsFontSizeToFitWidth = YES;
    _labelTitleBox.textAlignment = NSTextAlignmentCenter;
    _labelTitleBox.layer.shadowColor = [[UIColor yellowColor] CGColor];
    _labelTitleBox.layer.shadowOffset = CGSizeMake(4.0f, 4.0f);
    _labelTitleBox.layer.shadowOpacity = 1;
    

    _labelBottomBox = [[UILabel alloc] initWithFrame:CGRectMake(horizontalPercentage*width, .75*height, width*(1-2*horizontalPercentage), .1*height)];
     _labelBottomBox.text = @"Make Your Bingo Night Special";
     _labelBottomBox.textColor = labelTextColor;
     _labelBottomBox.backgroundColor = [UIColor clearColor];
     _labelBottomBox.font = [UIFont fontWithName:labelFontName size:width*.05];
     _labelBottomBox.adjustsFontSizeToFitWidth = YES;
     _labelBottomBox.textAlignment = NSTextAlignmentCenter;
     _labelBottomBox.layer.shadowColor = [[UIColor yellowColor] CGColor];
     _labelBottomBox.layer.shadowOffset = CGSizeMake(4.0f, 4.0f);
     _labelBottomBox.layer.shadowOpacity = 1;

    _labelCreditBox = [[UILabel alloc] initWithFrame:CGRectMake(horizontalPercentage*width, .90*height, width*(1-2*horizontalPercentage), .05*height)];
    _labelCreditBox.text = @"An A&A Development Production";
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
    
    _btnInstructions = [[UIButton alloc] init];
    
    _btnInstructions.frame = CGRectMake(0.6 * width,0.65 * height, .2*width, .05*width);
    _btnInstructions.backgroundColor = [UIColor whiteColor];
    _btnInstructions.layer.cornerRadius = 10;
    [_btnInstructions setTitle:@"Instructions" forState:UIControlStateNormal];
    [_btnInstructions setTitleColor:buttonTextColor forState:UIControlStateNormal];
    [_btnInstructions setTitleColor:[UIColor redColor] forState:UIControlStateHighlighted];
    [_btnInstructions setBackgroundColor:[UIColor lightGrayColor]];
    
    _btnInstructions.titleLabel.textColor = buttonTextColor;
    _btnInstructions.titleLabel.font = [UIFont fontWithName:buttonFontName size:.03 * width];
    [_btnInstructions addTarget:self action:@selector(pushInstructions) forControlEvents:UIControlEventTouchDown];
    
    _btnRestoreGame = [[UIButton alloc]init];
    _btnRestoreGame.frame = CGRectMake(0.2 * width,0.65 * height, .2*width, .05*width);
    _btnRestoreGame.backgroundColor = [UIColor whiteColor];
    _btnRestoreGame.layer.cornerRadius = 10;
    
    [_btnRestoreGame setTitle:@"Restore" forState:UIControlStateNormal];
    [_btnRestoreGame setTitleColor:buttonTextColor forState:UIControlStateNormal];
    [_btnRestoreGame setTitleColor:[UIColor redColor] forState:UIControlStateHighlighted];
    [_btnRestoreGame setBackgroundColor:[UIColor lightGrayColor]];
    
    _btnRestoreGame.titleLabel.textColor = buttonTextColor;
    _btnRestoreGame.titleLabel.font = [UIFont fontWithName:buttonFontName size:.03 * width];
    [_btnRestoreGame addTarget:self action:@selector(restoreGame) forControlEvents:UIControlEventTouchDown];
    
    
    _btnCloud = [[UIButton alloc] init];
    _btnCloud.frame = CGRectMake(10, height*.95, .05*width, .05*height);
    _btnCloud.backgroundColor = [UIColor whiteColor];
    _btnCloud.layer.cornerRadius = 10;
    
    [_btnCloud setTitle:@"\u2601" forState:UIControlStateNormal];
    [_btnCloud setTitleColor:buttonTextColor forState:UIControlStateNormal];
    [_btnCloud setTitleColor:[UIColor redColor] forState:UIControlStateHighlighted];
    [_btnCloud setBackgroundColor:[UIColor clearColor]];
    
    _btnCloud.titleLabel.textColor = buttonTextColor;
    _btnCloud.titleLabel.font = [UIFont fontWithName:buttonFontName size:.03 * width];
    [_btnCloud addTarget:self action:@selector(pushCloud) forControlEvents:UIControlEventTouchDown];
    
//USE THIS FOR IN APP LICENSE PURCHASE
    /*
    _btnLicense = [[UIButton alloc] init];
    _btnLicense.frame = CGRectMake(0.82 * width,0.96 * height, .15*width, .03* height);
    _btnLicense.backgroundColor = [UIColor whiteColor];
    _btnLicense.layer.cornerRadius = 10;
    
    [_btnLicense setTitle:@"Buy License" forState:UIControlStateNormal];
    [_btnLicense setTitleColor:buttonTextColor forState:UIControlStateNormal];
    _btnLicense.titleLabel.font = [UIFont fontWithName:buttonFontName size:.02 * width];
    [_btnLicense addTarget:self action:@selector(pushLicense) forControlEvents:UIControlEventTouchDown];
    */
    

    
    
    
    [self.view addSubview:_labelTitleBox];
    [self.view addSubview:_labelBottomBox];
    [self.view addSubview:_labelCreditBox];
    
    [self.view addSubview:_btnPlay];
    [self.view addSubview:_btnSetUp];
    [self.view addSubview:_btnInstructions];
    [self.view addSubview:_btnRestoreGame];
    [self.view addSubview:_btnCloud];
  //  [self.view addSubview:_btnLicense];
    
    
    
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
    [self performSegueWithIdentifier:@"segueIntroToStart" sender:self];
    
}
-(void)pushSetUp{
    [self performSegueWithIdentifier:@"segueIntroToSetUp" sender:self];
    
}

-(void)pushInstructions{
    [self performSegueWithIdentifier:@"segueIntroToInstructions" sender:self];
    
    
}

-(void)pushLicense{
    [self performSegueWithIdentifier:@"segueIntroToInAppPurchase" sender:self];
}

-(void)restoreGame {
    
    _restoreMode = 1;
    [self performSegueWithIdentifier:@"segueIntroToStart" sender:self];
    
}

-(void)pushCloud{
    [self performSegueWithIdentifier:@"segueIntroToCloud" sender:self];
}

-(void)prepareForSegue:(UIStoryboardSegue *)segue sender:(id)sender {
    
    if ([segue.identifier isEqualToString: @"segueIntroToStart" ]){
        
        StartViewController *introToStartViewController = [segue destinationViewController];
        introToStartViewController.restoreMode = _restoreMode;
        
        _restoreMode = 0;
    }
}

- (IBAction)btnPushFromCloud:(id)sender {
    [MKiCloudSync updateToiCloud];
}

- (IBAction)btnPullFromCloud:(id)sender {
    [MKiCloudSync updateFromiCloud];
}
@end
