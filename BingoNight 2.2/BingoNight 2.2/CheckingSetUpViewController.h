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
- (IBAction)switchButton:(id)sender;

@end
