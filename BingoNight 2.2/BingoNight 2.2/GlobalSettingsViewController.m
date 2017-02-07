//current
//  GlobalSettingsViewController.m
//  Bingo Night 3.0
//
//  Created by Adam Schor on 7/17/15.
//  Copyright (c) 2015 AandA Development. All rights reserved.
//


#import "GlobalSettingsViewController.h"
#import "DefaultsDataManager.h"
#import "PDFViewController.h"



@interface GlobalSettingsViewController ()

@end

@implementation GlobalSettingsViewController

- (BOOL)prefersStatusBarHidden{
    return YES;
}


- (void)viewDidLoad {
    
    self.view.backgroundColor = [UIColor colorWithPatternImage:[UIImage imageNamed:@"lilac.jpg"]];

    
    //SET UP STEPPER
    _stepperRoll.maximumValue = 20;
    _stepperRoll.minimumValue = 1;
    _stepperRoll.stepValue = 0.5;
    
    _stepperDisplay.maximumValue = 20;
    _stepperDisplay.minimumValue = 1;
    _stepperDisplay.stepValue = 0.5;
    
    _stepperDrop.maximumValue = 20;
    _stepperDrop.minimumValue = 1;
    _stepperDrop.stepValue = 0.5;
    
    
    _height = [UIScreen mainScreen].bounds.size.height;
    _width = [UIScreen mainScreen].bounds.size.width;
    
  
    //OTHER
  //  _fontSize = [[UITextField alloc] initWithFrame:CGRectMake(875, 650, 50, 50)];
    
   // [_fontSize setDelegate:self];
   // [_fontSize addTarget:self action:@selector(fontSizeStartEdit:) forControlEvents:UIControlEventEditingDidBegin];
   // [_fontSize addTarget:self action:@selector(fontSizeEndEdit:) forControlEvents:UIControlEventEditingDidEnd];
    _fontSize.text = @"Size";
    _fontSize.backgroundColor = [UIColor whiteColor];
    _fontSize.layer.borderColor = [[UIColor blackColor] CGColor];
    _fontSize.layer.borderWidth = 2;
    _fontSize.textAlignment = NSTextAlignmentCenter;
    
    
    
    [self.view addSubview:_fontSize];
    [self.view bringSubviewToFront:_fontSize];
    
    [self loadPickerArrays];

    
    _keyForGlobalSettings = @"keyForGlobalSettings";
    
    _segmentTextOrBackground.selectedSegmentIndex = 0;
    _selectedSegment =0;
    
    //SET UP SLIDERS
    
    self.sliderRed.value = 255;
    self.sliderRed.maximumValue = 255;
    self.sliderRed.minimumValue = 0;
    self.sliderGreen.value = 255;
    self.sliderGreen.maximumValue = 255;
    self.sliderGreen.minimumValue = 0;
    self.sliderBlue.value = 255;
    self.sliderBlue.maximumValue = 255;
    self.sliderBlue.minimumValue = 0;
    
    [self loadGlobalSettings];
    
    if ([[_arrayGlobalSettings objectAtIndex:0] isEqual:@YES]) {
        [_switchUseSelector setOn:YES];
        
    }
    
    else {
        [_switchUseSelector setOn:NO];
        
    }
    

    if ([[_arrayGlobalSettings objectAtIndex:15] isEqual:@YES]) {
        [_switchUnmarkedColumns setOn:YES];
        
    }
    
    else {
        [_switchUnmarkedColumns setOn:NO];
        
    }
    
    if ([[_arrayGlobalSettings objectAtIndex:16] isEqual:@YES]) {
        [_switchUseSpecialChecking setOn:YES];
        _btnSetUpChecking.enabled = YES;
        
    }
    
    else {
        [_switchUseSpecialChecking setOn:NO];
        _btnSetUpChecking.enabled = NO;
        
    }
    
    [self loadPickerArrays];
    
    _stepperRoll.value = [[_arrayGlobalSettings objectAtIndex:12] floatValue];
    _labelRollTime.text = [NSString stringWithFormat:@"%2.1f seconds",_stepperRoll.value];
    
    _stepperDisplay.value = [[_arrayGlobalSettings objectAtIndex:13] floatValue];
    _labelDisplayTime.text = [NSString stringWithFormat:@"%2.1f seconds",_stepperDisplay.value];

    _stepperDrop.value = [[_arrayGlobalSettings objectAtIndex:14] floatValue];
    _labelDropTime.text = [NSString stringWithFormat:@"%2.1f seconds",_stepperDrop.value];
    
    [super viewDidLoad];
    // Do any additional setup after loading the view.
}

