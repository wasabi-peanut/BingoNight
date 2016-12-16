//current
//  GamePlayViewController.m
//  Bingo Night 3.0
//
//  Created by Adam Schor on 7/31/15.
//  Copyright (c) 2015 AandA Development. All rights reserved.
//

#import "GamePlayViewController.h"
#import "DefaultsDataManager.h"

#import "BallColorView.h"


@interface GamePlayViewController ()

@end

@implementation GamePlayViewController

- (BOOL)prefersStatusBarHidden{
    return YES;
}


- (void)viewDidLoad {
    
    
#pragma mark SET UP MEASUREMENTS
    _height = [UIScreen mainScreen].bounds.size.height;
    _width = [UIScreen mainScreen].bounds.size.width;
    
    _ballCount = 0;
  
    //[[UIApplication sharedApplication] setStatusBarHidden:YES];
    
    _keyForCalledNumbers = @"keyForCalledNumbers";
    _useSpecialChecking = YES;
    
    _ready = YES;
    _winnerCycle = NO;
        [super viewDidLoad];
    // Do any additional setup after loading the view.
  
    _arrayCalledBalls = [[NSMutableArray alloc] init];
    _arrayCalledBallsLabels = [[NSMutableArray alloc]init];
    
    
}

-(void)viewDidAppear:(BOOL)animated {
     [self.navigationController setNavigationBarHidden:NO];
    
    if (_arrayCalledNumbers.count==0) {
        
    _arrayCalledNumbers = [[NSMutableArray alloc] init];
    [self openArray];
    }
   
    
    _isFirstNumber = YES;
    
    [self createBar];
   
    self.navigationItem.hidesBackButton = YES;
 
    
}

- (void)didReceiveMemoryWarning {
    [super didReceiveMemoryWarning];
    // Dispose of any resources that can be recreated.
}
#pragma mark BAR CREATION

-(void)createBar{
    
    UIBarButtonItem *undo = [[UIBarButtonItem alloc] initWithTitle:@"Undo" style:UIBarButtonItemStylePlain target:self action:@selector(deselectButton)];
    
    UIBarButtonItem *select = [[UIBarButtonItem alloc]initWithTitle:@"Choose Ball" style:UIBarButtonItemStylePlain target:self action:@selector(selectBall:)];
    UIBarButtonItem *check = [[UIBarButtonItem alloc]initWithTitle:@"Check Card" style:UIBarButtonItemStylePlain target:self action:@selector(checkingGame)];
    UIBarButtonItem *winner = [[UIBarButtonItem alloc] initWithTitle:@"Winner" style:UIBarButtonItemStylePlain target:self action:@selector(winnerPress)];
    UIBarButtonItem *notWinner = [[UIBarButtonItem alloc] initWithTitle:@"Return to Game" style:UIBarButtonItemStylePlain target:self action:@selector(cancelWinner)];
    UIBarButtonItem *goBack = [[UIBarButtonItem alloc] initWithTitle:@"Main Menu" style:UIBarButtonItemStylePlain target:self action:@selector(mainMenuPressed)];
    
    UIBarButtonItem *goBackReal = [[UIBarButtonItem alloc] initWithTitle:@"Confirm End Game" style:UIBarButtonItemStylePlain target:self action:@selector(returnToMainMenu)];
    
    UIBarButtonItem *flexSpace = [[UIBarButtonItem alloc] initWithBarButtonSystemItem:UIBarButtonSystemItemFlexibleSpace target:self action:nil];
    
        NSArray *buttonWithSelect = @[ flexSpace, select,flexSpace,check, flexSpace,goBack];

        NSArray *buttonWithoutSelect = @[undo, flexSpace,check, flexSpace,goBack];
    
        NSArray *buttonChecking = @[flexSpace, winner, flexSpace, notWinner, flexSpace,goBack];
    
        NSArray *buttonGoBack = @[flexSpace, goBackReal, flexSpace,notWinner];
    
        NSArray *buttonNotReady = @[ flexSpace,flexSpace,flexSpace,goBack];
    
    
    if (_useSelector==1 && _winnerCycle==NO)
        {
            if (_ready==YES) {
                self.navigationItem.rightBarButtonItems = buttonWithSelect;
                
            }
            if (_ready == NO) {
                self.navigationItem.rightBarButtonItems = buttonNotReady;
            }
            
    }
    
    if (_useSelector==0 && _winnerCycle== NO)
    {
        if (_ready == YES) {
           self.navigationItem.rightBarButtonItems = buttonWithoutSelect;
        }
    if (_ready == NO) {
           self.navigationItem.rightBarButtonItems = buttonNotReady;
    }
        
    }
    
    if (_winnerCycle == YES) {
        self.navigationItem.rightBarButtonItems = buttonChecking;
        
    }
    
    if (_goBack == YES) {
        self.navigationItem.rightBarButtonItems =buttonGoBack;
        
    }

}

