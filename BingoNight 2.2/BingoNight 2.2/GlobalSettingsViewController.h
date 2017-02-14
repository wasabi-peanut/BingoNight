//current
//  GlobalSettingsViewController.h
//  Bingo Night 3.0
//
//  Created by Adam Schor on 7/17/15.
//  Copyright (c) 2015 AandA Development. All rights reserved.
//

#import <UIKit/UIKit.h>

@interface GlobalSettingsViewController : UIViewController <UIAlertViewDelegate, UIPickerViewDataSource, UIPickerViewDelegate, UITextFieldDelegate, UITextViewDelegate,UIImagePickerControllerDelegate, UINavigationControllerDelegate, UIPopoverPresentationControllerDelegate>


//COLUMN SWITCH

@property (strong, nonatomic) IBOutlet UISwitch *switchUnmarkedColumns;
- (IBAction)switchUnmarkedColumnsChanged:(id)sender;
@property BOOL skipUnmarkedColumns;




@property (strong,nonatomic) NSMutableArray *arrayGlobalSettings;
@property (strong,nonatomic) NSString *keyForGlobalSettings;

//SLIDERS
@property (strong, nonatomic) IBOutlet UISlider *sliderRed;
@property (strong, nonatomic) IBOutlet UISlider *sliderGreen;
@property (strong, nonatomic) IBOutlet UISlider *sliderBlue;


//SETTINGS FOR SWITCH SELECTOR
@property Boolean useSelector;

@property (strong, nonatomic) IBOutlet UISwitch *switchUseSelector;
- (IBAction)changeSwitchUseSelector:(id)sender;

@property (strong, nonatomic) IBOutlet UILabel *labelUseSelector;

//SPECIAL CHECKING

@property (strong, nonatomic) IBOutlet UISwitch *switchUseSpecialChecking;
- (IBAction)switchSpecialCheckingMoved:(id)sender;

@property (strong, nonatomic) IBOutlet UIButton *btnSetUpChecking;




//OTHER

@property (strong, nonatomic) UITextView *nameOfEvent;

@property float height;
@property float width;



@property Boolean changeHappened;

//SEGMENT
@property (strong, nonatomic) IBOutlet UISegmentedControl *segmentTextOrBackground;
@property  NSInteger selectedSegment;


- (IBAction)segmentTextOrBackgroundSelected:(id)sender;

//PICKER FOR FONTS and SIZE

@property (strong, nonatomic) IBOutlet UIPickerView *pickerFonts;
@property (strong, nonatomic) NSMutableArray *arrayPickerFonts;
@property (strong, nonatomic) NSMutableArray *arrayPickerSize;

@property (strong, nonatomic) NSString *font;
//@property (strong, nonatomic) UITextField *fontSize;
@property (strong, nonatomic) IBOutlet UITextField *fontSize;


//STEPPER DELAY

//@property (strong, nonatomic) IBOutlet UIStepper *stepperDelay;
//- (IBAction)stepperDelayChanged:(id)sender;
@property (strong, nonatomic) IBOutlet UIStepper *stepperRoll;
@property (strong, nonatomic) IBOutlet UIStepper *stepperDisplay;
@property (strong, nonatomic) IBOutlet UIStepper *stepperDrop;

- (IBAction)stepperRollChanged:(id)sender;
- (IBAction)stepperDisplayChanged:(id)sender;
- (IBAction)stepperDropChanged:(id)sender;


@property (strong, nonatomic) IBOutlet UILabel *labelRollTime;
@property (strong, nonatomic) IBOutlet UILabel *labelDisplayTime;
@property (strong, nonatomic) IBOutlet UILabel *labelDropTime;

//PAGES
@property (strong, nonatomic) IBOutlet UITextField *labelNumberOfPages;
- (IBAction)labelNumberOfPagesEntered:(id)sender;
@property (strong, nonatomic) IBOutlet UIButton *btnMakeCards;
- (IBAction)btnMakeCaresPressed:(id)sender;

- (IBAction)NumberPageBeginEdit:(id)sender;

//RAFFLE

@property (strong, nonatomic) IBOutlet UISwitch *switchRaffle;
- (IBAction)switchRaffleValueChange:(id)sender;
@property (strong, nonatomic) IBOutlet UIButton *btnSetUpRaffle;
- (IBAction)btnSetUpRaffleSelected:(id)sender;
@property (strong, nonatomic) IBOutlet UITextField *txtRaffleSetUp;


//IMAGE HANDLING

//@interface ViewController : UIViewController <UIImagePickerControllerDelegate, UINavigationControllerDelegate, UIPopoverPresentationControllerDelegate>

@property UIImagePickerController *ipc;

@property (weak, nonatomic) IBOutlet UISlider *sliderHeight;
@property (weak, nonatomic) IBOutlet UISlider *sliderWidth;
@property (weak, nonatomic) IBOutlet UISlider *sliderY;
@property (weak, nonatomic) IBOutlet UISlider *sliderX;

@property float totalWidth;
@property float totalHeight;
@property float frameWidth;
@property float frameHeight;

- (IBAction)sliderImageChange:(id)sender;

@property UIImageView *imageView;

@property (weak, nonatomic) IBOutlet UIButton *btnImage;
- (IBAction)btnImagePressed:(id)sender;


@property UIPopoverController *popover;

@end
