//current
//  GamePlayViewController.h
//  Bingo Night 3.0
//
//  Created by Adam Schor on 7/31/15.
//  Copyright (c) 2015 AandA Development. All rights reserved.
//

#import <UIKit/UIKit.h>
#import "BallColorView.h"


@interface GamePlayViewController : UIViewController

//DIMENSIONS
@property CGFloat height;
@property CGFloat width;



@property NSInteger incomingGameNumber;

@property (strong, nonatomic) NSString *keyForGameSettings;
@property (strong, nonatomic) NSString *keyForGlobalSettings;
//@property (strong, nonatomic) NSMutableArray *arrayGameSettings;
@property (strong, nonatomic) NSMutableArray *arrayGlobalSettings;
@property (strong, nonatomic) NSString *keyForCalledNumbers;



@property (strong, nonatomic) UILabel *labelCalled;

@property int useSelector;
@property int useSmartSelector;





//labels and colors
@property UIColor *screenBackgroundColor;
@property UIColor *boxBackgroundColor;
@property UIColor *boxLetterColor;
@property UIColor *selectedBackgroundColor;
@property UIColor *selectedLetterColor;
@property UIColor *gridSelectedBoxColor;
@property UIColor *gridUnselectedBoxColor;
@property UIColor *nameOfGameLabelColor;
@property UIColor *nameOfGameTextColor;
@property UIColor *bingoLettersColor;
@property UIColor *usedBoxBackgroundColor;
@property UIColor *usedBoxLetterColor;
@property UIColor *lastCalledTitleColor;
@property UIColor *lastCalledColor;
@property UIColor *mostRecentLastCalledColor;

@property (strong,nonatomic) NSString *nameOfGame;

//Last Called

@property int lastCalledNumber;

/*@property (strong, nonatomic) IBOutlet UILabel *LC1;
@property (strong, nonatomic) IBOutlet UILabel *LC2;
@property (strong, nonatomic) IBOutlet UILabel *LC3;
@property (strong, nonatomic) IBOutlet UILabel *LC4;
@property (strong, nonatomic) IBOutlet UILabel *LC5;
@property NSString *LCExtra;
*/

@property Boolean isFirstNumber;

@property int lastCalledWidth;
@property int lastCalledHeight;



//SELECT BALL
//@property (strong, nonatomic) IBOutlet UIBarButtonItem *btnSelect;

-(IBAction)selectBall:(id)sender;
@property NSInteger ballCount;
@property (strong, nonatomic) NSMutableArray *bingoArray;
@property (strong,nonatomic) NSMutableArray *arrayCalledNumbers;
@property NSInteger numberCalled;
@property (strong,nonatomic) NSString *stringCalled;


@property (strong,nonatomic) UILabel *movingBall;

@property (strong,nonatomic) UIView *ballActive;
@property (strong,nonatomic) UILabel *ballText;
@property (strong,nonatomic) UIColor *ballTextColor;
@property (strong,nonatomic) NSString *ballTextFont;


@property int ballStartY;
@property int ballBounceRange;
@property CGFloat ballMoveDistance;

@property NSInteger ballRollTime;
@property NSInteger ballDisplayTime;
@property NSInteger ballDropTime;

@property double ballDisplayTimePct;




@property BallColorView *ballViewMain;
@property UILabel *number;


@property NSMutableArray *arrayCalledBalls;
@property NSMutableArray *arrayCalledBallsLabels;

@property Boolean hasBeenCalled;

@property Boolean gameUnderway;

@property Boolean ready;

//TIME BETWEEN DISPLAY
@property double displayLag;

//OTHER

@property Boolean winnerCycle;
@property (strong, nonatomic) UILabel *checking;
@property Boolean winnerPressedOnce;
@property Boolean goBack;

@property (strong, nonatomic) NSMutableArray *arrayButtonsCreated;

@property NSInteger restoreMode;

@property CAGradientLayer *gradient;


@property (strong, nonatomic) IBOutlet UILabel *labelGameComments;

//CHECKING SWITCH
@property Boolean useSpecialChecking;

//KEYS
@property (strong, nonatomic) NSString *keyForGameColorSettingsShell;
@property (strong, nonatomic) NSString *keyForGridsShell;
@property (strong, nonatomic) NSString *keyForCoordinatesGrid;
@property (strong, nonatomic) NSString *keyForCoordinatesColors;
@property (strong, nonatomic) NSString *keyForCoordinatesNameOfGame;
@property (strong, nonatomic) NSString *keyForGameComments;
@property (strong, nonatomic) NSString *keyForRestoredGame;



//ARRAYS
@property (strong, nonatomic) NSMutableArray *arrayGameColorSettings;
@property (strong, nonatomic) NSMutableArray *arrayGameColorSettingsShell;

@property (strong,nonatomic)NSMutableArray *arrayGridPatterns;
@property (strong, nonatomic) NSMutableArray *arrayGridsShell;

@property (strong, nonatomic) NSMutableArray *arrayCoordinatesGrids;
@property (strong, nonatomic) NSMutableArray *arrayCoordinatesColors;
@property (strong, nonatomic) NSMutableArray *arrayCoordinatesNameOfGame;
@property (strong, nonatomic) NSMutableArray *arrayGameComments;

@property (strong,nonatomic)  NSMutableArray *arrayMarkers;



@end