-(void)viewDidAppear:(BOOL)animated {
     [self.navigationController setNavigationBarHidden:NO];
    [self applySettings];
}

- (void)didReceiveMemoryWarning {
    [super didReceiveMemoryWarning];
    // Dispose of any resources that can be recreated.
}

- (void)viewWillDisappear:(BOOL)animated {
    
    [self saveSettings];
    
    
    
}


-(void)loadPickerArrays {
    

    
    NSArray *sortableFonts = [[UIFont familyNames] sortedArrayUsingSelector:@selector(localizedCaseInsensitiveCompare:)];
    
    
    _arrayPickerFonts = [[NSMutableArray alloc] initWithArray:sortableFonts];
    
   	NSString *sizeString;
    _arrayPickerSize = [[NSMutableArray alloc] init];
    
    for (int sizeStep = 12; sizeStep <301; sizeStep+=4) {
        sizeString =[NSString stringWithFormat:@"%d",sizeStep];
        [_arrayPickerSize addObject:sizeString]; 
        
    }
    
    
    
}

-(void)loadGlobalSettings{
    
   
    //SAVE AND LOAD CODE
 
    
    _arrayGlobalSettings = [[NSMutableArray alloc] initWithArray:[DefaultsDataManager getDataForKey:_keyForGlobalSettings]];
    
    
    if (![_arrayGlobalSettings count]) {
        _arrayGlobalSettings = [[NSMutableArray alloc]initWithObjects:@(YES),@"Name of Event",//UseSelector and Name 0,1
                                @0,@0,@0,//text color 2,3,4
                                @0,@255,@0,//background to text 5,6,7
                                @"Arial",@64, //font and size 8,9
                                @5, //10 is row number for font;
                                @13, //11 is row number for size;
                                @1,@1,@1, //12,13,14 is ball roll, display and drop seconds;
                                @1, //15 is smart selector on (i.e. value of one)
                                @1, //16 use Special Checking is on
                                nil];
        
           }
   
    
    NSString *fontName = [_arrayGlobalSettings objectAtIndex:8];
    NSInteger fontSize = [[_arrayGlobalSettings objectAtIndex:10] floatValue];
    
    
    CGFloat width = [UIScreen mainScreen].bounds.size.width;
    CGFloat height = [UIScreen mainScreen].bounds.size.height;
    
    _nameOfEvent = [[UITextView alloc]initWithFrame:CGRectMake(0, 50, width, height/2)];
    _nameOfEvent.layer.borderColor = [[UIColor blackColor] CGColor];
    _nameOfEvent.layer.borderWidth = 5;
    _nameOfEvent.font = [UIFont fontWithName:fontName size:fontSize];
    _nameOfEvent.textAlignment = NSTextAlignmentCenter;
    
    _nameOfEvent.text = [_arrayGlobalSettings objectAtIndex:1];
    
    _nameOfEvent.scrollEnabled = NO;
    
    [_nameOfEvent setDelegate:self];
    
    
    [self.view addSubview:_nameOfEvent];
    
    [self applySettings];
    
   
}