#pragma mark ARRAYS
-(void) openArray {
    
     
    _keyForGameColorSettingsShell = @"keyForGameColorSettingsShell";
    _keyForGridsShell = @"keyForGridsShell";
    _keyForCoordinatesGrid = @"keyForCoordinatesGrid";
    _keyForCoordinatesColors = @"keyForCoordinatesColors";
    _keyForCoordinatesNameOfGame = @"keyForCoordinatesNameOfGame";
    _keyForGlobalSettings = @"keyForGlobalSettings";
    _keyForGameComments = @"keyForGameComments";
    
    
    
    
    _arrayGameColorSettingsShell = [[NSMutableArray alloc] initWithArray:[DefaultsDataManager getArrayForKey:_keyForGameColorSettingsShell]];
    _arrayGridsShell = [[NSMutableArray alloc] initWithArray:[DefaultsDataManager getArrayForKey:_keyForGridsShell]];
    _arrayCoordinatesGrids = [[NSMutableArray alloc] initWithArray:[DefaultsDataManager getArrayForKey:_keyForCoordinatesGrid]];
    _arrayCoordinatesColors = [[NSMutableArray alloc] initWithArray:[DefaultsDataManager getArrayForKey:_keyForCoordinatesColors]];
     _arrayCoordinatesNameOfGame = [[NSMutableArray alloc] initWithArray:[DefaultsDataManager getArrayForKey:_keyForCoordinatesNameOfGame]];
    _arrayGameComments = [[NSMutableArray alloc] initWithArray:[DefaultsDataManager getDataForKey:_keyForGameComments]];

    
    _arrayGlobalSettings = [[NSMutableArray alloc] initWithArray:[DefaultsDataManager getArrayForKey:_keyForGlobalSettings]];
    
    
    
   
    
    
    
    
    
    
    
    
  
    if (![_arrayGameColorSettingsShell count]) {
        
        _arrayGameColorSettings = [[NSMutableArray alloc] initWithObjects:
                                   @255,@255,@255,@255,@0,
                                   @0,@0,@0,@255,@255,
                                   @100,@165,@130,@130,@130,
                                   @0,@0,@255,@0,@0,
                                   @255,@0,
                                   nil];
        for (int x = 0; x<12; x++) {
            [_arrayGameColorSettingsShell addObject:_arrayGameColorSettings];
             }
    }


    
    
    if (![_arrayGlobalSettings count]) {
        _arrayGlobalSettings = [[NSMutableArray alloc]initWithObjects:@(YES),@"Name of Event",//UseSelector and Name 0,1
                                @100,@100,@100,//text color 2,3,4
                                @0,@255,@0,//background to text 5,6,7
                                @"Courier",@64, //font and size 8,9
                                @1, //10 is row number for font;
                                @1, //11 is row number for size;
                                @2,@2,@2, //12,13,14 is delay in seconds for roll, display and drop;
                                @1, //15 is use Smart Selector;
                                nil];
        
    }

    if (![_arrayGridsShell count]) {
            _arrayGridPatterns = [[NSMutableArray alloc] initWithObjects:
                                  @"Straight",
                                  @1,@0,@0,@0,@0,
                                  @1,@1,@1,@0,@0,
                                  @1,@0,@1,@0,@0,
                                  @1,@0,@0,@1,@0,
                                  @1,@1,@1,@1,@1,
                                  nil];
        for (int x = 0; x<12; x++) {
            [_arrayGridsShell addObject:_arrayGridPatterns];
        }
        
    }
    
    if (![_arrayCoordinatesNameOfGame count]) {
        
        for (int n=0; n<12; n++) {
            [_arrayCoordinatesNameOfGame insertObject:@"Name Is Here" atIndex:n];
        }
        
    }
    if (![_arrayCoordinatesGrids count]) {
        
        for (int n=0; n<12; n++) {
            [_arrayCoordinatesGrids insertObject:@0 atIndex:n];
        }
        
    }
    
    if (![_arrayCoordinatesColors count]) {
        
        for (int n=0; n<12; n++) {
            [_arrayCoordinatesColors insertObject:@0 atIndex:n];
        }
        
    }
    
    if (![_arrayGameComments count]){
        for (int n=0; n<12; n++) {
            [_arrayGameComments insertObject:@" " atIndex:n];
        }
    }
  
    
    
    NSInteger colorScheme = [_arrayCoordinatesColors[_incomingGameNumber-1]integerValue];
    NSInteger gridScheme = [_arrayCoordinatesGrids[_incomingGameNumber-1]integerValue];

    _arrayGameColorSettings = [[NSMutableArray alloc] initWithArray:_arrayGameColorSettingsShell[colorScheme]];
    _arrayGridPatterns =      [[NSMutableArray alloc] initWithArray:_arrayGridsShell[gridScheme]];
    _labelGameComments.text =  _arrayGameComments[_incomingGameNumber];
    
    
    
    _useSelector = [[_arrayGlobalSettings objectAtIndex:0] intValue];
    _useSmartSelector = [_arrayGlobalSettings[15] intValue];
    


    [self displayGame];
    
    }


