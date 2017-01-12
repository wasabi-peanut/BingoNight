//
//  CheckingSetUpViewController.h
//  BingoNight 2.2
//
//  Created by Schor on 12/11/16.
//  Copyright © 2016 AandA Development. All rights reserved.
//

#import <UIKit/UIKit.h>
#import <AVFoundation/AVFoundation.h>
#import "checkingPatterns.h"




@interface CheckingSetUpViewController : UIViewController <UIPickerViewDelegate, UIPickerViewDataSource>

@property (strong, nonatomic)  UIView *viewPreviewWindow;

@property (strong, nonatomic) IBOutlet UIPickerView *pickerChecking;

@property (strong, nonatomic) NSMutableArray *arrayCheckingPatterns;
@property (strong, nonatomic) NSMutableArray *arrayCheckingSongs;
@property (strong, nonatomic) NSMutableArray *arrayGameNumbers;
@property (strong, nonatomic) NSMutableArray *arrayWinnerSounds;


@property (strong, nonatomic) NSMutableArray *arrayCoordinatesCheckingPatterns;
@property (strong, nonatomic) NSMutableArray *arrayCoordinatesCheckingSongs;
@property (strong, nonatomic) NSMutableArray *arrayCoordinatesWinnerSounds;
    

@property (strong, nonatomic) NSString *keyForCoordinatesCheckingPatterns;
@property (strong, nonatomic) NSString *keyForCoordinatesCheckingSongs;
@property (strong, nonatomic) NSString *keyForCoordinatesWinnerSounds;
@property (strong, nonatomic) NSString *keyForNumberOfGames;

@property  NSInteger numberOfGames;
@property  NSInteger patternSelected;




@property checkingPatterns *myView;



@property (strong, nonatomic) IBOutlet UIButton *btnPlayChecking;
@property (strong, nonatomic) IBOutlet UIButton *btnStopChecking;
@property (strong, nonatomic) IBOutlet UIButton *btnPlayWinner;
@property (strong, nonatomic) IBOutlet UIButton *btnStopWinner;

@property NSInteger gameNumber;

- (IBAction)btnPlay:(id)sender;

- (IBAction)btnStop:(id)sender;

@property (strong, nonatomic) NSString *songTitle;
@property (strong, nonatomic) NSString *checkingSongTitle;
@property (strong, nonatomic) NSString *winnerSoundTitle;


@end