-(void)applySettings {
    
    _nameOfEvent.textColor = [UIColor colorWithRed:[[_arrayGlobalSettings objectAtIndex:2] floatValue]/255 green:[[_arrayGlobalSettings  objectAtIndex:3] floatValue]/255 blue:[[_arrayGlobalSettings objectAtIndex:4]floatValue]/255 alpha:1];
    
    _nameOfEvent.backgroundColor = [UIColor colorWithRed:[[_arrayGlobalSettings objectAtIndex:5] floatValue]/255 green:[[_arrayGlobalSettings  objectAtIndex:6] floatValue]/255 blue:[[_arrayGlobalSettings objectAtIndex:7]floatValue]/255 alpha:1];
    
    switch (_selectedSegment) {
        case 0:
            _sliderRed.value = [[_arrayGlobalSettings objectAtIndex:2] floatValue];
            _sliderGreen.value = [[_arrayGlobalSettings objectAtIndex:3] floatValue];
            _sliderBlue.value = [[_arrayGlobalSettings objectAtIndex:4] floatValue];
            break;
        case 1:
            _sliderRed.value = [[_arrayGlobalSettings objectAtIndex:5] floatValue];
            _sliderGreen.value = [[_arrayGlobalSettings objectAtIndex:6] floatValue];
            _sliderBlue.value = [[_arrayGlobalSettings objectAtIndex:7] floatValue];
            break;
        default:
            break;
    }
    
    
    _font = [_arrayGlobalSettings objectAtIndex:8];
     float size = [[_arrayGlobalSettings objectAtIndex:9] floatValue];
    _nameOfEvent.font = [UIFont fontWithName:_font size:size];
    
    _fontSize.text = [NSString stringWithFormat:@"%@",[_arrayGlobalSettings objectAtIndex:9]];
    
    float startRow1 = [[_arrayGlobalSettings objectAtIndex:10] floatValue];
    float startRow2 =[[_arrayGlobalSettings objectAtIndex:11] floatValue];

    [_pickerFonts selectRow:startRow1 inComponent:0 animated:YES];
    [_pickerFonts selectRow:startRow2 inComponent:1 animated:YES];
    
    [self.view bringSubviewToFront:_fontSize];
    
    
}

- (IBAction)changeSwitchUseSelector:(id)sender {
    

    if (_switchUseSelector.isOn == YES) {
        [_arrayGlobalSettings replaceObjectAtIndex:0 withObject:@1];
       
        
    }
    else {
       
        [_arrayGlobalSettings replaceObjectAtIndex:0 withObject:@0];
       
    }
   
    
    
    
}


- (IBAction)switchUnmarkedColumnsChanged:(id)sender {
    
    if (_switchUnmarkedColumns.isOn == YES) {
       [_arrayGlobalSettings replaceObjectAtIndex:15 withObject:@1];
    }
    else {
        [_arrayGlobalSettings replaceObjectAtIndex:15 withObject:@0];
        
    }
    
}

- (IBAction)segmentTextOrBackgroundSelected:(id)sender {
    if (_segmentTextOrBackground.selectedSegmentIndex== 0) {
        _selectedSegment= 0;
    }
    if (_segmentTextOrBackground.selectedSegmentIndex== 1) {
        _selectedSegment = 1;
    }
    
    [self applySettings];
    [self saveSettings];
    
  
}

- (IBAction)switchSpecialCheckingMoved:(id)sender {
    if (_switchUseSpecialChecking.isOn == YES) {
        [_arrayGlobalSettings replaceObjectAtIndex:16 withObject:@1];
        _btnSetUpChecking.enabled = YES;
    }
    else {
        [_arrayGlobalSettings replaceObjectAtIndex:16 withObject:@0];
        _btnSetUpChecking.enabled = NO;
        
    }

}

- (IBAction)sliderChanged:(id)sender {
    _changeHappened = YES;
    
    
    
    NSNumber *redValue = [NSNumber numberWithFloat:_sliderRed.value];
    NSNumber *greenValue = [NSNumber numberWithFloat:_sliderGreen.value];
    NSNumber *blueValue = [NSNumber numberWithFloat:_sliderBlue.value];
    
    switch (_selectedSegment) {
        case 0:
            _nameOfEvent.textColor = [UIColor colorWithRed:_sliderRed.value/255 green:_sliderGreen.value/255 blue:_sliderBlue.value/255 alpha:1];
            
            [_arrayGlobalSettings replaceObjectAtIndex:2 withObject:redValue];
            [_arrayGlobalSettings replaceObjectAtIndex:3 withObject:greenValue];
            [_arrayGlobalSettings replaceObjectAtIndex:4 withObject:blueValue];
            break;
        case 1:
            _nameOfEvent.backgroundColor = [UIColor colorWithRed:_sliderRed.value/255 green:_sliderGreen.value/255 blue:_sliderBlue.value/255 alpha:1];
            
            [_arrayGlobalSettings replaceObjectAtIndex:5 withObject:redValue];
            [_arrayGlobalSettings replaceObjectAtIndex:6 withObject:greenValue];
            [_arrayGlobalSettings replaceObjectAtIndex:7 withObject:blueValue];
            break;
        
        default:
            break;
    }
    
}


