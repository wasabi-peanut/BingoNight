//
//  LocalSettingsViewController.h
//  
//
//  Created by Adam Schor on 7/17/15.
//
//

#import <UIKit/UIKit.h>

@interface LocalSettingsViewController : UIViewController <UIPickerViewDataSource,UIPickerViewDelegate, UIAlertViewDelegate, UITextFieldDelegate, UITextViewDelegate>



@property CGFloat height;
@property CGFloat width;

@property UIColor *gridBackgroundColor;

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


//ARRAYS FOR PICKERS: PROPERTIES, GAME NUMBER AND PRESETS
@property (strong, nonatomic)NSMutableArray *arrayPickerGameNumber;
@property (strong, nonatomic)NSMutableArray *arrayPickerGameColors;
@property (strong, nonatomic)NSMutableArray *arrayPickerPresets;
@property (strong, nonatomic)NSMutableArray *arrayPickerGrids;
@property (strong, nonatomic)NSMutableArray *arrayPickerMarkers;


@property int protectedPresets;
@property int protectedGrids;
@property BOOL isProtected;


//BUTTONS FOR GRID


@property (strong, nonatomic) IBOutletCollection(UIButton) NSArray *buttonGridCollection;
@property (strong, nonatomic) IBOutletCollection(UILabel) NSArray *labelCollection;

//VIEW FOR LABELS

@property (strong, nonatomic) IBOutlet UIView *viewLabelHolder;


//STEPPER AND NUMBER OF GAMES
@property (strong, nonatomic) IBOutlet UIStepper *stepperNumberOfGames;
- (IBAction)stepperNumberOfGamesPress:(id)sender;
@property (strong, nonatomic) IBOutlet UILabel *labelNumberOfGames;
@property NSInteger numberOfGames;


//PICKERS
@property (strong, nonatomic) IBOutlet UIPickerView *pickerGameSettings;

@property (strong, nonatomic) IBOutlet UIPickerView *pickerPresets;

@property  NSString *gameSelected;
@property  NSString *attributeSelected;

@property NSInteger gameNumber;
@property NSInteger attributeNumber;
@property NSInteger presetSelected;
@property NSInteger gridSelected;
@property NSInteger markerSelected;

@property (strong, nonatomic)  UIPickerView *testPicker;
@property (strong, nonatomic) IBOutlet UIPickerView *pickerMarkerColors;


//@property (strong,nonatomic) NSString *nameOfPreset;


//SAVED NAME OF SETTINGS

@property (strong, nonatomic) IBOutlet UITextField *textFieldSavedSettingsName;

- (IBAction)btnAddOrDelete:(id)sender;

//SLIDERS
@property (strong,nonatomic) NSMutableArray *arrayDisplayButtons;

- (IBAction)sliderChanged:(id)sender;



@property (strong, nonatomic) IBOutlet UITextField *textFieldRedValue;
@property (strong, nonatomic) IBOutlet UITextField *textFieldGreenValue;
@property (strong, nonatomic) IBOutlet UITextField *textFieldBlueValue;

- (IBAction)enteredTextFieldRedValue:(id)sender;
- (IBAction)enteredTextFieldGreenValue:(id)sender;
- (IBAction)enteredTextFieldBlueValue:(id)sender;

- (IBAction)startedEditTextFieldRedValue:(id)sender;
- (IBAction)startedEditTextFieldGreenValue:(id)sender;
- (IBAction)startedEditTextFieldBlueValue:(id)sender;

- (IBAction)editEndedTextFieldNameOfGame:(id)sender;

@property (strong, nonatomic) IBOutlet UISlider *sliderRed;
@property (strong, nonatomic) IBOutlet UISlider *sliderGreen;
@property (strong, nonatomic) IBOutlet UISlider *sliderBlue;

@property (strong, nonatomic) IBOutlet UILabel *lblRedValue;
@property (strong, nonatomic) IBOutlet UILabel *lblGreenValue;

@property (strong, nonatomic) IBOutlet UILabel *lblBlueValue;




//ARRAYS AND KEYS FOR STORING SETTINGS

@property (strong, nonatomic) NSMutableArray *arrayGameColorSettings;
@property (strong, nonatomic) NSMutableArray *arrayGameColorSettingsShell;
@property (strong, nonatomic) NSMutableArray *arrayGridsShell;
@property (strong, nonatomic) NSMutableArray *arrayGridPatterns;
@property (strong, nonatomic) NSMutableArray *arrayGameComments;


//@property (strong, nonatomic) NSMutableArray *arrayGridShell;

@property (strong, nonatomic) NSMutableArray *arrayCoordinatesGrids;
@property (strong, nonatomic) NSMutableArray *arrayCoordinatesColors;
@property (strong, nonatomic) NSMutableArray *arrayCoordinatesNameOfGame;
@property (strong, nonatomic) NSMutableArray *arrayCoordinatesGameComments;

//@property (strong, nonatomic) NSMutableArray *arrayActiveColors;
//@property (strong, nonatomic) NSMutableArray *arrayActiveGrid;


@property (strong, nonatomic) IBOutlet UITextView *textViewGameComments;


//@property (strong, nonatomic) NSMutableArray *arrayCurrentGameColorSettings;


//COORDINATE SYSTEM
@property int coordinateGameColor;
@property int coordinateAttributeColor;
@property int coordinateGameGrid;
@property int coordinateGridSquare;
@property int coordinateComments;









//SET UP KEY STRINGS

//@property (strong, nonatomic) NSString *keyForGameSettings;

//@property (strong, nonatomic) NSString *keyForGameColorSettings;

@property (strong, nonatomic) NSString *keyForGameColorSettingsShell;
@property (strong, nonatomic) NSString *keyForGridsShell;
@property (strong, nonatomic) NSString *keyForCoordinatesGrid;
@property (strong, nonatomic) NSString *keyForCoordinatesColors;
@property (strong, nonatomic) NSString *keyForCoordinatesNameOfGame;
@property (strong, nonatomic) NSString *keyForGameComments;


@property (strong, nonatomic) NSString *keyForNumberOfGames;





@property (strong, nonatomic) NSString *keyForPickerGrids;
@property (strong, nonatomic) NSString *keyForArrayPickerPresets;



//OTHER
@property Boolean changeHappened;
@property Boolean allowGridEdits;


@property (strong, nonatomic) IBOutlet UITextField *textFieldNameOfGame;

//@property UITextField *textFieldNameOfGame;
@property int alertNumber;



@end
