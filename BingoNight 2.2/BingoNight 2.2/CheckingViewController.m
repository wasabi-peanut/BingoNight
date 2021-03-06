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
#import "WinnerViewController.h"




@interface CheckingViewController ()
{AVAudioPlayer *avPlayer;
}
@end

@implementation CheckingViewController


- (BOOL)prefersStatusBarHidden{
    return YES;
}


- (void)viewDidLoad {
    
    _musicPlayer = [MPMusicPlayerController applicationMusicPlayer];
    _keyForArrayOfSongsPicked = @"keyForArrayOfSongsPicked";
    
    
    
    
    _height = [UIScreen mainScreen].bounds.size.height;
    _width = [UIScreen mainScreen].bounds.size.width;
    
    _keyForCalledNumbers = @"keyForCalledNumbers";
    _keyForCoordinatesCheckingPatterns = @"keyForCoordinatesCheckingPatterns";
    _keyForCoordinatesCheckingSongs = @"keyForCoordinatesCheckingSongs";
    
    _arrayCoordinatesCheckingPatterns = [DefaultsDataManager getDataForKey:_keyForCoordinatesCheckingPatterns];
    _arrayCalledNumbers = [DefaultsDataManager getDataForKey:_keyForCalledNumbers];
    _arrayCoordinatesCheckingSongs = [DefaultsDataManager getDataForKey:_keyForCoordinatesCheckingSongs];
    
    _arrayOfSongsPicked = [[NSMutableArray alloc] initWithArray:[DefaultsDataManager getArrayForKey:_keyForArrayOfSongsPicked]];
    
    
    
    
  //FOR TESTING
/*    _arrayCalledNumbers = [[NSMutableArray alloc] init];
    for (int z=1; z<=75; z++) {
        [_arrayCalledNumbers addObject:@(z)];
        
    }
  */
    //END TESTING
 
    
    _arrayCalledNumbersSorted = [_arrayCalledNumbers sortedArrayUsingSelector:@selector(compare:)];
    
    self.view.backgroundColor = [UIColor blueColor];
   
  
    

   
    
    
    
    [super viewDidLoad];
    
    
    
    
    // Do any additional setup after loading the view.
}

-(void)viewDidAppear:(BOOL)animated{
    //[self.navigationController popToViewController:[self.navigationController.viewControllers objectAtIndex:1] animated:YES];
    [self createCalledDisplay];
    [self setUpMenuBar];
    [self AnimationSelector];
    
}

- (void)didReceiveMemoryWarning {
    [super didReceiveMemoryWarning];
    // Dispose of any resources that can be recreated.
}

-(void)viewWillDisappear:(BOOL)animated{
    [avPlayer stop];
    [_musicPlayer stop];
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
    
    
    [_myView removeFromSuperview];
    
    
    [self performSegueWithIdentifier:@"segueCheckingToWinner" sender:self];
    
    
    

}

-(void)AnimationSelector {
    
    NSInteger checkingPattern = [_arrayCoordinatesCheckingPatterns[_gameNumber-1] integerValue];
    
    
    
    CGFloat navHeight = self.navigationController.navigationBar.frame.size.height;
    
    _myView = [checkingPatterns frameX:_widthOfCalledDisplay frameY:navHeight width:_width-_widthOfCalledDisplay height:_height-navHeight];
    [self.view addSubview:_myView];
    [_myView runAnimationWithPatternSelected:checkingPattern];
    
    NSInteger songToPlay = [_arrayCoordinatesCheckingSongs[_gameNumber-1] integerValue];
  //  _songRowSelected = songToPlay;
    switch (songToPlay) {
        case 0:
            _checkingSongTitle = @"brazilsamba";
            break;
        case 1:
            _checkingSongTitle = @"clearday";
            break;
        case 2:
            _checkingSongTitle = @"countryboy";
            break;
        case 3:
            _checkingSongTitle = @"dance";
            break;
        case 4:
            _checkingSongTitle = @"dubstep";
            break;
        case 5:
            _checkingSongTitle = @"epic";
            break;
        case 6:
            _checkingSongTitle = @"groovyhiphop";
            break;
        case 7:
            _checkingSongTitle = @"happyrock";
            break;
        case 8:
            _checkingSongTitle = @"jazzpiano";
            break;
        case 9:
            _checkingSongTitle = @"love";
            break;
        case 10:
            _checkingSongTitle = @"moose";
            break;
        case 11:
            _checkingSongTitle = @"popdance";
            break;
        case 12:
            _checkingSongTitle = @"retrosoul";
            break;
        case 13:
            _checkingSongTitle = @"rumble";
            break;
        default:
            [self playOwnSong:songToPlay];
            break;
    }
    if (songToPlay<14) {
        [self playSavedSong];
    }
}
-(void)playSavedSong {
    NSString *songPath;
    
    songPath =[[NSBundle mainBundle]pathForResource:_checkingSongTitle ofType:@"mp3"];
    NSURL *url = [NSURL fileURLWithPath:songPath];
    
    NSError *error;
    
    avPlayer= [[AVAudioPlayer alloc]initWithContentsOfURL:url error:&error];
    
    [avPlayer setNumberOfLoops:-1];
    [avPlayer setVolume:1];
    [avPlayer play];
    
}

-(void)playOwnSong: (NSInteger)rowSelected{
    MPMediaQuery *query = [MPMediaQuery songsQuery];
    [query addFilterPredicate:[MPMediaPropertyPredicate predicateWithValue:_arrayOfSongsPicked[rowSelected-14] forProperty:MPMediaItemPropertyPersistentID]];
    
    
    [_musicPlayer setQueueWithQuery:query];
    [_musicPlayer play];
    
}

-(void)prepareForSegue:(UIStoryboardSegue *)segue sender:(id)sender {
    
    
    
    if ([segue.identifier isEqualToString:@"segueCheckingToWinner"]) {
        WinnerViewController *viewChecking = [segue destinationViewController];
        viewChecking.gameNumber = _gameNumber;
    }
    
    
    
}



@end
