//
//  RaffleViewController.h
//  BingoNight 2.2
//
//  Created by Adam Schor on 1/29/17.
//  Copyright © 2017 AandA Development. All rights reserved.
//

#import <UIKit/UIKit.h>

@interface RaffleViewController : UIViewController <UIPickerViewDelegate, UIPickerViewDataSource>

@property (strong, nonatomic) IBOutlet UIPickerView *pickerViewRaffleItem;

@property (strong,nonatomic) NSMutableArray *arrayRaffleItems;

@property (strong,nonatomic) NSString *keyForArrayRaffleItems;
@property (strong, nonatomic) IBOutlet UITextView *textViewRaffleItems;
@property NSInteger lastNumber;

@end