#pragma mark SET UP GAME DISPLAY ...
-(void)displayGame {
    
    _arrayButtonsCreated = [[NSMutableArray alloc] init];
    
       
    //Colors from arrays here
    
    _screenBackgroundColor = [UIColor colorWithRed:[[_arrayGameColorSettings objectAtIndex:0] floatValue]/255.0f green:[[_arrayGameColorSettings objectAtIndex:1] floatValue]/255.0F blue:[[_arrayGameColorSettings objectAtIndex:2] floatValue]/255.0f alpha:1];
    self.view.backgroundColor = _screenBackgroundColor;
    
    _boxBackgroundColor =[UIColor colorWithRed:[[_arrayGameColorSettings objectAtIndex:3] floatValue]/255.0f green:[[_arrayGameColorSettings objectAtIndex:4] floatValue]/255.0F blue:[[_arrayGameColorSettings objectAtIndex:5] floatValue]/255.0f alpha:1];
    
    _boxLetterColor = [UIColor colorWithRed:[[_arrayGameColorSettings objectAtIndex:6] floatValue]/255.0f green:[[_arrayGameColorSettings objectAtIndex:7] floatValue]/255.0F blue:[[_arrayGameColorSettings objectAtIndex:8] floatValue]/255.0f alpha:1];
    
    _usedBoxBackgroundColor = [UIColor colorWithRed:[[_arrayGameColorSettings objectAtIndex:9] floatValue]/255.0f green:[[_arrayGameColorSettings objectAtIndex:10] floatValue]/255.0F blue:[[_arrayGameColorSettings objectAtIndex:11] floatValue]/255.0f alpha:1];
    
    _usedBoxLetterColor = [UIColor colorWithRed:[[_arrayGameColorSettings objectAtIndex:12] floatValue]/255.0f green:[[_arrayGameColorSettings objectAtIndex:13] floatValue]/255.0F blue:[[_arrayGameColorSettings objectAtIndex:14] floatValue]/255.0f alpha:1];
    
    _bingoLettersColor = [UIColor colorWithRed:[[_arrayGameColorSettings objectAtIndex:15] floatValue]/255.0f green:[[_arrayGameColorSettings objectAtIndex:16] floatValue]/255.0F blue:[[_arrayGameColorSettings objectAtIndex:17] floatValue]/255.0f alpha:1];
    
    _nameOfGameTextColor = [UIColor colorWithRed:[[_arrayGameColorSettings objectAtIndex:18] floatValue]/255.0f green:[[_arrayGameColorSettings objectAtIndex:19] floatValue]/255.0F blue:[[_arrayGameColorSettings objectAtIndex:20] floatValue]/255.0f alpha:1];
    
    _gridSelectedBoxColor = _boxBackgroundColor;
    _gridUnselectedBoxColor = _boxLetterColor;
    
    //create grid of numbers and bingo letters
#pragma mark SETTINGS FOR LARGE GRID
    
    int x;
    int y;
    int ystart = .1 * _height;
    int xstart = .025 * _width;
    int ygap = 5;
    int xgap = 5;

    int width = _width/18;
    int height = width;
    
    int xspace = width + xgap;
    int yspace = height + ygap;
    
    
#pragma mark SETTINGS FOR GAME DISPLAY
     int boxHeight = .05*_width;
     int boxWidth = boxHeight;
     int yGameDisplayStart = _height - 6*boxHeight;
    
    
    
#pragma mark SETTINGS FOR LAST CALLED 
    //DO NOT DELETE
    _lastCalledWidth = _width/10;
    _lastCalledHeight = _lastCalledWidth;
   
//    int xLastCalled = .45 * _width;
 //   int yLastCalled = _height - 2*_lastCalledHeight;
   // int yLastCalled2 = _height - _lastCalledHeight;
   // int spaceLastCalled = 15;
    //int fontSize = _lastCalledWidth*.7;
    
    //UIColor *lcBackgroundColor = [UIColor whiteColor];
    //UIColor *lcTextColor = [UIColor blackColor];

    

#pragma mark SETTINGS FOR RAILS
    int railHeight = 10;
    int topRailY = ystart + 5*yspace- ygap;
    int bottomRailY = yGameDisplayStart - railHeight;
    
    
    
    
#pragma mark SETTINGS FOR BALL AND PATH
    
    _ballBounceRange = topRailY-bottomRailY;
    _ballMoveDistance = _width*.5 + 100;
    _ballStartY = topRailY + height;
    _ballTextFont = @"Superclarendon-Regular";
    _ballTextColor = [UIColor blackColor];
    
    _ballRollTime = [[_arrayGlobalSettings objectAtIndex:12] integerValue];
    _ballDisplayTime = [[_arrayGlobalSettings objectAtIndex:13] integerValue];
    _ballDropTime = [[_arrayGlobalSettings objectAtIndex:14] integerValue];
   
    
   
    
    
    
    _gradient = [CAGradientLayer layer];
    
#pragma mark CREATE LARGE GRID
    
    for (int j = 1; j<76; j++)
    {
        
        if (j<16) {
            x= (j * xspace) + xstart;
            y = ystart;
            
            
        } else {
            if (j<31) {
                x = (j-15) * xspace + xstart;
                y = ystart + yspace;
            } else {
                if (j<46) {
                    x = (j -30) * xspace + xstart;
                    y = ystart + 2 * yspace;
                } else {
                    if (j <61) {
                        x = (j -45) * xspace + xstart;
                        y = ystart + 3 * yspace;
                    }else{
                        x = (j-60) * xspace + xstart;
                        y = ystart + 4 * yspace;
                    }
                    
                }
                
            }
            
        }
        
        
        UIButton *button = [UIButton buttonWithType:UIButtonTypeRoundedRect];
        button.tag = j;
        NSString *buttonLabel = [NSString stringWithFormat:@"%ld",(long)button.tag];
        
        
        button.frame = CGRectMake(x, y, width, height);
        [button setTitle:buttonLabel forState:UIControlStateNormal];
        [button addTarget:self action:@selector(numberPressed:) forControlEvents:UIControlEventTouchUpInside];
       // [button addTarget:self action:@selector(deselectButton) forControlEvents:UIControlEventTouchDragExit];
        
        
        button.backgroundColor = _boxBackgroundColor;
        button.tintColor = _boxLetterColor;
        
        button.layer.borderWidth=1.0f;
        button.layer.borderColor=[_boxLetterColor CGColor];
        button.layer.cornerRadius = 15;
        button.titleLabel.font = [UIFont fontWithName:@"Helvetica Bold" size:40];
        
        [_arrayButtonsCreated addObject:button];
        
        [self.view addSubview:button];
    }
    
    //add BINGO labels
    
    for (int k=1; k < 6; k++)
    {
        
        UILabel *letter = [[UILabel alloc] initWithFrame:CGRectMake(xstart-25, ystart + (k-1) * yspace, 60, 60)];
        letter.text = @"B";
        letter.font = [UIFont fontWithName:@"Marker Felt" size:75];
        letter.textAlignment = NSTextAlignmentCenter;
        
        
        letter.textColor = _bingoLettersColor;
        
        
        
        if (k == 1) {
            letter.text = @"B";
        } else {
            if (k == 2) {
                letter.text = @"I";
            } else {
                if (k == 3){
                    letter.text = @"N";
                }else
                    if (k == 4) {
                        letter.text = @"G";
                    }        else {
                        letter.text = @"O";
                    }
            }
        }
        
        
        [self.view addSubview:letter];
        
        
    }
    
   
    
#pragma mark SET UP GAME TYPE DISPLAY
    
    
    
    //Add grid for type of game
    UILabel *gameTitle = [[UILabel alloc] initWithFrame:CGRectMake(.05*_width+boxWidth, yGameDisplayStart-50, 5*boxWidth, boxHeight)];
    gameTitle.text = [_arrayCoordinatesNameOfGame objectAtIndex:_incomingGameNumber-1];
    
    
    gameTitle.textColor = _nameOfGameTextColor;
    gameTitle.backgroundColor = _screenBackgroundColor;
    gameTitle.textAlignment= NSTextAlignmentCenter;
    gameTitle.font = [UIFont fontWithName:@"Helvetica Bold" size:50];
    gameTitle.adjustsFontSizeToFitWidth = YES;
    
    [self.view addSubview:gameTitle];
   
    int xForGrid ;
    int yForGrid ;
    int gapFromBottomForGrid =35;
    
    
    for (int s = 1; s<26; s++) {
        
        if (s < 6) {
            xForGrid = .05*_width + boxWidth * s;
            yForGrid = _height - 5 * boxHeight-gapFromBottomForGrid;}
        else {
            if (s < 11) {
                xForGrid = .05*_width + (boxWidth * (s-5));
                yForGrid = _height - 4* boxHeight-gapFromBottomForGrid;}
            else {
                if (s < 16){
                    xForGrid = .05*_width  + (boxWidth * (s-10));
                    yForGrid = _height - 3 * boxHeight-gapFromBottomForGrid;}
                else{
                    if (s < 21){
                        xForGrid = .05*_width  + (boxWidth * (s-15));
                        yForGrid = _height - 2 *boxHeight-gapFromBottomForGrid;}
                    else{
                        xForGrid = .05*_width  + (boxWidth * (s-20));
                        yForGrid = _height - 1 *boxHeight-gapFromBottomForGrid;}
                }
            }
        }
        
        
        
        UILabel *squares = [[UILabel alloc] initWithFrame:CGRectMake(xForGrid, yForGrid, boxHeight, boxHeight)];
        
        
        NSInteger colorchoiceInt = [[_arrayGridPatterns objectAtIndex:s] integerValue];
        NSString *markerText;
        UIColor *fontColor;
        switch (colorchoiceInt) {
            case 0:
                
                break;
                
            case 1:
                
                switch ([_arrayGameColorSettings[21] integerValue]) {
                    case 0:
                        markerText = @"\u26AA";
                        break;
                    case 1:
                        markerText = @"\u26AB";
                        break;
                    case 2:
                        markerText = @"\u272D";
                        fontColor = [UIColor greenColor];
                        break;
                    case 3:
                        markerText = @"\u272A";
                        break;
                    case 4:
                        markerText = @"\u25CF";
                        break;
                    case 5:
                        markerText = @"\u272A";
                        break;
                    case 6:
                        markerText = @"\u263c";
                        break;
                    case 7:
                        markerText = @"\u2600";
                        break;
                    case 8:
                        markerText = @"\u2726";
                        break;
                    default:
                        break;
                }

                
                squares.text = markerText;
                squares.textAlignment = NSTextAlignmentCenter;
                squares.textColor = fontColor;
                squares.font = [UIFont fontWithName:@"Helvetica" size:50];
                
                
                
               
              /*
                
                squares.contentVerticalAlignment = UIControlContentVerticalAlignmentCenter;
                squares.contentHorizontalAlignment = UIControlContentHorizontalAlignmentCenter;
                squares.titleLabel.font = [UIFont fontWithName:@"Helvetica" size:60];
                squares.titleLabel.adjustsFontSizeToFitWidth = YES;
                squares.titleLabel.textColor = [UIColor blackColor];
                [squares setTitleColor:_boxLetterColor forState:UIControlStateNormal];
                
            */
                
                break;
                
                
        }
        
        squares.backgroundColor = _boxBackgroundColor;

        squares.layer.borderColor = [[UIColor blackColor] CGColor];
        squares.layer.borderWidth = 2.0f;
        [self.view addSubview:squares];
        
        
    }
    
    
  /*  UIView *gridFrame = [[UIView alloc] initWithFrame:CGRectMake(.05*_width + boxWidth - 35, _height - 5 * boxHeight-70, boxWidth*6+10, boxHeight*6+10)];
    gridFrame.backgroundColor = _bingoLettersColor;
    gridFrame.layer.borderColor = [[UIColor blackColor] CGColor];
    gridFrame.layer.borderWidth = 3;
    gridFrame.layer.cornerRadius = 20;
    [self.view addSubview:gridFrame];
    [self.view sendSubviewToBack:gridFrame];
    */
   
#pragma mark SET UP GAME COMMENTS BOX
    
    if ([_arrayGameComments[_incomingGameNumber-1] isEqualToString:@" "]) {
        _labelGameComments.layer.borderColor = [_screenBackgroundColor CGColor];
        _labelGameComments.layer.borderWidth =0;
        _labelGameComments.backgroundColor = _screenBackgroundColor;
    }
    else {
    _labelGameComments.layer.borderColor = [_boxLetterColor CGColor];
    _labelGameComments.layer.borderWidth =3;
    _labelGameComments.backgroundColor = _boxBackgroundColor;
    }
    
    _labelGameComments.textColor = _boxLetterColor;
    _labelGameComments.textAlignment = NSTextAlignmentCenter;
    _labelGameComments.font = [UIFont fontWithName:@"Helvetica" size:200];
    _labelGameComments.text =_arrayGameComments[_incomingGameNumber-1];
    _labelGameComments.layer.cornerRadius = 25;
    _labelGameComments.clipsToBounds = YES;
    _labelGameComments.numberOfLines = 0;
    _labelGameComments.adjustsFontSizeToFitWidth = YES;
    
    
    
}
#pragma mark BALL SELECTION STUFF
-(void)numberPressed: (UIButton *) sender {
    
    if (_ready == YES && _useSelector == 0 && sender.tag != 0) {
        
        _ballCount = _ballCount + 1;
    
        _stringCalled = [NSString alloc];
    
        _numberCalled = sender.tag;
        
            if (sender.tag < 16) {
                _stringCalled = [NSString stringWithFormat:@("B%d"),sender.tag];}
            else {
                if (sender.tag < 31) {
                    _stringCalled = [NSString stringWithFormat:@("I%d"),sender.tag];}
                else {
                    if (sender.tag < 46){
                        _stringCalled = [NSString stringWithFormat:@("N%d"), sender.tag];}
                    else{
                        if (sender.tag < 61){
                            _stringCalled = [NSString stringWithFormat:@("G%d"), sender.tag];}
                        else{
                            _stringCalled = [NSString stringWithFormat:@("O%d"), sender.tag];}
                    }
                }
            }

    
            sender.tintColor = _usedBoxLetterColor;
            sender.backgroundColor = _usedBoxBackgroundColor;
            
            _labelCalled.alpha = 0;
    
            [self selectedBallAction];
        
            sender.tag = 0;
            _ready = NO;
        [self createBar];
    }
    
    
    
}


