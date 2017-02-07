//
//  RaffleViewController.m
//  BingoNight 2.2
//
//  Created by Adam Schor on 1/29/17.
//  Copyright © 2017 AandA Development. All rights reserved.
//

#import "RaffleViewController.h"
#import "DefaultsDataManager.h"

@interface RaffleViewController ()

@end

@implementation RaffleViewController

- (void)viewDidLoad {
    [super viewDidLoad];
    
    
    _keyForArrayRaffleItems = @"keyForArrayRaffleItems";
    _arrayRaffleItems = [[NSMutableArray alloc] initWithArray:[DefaultsDataManager getArrayForKey:_keyForArrayRaffleItems]];
    
    _textViewRaffleItems.layer.borderColor = [[UIColor blueColor] CGColor];
    _textViewRaffleItems.layer.borderWidth = 3;
    _textViewRaffleItems.layer.cornerRadius = 15;
    _textViewRaffleItems.font = [UIFont fontWithName:@"Helvetica" size:84];
    _textViewRaffleItems.textColor = [UIColor redColor];
    _textViewRaffleItems.textAlignment = NSTextAlignmentCenter;
    _textViewRaffleItems.adjustsFontForContentSizeCategory = YES;
    
    _textViewRaffleItems.text =_arrayRaffleItems[0];
    
    
   
    self.view.backgroundColor = [UIColor magentaColor];
    

}

- (void)didReceiveMemoryWarning {
    [super didReceiveMemoryWarning];
    // Dispose of any resources that can be recreated.
}

-(NSInteger)pickerView:(UIPickerView *)pickerView numberOfRowsInComponent:(NSInteger)component{
    return _arrayRaffleItems.count;
    
    
}

-(NSInteger)numberOfComponentsInPickerView:(UIPickerView *)pickerView{
    return 1;
    
}

-(NSString*)pickerView:(UIPickerView *)pickerView titleForRow:(NSInteger)row forComponent:(NSInteger)component{
    NSString *title;
    title = [NSString stringWithFormat:@"Item %li",row+1];
        
    return  title;
}

-(void)pickerView:(UIPickerView *)pickerView didSelectRow:(NSInteger)row inComponent:(NSInteger)component {
   _textViewRaffleItems.text = _arrayRaffleItems[row];
    
}
@end
