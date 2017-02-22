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
    
    if (_arrayRaffleItems.count ==0) {
        
        _arrayRaffleItems = [[NSMutableArray alloc] initWithObjects:@"This is a sample\nReplace with real prizes", nil];
        
        
    }
    
    
    _imageViewRaffleImage.image = [UIImage imageNamed:@"raffleTicket.png"];
   // float widthImage = _imageViewRaffleImage.bounds.size.width;
   // float heightImage = _imageViewRaffleImage.bounds.size.height;
    
    
 //   _labelRaffleItems = [[UILabel  alloc] initWithFrame:CGRectMake(widthImage*.25, heightImage*.15, widthImage*.95, heightImage*.95)];
    _labelRaffleItems.backgroundColor = [UIColor clearColor];
    _labelRaffleItems.font = [UIFont fontWithName:@"Helvetica" size:300];
    _labelRaffleItems.textColor = [UIColor blueColor];
    _labelRaffleItems.adjustsFontSizeToFitWidth = YES;
    _labelRaffleItems.numberOfLines = 0;
    _labelRaffleItems.textAlignment = NSTextAlignmentCenter;
    
    [_imageViewRaffleImage addSubview:_labelRaffleItems];
    
    self.view.backgroundColor = [UIColor colorWithPatternImage:[UIImage imageNamed:@"spots.jpg"]];
    
    _arrayItemsForPicker = [[NSMutableArray alloc] initWithObjects:@"Choose", nil];
    for (int i=0; i<_arrayRaffleItems.count; i++) {
        NSString *pickerLine = [NSString stringWithFormat:@"Item %i",i+1];
        [_arrayItemsForPicker addObject:pickerLine];
        
    }

}

- (void)didReceiveMemoryWarning {
    [super didReceiveMemoryWarning];
    // Dispose of any resources that can be recreated.
}

-(NSInteger)pickerView:(UIPickerView *)pickerView numberOfRowsInComponent:(NSInteger)component{
    return _arrayRaffleItems.count+1;
    
}

-(NSInteger)numberOfComponentsInPickerView:(UIPickerView *)pickerView{
    return 1;
    
}

-(NSString*)pickerView:(UIPickerView *)pickerView titleForRow:(NSInteger)row forComponent:(NSInteger)component{
    NSString *title;
  //  title = [NSString stringWithFormat:@"Item %li",row+1];
    title = _arrayItemsForPicker[row];
    
        
    return  title;
}

-(void)pickerView:(UIPickerView *)pickerView didSelectRow:(NSInteger)row inComponent:(NSInteger)component {
    if (row>0) {
        
    _labelRaffleItems.text = _arrayRaffleItems[row-1];
    }
    else{
        _labelRaffleItems.text = @" ";
        }
    
}
@end