-(void)saveSettings {
    
    
    [DefaultsDataManager saveData:_arrayGlobalSettings forKey:_keyForGlobalSettings];
    
   
    
   
  
}

//PICKER CODE
-(NSInteger)numberOfComponentsInPickerView:(UIPickerView *)pickerView{
    return 2;
    
}

-(NSInteger)pickerView:(UIPickerView *)pickerView numberOfRowsInComponent:(NSInteger)component{
    NSInteger rows;
    rows = 0;
    switch (component) {
        case 0:
            rows= _arrayPickerFonts.count;
            break;
        case 1:
            rows =_arrayPickerSize.count;
        default:
            break;
    }
    return rows;
}

-(NSString*)pickerView:(UIPickerView *)pickerView titleForRow:(NSInteger)row forComponent:(NSInteger)component{
    NSString *title= [NSString alloc];
   
    switch (component) {
        case 0:
            title = [_arrayPickerFonts objectAtIndex:row];
            break;
        case 1:
            title = [_arrayPickerSize objectAtIndex:row];
            
        default:
            break;
    }
    return title;
    
}
-(void)pickerView:(UIPickerView *)pickerView didSelectRow:(NSInteger)row inComponent:(NSInteger)component {
    
 
  float size;
    
        switch (component) {
        case 0:
                [_arrayGlobalSettings replaceObjectAtIndex:8 withObject:[_arrayPickerFonts objectAtIndex:row]];
                [_arrayGlobalSettings replaceObjectAtIndex:10 withObject:@(row)];
                 
                
                break;
        case 1:
                [_arrayGlobalSettings replaceObjectAtIndex:9 withObject:[_arrayPickerSize objectAtIndex:row]];
                [_arrayGlobalSettings replaceObjectAtIndex:11 withObject:@(row)];

            break;
        default:
            break;
    }
    
    _font = [_arrayGlobalSettings objectAtIndex:8];
    size = [[_arrayGlobalSettings objectAtIndex:9] floatValue];
    _nameOfEvent.font = [UIFont fontWithName:_font size:size];
    
  
    _fontSize.text = [NSString stringWithFormat:@"%@",[_arrayGlobalSettings objectAtIndex:9]];
    
  [self.view bringSubviewToFront:_fontSize];
    

    _changeHappened = YES;
    
}



-(IBAction)fontSizeStartEdit:(id)sender {
 /*   [UIView animateWithDuration:0.5 animations:^{
        
        _fontSize.frame = CGRectMake(875, 300, 50, 50);
        _fontSize.textColor = [UIColor redColor];
        _fontSize.backgroundColor = [UIColor whiteColor];
        _fontSize.layer.borderColor = [[UIColor blackColor] CGColor];
        _fontSize.layer.borderWidth = 2;
        [self.view bringSubviewToFront:_fontSize];
        _fontSize.text = @"";
        
        
       
    }];*/
    
    float height = self.view.bounds.size.height;
    float width = self.view.bounds.size.width;
    
    [UIView animateWithDuration:1 animations:^{
        [self.view setFrame:CGRectMake(0,-height*.45,width,height)];
    }];
    

    
    [_fontSize setKeyboardType:UIKeyboardTypeNumberPad];
   
    

    
}

