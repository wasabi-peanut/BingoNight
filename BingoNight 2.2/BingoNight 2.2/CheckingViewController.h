//
//  CheckingViewController.h
//  Bingo Night 3.0
//
//  Created by Adam Schor on 9/11/15.
//  Copyright (c) 2015 AandA Development. All rights reserved.
//


#import <UIKit/UIKit.h>
#import <QuartzCore/QuartzCore.h>

@interface CheckingViewController : UIViewController

@property (strong,nonatomic) NSMutableArray *arrayCalledNumbers;

@property (strong,nonatomic) NSArray *arrayCalledNumbersSorted;
@property (strong, nonatomic) NSString *keyForCalledNumbers;


@property (strong, nonatomic) IBOutlet UITextView *textViewCalledNumbers;

@property (strong,nonatomic) UIView *animationView;

@property CGFloat height;
@property CGFloat width;


@property UILabel *labelCircleC;
@property UIView *viewCircleC;

@property CGFloat widthOfCalledDisplay;



@end
