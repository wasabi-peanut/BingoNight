//
//  TextViewController.m
//  BingoNight 2.2
//
//  Created by Adam Schor on 12/7/16.
//  Copyright © 2016 AandA Development. All rights reserved.
//

#import "TextViewController.h"

@interface TextViewController ()

@end

@implementation TextViewController

- (void)viewDidLoad {
    [super viewDidLoad];
    // Do any additional setup after loading the view.
    
    
   
    
    UIFont *boldFont = [UIFont fontWithName:@"Helvetica" size:24];
    
    NSRange boldedRange = NSMakeRange(0, 4);
    NSString *text = @"This \n is where the explanation goes";
    NSMutableAttributedString *attrString = [[NSMutableAttributedString alloc] initWithString:text];
    
    
    [attrString beginEditing];
    [attrString addAttribute:NSFontAttributeName
                       value:boldFont
                       range:boldedRange];
    
    [attrString endEditing];
    _textViewText.attributedText = attrString;
}

- (void)didReceiveMemoryWarning {
    [super didReceiveMemoryWarning];
    // Dispose of any resources that can be recreated.
}

/*
#pragma mark - Navigation

// In a storyboard-based application, you will often want to do a little preparation before navigation
- (void)prepareForSegue:(UIStoryboardSegue *)segue sender:(id)sender {
    // Get the new view controller using [segue destinationViewController].
    // Pass the selected object to the new view controller.
}
*/

@end
