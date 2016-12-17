//
//  CheckingSetUpViewController.h
//  BingoNight 2.2
//
//  Created by Schor on 12/11/16.
//  Copyright © 2016 AandA Development. All rights reserved.
//

#import <UIKit/UIKit.h>

@interface CheckingSetUpViewController : UIViewController <UIPickerViewDelegate, UIPickerViewDataSource>

@property (strong, nonatomic)  UIView *viewPreviewWindow;

@property (strong, nonatomic) IBOutlet UIPickerView *pickerChecking;

@property (strong, nonatomic) NSMutableArray *arrayCheckingPatterns;
@property (strong, nonatomic) NSMutableArray *arraySongs;
@property (strong, nonatomic) NSMutableArray *arrayGameNumbers;


@property (strong, nonatomic) NSMutableArray *arrayCoordinatesCheckingPatterns;
@property (strong, nonatomic) NSMutableArray *arrayCoordinatesSongs;

@property (strong, nonatomic) NSString *keyForCoordinatesCheckingPatterns;
@property (strong, nonatomic) NSString *keyForCoordinatesSongs;



@end
