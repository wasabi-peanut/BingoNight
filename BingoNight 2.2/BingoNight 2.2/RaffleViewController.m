//
//  RaffleViewController.m
//  BingoNight 2.2
//
//  Created by Adam Schor on 1/29/17.
//  Copyright © 2017 AandA Development. All rights reserved.
//

#import "RaffleViewController.h"

@interface RaffleViewController ()

@end

@implementation RaffleViewController

- (void)viewDidLoad {
    [super viewDidLoad];
    
    _arrayRaffleItems = [[NSMutableArray alloc] initWithObjects:@"One",@"Two",@"Three",@"Four",nil];
    
    NSInteger numberOfSegments = _arrayRaffleItems.count;
    
    _segmentedControlRaffle = [[UISegmentedControl alloc] initWithItems:_arrayRaffleItems];
    _segmentedControlRaffle.frame = CGRectMake(100, 100, 50*numberOfSegments, 50);
    [_segmentedControlRaffle addTarget:self action:@selector(segmentSelected:) forControlEvents:UIControlEventValueChanged];
    
    [self.view addSubview:_segmentedControlRaffle];
    

}

- (void)didReceiveMemoryWarning {
    [super didReceiveMemoryWarning];
    // Dispose of any resources that can be recreated.
}


-(void)segmentSelected: (UISegmentedControl *)selectedValue {
   _segmentSelected = selectedValue.selectedSegmentIndex;
    NSString *itemSelected = _arrayRaffleItems[_segmentSelected];
    NSLog(@"I pick %@",itemSelected);
    
}

@end
