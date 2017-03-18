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
    
 /*   CGAffineTransform transformRotate = CGAffineTransformMakeRotation(M_PI_2);
    _sliderLineHeight.transform = transformRotate;
    
   */
    
    
    UITapGestureRecognizer *tapGesture = [[UITapGestureRecognizer alloc] initWithTarget:self action:@selector(closeKeyboard)];
    [self.view addGestureRecognizer:tapGesture];
    
    _labelNumberOfPages.layer.borderColor = [[UIColor blackColor] CGColor];
    _labelNumberOfPages.layer.borderWidth = 2;
    
    
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
    
  //SET UP SLIDER
    _totalWidth = [UIScreen mainScreen].bounds.size.width;
    _totalHeight = [UIScreen mainScreen].bounds.size.height;
    
    
    _sliderWidth.minimumValue = 0;
    _sliderWidth.maximumValue = _totalWidth;
    
    _sliderHeight.minimumValue = 0;
    _sliderHeight.maximumValue = _totalHeight*.5;
    
    _sliderX.minimumValue = 0;
    _sliderX.maximumValue=_totalWidth;
    
    _sliderY.minimumValue = 0;
    _sliderY.maximumValue = _totalHeight*.5;
    
    _sliderLineHeight.minimumValue = 0;
    _sliderLineHeight.maximumValue = 300;
    
    
    
    
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
   //
    if ([[_arrayGlobalSettings objectAtIndex:22] isEqual:@YES]) {
        [_switchRaffle setOn:YES];
        _btnSetUpRaffle.enabled = YES;
        
    }
    
    else {
        [_switchRaffle setOn:NO];
        _btnSetUpRaffle.enabled = NO;
        
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

#pragma mark LOAD ARRAYS AND SETTINGS

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
                                @1,@3,@1, //12,13,14 is ball roll, display and drop seconds;
                                @1, //15 is smart selector on (i.e. value of one)
                                @1, //16 use Special Checking is on
                                @0, //17 add image is Off.
                                @10, //18 X coordinate of image
                                @10, //19  Y coordinate of image
                                @100, //20 width of image
                                @100, //21 height of image
                                @0,//22  DON"T use raffle
                                @0,//23 Theme NOT selected
                                @0,//24 Image On Top
                                nil];
        
           }
   
    [self applyLineSpacing:0.5 fontSize:48];
    
    _fontName = [_arrayGlobalSettings objectAtIndex:8];
    _floatFontSize = [[_arrayGlobalSettings objectAtIndex:10] floatValue];
    
    CGFloat width = [UIScreen mainScreen].bounds.size.width;
    CGFloat height = [UIScreen mainScreen].bounds.size.height;
    
  
    _viewNameOfEvent = [[UIView alloc] initWithFrame:CGRectMake(0, 44, width, height/2)];
    _nameOfEvent = [[CursorFixedTextView alloc]initWithFrame:CGRectMake(0, 0, width, height/2)];
    
  /*
    _nameOfEvent.font = [UIFont fontWithName:_fontName size:_floatFontSize];
    _nameOfEvent.textAlignment = NSTextAlignmentCenter;
    
    _nameOfEvent.text = [_arrayGlobalSettings objectAtIndex:1];
   */
    
    
    _nameOfEvent.scrollEnabled = NO;
    [_nameOfEvent setDelegate:self];
    
    
    [self.view addSubview:_viewNameOfEvent];
    [_viewNameOfEvent addSubview:_nameOfEvent];
    _nameOfEvent.clipsToBounds = NO;
    
    
    if ([_arrayGlobalSettings[17] integerValue] == 1) {
        [self yesImageExist];
    }

    [self handleEventName:_arrayGlobalSettings[1] eventFont:_arrayGlobalSettings[8] eventFontSize:[_arrayGlobalSettings[9] floatValue] lineSpacing:_sliderLineHeight.value alignmentValue:1];
    [self applySettings];
    
   
}



