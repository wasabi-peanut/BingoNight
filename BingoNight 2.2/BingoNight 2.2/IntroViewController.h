//
//  IntroViewController.h
//  Bingo Night 3.0
//
//  Created by Adam Schor on 7/19/15.
//  Copyright (c) 2015 AandA Development. All rights reserved.
//


#import <UIKit/UIKit.h>

@interface IntroViewController : UIViewController

@property (strong, nonatomic) UILabel *labelTitleBox;
@property (strong, nonatomic) UILabel *labelBottomBox;
@property (strong, nonatomic) UILabel *labelCreditBox;

@property (strong, nonatomic) UIButton *btnPlay;
@property (strong, nonatomic) UIButton *btnSetUp;
@property (strong, nonatomic) UIButton *btnInstructions;
@property (strong, nonatomic) UIButton *btnRestoreGame;

@property NSInteger restoreMode;




@end
