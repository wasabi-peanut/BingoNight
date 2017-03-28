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
    _textViewText.backgroundColor = [UIColor whiteColor];
    
    [self createContentArrays];
    [self chooseContent];
    
    
}

- (void)didReceiveMemoryWarning {
    [super didReceiveMemoryWarning];
    // Dispose of any resources that can be recreated.
}

-(void)chooseContent {
    
    NSString * body;
    
    switch (_sendingSection) {
        case 0:
            body = _arrayContentIntro[_sendingRow];
            break;
        case 1:
            body = _arrayContentGamePlay[_sendingRow];
            break;
        case 2:
            body = _arrayContentSetupLocal[_sendingRow];
            break;
        case 3:
            body = _arrayContentSetupGlobal[_sendingRow];
            break;
        case 4:
            body = _arrayContentRestore[_sendingRow];
            break;
        default:
            
            break;
    }
    
    UIFont *titleFont = [UIFont fontWithName:@"Helvetica" size:32];
    UIColor*titleFontColor = [UIColor blueColor];
    
    UIFont *bodyFont = [UIFont fontWithName:@"Helvetica" size:18];
    UIColor*bodyFontColor = [UIColor grayColor];
    
    NSRange titleRange = NSMakeRange(0, _incomingTopic.length);
    NSRange bodyRange = NSMakeRange(_incomingTopic.length, body.length+4);

    NSMutableParagraphStyle *titleStyle = [[NSMutableParagraphStyle alloc] init];
    titleStyle.alignment = NSTextAlignmentCenter;
    
    NSMutableParagraphStyle *bodyStyle = [[NSMutableParagraphStyle alloc] init];
    bodyStyle.alignment = NSTextAlignmentJustified;
    
    
    NSString *text = [NSString stringWithFormat:@"%@ \n \n%@",_incomingTopic,body];
    NSMutableAttributedString *attrText = [[NSMutableAttributedString alloc] initWithString:text];
    
    [attrText beginEditing];
    [attrText addAttribute:NSFontAttributeName
                       value:titleFont
                       range:titleRange
     ];
    
    [attrText addAttribute:NSParagraphStyleAttributeName
                     value:titleStyle
                     range:titleRange];
    
    [attrText addAttribute:NSParagraphStyleAttributeName
                     value:bodyStyle
                     range:bodyRange];
    
    [attrText addAttribute:NSFontAttributeName
                     value:bodyFont
                     range:bodyRange];
    
    [attrText addAttribute:NSForegroundColorAttributeName
                       value:titleFontColor
                       range:titleRange];
    
    [attrText addAttribute:NSForegroundColorAttributeName
                     value:bodyFontColor
                     range:bodyRange];
   
    [attrText endEditing];
    
    
    _textViewText.attributedText = attrText;
    
    
    _textViewText.layer.borderColor = [[UIColor blueColor] CGColor];
    _textViewText.layer.borderWidth = 1;
    _textViewText.editable = NO;
    
    
}