-(void)handleEventName: (NSString*)text eventFont: (NSString *)eventFont eventFontSize: (float)eventFontSize lineSpacing: (float)heightValue alignmentValue: (NSInteger) alignmentValue {
    //create style
    NSMutableParagraphStyle *paragraphStyle = [[NSMutableParagraphStyle alloc] init];
    
  
    paragraphStyle.lineSpacing = heightValue;
    paragraphStyle.lineHeightMultiple = 0.5;
    paragraphStyle.paragraphSpacingBefore = 0;
    paragraphStyle.paragraphSpacing = 0;
    paragraphStyle.minimumLineHeight = 0;
    paragraphStyle.maximumLineHeight = eventFontSize;
   
     _nameOfEvent.textContainerInset = UIEdgeInsetsMake(eventFontSize/1.5, 0, -eventFontSize, 0);
    
  
    
    
    
    switch (alignmentValue) {
        case 0:
            paragraphStyle.alignment = NSTextAlignmentLeft;
            break;
        case 1:
            paragraphStyle.alignment = NSTextAlignmentCenter;
            break;
        case 2:
            paragraphStyle.alignment = NSTextAlignmentRight;
            break;
        default:
            paragraphStyle.alignment = NSTextAlignmentLeft;
            break;
    }
    

    
    NSDictionary *attributeDictionary = @{
                                          NSParagraphStyleAttributeName: paragraphStyle,
                                          NSFontAttributeName: [UIFont fontWithName:eventFont size:eventFontSize],
                                          
                                          };
    _nameOfEvent.attributedText = [[NSAttributedString alloc] initWithString:text attributes:attributeDictionary];
    
    
}

-(void)applyLineSpacing: (float)heightValue fontSize: (float)fontSize{
    
    NSString *fontName = [_arrayGlobalSettings objectAtIndex:8];
  //  fontSize = [[_arrayGlobalSettings objectAtIndex:10] floatValue];
    
    NSLog(@"the font name is %@ and the size is %f",fontName,fontSize);
    
    NSMutableParagraphStyle *paragraphStyle = [[NSMutableParagraphStyle alloc] init];
    
    
    paragraphStyle.headIndent = 15; // <--- indention if you need it
    paragraphStyle.firstLineHeadIndent = 15;
    
    paragraphStyle.lineSpacing = 10; // <--- magic line spacing here!
    paragraphStyle.lineHeightMultiple = heightValue;
    paragraphStyle.alignment = NSTextAlignmentCenter;
    
    
    
    NSDictionary *attrsDictionary =
    @{ NSParagraphStyleAttributeName: paragraphStyle,
       NSFontAttributeName:[UIFont fontWithName:fontName size:fontSize],
       }; // <-- there are many more attrs, e.g NSFontAttributeName
    
    self.nameOfEvent.attributedText = [[NSAttributedString alloc] initWithString:@"Hello World\nHello World\nHello World" attributes:attrsDictionary];
    
    
    
}

- (IBAction)segmentAlignmentChanged:(UISegmentedControl *)sender {
    
     [self handleEventName:_arrayGlobalSettings[1] eventFont:_arrayGlobalSettings[8] eventFontSize:[_arrayGlobalSettings[9] floatValue] lineSpacing:_sliderLineHeight.value alignmentValue:sender.selectedSegmentIndex];
}

- (IBAction)sliderLIneHeightChanged:(id)sender {
    [self handleEventName:_arrayGlobalSettings[1] eventFont:_arrayGlobalSettings[8] eventFontSize:[_arrayGlobalSettings[9] floatValue] lineSpacing:_sliderLineHeight.value alignmentValue:3];
}

-(void)applySettings {
    
    _nameOfEvent.textColor = [UIColor colorWithRed:[[_arrayGlobalSettings objectAtIndex:2] floatValue]/255 green:[[_arrayGlobalSettings  objectAtIndex:3] floatValue]/255 blue:[[_arrayGlobalSettings objectAtIndex:4]floatValue]/255 alpha:1];
    
    _viewNameOfEvent.backgroundColor = [UIColor colorWithRed:[[_arrayGlobalSettings objectAtIndex:5] floatValue]/255 green:[[_arrayGlobalSettings  objectAtIndex:6] floatValue]/255 blue:[[_arrayGlobalSettings objectAtIndex:7]floatValue]/255 alpha:1];
    
    _nameOfEvent.backgroundColor = [UIColor clearColor];
    

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

    NSString *songTitle = [NSString stringWithFormat:@"%@",[DefaultsDataManager getDataForKey:@"keySongName"]];
  
    if ([_arrayGlobalSettings[23] isEqual:@0]) {
    
        _labelSongData.text = @"No Song Selected";
        }
    
    else {
        _labelSongData.text = songTitle;
        [_arrayGlobalSettings replaceObjectAtIndex:23 withObject:@1];
        
    }
    
    _labelSongData.layer.borderWidth = 2;
    _labelSongData.layer.borderColor = [[UIColor redColor] CGColor];
    
    //SET UP SEGMENT
   _segmentOverUnder.selectedSegmentIndex = [_arrayGlobalSettings[24] integerValue];
    
   //Photo Frame
    if ([_arrayGlobalSettings[17] integerValue]==1) {
        [_btnImage setTitle:@"Delete Image" forState:UIControlStateNormal];
        [self yesImageExist];
    }
    else{
        [_btnImage setTitle:@"Get Image" forState:UIControlStateNormal];
        _sliderX.enabled = NO;
        _sliderY.enabled = NO;
        _sliderWidth.enabled = NO;
        _sliderHeight.enabled = NO;
    }
    
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
    
    
      [self handleEventName:_arrayGlobalSettings[1] eventFont:_arrayGlobalSettings[8] eventFontSize:[_arrayGlobalSettings[9] floatValue] lineSpacing:_sliderLineHeight.value alignmentValue:1];
   
    _fontSize.text = [NSString stringWithFormat:@"%@",[_arrayGlobalSettings objectAtIndex:9]];
    
    [self.view bringSubviewToFront:_fontSize];
    

    
}



