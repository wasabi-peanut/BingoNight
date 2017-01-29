//
//  RaffleSetUpViewController.m
//  BingoNight 2.2
//
//  Created by Adam Schor on 1/27/17.
//  Copyright © 2017 AandA Development. All rights reserved.
//

#import "RaffleSetUpViewController.h"

@interface RaffleSetUpViewController ()

@end

@implementation RaffleSetUpViewController

- (void)viewDidLoad {
    
    _numberOfItems = 1; //Use defaults to load this later
    
    _stepperNumberOfItems.minimumValue = 1;
    _stepperNumberOfItems.maximumValue = 100;
    _stepperNumberOfItems.value = _numberOfItems;
    _labelNumberOfItems.text = [NSString stringWithFormat:@"%ld",(long)_numberOfItems];
    
    [self createStepperArray];
    
    [super viewDidLoad];
    
    
    
    
    
    // Do any additional setup after loading the view.
}

- (void)didReceiveMemoryWarning {
    [super didReceiveMemoryWarning];
    // Dispose of any resources that can be recreated.
}



- (IBAction)stepperItemsChanged:(id)sender {
    
    _numberOfItems = _stepperNumberOfItems.value ;
    _labelNumberOfItems.text = [NSString stringWithFormat:@"%ld",_numberOfItems];
    
    [self createStepperArray];
    
   
    
}


-(void)pickerView:(UIPickerView *)pickerView didSelectRow:(NSInteger)row inComponent:(NSInteger)component{
    //so something
}

-(NSInteger)pickerView:(UIPickerView *)pickerView numberOfRowsInComponent:(NSInteger)component{
    NSInteger rows = _arrayGameNumbers.count;
    return rows;
    
}

-(NSInteger)numberOfComponentsInPickerView:(UIPickerView *)pickerView{
    return 1;
    
}

-(NSString *)pickerView:(UIPickerView *)pickerView titleForRow:(NSInteger)row forComponent:(NSInteger)component {
    NSString *title;
    title = [NSString stringWithFormat:@"%@",_arrayGameNumbers[row]];
    
    
    return title;
    
}

-(void)createStepperArray {
    NSString *itemNumber;
    _arrayGameNumbers = [[NSMutableArray alloc] init];
    
    for (int x=1; x==_numberOfItems; x++) {
        itemNumber = [NSString stringWithFormat:@"Game %i",x];
        [_arrayGameNumbers addObject:itemNumber];
    }
    
     [_pickerRaffleItem reloadAllComponents];
    
    
}
@end
