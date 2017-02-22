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
@property (weak, nonatomic) IBOutlet UIImageView *imageViewRaffleImage;


@property NSInteger lastNumber;
@property (strong, nonatomic) IBOutlet UILabel *labelRaffleItems;

@property (strong, nonatomic) NSMutableArray *arrayItemsForPicker;


@end