-(IBAction)fontSizeStartEdit:(id)sender {

    
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
    
    [_fontSize resignFirstResponder];
    
    
    
    
}


//NOTE: this works because added delegate statement <UITextFieldDelegate> in h file


-(BOOL)textFieldShouldReturn:(UITextField *)textField
{
   
    [textField resignFirstResponder];
    return YES;
}

-(BOOL)textViewShouldBeginEditing:(UITextView *)textView {
    _nameOfEvent.font = [UIFont fontWithName:_arrayGlobalSettings[8] size:[_arrayGlobalSettings[9] floatValue]];
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

        
    [UIView animateWithDuration:1 animations:^{
        [self.view setFrame:CGRectMake(0,-height*.45,width,height)];
    }];
     [_labelNumberOfPages setKeyboardType:UIKeyboardTypeNumberPad];
}
- (IBAction)switchRaffleValueChange:(id)sender {
    if ([_arrayGlobalSettings[22] isEqual:@1]) {
        [_arrayGlobalSettings replaceObjectAtIndex:22 withObject:@0];
        _btnSetUpRaffle.enabled = NO;
        }
    else {
        [_arrayGlobalSettings replaceObjectAtIndex:22 withObject:@1];
        _btnSetUpRaffle.enabled = YES;

    }
}
- (IBAction)btnSetUpRaffleSelected:(id)sender {
}

-(void)closeKeyboard{
    [_fontSize resignFirstResponder];
    [_labelNumberOfPages resignFirstResponder];
    
    
}

#pragma mark IMAGE HANDLING HERE

-(void)yesImageExist {
    [_imageView removeFromSuperview];
    
    _sliderX.enabled = YES;
    _sliderY.enabled = YES;
    _sliderWidth.enabled = YES;
    _sliderHeight.enabled = YES;
    
    [self makeFrame:[_arrayGlobalSettings[18] floatValue] yValue:[_arrayGlobalSettings[19] floatValue] width:[_arrayGlobalSettings[20] floatValue] height:[_arrayGlobalSettings[21] floatValue]];
        [_btnImage setTitle:@"Delete Image" forState:UIControlStateNormal];
    _sliderX.value = [_arrayGlobalSettings[18] floatValue];
    _sliderY.value = [_arrayGlobalSettings[19] floatValue];
    _sliderWidth.value = [_arrayGlobalSettings[20] floatValue];
    _sliderHeight.value = [_arrayGlobalSettings[21] floatValue];
}

-(void)makeFrame: (float)xValue yValue: (float)yValue width: (float)width height:(float)height{
    
    _imageView = [[UIImageView alloc] initWithFrame:CGRectMake(xValue, yValue, width, height)];
    [_nameOfEvent addSubview:_imageView];
    
    if ([_arrayGlobalSettings[24] integerValue]==0) {
        [_nameOfEvent bringSubviewToFront:_imageView];
        }
    
    if ([_arrayGlobalSettings[24] integerValue]==1) {
        [_nameOfEvent sendSubviewToBack:_imageView];
        }
    

   [self loadImage];
    
}

-(void)loadImage {
    _imageView.image = [UIImage imageWithData:[DefaultsDataManager getDataForKey:@"imageKey"]];
    
}

-(void)removeImage{
    [_imageView removeFromSuperview];
   
}

