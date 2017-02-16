//
//  StartViewController.m
//  Bingo Night 3.0
//
//  Created by Adam Schor on 7/31/15.
//  Copyright (c) 2015 AandA Development. All rights reserved.
//

#import "StartViewController.h"
#import "GamePlayViewController.h"
#import "DefaultsDataManager.h"



@interface StartViewController ()

@end

@implementation StartViewController

- (BOOL)prefersStatusBarHidden{
    return YES;
}


- (void)viewDidLoad {
    _musicPlayer = [MPMusicPlayerController applicationMusicPlayer];
    

    _keyForNumberOfGames = @"keyForNumberOfGames";
    _keyForGlobalSettings = @"keyForGlobalSettings";
    
    
    _width = [UIScreen mainScreen].bounds.size.width;
    _height = [UIScreen mainScreen].bounds.size.height;
    
    
    [self importSettings];

    
    [self.navigationController setNavigationBarHidden:YES];
    
    UIView *background = [[UIView alloc] initWithFrame:CGRectMake(0, 0, _width, _height)];
    CAGradientLayer *gradient = [CAGradientLayer layer];
    gradient.frame = background.bounds;
    gradient.colors = [NSArray arrayWithObjects:(id)[[UIColor grayColor]CGColor],(id)[[UIColor lightGrayColor]CGColor],(id)[[UIColor whiteColor]CGColor], nil];
    [background.layer insertSublayer:gradient atIndex:0];
    [self.view addSubview:background];
    [self.view sendSubviewToBack:background];
    
    [super viewDidLoad];
    
    
    
    
    
    
    
}

-(void)viewDidAppear:(BOOL)animated {
     [self.navigationController setNavigationBarHidden:NO];
    
     [self setUpGameButtons];
     [self nameOfGameSetUp];
}

- (void)didReceiveMemoryWarning {
    [super didReceiveMemoryWarning];
    // Dispose of any resources that can be recreated.
}

-(void)importSettings{
    
 
    
    
    _arrayGlobalSettings = [[NSMutableArray alloc] initWithArray:[DefaultsDataManager getDataForKey:_keyForGlobalSettings]];
    
    if (![_arrayGlobalSettings count]) {
        _arrayGlobalSettings = [[NSMutableArray alloc]initWithObjects:@(YES),@"Name of Event",//UseSelector and Name 0,1
                                @0,@0,@0,//text color 2,3,4
                                @0,@255,@0,//background to text 5,6,7
                                @"Arial",@64, //font and size 8,9
                                @5, //10 is row number for font;
                                @13, //11 is row number for size;
                                @1,@1,@1, //12,13,14 is ball roll, display and drop seconds;
                                @1, //15 is smart selector on (i.e. value of one)
                                @0, //16 use Special Checking is ON
                                @1, //17 add image is OFF.
                                @10, //18 X coordinate of image
                                @10, //19  Y coordinate of image
                                @100, //20 width of image
                                @100, //21 height of image
                                nil];
        
    }
    
    
    _numberOfGames = [[DefaultsDataManager getDataForKey:_keyForNumberOfGames] integerValue];

    
   
    if (_numberOfGames<1) {
       _numberOfGames = 8;
        
    }

}
    


-(void)setUpGameButtons {
    
    if (_numberOfGames < 7) {
        
    
    
    //OLD WORKING WAY:
    NSInteger startX = _width/(_numberOfGames+1)-(100 + (4*_numberOfGames))/2;
    NSInteger startY = _height/2+100;
    NSInteger space = (_width-startX)/_numberOfGames;
    
    for (int i=1; i <= _numberOfGames; i++) {
        UIButton *gameButton = [UIButton buttonWithType:UIButtonTypeRoundedRect];
        gameButton.tag = i;
        NSString *gamenumber = [NSString stringWithFormat:@"%d",i];
        
        gameButton.frame = CGRectMake(startX + space * (i-1), startY, 100 - (4*_numberOfGames) , 100- (4*_numberOfGames));
        [gameButton setTitle:gamenumber forState:UIControlStateNormal];
        gameButton.layer.borderColor = [[UIColor blueColor] CGColor];
        gameButton.layer.borderWidth = 3;
        gameButton.layer.cornerRadius = (100 - (4*_numberOfGames))/2;
        gameButton.titleLabel.font = [UIFont fontWithName:@"Helvetica" size:44];
        
        
        [gameButton addTarget:self action:@selector(gameSelected:) forControlEvents:UIControlEventTouchUpInside];
        
        
        [self.view addSubview:gameButton];
    
  
        }}
        
    
    if (_numberOfGames >6) {
        
    
    
   
    NSInteger startX = 50;
    NSInteger startY = _height/2+100;
    NSInteger startAdjust = _width/_numberOfGames + 50;
    NSInteger space = 1.5*(_width-startX)/_numberOfGames;
    
    for (int i=1; i <= _numberOfGames; i++) {
        UIButton *gameButton = [UIButton buttonWithType:UIButtonTypeRoundedRect];
        gameButton.tag = i;
        NSString *gamenumber = [NSString stringWithFormat:@"%d",i];
        
        
        if(i<=_numberOfGames/2){
        gameButton.frame = CGRectMake(startX + startAdjust+ space * (i-1), startY, 100 - (2*_numberOfGames) , 100- (2*_numberOfGames));
        }
        
        if(i>_numberOfGames/2){
            
            
            gameButton.frame = CGRectMake(startX + startAdjust +space * ((i-_numberOfGames/2)-1), startY+100, 100 - (2*_numberOfGames) , 100- (2*_numberOfGames));
        }
 
        
        [gameButton setTitle:gamenumber forState:UIControlStateNormal];
        gameButton.layer.borderColor = [[UIColor blueColor] CGColor];
        gameButton.layer.borderWidth = 3;
        gameButton.layer.cornerRadius = (100 - (2*_numberOfGames))/2;
        gameButton.titleLabel.font = [UIFont fontWithName:@"Helvetica" size:44];
        
        
        [gameButton addTarget:self action:@selector(gameSelected:) forControlEvents:UIControlEventTouchUpInside];
        
        
        [self.view addSubview:gameButton];

        
        
    }
    }
       
    }



