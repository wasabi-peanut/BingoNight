//
//  RaffleSetUpTableViewController.h
//  BingoNight 2.2
//
//  Created by Adam Schor on 2/2/17.
//  Copyright © 2017 AandA Development. All rights reserved.
//

#import <UIKit/UIKit.h>

@interface RaffleSetUpTableViewController : UITableViewController <UITextViewDelegate>
//latest version


@property (strong,nonatomic) NSMutableArray *arrayRaffleItems;
@property NSString *keyForArrayRaffleItems;
- (IBAction)addItemPressed:(id)sender;

@property NSInteger activeRow;
@property NSInteger rowHeight;
@property NSString *action;

@property float height;
@property float width;

@property (strong,nonatomic) UITextView *textViewDetail;
- (IBAction)btnFinishAdd:(id)sender;


@end