-(IBAction)selectBall:(id)sender{
    if (_ready == YES) {
    
    
    if (_ballCount == 0) {
        [self makeArrayOfBalls];
        [self chooseBall];
        
    }
    else {
        [self chooseBall];
    }
    }
}

-(void)makeArrayOfBalls{
    int limit = 76;
    _bingoArray = [[NSMutableArray alloc] init];
    
    for (int x = 1; x<limit; x++) {
        [_bingoArray addObject:@(x)];
        
    }
    
    if (_useSmartSelector == 1) {
    
    //code to exclude columns
    
    NSMutableArray *tempArrayOfNumbers = [[NSMutableArray alloc] init];
    
        if ([_arrayGridPatterns[1] isEqual:@0] &&
            [_arrayGridPatterns[6] isEqual:@0] &&
            [_arrayGridPatterns[11] isEqual:@0] &&
            [_arrayGridPatterns[16] isEqual:@0] &&
            [_arrayGridPatterns[21] isEqual:@0])
        {
            
            
            for (NSString *gridMark in _bingoArray) {
                if ([gridMark integerValue]<16) {
                    [tempArrayOfNumbers addObject:gridMark];
            
        }
            }
        }
 
    if ([_arrayGridPatterns[2] isEqual:@0]&&
        [_arrayGridPatterns[7] isEqual:@0]&&
        [_arrayGridPatterns[12] isEqual:@0]&&
        [_arrayGridPatterns[17] isEqual:@0]&&
        [_arrayGridPatterns[22] isEqual:@0]) {
        
        for (NSString *gridMark in _bingoArray) {
            if ([gridMark integerValue]>15 && [gridMark integerValue]<31) {
                [tempArrayOfNumbers addObject:gridMark];
                
            }
        }
    }
    
   
    if ([_arrayGridPatterns[3] isEqual:@0]&&
        [_arrayGridPatterns[8] isEqual:@0]&&
        [_arrayGridPatterns[13] isEqual:@0]&&
        [_arrayGridPatterns[18] isEqual:@0]&&
        [_arrayGridPatterns[23] isEqual:@0])
    {
        
        for (NSString *gridMark in _bingoArray) {
            if ([gridMark integerValue]>30 && [gridMark integerValue]<46) {
                [tempArrayOfNumbers addObject:gridMark];
                
            }
        }
    }

    if ([_arrayGridPatterns[4] isEqual:@0] &&
        [_arrayGridPatterns[9] isEqual:@0] &&
        [_arrayGridPatterns[14] isEqual:@0] &&
        [_arrayGridPatterns[19] isEqual:@0] &&
        [_arrayGridPatterns[24] isEqual:@0]) {
        
        for (NSString *gridMark in _bingoArray) {
            if ([gridMark integerValue]>45 && [gridMark integerValue]<61) {
                [tempArrayOfNumbers addObject:gridMark];
                
            }
        }
    }
    
    if ([_arrayGridPatterns[5] isEqual:@0] &&
        [_arrayGridPatterns[10] isEqual:@0] &&
        [_arrayGridPatterns[15] isEqual:@0] &&
        [_arrayGridPatterns[20] isEqual:@0] &&
        [_arrayGridPatterns[25] isEqual:@0]) {
        
        for (NSString *gridMark in _bingoArray) {
            if ([gridMark integerValue]>60 && [gridMark integerValue]<76) {
                [tempArrayOfNumbers addObject:gridMark];
                
            }
        }
    }
       
        if (tempArrayOfNumbers.count != 75) {
            
    [_bingoArray removeObjectsInArray:tempArrayOfNumbers];
    
    }
    }
    
    
   NSUInteger count;
    count = _bingoArray.count ;
    
    int i;
    for (i  = 0; i< count; i++) {
       u_int32_t countRemaining;
        
        countRemaining = count - i;
       
        
        int exchangeIndex = i +arc4random_uniform(countRemaining);
        
        [_bingoArray exchangeObjectAtIndex:i withObjectAtIndex:exchangeIndex];
        [_arrayButtonsCreated exchangeObjectAtIndex:i withObjectAtIndex:exchangeIndex];
        
    }
    
    
    
    
}