-(void)nameOfGameSetUp {
    
    float fontSize = [[_arrayGlobalSettings objectAtIndex:9] floatValue];
    NSString *fontName = [_arrayGlobalSettings objectAtIndex:8];
    
    
   
    
    _nameOfEvent = [[UITextView alloc]initWithFrame:CGRectMake(0, 50, _width, _height/2)];
    
    _nameOfEvent.layer.borderColor = [[UIColor blackColor] CGColor];
    _nameOfEvent.layer.borderWidth = 5;
    _nameOfEvent.font = [UIFont fontWithName:fontName size:fontSize];
    _nameOfEvent.textAlignment = NSTextAlignmentCenter;
    _nameOfEvent.text = [_arrayGlobalSettings objectAtIndex:1];
    
    
    _nameOfEvent.textColor = [UIColor colorWithRed:[[_arrayGlobalSettings objectAtIndex:2] floatValue]/255 green:[[_arrayGlobalSettings  objectAtIndex:3] floatValue]/255 blue:[[_arrayGlobalSettings objectAtIndex:4]floatValue]/255 alpha:1];
    
    _nameOfEvent.backgroundColor = [UIColor colorWithRed:[[_arrayGlobalSettings objectAtIndex:5] floatValue]/255 green:[[_arrayGlobalSettings  objectAtIndex:6] floatValue]/255 blue:[[_arrayGlobalSettings objectAtIndex:7]floatValue]/255 alpha:1];
    
    _nameOfEvent.editable = NO;
    _nameOfEvent.scrollEnabled =NO;
    
    [self.view addSubview:_nameOfEvent];
    
    float xValue = [_arrayGlobalSettings[18] floatValue];
    float yValue = [_arrayGlobalSettings[19] floatValue];
    float width = [_arrayGlobalSettings[20] floatValue];
    float height = [_arrayGlobalSettings[21] floatValue];
    
    UIImageView *imageView = [[UIImageView alloc] initWithFrame:CGRectMake(xValue, yValue, width, height)];
    imageView.image = [UIImage imageWithData:[DefaultsDataManager getDataForKey:@"imageKey"]];
    [self.view addSubview:imageView];
    [self.view bringSubviewToFront:imageView];
    
    

    
}

-(IBAction)gameSelected:(UIButton*)sender {
    
    _gameSelected = sender.tag ;

    [self performSegueWithIdentifier:@"segueStartToGamePlay" sender:self];
}

-(void)prepareForSegue:(UIStoryboardSegue *)segue sender:(id)sender {
    
    if (([segue.identifier isEqualToString:@"segueStartToGamePlay"])) {
        
        GamePlayViewController *viewStartToGamePlay = [segue destinationViewController];
        viewStartToGamePlay.incomingGameNumber = _gameSelected ;
        
    }
}

#pragma mark PLAY SONG
-(IBAction)btnPlay:(id)sender{
    NSData *data = [DefaultsDataManager getDataForKey:@"keyThemeSong"];
    MPMediaItemCollection *mediaItemCollection = [NSKeyedUnarchiver unarchiveObjectWithData:data];
    [_musicPlayer setQueueWithItemCollection:mediaItemCollection];
    [_musicPlayer play];
}

-(IBAction)btnStop:(id)sender{
    [_musicPlayer stop];
}

@end
