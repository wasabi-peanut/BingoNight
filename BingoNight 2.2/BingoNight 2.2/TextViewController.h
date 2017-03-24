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
@property NSString *incomingTopic;

@property (strong, nonatomic) IBOutlet UITextView *textViewText;

@property (strong, nonatomic) NSMutableArray *arrayContentIntro;
@property (strong, nonatomic) NSMutableArray *arrayContentGamePlay;
@property (strong, nonatomic) NSMutableArray *arrayContentSetupLocal;
@property (strong, nonatomic) NSMutableArray *arrayContentSetupGlobal;
@property (strong, nonatomic) NSMutableArray *arrayContentRestore;




@end