-(void)chooseBall {
    _ready = NO;
   
    if (_ballCount <_bingoArray.count) {
        [self createBar];
   
    _stringCalled = [NSString alloc];
    NSInteger calledNumber = [[_bingoArray objectAtIndex:_ballCount] integerValue];
        _numberCalled = calledNumber;
        
    
    if (calledNumber < 16) {
        _stringCalled = [NSString stringWithFormat:@("B%d"),calledNumber];}
    else {
        if (calledNumber < 31) {
            _stringCalled = [NSString stringWithFormat:@("I%d"),calledNumber];}
        else {
            if (calledNumber < 46){
                _stringCalled = [NSString stringWithFormat:@("N%d"), calledNumber];}
            else{
                if (calledNumber < 61){
                    _stringCalled = [NSString stringWithFormat:@("G%d"), calledNumber];}
                else{
                    _stringCalled = [NSString stringWithFormat:@("O%d"), calledNumber];}
            }
        }
    }
        
        
        [self selectedBallAction];
        
        
        
        _ballCount = _ballCount + 1;
    }


}

-(void)checkingGame {
    
    if (_useSpecialChecking == YES) {
        [self performSegueWithIdentifier:@"segueGameToChecking" sender:self];
         }
   
    else {
    _checking = [[UILabel alloc] initWithFrame:CGRectMake (400, 650, 515, 100)];
    _checking.text = @"Hold Your Cards";
    _checking.backgroundColor = _boxBackgroundColor;
    _checking.textColor = _boxLetterColor;
    _checking.font = [UIFont fontWithName:@"Courier" size:56];
    _checking.textAlignment = NSTextAlignmentCenter;
    
    
    [self.view addSubview:_checking];
    
    _checking.alpha = 0;
    [UIView animateWithDuration:1.0 delay:0.5 options:UIViewAnimationOptionRepeat | UIViewAnimationOptionAutoreverse animations:^{
        _checking.alpha = 1;
    } completion:nil];
    
    _winnerCycle = YES;
    [self createBar];
    
    _ready = NO;
        [self createBar];
    
    //TO STOP FLASHING
     //[checking.layer removeAllAnimations];
    
    }
    
    
    
}

