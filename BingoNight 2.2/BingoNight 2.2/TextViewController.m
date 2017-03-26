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
    
    _textViewText.font = [UIFont fontWithName:@"Helvetica" size:14];
    
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
    _textViewText.editable = NO;
    
    
}

-(void)createContentArrays{
    
    _arrayContentIntro = [[NSMutableArray alloc] initWithObjects:
                          @"Welcome to Bingo Night, the only app you need to host your Bingo event or just to host a Bingo game in your home, business or anywhere. These instructions are divided by the options you'll find when you open the game. The game is ready to play if you hit PLAY. But let your creative juices flow and go to SETUP to customize just about every aspect of the experience. Once in SETUP, use LOCAL SETTINGS to adjust settings for individual games. Use GLOBAL SETTINGS to make changes to impact all the games, such as the name of the event and how to choose and display the selected ball.",
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
                               //OVERVIEW
                               @"The local settings allow you to customize each game. Once you have selected the number of games (See NUMBER OF GAMES), then you use the selector to choose which game you want to customize. For each game, choose a color scheme (See COLOR SCHEMES), choose a game grid (See GRIDS and CUSTOMIZE GRIDS), and enter a game comment. (See GAME COMMENTS). Each change is saved. You can see a preview of the display on this page. To see the full picture, go to Game Play and select the game you just customized. Return to SETUP to make additional changes.",
                               
                               //NUMBER OF GAMES
                             @"Use the plus and minus buttons to choose the number of games, up to 12 games. Added games use the default display but you can later make changes. If you reduce the number of games, you will lose the settings for eliminated games.",
                               //COLOR SCHEMES
                             @"You can choose what color scheme you want to use for each game. There are several preset schemes to choose from. You cannot change these schemes. If you want to edit a scheme or create a new one, hit the plus button. You will give the scheme a name and be able to edit each aspect. When you add a new scheme, it uses the current scheme as the base. Therefore, if you want to make an edit to the default Red scheme, add a new scheme while Red is selected. Also note that the markers are tied to the scheme. If you want to change the markers used, you must create a new scheme. Again start with the base that is closest to what you want to use.\n\nYou can customize most aspects by adjusting the color sliders. All changes are saved. Adjust the dial to the aspect you want to change and go for it. For example, the change the background color, choose that attribute. The other choices are the background and text colors of the grid. Called box and text refers to the colors after the number has been announced. You often will want these to have a faded or darkened look so players can easily distinguish between what has been called and what is left. You can also change the Bingo Letters, which are the letters B-I-N-G-O that appear aside the number rows in the grid. Remember to distinguish these from the background color.Your changes will display in the sample grid on this page.\nnYou can also change the name of the game. You will see a yellow box around the display, which means editing is enabled. The name appears above the grid on the game play display. It is a good place to put the name or number of game and perhaps the type of game to play. The text will shrink to fit the space but if you type too much, it will hard to see when displayed.\n\nIf you want longer comments, consider using the optional comment section on this page. See GAME COMMENTS for instructions",
                               //GRIDS
                             @"You can select the game type or GRID for each game. For example, Game One may required the traditional five in a row, either up, down or across to Bingo. Game Two could require an X pattern or a Perimeter pattern. There are several defaults that cannot be changed. If you want add a new pattern, then press the plus button, name the grid and add it. As with the color schemes, your new grid is based on the grid that is selected. See CUSTOMIZE GRID. Note that the markers are not part of the grid but part of the color scheme. To change the markers, edit the color scheme. See COLOR SCHEMES",
                             //CUSTOMIZE GRIDS
                               @"There are two ways to customize the grid: the marker used and the layout of the grid. To adjust the markers, you need to adjust the color schemes and create a new scheme. See COLOR SCHEMES.\n\nTo customize the layout of the grid, create a custom grid. You cannot edit a default grid. With a custom grid, select EDIT GRID in the attribute selector. Then tap the squares of the grid display to toggle between selected and unselected squares. All changes are saved.",
                               //GAME COMMENTS
                             @"You have the option of adding a game comment to each game. These comments appear in a box on the Game Play screen. The box will have the same text and background colors of an unselected number box. If there are no comments, however, the box will not appear. This box is a good chance for messages on sponsors, special thank yous or additional game notes.\n\n TIP:The text size will adjust to fit the box. You may want to add returns before and after the text to center it vertically or to adjust its size. Conversely, you may need to eliminate returns if you find undesired blank lines. ",
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
