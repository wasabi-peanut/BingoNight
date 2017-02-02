//
//  RaffleSetUpViewController.m
//  BingoNight 2.2
//
//  Created by Adam Schor on 1/27/17.
//  Copyright © 2017 AandA Development. All rights reserved.
//

#import "RaffleSetUpViewController.h"
#import "DefaultsDataManager.h"


@interface RaffleSetUpViewController ()

@end

@implementation RaffleSetUpViewController

- (void)viewDidLoad {
    
    _numberOfItems = 8; //Use defaults to load this later
    
    _stepperNumberOfItems.minimumValue = 1;
    _stepperNumberOfItems.maximumValue = 100;
    _stepperNumberOfItems.value = _numberOfItems;
    _labelNumberOfItems.text = [NSString stringWithFormat:@"%ld",(long)_numberOfItems];
    
    
    _keyForArrayRaffleNames = @"keyForArrayRaffleNames";
    _keyForNumberOfItems = @"keyForNumberOfItems";
    _keyForArrayRaffleDescriptions = @"keyForArrayRaffleDescriptions";
    _keyForCoordinatesForRaffleList = @"keyForCoordinatesForRaffleList";
    
    
    _arrayRaffleNames = [[NSMutableArray alloc]initWithObjects:@"House",@"Boat",@"Vacation", nil];
    _arrayItemNumbers = [[NSMutableArray alloc] init];
    [self setUpPicker];
    
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
    
 //   [self createStepperArray];
    
   
    
}


-(void)pickerView:(UIPickerView *)pickerView didSelectRow:(NSInteger)row inComponent:(NSInteger)component{
    //so something
}

-(NSInteger)pickerView:(UIPickerView *)pickerView numberOfRowsInComponent:(NSInteger)component{
    NSInteger rows;
    switch (component) {
        case 0:
            rows = _arrayItemNumbers.count;
            break;
        case 1:
            rows = _arrayRaffleNames.count;
        default:
            break;
    }
    
    return rows;
    
    
}

-(NSInteger)numberOfComponentsInPickerView:(UIPickerView *)pickerView{
    return 2;
    
}

-(NSString *)pickerView:(UIPickerView *)pickerView titleForRow:(NSInteger)row forComponent:(NSInteger)component {
    NSString *title;
    
    switch (component) {
        case 0:
        title = [NSString stringWithFormat:@"%@",_arrayItemNumbers[row]];
            break;
        case 1:
            title = _arrayRaffleNames[row];
            break;
            
        default:
            break;
    }
    NSLog(@"This is the array %@",_arrayItemNumbers);
    return title;
    
}


-(void)setUpPicker{
    //set up first array of item numbers

    NSString *itemNumber;
    
    for (int x = 1; x<=_arrayRaffleNames.count; x++) {
        itemNumber = [NSString stringWithFormat:@"Item %i",x];
        [_arrayItemNumbers addObject:itemNumber];
        
    }
    
    [_pickerRaffleItem reloadComponent:0];
    
    //set up array of Raffle Names
    
 //   _arrayRaffleNames = [[NSMutableArray alloc] initWithArray:[DefaultsDataManager getDataForKey:_keyForArrayRaffleNames]];
    
    
    
    
}
- (IBAction)btnAddItem:(id)sender {
    
}

- (IBAction)btnEditItem:(id)sender {
}

- (IBAction)btnDeleteItem:(id)sender {
}
@end