-(void)createContentArrays{
    
    _arrayContentIntro = [[NSMutableArray alloc] initWithObjects:
                          @"Welcome to Bingo Night, the only app you need to host your Bingo event or just to host a Bingo game in your home, business or anywhere. These instructions are divided by the options you'll find when you open the game. The game is ready to play if you hit PLAY.\n\nBut let your creative juices flow. Go to SETUP to customize just about every aspect of the experience. Once in SETUP, use LOCAL SETTINGS to adjust settings for individual games. Use GLOBAL SETTINGS to make changes to impact all the games, such as the name of the event and how to choose and display the selected ball.\n\nYou can play right away. But if you're going for the special Bingo Night, we suggest you take some time to test your settings, espcially if you plan to use a projector, which can sometimes distort colors.\n\nWe recommend using connecting your iPad to a projector, large screen TV or several monitors for the best Bingo Night experience",
                          nil];
    _arrayContentGamePlay = [[NSMutableArray alloc] initWithObjects:
                             @"The choose game screen lets you pick which game to play. Use SETUP to set the number of games up to 12. Use set up to customize the colors, image and name on the title screen. If you have activated a raffle, a raffle ticket will appear to let you display the prizes. If you have a theme song, a music play and stop button appear. Again, use SETUP to activate these options.",
                             @"If you have set up a raffle, press the ticket icon to display the prizes. You can set up the raffle by going to SETUP and GLOBAL SETTINGS. Once the prizes are entered and you have pressed the ticket icon, use the selector at the bottom left to choose each item. You can order the items in SETUP. Then you just move easily from item to item between drawings.",
                             @"Some events have a theme song to play between rounds or before the raffle, to announce a change or to get the audience's attention. If you have selected a song or sound, use PLAY and STOP buttons. The song will always play from the beginning after it is stopped. You can set up the song or sound by going to SETUP and GLOBAL SETTINGS",
                             @"Once you have selected the game to play, you will go to the Game Play Screen. The page shows the traditional Bingo numbers and the grid displaying the game version. It also shows the name of the game. There is an area to display an game message. This area will have the same color scheme as the number grid. It will only appear if there is a message. All of these features, including colors, grid designs and text can be customized in SETUP and LOCAL SETTINGS.",
                             @"Bingo Night gives you the option to choose a ball within the app or to use a separate ball selector. The default is to use the chooser within the app. To choose a ball, press Choose Ball in the top menu bar. After the ball is displayed, the CHOOSE BALL option reappears.\n\nIf you prefer to use an ball selector outside of the app, go to SETUP and GLOBAL SETTINGS and deselect USE AUTO SELECT. To choose a ball without AUTO SELECT, simply press the number square of the selected number. If you make a mistake, hit the UNDO button.\n\nFor more info, see CHOOSE BALL in GLOBAL SETTINGS",
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
                                //Event Screen
                             @"The Event Screen allows you to set up the name of the event. This name will appear on the start screen before you select which game to play or, if available, you go to the raffle display.\n\nTo enter the text, simply tap in the screen and write the text. With the controls on the bottom, you can choose the color for the text and for the background. Simply pick either option and adjust the color sliders. All color changes are saved. The text is saved when you dismiss the keyboard.\n\nYou can also choose the font style and color from the selectors. Use the line spacing slider to adjust the spacing between lines. Use the alignment choices to select left, center or right alignment/n/nTip: If the font size is too large, the second and subsequent lines may disappear below the screen. Adjust the font size and line spacing to bring them back into view. Stray returns or lines at the end of the text may also cause text to disappear. Be sure to delete those if the words disappear from view before reaching the bottom of the screen",
                                //ADD IMAGE
                             @"You can also add an image to your title by tapping Get Image. You will be able to access images stored on your iPad, after you grant permission. If you don't grant permission but later change your mind, you can update your choice in the Settings function on the iPad./n/nAfter you have selected the image, use the sliders to position and size it. You can also switch between having the image under the text and have the image over the text, using the under and over buttons. To remove image, simply press remove image/n/nTip: You can only add one image but you can combine different images and words into one image using an image editing program. You can then import your edited image.\n\nThe image is not stored within the App but remains on you iPad. Be sure not to delete the image from storage in your camera or photos if you intend to use it on the title screen",
                                //AUTO SELECT
                             @"If you choose to Use Auto Select, then Bingo Nights will automatically choose a ball during the game. If this button is switched off, then you must provide your own way to choose balls. You will still use Bingo Nights to display the called numbers and fpr other asepcts of the game.",
                                //SMART CHOICE
                             @"Using Smart Ball Choice is helpful when Auto Select is on. With Smart Ball Choice, only balls from relevant columns are selected. For example, if you play Four Corners, only balls from the B column and O column matter. The Auto Select will not select balls that begin with I, N or G. Small Ball Choice has no impact if you are not using Auto Select",
                                //SPECIAL CHECKING
                             @"One feature of Bingo Nights is the ability to add animation and music to the perod while evaluating a potentially winning card. Choosing Special Checking gives you this option to add a little flavor between games. (Without Special Checking, a simple sign that says \"Hold Your Cards\" flashes on the game screen.\n\nIf you select Use Special Checking, press SET UP to go to the customization screen\n\nYou will be able to choose a checking pattern for each games. A sample of the animation appears below. You can also choose background music that matches this pattern. Finally, you can choose a sound that plays when you go to the Winner Screen. Press the play button to sample the music and sounds.\n\nYou can use your own music for checking music. Press ADD OWN SONGS and select your music from your iTunes account. Your own songs will appear at the end of the SONG CHOICES SELECTOR. Choose one of your own songs as you customeize a game.\n\nTIP: If you choose your own songs, be sure they are downloaded to your iTunes account or that you are connected to the internet on the night of your event. If the app cannot find the selected song, no sound will play.\n\nAlso, think about how long each checking period will take when you choose a song. For example, checking if a card had a row of five takes much less time then checking if a perimeter or the entire card is filled. Choose the appropriate checking pattern based on how long you think it will appear on the screen.",
                                //BALL ANIMATION SETTINGS
                                @"During game play, an animation of a ball rolling, enlarging and falling appears for each number called. This animation occurs with or without using Auto Select. Use the three switches under BALL ANIMATION to select the duration of each phase of the animation. Return to main menu and PLAY to see the impact of your choices\n\nTip: The time for display depends on how quickly the host announces each ball. It also depends on how many cards each person is playing and how many children may need help. Test different combinations until it feels right for your event",
                                //RAFFLE
                                @"Often, Bingo events have raffles. Bingo Night allows you to have a raffle as part of the display. Use the HAVE A RAFFLE switch and press SETUP to enter the names of prizes. You can use ADD to add a new entry. Type as many lines as you'd like to name and describe the prize. The font size will adjust. Use EDIT to delete items and to change the order./n/nTip: While the display will adjust to the display the description, be sure it remains large enough to be seen. Go to Play and hit the Raffle Ticket icon to have a look. The best way to utilize this feature is to put the items in the order that will be raffled off. That way, you can switch from item to item easily between drawings",
                                //MAKE CARDS
                                @"You can print your own Bingo cards with Bingo Night. In the square next to the MAKE CARDS button, enter the number of pages to print. Then press MAKE CARDS. There are four cards per page.",
                                //THEME SONG
                                @"Some events use a song or sound to get the audience's attention or to signal a change to a new game. Use the THEME SONG button to select the song or sound you want to use. Choose any song in your iTunes. The name of the song will appear after you have selected it. When you go to PLAY, you will see music controls on the start up screen if you have selected a theme sound. See THEME SONG in the PLAY section.",
                                
                             nil];

    _arrayContentRestore = [[NSMutableArray alloc] initWithObjects:
                                //RESTORE GAME
                                @"Bingo Nights is stable and uses a relatively small amount of memory. Still, apps sometimes crash. Don't worry. If the app crashes during a game, use the RESTORE button to return to the game. Once you press restore, you will be able to choose the game you were just in. The board will reflect all of the numbers called before the error.\n\nTip: The RESTORE command works until you start a new game and select a ball. If you want to RESTORE, do not hit PLAY and select a game number.",
                                @"You have the option to store your settings in iCloud as a back up. This is helpful in case you need to re-download the app to a new iPad or if you encounter another error. Hit the Cloud icon on the main screen and press SAVE TO iCloud. To load, press LOAD FROM iCloud.\n\nBe careful.The SAVING and LOADING will overwrite prior versions. While your settings are always saved locally automatically, you need to follow these steps to save them to iCloud.\n\nAnother user who has purchased Bingo Night can download saved settings. The second user must sign in with your Apple ID and password. This is a handy way to create a back up device for the night of the event. Remember, however, that images and songs from iTunes are specific to the device. You may need to download those to the second device. Best to test ahead of time.",
                            
                                nil];


}




@end
