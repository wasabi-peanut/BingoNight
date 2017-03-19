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
    _keyForLastGameSelected = @"keyForLastGameSelected";
    
    
    
    _width = [UIScreen mainScreen].bounds.size.width;
    _height = [UIScreen mainScreen].bounds.size.height;
    
    
    [self importSettings];

    
    [self.navigationController setNavigationBarHidden:YES];
    
    self.view.backgroundColor = [UIColor colorWithPatternImage:[UIImage imageNamed:@"baubles.jpg"]];
    
    
 /*   UIView *background = [[UIView alloc] initWithFrame:CGRectMake(0, _height/2, _width, _height/2)];
    CAGradientLayer *gradient = [CAGradientLayer layer];
    gradient.frame = background.bounds;
    gradient.colors = [NSArray arrayWithObjects:(id)[[UIColor whiteColor]CGColor],(id)[[UIColor lightGrayColor]CGColor],(id)[[UIColor whiteColor]CGColor], nil];
    [background.layer insertSublayer:gradient atIndex:0];
    [self.view addSubview:background];
    [self.view sendSubviewToBack:background];
   */
    [super viewDidLoad];
    
   
}

-(void)viewDidAppear:(BOOL)animated {
     [self.navigationController setNavigationBarHidden:NO];
    
     [self setUpGameButtons];
     [self nameOfGameSetUp];
}

-(void)viewWillDisappear:(BOOL)animated {
    [_musicPlayer stop];
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
                                @1,@3,@1, //12,13,14 is ball roll, display and drop seconds;
                                @1, //15 is smart selector on (i.e. value of one)
                                @1, //16 use Special Checking is on
                                @0, //17 add image is Off.
                                @10, //18 X coordinate of image
                                @10, //19  Y coordinate of image
                                @100, //20 width of image
                                @100, //21 height of image
                                @0,//22  DON"T use raffle
                                @0,//23 Theme NOT selected
                                @0,//24 Image On Top
                                @0,//25 Alignment
                                @100,//26 Line Space
                                nil];
        
    }
    
   
    _numberOfGames = [[DefaultsDataManager getDataForKey:_keyForNumberOfGames] integerValue];

    
   
    if (_numberOfGames<1) {
       _numberOfGames = 8;
        
    }

}
    


-(void)setUpGameButtons {
    
    //GET LAST GAME SELECTED FOR RESTORE
    NSInteger lastGameSelected = [[DefaultsDataManager getDataForKey:_keyForLastGameSelected] integerValue];
    
    
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
        gameButton.layer.borderColor = [[UIColor redColor] CGColor];
        gameButton.layer.borderWidth = 5;
        gameButton.layer.cornerRadius = (100 - (4*_numberOfGames))/2;
        gameButton.titleLabel.font = [UIFont fontWithName:@"Helvetica" size:44];
        gameButton.backgroundColor = [UIColor whiteColor];
       
        
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
        gameButton.layer.borderColor = [[UIColor redColor] CGColor];
        gameButton.layer.borderWidth = 5;
        gameButton.layer.cornerRadius = (100 - (2*_numberOfGames))/2;
        gameButton.titleLabel.font = [UIFont fontWithName:@"Helvetica" size:44];
        gameButton.backgroundColor = [UIColor whiteColor];

        
        [gameButton addTarget:self action:@selector(gameSelected:) forControlEvents:UIControlEventTouchUpInside];
        
        if (gameButton.tag != lastGameSelected && _restoreMode == 1) {
            gameButton.enabled = NO;
        }
        
        [self.view addSubview:gameButton];

        
        
    }
    }
       
    }