-(IBAction)fontSizeEndEdit:(id)sender{
    float size;
    
    if ([[_fontSize text] floatValue]>300) {
        _fontSize.text = @"300";
    }
    if ([[_fontSize text] floatValue]<12) {
        _fontSize.text = @"12";
    }

    
    
    float height = self.view.bounds.size.height;
    float width = self.view.bounds.size.width;
    
    [UIView animateWithDuration:1 animations:^{
        [self.view setFrame:CGRectMake(0,0,width,height)];
    }];
    
    
    int selectRowSize = ([[_fontSize text] floatValue]-12)/4;
    [_pickerFonts selectRow:selectRowSize inComponent:1 animated:YES];
    [_arrayGlobalSettings replaceObjectAtIndex:9 withObject:_fontSize.text];
    size = [[_arrayGlobalSettings objectAtIndex:9] floatValue];
    [_arrayGlobalSettings replaceObjectAtIndex:11 withObject:@(selectRowSize)];
    
     _fontSize.frame = CGRectMake(875, 650, 50, 50);

    _nameOfEvent.font = [UIFont fontWithName:_font size:size];
    
    
    _changeHappened = YES;
    
    
    
}


//NOTE: this works because added delegate statement <UITextFieldDelegate> in h file
-(BOOL)textFieldShouldReturn:(UITextField *)textField
{
    _changeHappened = YES;
    [textField resignFirstResponder];
    return YES;
}


-(BOOL)textViewShouldEndEditing:(UITextView *)textView {
    [textView resignFirstResponder];
    [_arrayGlobalSettings replaceObjectAtIndex:1 withObject:_nameOfEvent.text];
   
    return YES;
    
}



- (IBAction)stepperRollChanged:(id)sender {
    
    _labelRollTime.text = [NSString stringWithFormat:@"%2.1f seconds",_stepperRoll.value];
    [_arrayGlobalSettings replaceObjectAtIndex:12 withObject:@(_stepperRoll.value)];
    [DefaultsDataManager saveData:_arrayGlobalSettings forKey:_keyForGlobalSettings];
    
}


- (IBAction)stepperDisplayChanged:(id)sender {
    _labelDisplayTime.text = [NSString stringWithFormat:@"%2.1f seconds",_stepperDisplay.value];
    [_arrayGlobalSettings replaceObjectAtIndex:13 withObject:@(_stepperDisplay.value)];
    [DefaultsDataManager saveData:_arrayGlobalSettings forKey:_keyForGlobalSettings];
}

- (IBAction)stepperDropChanged:(id)sender {
    _labelDropTime.text = [NSString stringWithFormat:@"%2.1f seconds",_stepperDrop.value];
    [_arrayGlobalSettings replaceObjectAtIndex:14 withObject:@(_stepperDrop.value)];
}

- (IBAction)labelNumberOfPagesEntered:(id)sender {
    float height = self.view.bounds.size.height;
    float width = self.view.bounds.size.width;
    [UIView animateWithDuration:1 animations:^{
        [self.view setFrame:CGRectMake(0,0,width,height)];
    }];

    [_labelNumberOfPages resignFirstResponder];
    
    
}

-(void)prepareForSegue:(UIStoryboardSegue *)segue sender:(id)sender {
    
    if (([segue.identifier isEqualToString:@"segueGlobalSettingToPDF"])) {
        
        PDFViewController *viewGlobalToPDF = [segue destinationViewController];
        viewGlobalToPDF.pages = [_labelNumberOfPages.text intValue];
        
    }
}
- (IBAction)btnMakeCaresPressed:(id)sender {
       if ([_labelNumberOfPages.text integerValue]>0) {
     
    [self performSegueWithIdentifier:@"segueGlobalSettingToPDF" sender:self];
}

}

- (IBAction)NumberPageBeginEdit:(id)sender {
    
    float height = self.view.bounds.size.height;
    float width = self.view.bounds.size.width;
    
    [UIView animateWithDuration:1 animations:^{
        [self.view setFrame:CGRectMake(0,-height*.25,width,height)];
    }];
  
    _labelNumberOfPages.frame = CGRectMake(200, 300, 50, 50);
    [self.view bringSubviewToFront:_labelNumberOfPages];
    
     [_labelNumberOfPages setKeyboardType:UIKeyboardTypeNumberPad];
}
- (IBAction)switchRaffleValueChange:(id)sender {
}
- (IBAction)btnSetUpRaffleSelected:(id)sender {
}

@end
