//
//  RaffleViewController.h
//  BingoNight 2.2
//
//  Created by Adam Schor on 1/29/17.
//  Copyright © 2017 AandA Development. All rights reserved.
//

#import <UIKit/UIKit.h>

@interface RaffleViewController : UIViewController

@property (strong,nonatomic) UISegmentedControl *segmentedControlRaffle;
@property (strong,nonatomic) NSMutableArray *arrayRaffleItems;
@property NSInteger segmentSelected;

@end
