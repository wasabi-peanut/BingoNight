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
@property (strong, nonatomic) IBOutlet UITextView *textViewItemDescription;
@property (strong, nonatomic) IBOutlet UITextField *textFieldNameOfItem;

@property (strong, nonatomic) NSMutableArray *arrayRaffleNames;
@property (strong, nonatomic) NSMutableArray *arrayRaffleDescription;
@property (strong, nonatomic) NSMutableArray *arrayItemNumbers;

@property (strong, nonatomic) IBOutlet UIPickerView *pickerRaffleItem;

@property (strong, nonatomic) NSString *keyForArrayRaffleNames;
@property (strong, nonatomic) NSString *keyForArrayRaffleDescriptions;
@property (strong, nonatomic) NSString *keyForNumberOfItems;
@property (strong, nonatomic) NSString *keyForCoordinatesForRaffleList;

@property (strong, nonatomic) NSMutableArray *coordinatesForRaffleList;







- (IBAction)btnAddItem:(id)sender;
- (IBAction)btnEditItem:(id)sender;
- (IBAction)btnDeleteItem:(id)sender;

@end