-(void)nameOfGameSetUp {
    
    float fontSize = [[_arrayGlobalSettings objectAtIndex:9] floatValue];
    NSString *fontName = [_arrayGlobalSettings objectAtIndex:8];
    
    
    _viewNameOfEvent = [[UIView alloc] initWithFrame:CGRectMake(0, 44, _width, _height/2)];
    _viewNameOfEvent.backgroundColor = [UIColor colorWithRed:[[_arrayGlobalSettings objectAtIndex:5] floatValue]/255 green:[[_arrayGlobalSettings  objectAtIndex:6] floatValue]/255 blue:[[_arrayGlobalSettings objectAtIndex:7]floatValue]/255 alpha:1];
    
    [self.view addSubview:_viewNameOfEvent];
    
    _nameOfEvent = [[UITextView alloc]initWithFrame:CGRectMake(0, 0, _width, _height/2)];
    
    _nameOfEvent.font = [UIFont fontWithName:fontName size:fontSize];
    _nameOfEvent.textAlignment = NSTextAlignmentCenter;
    _nameOfEvent.text = [_arrayGlobalSettings objectAtIndex:1];
    
    
    _nameOfEvent.textColor = [UIColor colorWithRed:[[_arrayGlobalSettings objectAtIndex:2] floatValue]/255 green:[[_arrayGlobalSettings  objectAtIndex:3] floatValue]/255 blue:[[_arrayGlobalSettings objectAtIndex:4]floatValue]/255 alpha:1];
    
    _nameOfEvent.backgroundColor = [UIColor clearColor];
    
    _nameOfEvent.selectable = NO;
    _nameOfEvent.editable = NO;
    _nameOfEvent.scrollEnabled =NO;
    
    [_viewNameOfEvent addSubview:_nameOfEvent];
    
    float xValue = [_arrayGlobalSettings[18] floatValue];
    float yValue = [_arrayGlobalSettings[19] floatValue];
    float width = [_arrayGlobalSettings[20] floatValue];
    float height = [_arrayGlobalSettings[21] floatValue];
    
    
        
    UIImageView *imageView = [[UIImageView alloc] initWithFrame:CGRectMake(xValue, yValue, width, height)];
   
    if ([_arrayGlobalSettings[17] integerValue] == 1) {
    imageView.image = [UIImage imageWithData:[DefaultsDataManager getDataForKey:@"imageKey"]];
    
    [_nameOfEvent addSubview:imageView];
    }
   
    if ([_arrayGlobalSettings[24] integerValue]==0) {
        [_nameOfEvent bringSubviewToFront:imageView];
    }
    
    if ([_arrayGlobalSettings[24] integerValue]==1) {
        [_nameOfEvent sendSubviewToBack:imageView];
    }

    
    
    
    if ([_arrayGlobalSettings[22] isEqual:@1]) {
        _btnRaffle.alpha = 1;
    }
    else {
        _btnRaffle.alpha = 0;
    }
    
    if ([_arrayGlobalSettings[23] isEqual:@1]) {
        _btnPlay.alpha = 1;
        _btnStop.alpha = 1;
    }
    else {
        _btnPlay.alpha = 0;
        _btnStop.alpha = 0;
    }

[self handleEventName:_arrayGlobalSettings[1] eventFont:_arrayGlobalSettings[8] eventFontSize:[_arrayGlobalSettings[9] floatValue] lineSpacing:[_arrayGlobalSettings[26] integerValue] alignmentValue:[_arrayGlobalSettings[25]integerValue]];


}
-(void)handleEventName: (NSString*)text eventFont: (NSString *)eventFont eventFontSize: (float)eventFontSize lineSpacing: (float)heightValue alignmentValue: (NSInteger) alignmentValue {
    //create style
    NSMutableParagraphStyle *paragraphStyle = [[NSMutableParagraphStyle alloc] init];
    
    
    paragraphStyle.lineSpacing = heightValue;
    paragraphStyle.lineHeightMultiple = 0.5;
    paragraphStyle.paragraphSpacingBefore = 0;
    paragraphStyle.paragraphSpacing = 0;
    paragraphStyle.minimumLineHeight = 0;
    paragraphStyle.maximumLineHeight = eventFontSize;
    
    _nameOfEvent.textContainerInset = UIEdgeInsetsMake(eventFontSize/1.5, 0, -eventFontSize, 0);
    
    
    
    
    
    switch (alignmentValue) {
        case 0:
            paragraphStyle.alignment = NSTextAlignmentLeft;
            break;
        case 1:
            paragraphStyle.alignment = NSTextAlignmentCenter;
            break;
        case 2:
            paragraphStyle.alignment = NSTextAlignmentRight;
            break;
        default:
            paragraphStyle.alignment = NSTextAlignmentLeft;
            break;
    }
    
    
    
    NSDictionary *attributeDictionary = @{
                                          NSParagraphStyleAttributeName: paragraphStyle,
                                          NSFontAttributeName: [UIFont fontWithName:eventFont size:eventFontSize],
                                          
                                          };
    _nameOfEvent.attributedText = [[NSAttributedString alloc] initWithString:text attributes:attributeDictionary];
    _nameOfEvent.textColor = [UIColor colorWithRed:[[_arrayGlobalSettings objectAtIndex:2] floatValue]/255 green:[[_arrayGlobalSettings  objectAtIndex:3] floatValue]/255 blue:[[_arrayGlobalSettings objectAtIndex:4]floatValue]/255 alpha:1];
    
}


-(IBAction)gameSelected:(UIButton*)sender {
    
    _gameSelected = sender.tag ;

    [self performSegueWithIdentifier:@"segueStartToGamePlay" sender:self];
}

-(void)prepareForSegue:(UIStoryboardSegue *)segue sender:(id)sender {
    
    if (([segue.identifier isEqualToString:@"segueStartToGamePlay"])) {
        
        GamePlayViewController *viewStartToGamePlay = [segue destinationViewController];
        viewStartToGamePlay.incomingGameNumber = _gameSelected ;
        viewStartToGamePlay.restoreMode = _restoreMode;
        [DefaultsDataManager saveData: @(_gameSelected) forKey:_keyForLastGameSelected];
        
        _restoreMode = 0;
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
