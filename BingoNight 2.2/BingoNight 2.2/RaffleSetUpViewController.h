//
//  RaffleSetUpViewController.h
//  BingoNight 2.2
//
//  Created by Adam Schor on 1/27/17.
//  Copyright © 2017 AandA Development. All rights reserved.
//

#import <UIKit/UIKit.h>

@interface RaffleSetUpViewController : UIViewController <UIPickerViewDelegate, UIPickerViewDataSource, UITextViewDelegate, UITextFieldDelegate>

@property (strong, nonatomic) IBOutlet UILabel *labelNumberOfItems;

@property (strong, nonatomic) IBOutlet UIStepper *stepperNumberOfItems;

- (IBAction)stepperItemsChanged:(id)sender;
@property NSInteger numberOfItems;


@property (strong, nonatomic) IBOutlet UITextView *TextViewDescription;
@property (strong, nonatomic) IBOutlet UITextField *txtNameOfItem;

@property (strong, nonatomic) NSMutableArray *raffleNames;
@property (strong, nonatomic) NSMutableArray *raffleDescription;

@property (strong, nonatomic) IBOutlet UIPickerView *pickerRaffleItem;

@property (strong, nonatomic) NSMutableArray *arrayGameNumbers;


@end
