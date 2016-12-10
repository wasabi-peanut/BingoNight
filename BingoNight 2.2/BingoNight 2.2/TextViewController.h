//
//  TextViewController.h
//  BingoNight 2.2
//
//  Created by Adam Schor on 12/7/16.
//  Copyright © 2016 AandA Development. All rights reserved.
//

#import <UIKit/UIKit.h>

@interface TextViewController : UIViewController
@property NSUInteger sendingRow;
@property NSUInteger sendingSection;
@property (strong, nonatomic) IBOutlet UITextView *textViewText;
@end
