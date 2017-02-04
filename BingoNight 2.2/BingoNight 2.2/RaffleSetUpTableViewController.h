//
//  RaffleSetUpTableViewController.h
//  BingoNight 2.2
//
//  Created by Adam Schor on 2/2/17.
//  Copyright © 2017 AandA Development. All rights reserved.
//

#import <UIKit/UIKit.h>

@interface RaffleSetUpTableViewController : UITableViewController
@property (strong,nonatomic) NSMutableArray *test;
- (IBAction)addItemPressed:(id)sender;
@end
