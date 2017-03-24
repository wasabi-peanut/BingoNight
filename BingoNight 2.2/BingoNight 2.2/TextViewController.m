//
//  TextViewController.m
//  BingoNight 2.2
//
//  Created by Adam Schor on 12/7/16.
//  Copyright © 2016 AandA Development. All rights reserved.
//

#import "TextViewController.h"
#import "InstructionsTableViewController.h"

@interface TextViewController ()

@end

@implementation TextViewController

- (void)viewDidLoad {
    [super viewDidLoad];
    // Do any additional setup after loading the view.
    
    
    [self createContentArrays];
    [self chooseContent];
    
    
}

- (void)didReceiveMemoryWarning {
    [super didReceiveMemoryWarning];
    // Dispose of any resources that can be recreated.
}

-(void)chooseContent {
    
    NSString * content;
    
    switch (_sendingSection) {
        case 0:
            content = _arrayContentIntro[_sendingRow];
            break;
        case 1:
            content = _arrayContentGamePlay[_sendingRow];
            break;
        case 2:
            content = _arrayContentSetupLocal[_sendingRow];
            break;
        case 3:
            content = _arrayContentSetupGlobal[_sendingRow];
            break;
        case 4:
            content = _arrayContentRestore[_sendingRow];
            break;
        default:
            
            break;
    }
    
    UIFont *boldFont = [UIFont fontWithName:@"Helvetica" size:24];
    
    UIColor*fontColor = [UIColor redColor];
    
    NSRange boldedRange = NSMakeRange(0, _incomingTopic.length);
    NSString *text = [NSString stringWithFormat:@"%@ \n \n%@",_incomingTopic,content];
    NSMutableAttributedString *attrString = [[NSMutableAttributedString alloc] initWithString:text];
    
    
    [attrString beginEditing];
    [attrString addAttribute:NSFontAttributeName
                       value:boldFont
                       range:boldedRange
     ];
    
    [attrString addAttribute:NSForegroundColorAttributeName
                       value:fontColor
                       range:boldedRange];
    
   
    [attrString endEditing];
    _textViewText.attributedText = attrString;
    _textViewText.layer.borderColor = [[UIColor redColor] CGColor];
    _textViewText.layer.borderWidth = 5;
    
    
    
}

-(void)createContentArrays{
    
    _arrayContentIntro = [[NSMutableArray alloc] initWithObjects:
                          @"Welcome to Bingo Night, the only app you need to host your Bingo event or just to host a Bingo game in your home, business or anywhere. These instructions are divided by the options you'll find when you open the game. The game is ready to play if you hit PLAY. But let your creative juices flow and go to SETUP to customize just about every aspect of the experience.",
                          nil];
    _arrayContentGamePlay = [[NSMutableArray alloc] initWithObjects:
                             @"The choose game screen lets you pick which game to play. Use SETUP to set the number of games up to 12. Use set up to customize the colors, image and name on the title screen. If you have activated a raffle, a raffle ticket will appear to let you display the prizes. If you have a theme song, a music play and stop button appear. Again, use SETUP to activate these options.",
                             @"If you have set up a raffle, press the ticket icon to display the prizes. You can set up the raffle by going to SETUP and GLOBAL SETTINGS",
                             @"Some events have a theme song to play between rounds or before the raffle, to announce a change or to get the audience's attention. If you have selected a song or sound, use PLAY and STOP buttons. The song will always play from the beginning after it is stopped. You can set up the song or sound by going to SETUP and GLOBAL SETTINGS",
                             @"Once you have selected the game to play, you will go to the Game Play Screen. The page shows the traditional Bingo numbers and the grid displaying the game version. It also shows the name of the game. There is an area to display an game message. This area will have the same color scheme as the number grid. It will only appear if there is a message. All of these features, including colors, grid designs and text can be customized in SETUP and LOCAL SETTINGS.",
                             @"Bingo Night gives you the choice to choose a ball with the app or to use a separate ball selector. The default is to use the chooser within the app. To choose a ball, press Choose Ball in the top menu bar. After the ball is displayed, the CHOOSE BALL option reappears.\n \n If you prefer to use an ball selector outside of the app, go to SETUP and GLOBAL SETTINGS and deselect USE AUTO SELECT. To choose a ball without AUTO SELECT, simply press the number square of the selected number. If you make a mistake, hit the UNDO button",
                             @"When somebody shouts Bingo, it's time to check the cards. Press checking button to pause the game. The default is to use special checking, which means a song and an annimation will appear -- and occupy the audience while the checking is underway. If you turn off special checking, then a simple sign flashes on the screen. Go to SETUP and GLOBAL SETTINGS to select special checking. You will be able to customize the music and animation too./n/n If it turns out there was no Bingo and the game continues, hit either return to game or Back (depending on wheter you are using special checking.) Resume selecting numbers.",
                             @"If you determine that a player or players have Bingo, hit the Winner button in the top menu. To avoid errors, you must hit confirm winner button to the side. If you are using special checking, you will go to an animated winner screen, with a sound of your choice. If not, a sign saying Winner will appear.",
                        
                             
nil];
    _arrayContentSetupLocal = [[NSMutableArray alloc] initWithObjects:
                             @"This is the first setup local entry",
                             @"This is the second setup local entry",
                             @"This is the third setup local entry",
                             @"This is the fourth setup local entry",
                             @"This is the fifth setup local entry",
                             nil];
    _arrayContentSetupGlobal = [[NSMutableArray alloc] initWithObjects:
                             @"This is the first setup global entry",
                             @"This is the second setup global entry",
                             @"This is the third setup global entry",
                             @"This is the fourth setup global entry",
                             @"This is the fifth setup global entry",
                             nil];

    _arrayContentRestore = [[NSMutableArray alloc] initWithObjects:
                                @"This is the first restore entry",
                                @"This is the second restore entry",
                            
                                nil];


}




@end