-(void)winnerPress{
    [_checking.layer removeAllAnimations];
    _checking.text = @"Winner";
    
    [self createBar];
    
    

    
}

-(void)cancelWinner {
    [_checking.layer removeAllAnimations];
    [_checking removeFromSuperview];
    _winnerCycle = NO;
    _ready = YES;
    _goBack = NO;
    [self createBar];
    
    
    
}

-(void)mainMenuPressed {
    _goBack = YES;
    [self createBar];
    
}

-(void)returnToMainMenu {
   [self.navigationController popToViewController:[self.navigationController.viewControllers objectAtIndex:1] animated:YES];
    
    
}

-(void)deselectButton {
    if (_ballCount>0&_arrayCalledNumbers.count>0) {
       // NSLog(@"This is the array called numbers %@ and this is ball count %i",_arrayCalledNumbers,_ballCount);
        
    _numberCalled = [_arrayCalledNumbers[_ballCount-1] integerValue];
    _ballCount = _ballCount - 1;
    
    UIButton *activeButton = [[UIButton alloc] init];
    activeButton = _arrayButtonsCreated[_numberCalled-1];
    
    activeButton.backgroundColor = _boxBackgroundColor;
    activeButton.tintColor = _boxLetterColor;
    activeButton.tag = [_arrayCalledNumbers[_ballCount] integerValue];
    
       
    
    [_arrayCalledBalls[0] removeFromSuperview];
    [_arrayCalledBalls removeObjectAtIndex:0];
    [_arrayCalledNumbers removeLastObject];
        
    [DefaultsDataManager saveData:_arrayCalledNumbers forKey:_keyForCalledNumbers];
    
    
    }

}




-(void)selectedBallAction{
    
    [_arrayCalledNumbers addObject: @(_numberCalled)];
    [DefaultsDataManager saveData:_arrayCalledNumbers forKey:_keyForCalledNumbers];
    
    
    UIView *shadow =[[UIView alloc] init];
    shadow.layer.shadowColor = [[UIColor blackColor] CGColor];
    shadow.layer.shadowOpacity = 0.5f;
    
    shadow.layer.shadowOffset = CGSizeMake(5.0f, 5.0f);
    shadow.layer.shadowRadius = 5.0f;
    shadow.layer.masksToBounds = NO;
    
    BallColorView *activeBall =[[BallColorView alloc] initWithFrame:CGRectMake(0, 0, _lastCalledWidth/1, _lastCalledHeight/1)];
    activeBall =[[BallColorView alloc] initWithFrame:CGRectMake(0, 0, _lastCalledWidth/1, _lastCalledHeight/1)];
    activeBall.layer.cornerRadius = activeBall.bounds.size.height/2;
    activeBall.clipsToBounds = YES;
    
    [self.view addSubview:activeBall];
    
    UILabel *number = [[UILabel alloc]initWithFrame:CGRectMake(0,0, _lastCalledWidth/1 , _lastCalledHeight/1)];
    number.center = activeBall.center;
    number.text =  _stringCalled;
    
    number.textColor = _ballTextColor;
    [number setTextAlignment:NSTextAlignmentCenter];
    number.font = [UIFont fontWithName:_ballTextFont size:_lastCalledHeight*.4];
    
    number.backgroundColor = [UIColor clearColor];
    if (_useSelector == 1) {
        number.alpha = 0;}
    
    number.layer.contentsScale = 8.0f;
    
    
    [activeBall addSubview:number];
    [shadow addSubview:activeBall];
    [self.view addSubview:shadow];
    
    
    activeBall.center = CGPointMake(-100, _ballStartY);
    
    
 
    [_arrayCalledBallsLabels insertObject:number atIndex:0];
    [_arrayCalledBalls insertObject:activeBall atIndex:0];
    
    
    
    
    
    [CATransaction begin];
    [CATransaction setCompletionBlock:^{
        
        
        [self moveTwo];
        
        
    }];
   
    
    
    CABasicAnimation *move = [CABasicAnimation animationWithKeyPath:@"transform.translation.x" ];
    [move setFromValue:[NSNumber numberWithFloat:0.0f]];
    [move setByValue:[NSNumber numberWithFloat:_ballMoveDistance]];
    [move setBeginTime:CACurrentMediaTime() + 1];
    [move setDuration:_ballRollTime];
    move.removedOnCompletion = NO;
    move.autoreverses = NO;
    move.fillMode = kCAFillModeForwards;
    
    
    
    CABasicAnimation *spin = [CABasicAnimation animationWithKeyPath:@"transform.rotation.z"];
    spin=[CABasicAnimation animationWithKeyPath:@"transform.rotation.z"];
    [spin setDuration: 1];
    spin.repeatCount=_ballRollTime;
    spin.autoreverses=NO;
    [spin setBeginTime:CACurrentMediaTime() + 1];
    spin.fromValue=[NSNumber numberWithFloat:0];
    spin.toValue=[NSNumber numberWithFloat:2*M_PI];
    spin.removedOnCompletion = NO;
    spin.fillMode = kCAFillModeForwards;
    
    
    CABasicAnimation *bounce = [CABasicAnimation animationWithKeyPath:@"transform.translation.y"];
    [bounce setFromValue:[NSNumber numberWithFloat:0.0f]];
    [bounce setByValue:[NSNumber numberWithFloat:-10]];
    [bounce setBeginTime:CACurrentMediaTime() + 1];
    [bounce setDuration:0.25f];
    bounce.repeatCount = _ballRollTime/0.25f/2;
    bounce.autoreverses = YES;
    bounce.removedOnCompletion = NO;
    
    CABasicAnimation *enlarge = [CABasicAnimation animationWithKeyPath:@"transform.scale"];
    enlarge.timingFunction = [CAMediaTimingFunction functionWithName:kCAMediaTimingFunctionLinear];
    enlarge.fromValue = [NSNumber numberWithFloat:1.0f];
    enlarge.toValue = [NSNumber numberWithFloat:4.0f];
    enlarge.duration = _ballDisplayTime;
    enlarge.removedOnCompletion = NO;
    [enlarge setBeginTime:CACurrentMediaTime()+_ballRollTime+1];
    enlarge.fillMode = kCAFillModeForwards;
    enlarge.autoreverses = NO;
    
    
    [((BallColorView *)_arrayCalledBalls[0]).layer addAnimation:move forKey:@"move"];
    [((UILabel *) _arrayCalledBallsLabels[0]).layer addAnimation:spin forKey:nil];
    [((BallColorView *)_arrayCalledBalls[0]).layer addAnimation:bounce forKey:nil];
    [((BallColorView *)_arrayCalledBalls[0]).layer addAnimation:enlarge forKey:nil];
    
    
    [CATransaction commit];
    
    [UIView animateWithDuration:2 delay:_ballRollTime options:UIViewAnimationOptionCurveEaseIn animations:^{
       ((UILabel *) _arrayCalledBallsLabels[0]).alpha = 1;
    } completion:^(BOOL finished) {
        
    }];
    
    
}