- (IBAction)btnImagePressed:(id)sender {
    if ([_arrayGlobalSettings[17] floatValue] == 1) {
        [_imageView removeFromSuperview];
        [_btnImage setTitle:@"Get Image" forState:UIControlStateNormal];
        [_arrayGlobalSettings replaceObjectAtIndex:17 withObject:@0];
        _sliderX.enabled = NO;
        _sliderY.enabled = NO;
        _sliderWidth.enabled = NO;
        _sliderHeight.enabled = NO;
         
    }
    
    else {
        
     [self yesImageExist];
     [_arrayGlobalSettings replaceObjectAtIndex:17 withObject:@1];
    _ipc = [[UIImagePickerController alloc] init];
    _ipc.delegate = self;
    _ipc.sourceType = UIImagePickerControllerSourceTypePhotoLibrary;
    _popover = [[UIPopoverController alloc] initWithContentViewController:_ipc];
    
    [_popover presentPopoverFromRect:_btnImage.frame  inView:self.view permittedArrowDirections:UIPopoverArrowDirectionAny animated:YES];
        
        
    }
   
}

-(void)imagePickerController:(UIImagePickerController *)picker didFinishPickingMediaWithInfo:(NSDictionary<NSString *,id> *)info {
    
    [_popover dismissPopoverAnimated:YES];
    [picker dismissViewControllerAnimated:YES completion:nil];
    
    _imageView.image = [info objectForKey:UIImagePickerControllerOriginalImage];
   
    
    [self saveImage];
    [self yesImageExist];
    
    
    
}
-(void)setFrameOfUIImageView{
    
    if (_sliderX.value>_totalWidth-_sliderWidth.value) {
        _sliderX.value =_totalWidth-_sliderWidth.value;
    }
    
    if (_sliderY.value > _totalHeight*.5 - _sliderHeight.value) {
        _sliderY.value = _totalHeight*.5 - _sliderHeight.value;
    }
    
    [_arrayGlobalSettings replaceObjectAtIndex:18 withObject:@(_sliderX.value)];
    [_arrayGlobalSettings replaceObjectAtIndex:19 withObject:@(_sliderY.value)];
    [_arrayGlobalSettings replaceObjectAtIndex:20 withObject:@(_sliderWidth.value)];
    [_arrayGlobalSettings replaceObjectAtIndex:21 withObject:@(_sliderHeight.value)];
    
    [self yesImageExist];
    
}

- (IBAction)sliderImageChange:(id)sender {
    
    [_imageView removeFromSuperview];

    [self setFrameOfUIImageView];
    
}

- (IBAction)segmentOverUnderChanged:(UISegmentedControl *)sender {
    switch (sender.selectedSegmentIndex) {
        case 0:
            [_nameOfEvent bringSubviewToFront:_imageView];
            _selectedOverUnderSegment = 0;
            [_arrayGlobalSettings replaceObjectAtIndex:24 withObject:@0];
            break;
        case 1:
            [_nameOfEvent sendSubviewToBack:_imageView];
            _selectedOverUnderSegment = 1;
            [_arrayGlobalSettings replaceObjectAtIndex:24 withObject:@1];
            break;
        default:
            break;
    }
    
   }

-(void)saveImage{
    NSData *data = UIImagePNGRepresentation(_imageView.image);
    
    [DefaultsDataManager saveData:data forKey:@"imageKey"];
    
}


#pragma mark CHOOSE SONG

- (IBAction)btnChoosePressed:(id)sender {
    
    MPMediaPickerController *mediaPicker= [[MPMediaPickerController alloc] initWithMediaTypes:MPMediaTypeMusic];
    mediaPicker.delegate = self;
    mediaPicker.allowsPickingMultipleItems = NO;
    [self presentViewController:mediaPicker animated:YES completion:nil];
    
    
}

-(void)mediaPickerDidCancel:(MPMediaPickerController *)mediaPicker{
    [self dismissViewControllerAnimated:mediaPicker completion:nil];
   
}

-(void)mediaPicker:(MPMediaPickerController *)mediaPicker didPickMediaItems:(MPMediaItemCollection *)mediaItemCollection{
    
   [self dismissViewControllerAnimated:mediaPicker completion:nil];
    
    _item = [[mediaItemCollection items] objectAtIndex:0];
    
    NSString *keyForData = @"keyThemeSong";
    NSData *data = [NSKeyedArchiver archivedDataWithRootObject:mediaItemCollection];
    [DefaultsDataManager saveData:data forKey:keyForData];
    
    _labelSongData.text= [_item valueForProperty:MPMediaItemPropertyTitle];
    [DefaultsDataManager saveData:_labelSongData.text forKey:@"keySongName"];
    
    [_arrayGlobalSettings replaceObjectAtIndex:23 withObject:@1];
    
   
    
}


- (IBAction)btnDeleteSongPress:(id)sender {
    [_arrayGlobalSettings replaceObjectAtIndex:23 withObject:@0];
    [self applySettings];
}

@end