-(void)moveTwo{
    
    [CATransaction begin];
    
    [CATransaction setCompletionBlock:^{
        if (_ballCount>5) {
            [((BallColorView *)_arrayCalledBalls[5]) removeFromSuperview];
            [_arrayCalledBalls removeObjectAtIndex:5];
            [_arrayCalledBallsLabels removeObjectAtIndex:5];
            
        }
        
            _ready = YES;
        [self createBar];
        if (_useSelector) {
            for (UIButton *myButton in _arrayButtonsCreated) {
               // NSLog(@"My tag is %i and number called is %i",myButton.tag,_numberCalled);
                if (myButton.tag == _numberCalled){
                    myButton.backgroundColor = _usedBoxBackgroundColor;
                    myButton.tintColor = _usedBoxLetterColor;
                }
            }
            
            //UIButton *currentButton = [_arrayButtonsCreated objectAtIndex:_ballCount-1];
            //currentButton.backgroundColor = _usedBoxBackgroundColor;
            //currentButton.tintColor = _usedBoxLetterColor;
        }
      
    }];
    
 
    
    CABasicAnimation *shrink = [CABasicAnimation animationWithKeyPath:@"transform.scale"];
    shrink.beginTime = CACurrentMediaTime() + _ballDisplayTime;
    shrink.timingFunction = [CAMediaTimingFunction functionWithName:kCAMediaTimingFunctionLinear];
    shrink.fromValue  = [NSNumber numberWithFloat:4.0f];
    shrink.toValue =[NSNumber numberWithFloat:1.0f];
    shrink.duration = 1;
    shrink.autoreverses = NO;
    shrink.fillMode = kCAFillModeForwards;
    shrink.removedOnCompletion = NO;
    
    
    CABasicAnimation *move = [CABasicAnimation animationWithKeyPath:@"transform.translation.x" ];
    [move setFromValue:[NSNumber numberWithFloat:.5*_width+100]];
    [move setToValue:[NSNumber numberWithFloat:0.45f * _width+100+_lastCalledWidth/2]];
    [move setBeginTime:CACurrentMediaTime() +_ballDisplayTime+1];
    [move setDuration:_ballDropTime];
    move.removedOnCompletion = NO;
    move.autoreverses = NO;
    move.fillMode = kCAFillModeForwards;
    
    CABasicAnimation *moveDown = [CABasicAnimation animationWithKeyPath:@"transform.translation.y" ];
    [moveDown setFromValue:[NSNumber numberWithFloat:0]];
    [moveDown setByValue:[NSNumber numberWithFloat:_height-_ballStartY-_lastCalledHeight/2]];
    [moveDown setBeginTime:CACurrentMediaTime() + 2 + _ballDisplayTime ];
    [moveDown setDuration:_ballDropTime];
    moveDown.removedOnCompletion = NO;
    moveDown.autoreverses = NO;
    moveDown.fillMode = kCAFillModeForwards;
  
    CABasicAnimation *spin = [CABasicAnimation animationWithKeyPath:@"transform.rotation.z"];
    spin.duration=_ballDropTime;
    spin.repeatCount=1;
    spin.autoreverses=NO;
    [spin setBeginTime:CACurrentMediaTime() + _ballDisplayTime + 2];
    spin.fromValue=[NSNumber numberWithFloat:0];
    spin.toValue=[NSNumber numberWithFloat:2*M_PI];
    spin.removedOnCompletion = NO;
    spin.fillMode = kCAFillModeForwards;
    
    CABasicAnimation *bounce = [CABasicAnimation animationWithKeyPath:@"transform.translation.y"];
    [bounce setFromValue:[NSNumber numberWithFloat:_height-_ballStartY-_lastCalledHeight/2]];
    [bounce setByValue:[NSNumber numberWithFloat:-5]];
    [bounce setBeginTime:CACurrentMediaTime() + 2+ _ballDisplayTime + _ballDropTime];
    [bounce setDuration:0.25];
    bounce.repeatCount = 2;
    bounce.autoreverses = YES;
    bounce.removedOnCompletion = NO;
    
    CABasicAnimation *spinToRight = [CABasicAnimation animationWithKeyPath:@"transform.rotation.z"];
    spinToRight.duration=1;
    spinToRight.repeatCount=0;
    spinToRight.autoreverses=NO;
    [spinToRight setBeginTime:CACurrentMediaTime() + 2 + _ballDisplayTime];
    spinToRight.fromValue=[NSNumber numberWithFloat:0];
    spinToRight.toValue=[NSNumber numberWithFloat:2*M_PI];
    spinToRight.removedOnCompletion = NO;
    spinToRight.fillMode = kCAFillModeForwards;
    

    CABasicAnimation *shiftRight1 = [CABasicAnimation animationWithKeyPath:@"transform.translation.x"];
    [shiftRight1 setToValue:[NSNumber numberWithFloat:.45*_width + 100+ 1.5*_lastCalledWidth]];
    [shiftRight1 setBeginTime:CACurrentMediaTime()+ 2 + _ballDisplayTime];
    [shiftRight1 setDuration:1.0f];
    shiftRight1.autoreverses = NO;
    shiftRight1.removedOnCompletion = NO;
    shiftRight1.fillMode = kCAFillModeForwards;
    
    CABasicAnimation *shiftRight2 = [CABasicAnimation animationWithKeyPath:@"transform.translation.x"];
    [shiftRight2 setToValue:[NSNumber numberWithFloat:.45*_width + 100+ 2.5*_lastCalledWidth]];
    [shiftRight2 setBeginTime:CACurrentMediaTime()+ 2 + _ballDisplayTime];
    [shiftRight2 setDuration:1.0f];
    shiftRight2.autoreverses = NO;
    shiftRight2.removedOnCompletion = NO;
    shiftRight2.fillMode = kCAFillModeForwards;
    
    CABasicAnimation *shiftRight3 = [CABasicAnimation animationWithKeyPath:@"transform.translation.x"];
    [shiftRight3 setToValue:[NSNumber numberWithFloat:.45*_width + 100+ 3.5*_lastCalledWidth]];
    [shiftRight3 setBeginTime:CACurrentMediaTime()+ 2 + _ballDisplayTime];
    [shiftRight3 setDuration:1.0f];
    shiftRight3.autoreverses = NO;
    shiftRight3.removedOnCompletion = NO;
    shiftRight3.fillMode = kCAFillModeForwards;
    
    CABasicAnimation *shiftRight4 = [CABasicAnimation animationWithKeyPath:@"transform.translation.x"];
    [shiftRight4 setToValue:[NSNumber numberWithFloat:.45*_width + 100+ 4.5*_lastCalledWidth]];
    [shiftRight4 setBeginTime:CACurrentMediaTime()+ 2 + _ballDisplayTime];
    [shiftRight4 setDuration:1.0f];
    shiftRight4.autoreverses = NO;
    shiftRight4.removedOnCompletion = NO;
    shiftRight4.fillMode = kCAFillModeForwards;
    
    CABasicAnimation *shiftRight5 = [CABasicAnimation animationWithKeyPath:@"transform.translation.x"];
    [shiftRight5 setToValue:[NSNumber numberWithFloat:.45*_width + 100+ 7.5*_lastCalledWidth]];
    [shiftRight5 setBeginTime:CACurrentMediaTime()+ 2 + _ballDisplayTime];
    [shiftRight5 setDuration:1.0f];
    shiftRight5.autoreverses = NO;
    shiftRight5.removedOnCompletion = NO;
    shiftRight5.fillMode = kCAFillModeForwards;
    
    
    [((BallColorView *)_arrayCalledBalls[0]).layer addAnimation:shrink forKey:@"shrink"];
    [((BallColorView *)_arrayCalledBalls[0]).layer addAnimation:move forKey:nil];
    [((BallColorView *)_arrayCalledBalls[0]).layer addAnimation:moveDown forKey:nil];
    [((UILabel *) _arrayCalledBallsLabels[0]).layer addAnimation:spin forKey:nil];
    [((BallColorView *)_arrayCalledBalls[0]).layer addAnimation:bounce forKey:nil];
    
    if (_ballCount>1) {
       [((BallColorView *)_arrayCalledBalls[1]).layer addAnimation:shiftRight1 forKey:nil];
        [((UILabel *) _arrayCalledBallsLabels[1]).layer addAnimation:spinToRight forKey:nil];

    }
    if (_ballCount>2) {
        [((BallColorView *)_arrayCalledBalls[2]).layer addAnimation:shiftRight2 forKey:nil];
        [((UILabel *) _arrayCalledBallsLabels[2]).layer addAnimation:spinToRight forKey:nil];
    }
    if (_ballCount>3) {
        [((BallColorView *)_arrayCalledBalls[3]).layer addAnimation:shiftRight3 forKey:nil];
        [((UILabel *) _arrayCalledBallsLabels[3]).layer addAnimation:spinToRight forKey:nil];
    }
    if (_ballCount>4) {
        [((BallColorView *)_arrayCalledBalls[4]).layer addAnimation:shiftRight4 forKey:nil];
        [((UILabel *) _arrayCalledBallsLabels[4]).layer addAnimation:spinToRight forKey:nil];
    }

    if (_ballCount>5) {
        [((BallColorView *)_arrayCalledBalls[5]).layer addAnimation:shiftRight5 forKey:nil];
        [((UILabel *) _arrayCalledBallsLabels[5]).layer addAnimation:spinToRight forKey:nil];
        
    }

    
    [CATransaction commit];
    
}



@end
