

//
//  LocalSettingsViewController.m
//  
//
//  Created by Adam Schor on 7/17/15.
//
//

#import "LocalSettingsViewController.h"
#import "DefaultsDataManager.h"

@interface LocalSettingsViewController ()

@end

@implementation LocalSettingsViewController

- (BOOL)prefersStatusBarHidden{
    return YES;
}


- (void)viewDidLoad {
    
    _textViewGameComments.layer.borderColor = [[UIColor blueColor] CGColor];
    _textViewGameComments.layer.borderWidth = 2;
    
    
    _protectedGrids = 3;
    _protectedPresets = 3;
    
    
   _height = [UIScreen mainScreen].bounds.size.height;
    _width = [UIScreen mainScreen].bounds.size.width;
   
   
   
    
    
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
    
    
    _sliderGreen.frame = CGRectMake(200, 20, 600, 20);
    
    
    _sliderRed.backgroundColor = [UIColor redColor];
    _sliderGreen.backgroundColor = [UIColor greenColor];
    _sliderBlue.backgroundColor = [UIColor blueColor];
    
  
    //SET UP STEPPERS AND LABEL
    
    _stepperNumberOfGames.maximumValue = 12;
    _stepperNumberOfGames.minimumValue = 1;
    _labelNumberOfGames.text = [NSString stringWithFormat:@"%2.0f Games",_stepperNumberOfGames.value];
    
    //GET NUMBER OF GAMES
    _keyForNumberOfGames = @"keyForNumberOfGames";
    _numberOfGames = [[DefaultsDataManager getDataForKey:_keyForNumberOfGames] integerValue];
    if (_numberOfGames ==0) {
        _numberOfGames = 8;
    }
    
    

    _stepperNumberOfGames.value = _numberOfGames;
    
    if (_stepperNumberOfGames.value == 1) {
        _labelNumberOfGames.text = [NSString stringWithFormat:@"%2.0f Game",_stepperNumberOfGames.value];
    }
    else{ _labelNumberOfGames.text = [NSString stringWithFormat:@"%2.0f Games",_stepperNumberOfGames.value];
    }

    
    [self createGameArrays];
    [self createPickerArray];
 
    [_pickerGameSettings selectRow:0 inComponent:0 animated:YES];
   
    [_pickerMarkerColors selectRow:0 inComponent:0 animated:YES];
  
    _pickerGameSettings.layer.borderColor = [[UIColor blueColor] CGColor];
    _pickerGameSettings.layer.borderWidth = 3;
    
    _pickerPresets.layer.borderColor = [[UIColor blueColor] CGColor];
    _pickerPresets.layer.borderWidth = 3;
    
    
    _textFieldRedValue.textColor =[UIColor redColor];
    _textFieldRedValue.layer.borderColor = [[UIColor blackColor] CGColor];
    _textFieldRedValue.layer.borderWidth = 2;
    _textFieldRedValue.font = [UIFont fontWithName:@"Helvetica" size:24];
    _textFieldRedValue.textAlignment = NSTextAlignmentCenter;
    
    _textFieldGreenValue.textColor =[UIColor greenColor];
    _textFieldGreenValue.layer.borderColor = [[UIColor blackColor] CGColor];
    _textFieldGreenValue.layer.borderWidth = 2;
    _textFieldGreenValue.font = [UIFont fontWithName:@"Helvetica" size:24];
    _textFieldGreenValue.textAlignment = NSTextAlignmentCenter;
    
    _textFieldBlueValue.textColor =[UIColor blueColor];
    _textFieldBlueValue.layer.borderColor = [[UIColor blackColor] CGColor];
    _textFieldBlueValue.layer.borderWidth = 2;
    _textFieldBlueValue.font = [UIFont fontWithName:@"Helvetica" size:24];
    _textFieldBlueValue.textAlignment = NSTextAlignmentCenter;

    

    [super viewDidLoad];
    
    //[self makeDisplayButtons];
   // [self createDisplayGrid];
    
    
    // Do any additional setup after loading the view.
}

-(void)viewDidAppear:(BOOL)animated {
    
    [self.navigationController setNavigationBarHidden:NO];
    
   [self pickerView:_pickerGameSettings didSelectRow:0 inComponent:0];
    
   [self pickerView:_pickerPresets didSelectRow:0 inComponent:0];
    
  //  [self gridButtons];
    
   
    
  
}



- (void)didReceiveMemoryWarning {
    [super didReceiveMemoryWarning];
    // Dispose of any resources that can be recreated.
}

#pragma mark PICKER ELEMENTS HERE

-(NSInteger)numberOfComponentsInPickerView:(UIPickerView *)pickerView {
    int componentNumber = 0;
    if (pickerView == _pickerGameSettings) {
        componentNumber = 1;
    }
    
    if (pickerView == _pickerMarkerColors) {
        componentNumber =1;
    }
  
    if (pickerView == _pickerPresets) {
        componentNumber = 3;
       
    }
    return componentNumber;
}

-(NSInteger)pickerView:(UIPickerView *)pickerView numberOfRowsInComponent:(NSInteger)component {
    NSInteger rows;
    
    rows = 0;
    
    if (pickerView == _pickerGameSettings){
    
            rows = _arrayPickerGameColors.count;
     
    }
    
    if (pickerView == _pickerMarkerColors) {
        rows = _arrayPickerMarkers.count;
    }
  
    else {
        switch (component) {
            case 0:
                rows = _arrayPickerGameNumber.count;
                break;
            case 1:
                rows = _arrayPickerPresets.count;
                break;
            case 2:
                rows = _arrayPickerGrids.count;
                break;
                
            default:
                break;
        }
    }
    return rows;
    
}

//  TO FORMAT PICKER VIEWS
-(UIView * )pickerView:(UIPickerView *)pickerView viewForRow:(NSInteger)row forComponent:(NSInteger)component reusingView:(UIView *)view {
  
    
    NSString *fontName = @"Helvetica";
    float fontSize = 36;
    
    
    
    
    UILabel *tview = (UILabel *) view;
    if (pickerView == _pickerPresets) {
        switch (component) {
            case 0:
        
        tview = [[UILabel alloc] init];
        tview.backgroundColor = [UIColor lightGrayColor];
        tview.textColor = [UIColor blueColor];
        
        tview.text = [_arrayPickerGameNumber objectAtIndex:row];
                break;
        
            case 1:
                if (row<_protectedPresets) {
                    
                        tview = [[UILabel alloc] init];
                        tview.backgroundColor = [UIColor yellowColor];
                        tview.textColor = [UIColor blueColor];
                    
                    
                }
                if (row>=_protectedPresets) {
                    
                        tview = [[UILabel alloc] init];
                        tview.backgroundColor = [UIColor greenColor];
                        tview.textColor = [UIColor blueColor];
                    
                    
                }
                 tview.text = [_arrayPickerPresets objectAtIndex:row];
                break;
                
            case 2:
                if (row<_protectedGrids) {
                    
                    tview = [[UILabel alloc] init];
                    tview.backgroundColor = [UIColor yellowColor];
                    tview.textColor = [UIColor blueColor];
                }
                if (row>=_protectedGrids) {
                    
                    tview = [[UILabel alloc] init];
                    tview.backgroundColor = [UIColor greenColor];
                    tview.textColor = [UIColor blueColor];
                }
                tview.text = [_arrayPickerGrids objectAtIndex:row];
                break;
    
                
                
            default:
                //do something else
                break;
                
        }
    
        
    }
    
    if (pickerView ==_pickerGameSettings) {
        tview = [[UILabel alloc] init];
        tview.backgroundColor = [UIColor lightGrayColor];
        tview.textColor = [UIColor blueColor];
        
        tview.text = [_arrayPickerGameColors objectAtIndex:row];

    }
    
    if (pickerView == _pickerMarkerColors) {
        tview = [[UILabel alloc] init];
        tview.backgroundColor = [UIColor whiteColor];
        tview.textColor = [UIColor blueColor];
        
        tview.text = _arrayPickerMarkers[row];
        
    }
    
    tview.textAlignment = NSTextAlignmentCenter;
    tview.adjustsFontSizeToFitWidth = YES;
    [tview setFont:[UIFont fontWithName:fontName size:fontSize]];
    return tview;
    
}

-(CGFloat)pickerView:(UIPickerView *)pickerView rowHeightForComponent:(NSInteger)component{
    return 50;
}


/*
 UNFORMATED TITLES FOR PICKERS ROWS
-(NSString *)pickerView:(UIPickerView *)pickerView titleForRow:(NSInteger)row forComponent:(NSInteger)component {
    NSString *title = [NSString alloc];
    
    if (pickerView == _pickerGameSettings) {
        
        title = [_arrayPickerGameColors objectAtIndex:row];
    }
    
    if (pickerView == _pickerMarkerColors) {
        switch (row) {
            case 0:
                title = @"White Markers";
                break;
            case 1:
                title = @"Black Markers";
                break;
                
            default:
                break;
        }
    }

    if (pickerView == _pickerPresets) {
        switch (component) {
            case 0:
                title = [_arrayPickerGameNumber objectAtIndex:row];
                break;
            case 1:
                title = [_arrayPickerPresets objectAtIndex:row];
                break;
            case 2:
                title = [_arrayPickerGrids objectAtIndex:row];
                break;
            default:
                break;
        }
     }
        return title;
   
}*/

-(void)pickerView:(UIPickerView *)pickerView didSelectRow:(NSInteger)row inComponent:(NSInteger)component{
   
    
    if (pickerView == _pickerGameSettings) {
  
            _attributeSelected = [_arrayPickerGameColors objectAtIndex:row];
            _attributeNumber = row+1;
        
            
            if (row == 7) {
                UITextField *textField = [_arrayDisplayButtons objectAtIndex:9];
                textField.enabled = YES;
                _allowGridEdits = YES;
               
                
            }
        
           else {
                UITextField *textField = [_arrayDisplayButtons objectAtIndex:9];
                textField.enabled = NO;
               _allowGridEdits = NO;
               
           }
        
        
    }
        

    if (pickerView == _pickerPresets) {
        
            switch (component) {
            case 0://GAME NUMBER
                _gameNumber = row;
                
                [_pickerPresets selectRow:[_arrayCoordinatesColors [row] integerValue] inComponent:1 animated:YES];
                [_pickerPresets selectRow:[_arrayCoordinatesGrids  [row] integerValue] inComponent:2 animated:YES];
                [_pickerMarkerColors selectRow:[_arrayGameColorSettings[21] integerValue] inComponent:0 animated:YES];
                    
                      
                _presetSelected = [_arrayCoordinatesColors[row] integerValue];
                _gridSelected = [_arrayCoordinatesGrids   [row] integerValue];
                _textViewGameComments.text = _arrayGameComments [row];
                 
                
                    
                   
                    
                    
                    
                break;
            
            case 1://COLOR SELECTION
                _presetSelected = row;
                [_arrayCoordinatesColors replaceObjectAtIndex:_gameNumber withObject:@(row)];
                [DefaultsDataManager saveData:_arrayCoordinatesColors forKey:_keyForCoordinatesColors];
                [_pickerMarkerColors selectRow:[_arrayGameColorSettings[21] integerValue] inComponent:0 animated:YES];
              
                                   break;
            
            case 2://GRID SELECTION
                _gridSelected = row;
                [_arrayCoordinatesGrids replaceObjectAtIndex:_gameNumber withObject:@(row)];
                [DefaultsDataManager saveData:_arrayCoordinatesGrids forKey:_keyForCoordinatesGrid];
             //    [_pickerMarkerColors selectRow:[_arrayGameColorSettings[21] integerValue] inComponent:0 animated:YES];
                break;
                
            default:
                    
                break;
        }
        
        
        
        
    }
    
    if (pickerView == _pickerMarkerColors) {
        
        _markerSelected = row;
        [_arrayGameColorSettings replaceObjectAtIndex:21 withObject:@(row)];
        
        [_arrayGameColorSettingsShell replaceObjectAtIndex: _presetSelected withObject:_arrayGameColorSettings];
        [DefaultsDataManager saveData:_arrayGameColorSettingsShell forKey:_keyForGameColorSettingsShell];
       
      

    }
   
    
    
    _arrayGameColorSettings = [[NSMutableArray alloc] initWithArray:_arrayGameColorSettingsShell[_presetSelected]];
    _arrayGridPatterns = [[NSMutableArray alloc] initWithArray:_arrayGridsShell[_gridSelected]];
    
     _markerSelected = [_arrayGameColorSettings[21] integerValue];
    
    [self theProcess];
    
    
    
}



//CREATE PICKER ARRAYS

-(void)createPickerArray {
    
    _arrayPickerGameColors = [[NSMutableArray alloc] initWithObjects:
                              @"Background", @"Box Background",@"Box Text",@"Called Background",@"Called Text",@"BINGO Letters",@"Game Title Color",@"Edit Name/Grid", nil];
    
    _arrayPickerGameNumber = [[NSMutableArray alloc] init];

    NSString *arrayItem;
    for (int z=1; z<=_numberOfGames; z++) {
        switch (z) {
            case 1:
                arrayItem = @"One";
                break;
            case 2:
                arrayItem = @"Two";
                break;
            case 3:
                arrayItem = @"Three";
                break;
            case 4:
                arrayItem = @"Four";
                break;
            case 5:
                arrayItem = @"Five";
                break;
            case 6:
                arrayItem = @"Six";
                break;
            case 7:
                arrayItem = @"Seven";
                break;
            case 8:
                arrayItem = @"Eight";
                break;
            case 9:
                arrayItem = @"Nine";
                break;
            case 10:
                arrayItem = @"Ten";
                break;
            case 11:
                arrayItem = @"Eleven";
                break;
            case 12:
                arrayItem = @"Twelve";
                break;
             
            default:
                break;
        }
        
        [_arrayPickerGameNumber addObject:arrayItem];
        
    }
    _keyForArrayPickerPresets = @"keyForArrayPickerPresets";
    
    
    _arrayPickerPresets = [[NSMutableArray alloc] initWithArray:[DefaultsDataManager getArrayForKey:_keyForArrayPickerPresets]];
    
    if (![_arrayPickerPresets count]) {
        _arrayPickerPresets = [[NSMutableArray alloc] initWithObjects:@"Red",@"Blue",@"Green", nil];
        
    }
    
    _keyForPickerGrids = @"keyForPickerGrids";
    
    _arrayPickerGrids = [[NSMutableArray alloc] initWithArray:[DefaultsDataManager getArrayForKey:_keyForPickerGrids]];
    
    
    
    if (![_arrayPickerGrids count]) {
    
    _arrayPickerGrids =[[NSMutableArray alloc]initWithObjects:@"Straight",@"X",@"Box",nil];
    
    }
    
   _arrayPickerMarkers = [[NSMutableArray alloc] initWithObjects:
                          @"White Discs",
                          @"Black Disks",
                          @"Star 1",
                          @"Star 2",
                          @"Circle",
                          @"Circle With Star",
                          @"Sun 1",
                          @"Sun 2",
                          @"Diamond",
                          nil];
    
    
}
#pragma mark    MAKE ARRAYS HERE


-(void)createGameArrays {
    //Create or look up GameSettings,GridSettings,ColorSettings and Game Number
    
    
    _keyForGameColorSettingsShell = @"keyForGameColorSettingsShell";
    _keyForGridsShell = @"keyForGridsShell";
    _keyForCoordinatesGrid = @"keyForCoordinatesGrid";
    _keyForCoordinatesColors = @"keyForCoordinatesColors";
    _keyForCoordinatesNameOfGame = @"keyForCoordinatesNameOfGame";
    _keyForGameComments = @"keyForGameComments";
    

  
    _arrayGameColorSettingsShell = [[NSMutableArray alloc] initWithArray:[DefaultsDataManager getArrayForKey:_keyForGameColorSettingsShell]];
    _arrayGridsShell = [[NSMutableArray alloc] initWithArray:[DefaultsDataManager getArrayForKey:_keyForGridsShell]];
    _arrayCoordinatesGrids = [[NSMutableArray alloc] initWithArray:[DefaultsDataManager getArrayForKey:_keyForCoordinatesGrid]];
    _arrayCoordinatesColors = [[NSMutableArray alloc] initWithArray:[DefaultsDataManager getArrayForKey:_keyForCoordinatesColors]];
    _arrayCoordinatesNameOfGame = [[NSMutableArray alloc] initWithArray:[DefaultsDataManager getArrayForKey:_keyForCoordinatesNameOfGame]];
    _arrayGameComments = [[NSMutableArray alloc] initWithArray:[DefaultsDataManager getDataForKey:_keyForGameComments]];
    
    
    
    
    if (![_arrayGameColorSettingsShell count]) {
        
        NSMutableArray *RedPreset = [[NSMutableArray alloc] initWithObjects:
                                     @255,@0,@0,@255,@0,
                                     @0,@0,@0,@255,@255,
                                     @100,@165,@130,@130,@130,
                                     @0,@0,@255,@0,@0,
                                     @255,@0,
                                     nil];
        NSMutableArray *BluePreset = [[NSMutableArray alloc] initWithObjects:
                                     @0,@0,@255,@255,@0,
                                     @0,@0,@0,@255,@255,
                                     @100,@165,@130,@130,@130,
                                     @0,@0,@255,@0,@0,
                                     @255,@0,
                                     nil];
        NSMutableArray *GreenPreset = [[NSMutableArray alloc] initWithObjects:
                                     @0,@255,@0,@255,@0,
                                     @0,@0,@0,@255,@255,
                                     @100,@165,@130,@130,@130,
                                     @0,@0,@255,@0,@0,
                                     @255,@0,
                                     nil];
        
        _arrayGameColorSettings = [[NSMutableArray alloc] initWithObjects:
                              @255,@255,@255,@255,@0,
                              @0,@0,@0,@255,@255,
                              @100,@165,@130,@130,@130,
                              @0,@0,@255,@0,@0,
                              @255,@0,
                              nil];
        _arrayGameColorSettingsShell = [[NSMutableArray alloc] initWithObjects:RedPreset,BluePreset,GreenPreset, nil];
       
    }
    
    
    
   if (![_arrayCoordinatesGrids count]) {
      
       for (int n=0; n<12; n++) {
           [_arrayCoordinatesGrids insertObject:@0 atIndex:n];
       }
    
    }
   
    if (![_arrayCoordinatesColors count]) {
        
        for (int n=0; n<12; n++) {
            [_arrayCoordinatesColors insertObject:@0 atIndex:n];
        }
        
    }
    
    if (![_arrayCoordinatesNameOfGame count]) {
        
        for (int n=0; n<12; n++) {
            [_arrayCoordinatesNameOfGame insertObject:@"Name Goes Here" atIndex:n];
        }
        
    }
    
    
    
    if (![_arrayGridsShell count]) {
       
        NSMutableArray *StraightGrid = [[NSMutableArray alloc] initWithObjects:
                                        @"Straight",
                                        @1,@0,@0,@0,@0,
                                        @1,@1,@0,@0,@0,
                                        @1,@0,@1,@0,@0,
                                        @1,@0,@0,@1,@0,
                                        @1,@1,@1,@1,@1,
                                        nil];
        NSMutableArray *XGrid = [[NSMutableArray alloc] initWithObjects:
                                        @"X",
                                        @1,@0,@0,@0,@1,
                                        @0,@1,@0,@1,@0,
                                        @0,@0,@1,@0,@0,
                                        @0,@1,@0,@1,@0,
                                        @1,@0,@0,@0,@1,
                                        nil];
        NSMutableArray *BoxGrid = [[NSMutableArray alloc] initWithObjects:
                                        @"Box",
                                        @1,@1,@1,@1,@1,
                                        @1,@0,@0,@0,@1,
                                        @1,@0,@0,@0,@1,
                                        @1,@0,@0,@0,@1,
                                        @1,@1,@1,@1,@1,
                                        nil];
        
        
        _arrayGridPatterns = [[NSMutableArray alloc] initWithObjects:
                              @"Straight",
                              @1,@0,@0,@0,@0,
                              @1,@1,@0,@0,@0,
                              @1,@0,@1,@0,@0,
                              @1,@0,@0,@1,@0,
                              @1,@1,@1,@1,@1,
                              nil];
        
        _arrayGridsShell = [[NSMutableArray alloc] initWithObjects:StraightGrid,XGrid,BoxGrid, nil];
    }
        
    
    
    if (![_arrayGameComments count]){
        for (int n=0; n<12; n++) {
            [_arrayGameComments insertObject:@" " atIndex:n];
        }
    }
    
    [DefaultsDataManager saveData:_arrayGameColorSettingsShell forKey:_keyForGameColorSettingsShell];
    [DefaultsDataManager saveData:_arrayGridsShell forKey:_keyForGridsShell];
    [DefaultsDataManager saveData:_arrayCoordinatesGrids forKey:_keyForCoordinatesGrid];
    [DefaultsDataManager saveData:_arrayCoordinatesColors forKey:_keyForCoordinatesColors];
    [DefaultsDataManager saveData:_arrayGameComments forKey:_keyForGameComments];
    
       


}



#pragma mark  STEPPER FOR NUMBER OF GAMES CODE

-(IBAction)stepperNumberOfGamesPress:(id)sender{

    if (_stepperNumberOfGames.value == 1) {
        _labelNumberOfGames.text = [NSString stringWithFormat:@"%2.0f Game",_stepperNumberOfGames.value];
    }
    else{ _labelNumberOfGames.text = [NSString stringWithFormat:@"%2.0f Games",_stepperNumberOfGames.value];
    }
    
    _numberOfGames = _stepperNumberOfGames.value;
    
    [DefaultsDataManager saveData:@(_numberOfGames) forKey:_keyForNumberOfGames];
    
    
    [self createPickerArray];
    
    [_pickerPresets reloadAllComponents];
        
    
    
}
#pragma mark  ALERTS

-(void)colorChangeAlert {
    
        UIAlertController *sliderAlert = [UIAlertController alertControllerWithTitle:@"Stop" message:@"You can only change custom color schemes. Use the + to add an identical scheme under a new name if you want to make changes" preferredStyle:UIAlertControllerStyleAlert];
        UIAlertAction *OK =[UIAlertAction actionWithTitle:@"OK" style:UIAlertActionStyleDefault handler:^(UIAlertAction * _Nonnull action) {
            
            
            
        }];
        [sliderAlert addAction:OK];
        
        [self presentViewController:sliderAlert animated:YES completion:nil];
        
    
}
-(void)gridChangeAlert {
    
    UIAlertController *gridAlert = [UIAlertController alertControllerWithTitle:@"Stop" message:@"You can only change custom grids. Use the + to add an identical grid under a new name if you want to make changes" preferredStyle:UIAlertControllerStyleAlert];
    UIAlertAction *OK =[UIAlertAction actionWithTitle:@"OK" style:UIAlertActionStyleDefault handler:^(UIAlertAction * _Nonnull action) {
        
        
        
    }];
    [gridAlert addAction:OK];
    
    [self presentViewController:gridAlert animated:YES completion:nil];
    
    
}
#pragma mark SLIDER CHANGES


- (IBAction)sliderChanged:(id)sender {
    if (_presetSelected<_protectedPresets) {
       
        
        // [self applySetupDisplay];
         [self colorChangeAlert];
        
    }
   
    
    else{
    
    NSNumber *redValue = [NSNumber numberWithFloat:_sliderRed.value];
    NSNumber *greenValue = [NSNumber numberWithFloat:_sliderGreen.value];
    NSNumber *blueValue = [NSNumber numberWithFloat:_sliderBlue.value];
    
  //Make Colors
        switch (_attributeNumber) {
            case 1:
                _screenBackgroundColor = [UIColor colorWithRed:_sliderRed.value/255.0 green:_sliderGreen.value/255.0 blue:_sliderBlue.value/255.0 alpha:1];
                break;
                
            case 2:
                _boxBackgroundColor = [UIColor colorWithRed:_sliderRed.value/255.0 green:_sliderGreen.value/255.0 blue:_sliderBlue.value/255.0 alpha:1];
                break;
            case 3:
                _boxLetterColor = [UIColor colorWithRed:_sliderRed.value/255.0 green:_sliderGreen.value/255.0 blue:_sliderBlue.value/255.0 alpha:1];
                break;
            case 4:
                _selectedBackgroundColor = [UIColor colorWithRed:_sliderRed.value/255.0 green:_sliderGreen.value/255.0 blue:_sliderBlue.value/255.0 alpha:1];
                break;
            case 5:
                _selectedLetterColor = [UIColor colorWithRed:_sliderRed.value/255.0 green:_sliderGreen.value/255.0 blue:_sliderBlue.value/255.0 alpha:1];
                break;
            case 6:
                _bingoLettersColor = [UIColor colorWithRed:_sliderRed.value/255.0 green:_sliderGreen.value/255.0 blue:_sliderBlue.value/255.0 alpha:1];
                break;
            case 7:
                _nameOfGameTextColor = [UIColor colorWithRed:_sliderRed.value/255.0 green:_sliderGreen.value/255.0 blue:_sliderBlue.value/255.0 alpha:1];
                break;
                
            default:
                
                break;
        }
    
        NSInteger redValueInt = [redValue integerValue];
        _textFieldRedValue.text = [NSString stringWithFormat:@"%li",(long)redValueInt];
        
        
        NSInteger greenValueInt = [greenValue integerValue];
        _textFieldGreenValue.text = [NSString stringWithFormat:@"%li",(long)greenValueInt];
        
        
        NSInteger blueValueInt = [blueValue integerValue];
        _textFieldBlueValue.text = [NSString stringWithFormat:@"%li",(long)blueValueInt];
        
        
      //Save Colors
        switch (_attributeNumber) {
            case 1:
                [_arrayGameColorSettings replaceObjectAtIndex:0 withObject:redValue];
                [_arrayGameColorSettings replaceObjectAtIndex:1 withObject:greenValue];
                [_arrayGameColorSettings replaceObjectAtIndex:2 withObject:blueValue];
                break;

                
                
            default:
                break;
        
        case 2:
        
        [_arrayGameColorSettings replaceObjectAtIndex:3 withObject:redValue];
        [_arrayGameColorSettings replaceObjectAtIndex:4 withObject:greenValue];
        [_arrayGameColorSettings replaceObjectAtIndex:5 withObject:blueValue];
        break;
        
    case 3:
        [_arrayGameColorSettings replaceObjectAtIndex:6 withObject:redValue];
        [_arrayGameColorSettings replaceObjectAtIndex:7 withObject:greenValue];
        [_arrayGameColorSettings replaceObjectAtIndex:8 withObject:blueValue];
        break;
    case 4:
        [_arrayGameColorSettings replaceObjectAtIndex:9  withObject:redValue];
        [_arrayGameColorSettings replaceObjectAtIndex:10 withObject:greenValue];
        [_arrayGameColorSettings replaceObjectAtIndex:11 withObject:blueValue];
        
        break;
    case 5:
        [_arrayGameColorSettings replaceObjectAtIndex:12  withObject:redValue];
        [_arrayGameColorSettings replaceObjectAtIndex:13 withObject:greenValue];
        [_arrayGameColorSettings replaceObjectAtIndex:14 withObject:blueValue];
        
        break;
        
    case 6:
                
        [_arrayGameColorSettings replaceObjectAtIndex:15  withObject:redValue];
        [_arrayGameColorSettings replaceObjectAtIndex:16 withObject:greenValue];
        [_arrayGameColorSettings replaceObjectAtIndex:17 withObject:blueValue];
        
        break;
        
    case 7:
        [_arrayGameColorSettings replaceObjectAtIndex:18 withObject:redValue];
        [_arrayGameColorSettings replaceObjectAtIndex:19 withObject:greenValue];
        [_arrayGameColorSettings replaceObjectAtIndex:20 withObject:blueValue];
        
        break;
        
    case 8:
                
        _allowGridEdits = YES;
        break;
                
       
       
        
        }
        
        
   
    [_arrayGameColorSettingsShell replaceObjectAtIndex:_presetSelected withObject:_arrayGameColorSettings];
    [DefaultsDataManager saveData:_arrayGameColorSettingsShell forKey:_keyForGameColorSettingsShell];
    
    [self theProcess];
    

        
        }
}

#pragma mark  THE PROCESS

-(void)theProcess{
    [self gatherColors];
    [self gridButtons];
    [self makeLabels];
}


-(void)gatherColors{
    _screenBackgroundColor = [UIColor colorWithRed:[_arrayGameColorSettings[0] floatValue]/255 green:[_arrayGameColorSettings[1] floatValue]/255 blue:[_arrayGameColorSettings[2] floatValue]/255 alpha:1.0];
    _boxBackgroundColor = [UIColor colorWithRed:[_arrayGameColorSettings[3] floatValue]/255 green:[_arrayGameColorSettings[4] floatValue]/255 blue:[_arrayGameColorSettings[5] floatValue]/255 alpha:1.0];
    _boxLetterColor = [UIColor colorWithRed:[_arrayGameColorSettings[6] floatValue]/255 green:[_arrayGameColorSettings[7] floatValue]/255 blue:[_arrayGameColorSettings[8] floatValue]/255 alpha:1.0];
    _selectedBackgroundColor = [UIColor colorWithRed:[_arrayGameColorSettings[9] floatValue]/255 green:[_arrayGameColorSettings[10] floatValue]/255 blue:[_arrayGameColorSettings[11] floatValue]/255 alpha:1.0];
    _selectedLetterColor =[UIColor colorWithRed:[_arrayGameColorSettings[12] floatValue]/255 green:[_arrayGameColorSettings[13] floatValue]/255 blue:[_arrayGameColorSettings[14] floatValue]/255 alpha:1.0];
    _bingoLettersColor = [UIColor colorWithRed:[_arrayGameColorSettings[15] floatValue]/255 green:[_arrayGameColorSettings[16] floatValue]/255 blue:[_arrayGameColorSettings[17] floatValue]/255 alpha:1.0];
    _nameOfGameTextColor = [UIColor colorWithRed:[_arrayGameColorSettings[18] floatValue]/255 green:[_arrayGameColorSettings[19] floatValue]/255 blue:[_arrayGameColorSettings[20] floatValue]/255 alpha:1.0];
    
    _textFieldNameOfGame.text = _arrayCoordinatesNameOfGame[_gameNumber];
    
    
    

    
    //Then Set Up Sliders using pattern in ApplySetUpDisplay
    [_pickerMarkerColors selectRow:[_arrayGameColorSettings[21] integerValue] inComponent:0 animated:YES];
    
    switch (_attributeNumber) {
        case 1:
            
            _sliderRed.value = [[_arrayGameColorSettings objectAtIndex:0]floatValue];
            _sliderGreen.value = [[_arrayGameColorSettings objectAtIndex:1] floatValue];
            _sliderBlue.value = [[_arrayGameColorSettings objectAtIndex:2] floatValue];
            
            break;
            
            
        case 2:
            
            _sliderRed.value = [[_arrayGameColorSettings objectAtIndex:3] floatValue];
            _sliderGreen.value = [[_arrayGameColorSettings objectAtIndex:4] floatValue];
            _sliderBlue.value = [[_arrayGameColorSettings objectAtIndex:5] floatValue];
            
            break;
        case 3:
            
            _sliderRed.value = [[_arrayGameColorSettings objectAtIndex:6] floatValue];
            _sliderGreen.value = [[_arrayGameColorSettings objectAtIndex:7] floatValue];
            _sliderBlue.value = [[_arrayGameColorSettings objectAtIndex:8] floatValue];
            
            break;
        case 4:
            
            _sliderRed.value = [[_arrayGameColorSettings objectAtIndex:9] floatValue];
            _sliderGreen.value = [[_arrayGameColorSettings objectAtIndex:10] floatValue];
            _sliderBlue.value = [[_arrayGameColorSettings objectAtIndex:11] floatValue];
            
            break;
        case 5:
            
            _sliderRed.value = [[_arrayGameColorSettings objectAtIndex:12] floatValue];
            _sliderGreen.value = [[_arrayGameColorSettings objectAtIndex:13] floatValue];
            _sliderBlue.value = [[_arrayGameColorSettings objectAtIndex:14] floatValue];
            break;
            
        case 6:
            
            _sliderRed.value = [[_arrayGameColorSettings objectAtIndex:15] floatValue];
            _sliderGreen.value = [[_arrayGameColorSettings objectAtIndex:16] floatValue];
            _sliderBlue.value = [[_arrayGameColorSettings objectAtIndex:17] floatValue];
            break;
            
        case 7:
            
            _sliderRed.value = [[_arrayGameColorSettings objectAtIndex:18] floatValue];
            _sliderGreen.value = [[_arrayGameColorSettings objectAtIndex:19] floatValue];
            _sliderBlue.value = [[_arrayGameColorSettings objectAtIndex:20] floatValue];
            break;
            
        default:
            break;
    }

    _textFieldRedValue.text = [NSString stringWithFormat:@"%0.f",_sliderRed.value];
    _textFieldGreenValue.text = [NSString stringWithFormat:@"%0.f",_sliderGreen.value];
    _textFieldBlueValue.text = [NSString stringWithFormat:@"%0.f",_sliderBlue.value];
    
    
    
}



-(void)makeLabels {
    for (UILabel *label in _labelCollection) {
        label.layer.borderColor = [[UIColor blackColor] CGColor];
        label.layer.borderWidth = 1;
        label.backgroundColor = [UIColor yellowColor];
        label.layer.cornerRadius = 15;
        label.clipsToBounds = YES;
        label.font = [UIFont fontWithName:@"Helvetica" size:label.bounds.size.width*.75];
        label.adjustsFontSizeToFitWidth = YES;
        
        _viewLabelHolder.backgroundColor = _screenBackgroundColor;
        _textFieldNameOfGame.backgroundColor = _screenBackgroundColor;
        _textFieldNameOfGame.textColor = _nameOfGameTextColor;
        _textFieldNameOfGame.font = [UIFont fontWithName:@"Marker Felt" size:_textFieldNameOfGame.bounds.size.height];
        _textFieldNameOfGame.textAlignment = NSTextAlignmentCenter;
        _textFieldNameOfGame.adjustsFontSizeToFitWidth = YES;

        
        switch (label.tag) {
            case 1:
                label.backgroundColor = _screenBackgroundColor;
                label.textColor = _bingoLettersColor;
                label.font = [UIFont fontWithName:@"Marker Felt" size:label.bounds.size.width*.75];
                label.layer.borderWidth = 0;
                break;
            case 2:
                label.backgroundColor = _boxBackgroundColor;
                label.textColor = _boxLetterColor;
                break;
            case 3:
                label.backgroundColor = _selectedBackgroundColor;
                label.textColor = _selectedLetterColor;
                break;
            default:
                break;
        }
    }

   
}

-(void)gridButtons {
    
    [self makeLabels];
    
    for (UIButton *button in _buttonGridCollection)
        
    {
        button.layer.borderColor = [[UIColor blackColor] CGColor];
        button.layer.borderWidth = 1;
        button.titleLabel.font = [UIFont fontWithName:@"Helvetica" size:button.frame.size.height*.95];
        button.titleLabel.adjustsFontSizeToFitWidth = YES;
        button.backgroundColor = _gridBackgroundColor;
        _textFieldNameOfGame.textColor = _nameOfGameTextColor;
        _textFieldNameOfGame.backgroundColor = _screenBackgroundColor;
        
        NSString *markerText;
        
        switch (_markerSelected) {
            case 0:
                markerText = @"\u26AA";
                break;
            case 1:
                markerText = @"\u26AB";
                break;
            case 2:
                markerText = @"\u272D";
                break;
            case 3:
                markerText = @"\u272A";
                break;
            case 4:
                markerText = @"\u25CF";
                break;
            case 5:
                markerText = @"\u272A";
                break;
            case 6:
                markerText = @"\u263c";
                break;
            case 7:
                markerText = @"\u2600";
                break;
            case 8:
                markerText = @"\u2726";
                break;
            default:
                break;
        }
        
        
        if ([[_arrayGridPatterns objectAtIndex:button.tag] intValue] == 0) {
            
            [button setTitle:@" " forState:UIControlStateNormal];
            
            
        }
        
        if ([[_arrayGridPatterns objectAtIndex:button.tag] intValue] == 1) {
            
            [button setTitle:markerText forState:UIControlStateNormal];
            
        }

    
    
    
    }
}

-(IBAction)btnGridPressed:(UIButton *)sender {
    
    
    if (_protectedGrids>_gridSelected) {
        [self gridChangeAlert];
        
    }
    
 
    else{
        
    if (_allowGridEdits == YES && _gridSelected>=_protectedGrids) {
        
    if  ([[_arrayGridPatterns objectAtIndex:sender.tag] intValue] == 1)
    {
     
        [_arrayGridPatterns replaceObjectAtIndex:sender.tag withObject:@0];
    }
    
    else {
       
         [_arrayGridPatterns replaceObjectAtIndex:sender.tag withObject:@1];
        
    }
    }
    
        
    
    [_arrayGridsShell replaceObjectAtIndex:_gridSelected withObject:_arrayGridPatterns];
    [DefaultsDataManager saveData:_arrayGridsShell forKey:_keyForGridsShell];
    
    }
    [self gridButtons];
}





-(BOOL)textFieldShouldReturn:(UITextField *)textField {
    //_changeHappened = YES;
    [textField resignFirstResponder];
    return YES;
    
}


#pragma mark THIS IS THE ALERT THAT MATTERS

- (IBAction)btnAddOrDelete:(UIButton *)sender {
    
    NSString *title;
    NSString *message;
    NSString *nameOfPreset = [NSString stringWithFormat:@"%@", _arrayPickerPresets[_presetSelected]];
    NSString *nameOfGrid = [NSString stringWithFormat:@"%@", _arrayPickerGrids[_gridSelected]];
    
    
      switch (sender.tag) {
        case 1:
            title = @"Add a new color scheme";
            message = @"Type the name of the new color scheme";
            
            break;
        case 2:
            title = @"Delete a color scheme";
            
            if (_presetSelected<_protectedPresets) {
                message = @"You can only delete custom color schemes";
            }
            else{
                message = [NSString stringWithFormat:@"Do you want to delete the color scheme named %@",nameOfPreset];
            }
              break;
          case 3:
              title = @"Add a new grid";
              message = @"Type the name of the new grid";
            
            break;
         
        case 4:
              title = @"Delete a grid pattern";
              
              if (_gridSelected<_protectedGrids) {
                  message = @"You can only delete custom grids";
              }
              else{
                  message = [NSString stringWithFormat:@"Do you want to delete the grid named %@",nameOfGrid];
              }

              break;
            
        default:
            break;
    }
    UIAlertController *alert = [UIAlertController alertControllerWithTitle:title message:message preferredStyle:UIAlertControllerStyleAlert];
    
    UIAlertAction *cancel = [UIAlertAction actionWithTitle:@"Cancel" style:UIAlertActionStyleDefault handler:^(UIAlertAction * _Nonnull action) {
        //
    }];
    
    if (sender.tag == 1 || sender.tag == 3) {
        [alert addTextFieldWithConfigurationHandler:^(UITextField * _Nonnull textField) {
            
        }];
        
        
        UIAlertAction *AddPreset = [UIAlertAction actionWithTitle:@"Add It" style:UIAlertActionStyleDefault handler:^(UIAlertAction * _Nonnull action) {
        
        NSString *newPreset = alert.textFields.firstObject.text;
            [self alertActionWithAlertNumber:sender.tag name:newPreset preset:0];
        
       }];
        [alert addAction:AddPreset];
        [alert addAction:cancel];
    }
   
    
    if (sender.tag == 2 || sender.tag == 4) {
        
        UIAlertAction *DeletePreset = [UIAlertAction actionWithTitle:@"Delete It" style:UIAlertActionStyleDefault handler:^(UIAlertAction * _Nonnull action) {
            
            if (sender.tag == 2) {
                [self alertActionWithAlertNumber:sender.tag name:nil preset:_presetSelected];
            }
            if (sender.tag == 4) {
                [self alertActionWithAlertNumber:sender.tag name:nil preset:_gridSelected];
            }
        }];
        
        UIAlertAction *DoNotDeletePreset = [UIAlertAction actionWithTitle:@"Do Not Delete" style:UIAlertActionStyleDefault handler:^(UIAlertAction * _Nonnull action) {
            //
        }];
        
        if ((_presetSelected<_protectedPresets && sender.tag == 2) || (_gridSelected<_protectedGrids && sender.tag == 4)) {
            [alert addAction:DoNotDeletePreset];
        }
        else{
            [alert addAction:DeletePreset];
            [alert addAction:cancel];
        }
    }
    
   
    

    [self presentViewController:alert animated:YES completion:nil];
    
  
}


#pragma mark THIS IS ALERT SECTION FOR ADDING ELEMENTS TO ARRAY

-(void)alertActionWithAlertNumber: (NSInteger)alertNumber name:(NSString *)enteredName preset:(NSInteger)presetSelected{
    
    if (alertNumber == 1) {
        
        [_arrayPickerPresets addObject:enteredName];
        [DefaultsDataManager saveData:_arrayPickerPresets forKey:_keyForArrayPickerPresets];
        [_pickerPresets reloadAllComponents];
        
        [_arrayGameColorSettingsShell addObject:_arrayGameColorSettingsShell[_presetSelected]];
        
        NSInteger newRow = _arrayPickerPresets.count;
        
        [_pickerPresets selectRow:newRow-1 inComponent:1 animated:YES];
        _presetSelected = newRow-1;
        
        [DefaultsDataManager saveData:_arrayGameColorSettingsShell forKey:_keyForGameColorSettingsShell];
        
        
    }
    
    if (alertNumber == 2) {
        
        [_arrayPickerPresets removeObjectAtIndex:presetSelected];
        [_pickerPresets reloadAllComponents];
        [_arrayGameColorSettingsShell removeObjectAtIndex:presetSelected];
        [DefaultsDataManager saveData:_arrayPickerPresets forKey:_keyForArrayPickerPresets];
        
        //adjust coordinates
        
        for (int i = 0; i<_arrayCoordinatesColors.count; i++) {
            if ([[_arrayCoordinatesColors objectAtIndex:i] integerValue]==presetSelected){
                [_arrayCoordinatesColors replaceObjectAtIndex:i withObject:@(0)];
            }
            if ([[_arrayCoordinatesColors objectAtIndex:i] integerValue]>presetSelected){
                [_arrayCoordinatesColors replaceObjectAtIndex:i withObject:@([_arrayCoordinatesColors[i] integerValue] - 1)];
            }
        }
        [DefaultsDataManager saveData:_arrayCoordinatesColors forKey:_keyForCoordinatesColors];
        [_pickerPresets selectRow:0 inComponent:1 animated:YES];
        
    }
    if (alertNumber == 3) {
        
        [_arrayPickerGrids addObject:enteredName];
        [DefaultsDataManager saveData:_arrayPickerGrids forKey:_keyForPickerGrids];
        [_pickerPresets reloadAllComponents];
        
        [_arrayGridsShell addObject:_arrayGridsShell[_gridSelected]];
        
        NSInteger newRow = _arrayPickerGrids.count;
        
        [_pickerPresets selectRow:newRow-1 inComponent:2 animated:YES];
        _gridSelected = newRow-1;
        [_pickerGameSettings selectRow:7 inComponent:0 animated:YES];
        _allowGridEdits = YES;
        
        [DefaultsDataManager saveData:_arrayGridsShell forKey:_keyForGridsShell];
        
        
    }
    if (alertNumber == 4) {
        
        
        
        [_arrayPickerGrids removeObjectAtIndex:presetSelected];
        [_pickerPresets reloadAllComponents];
        [_arrayGridsShell removeObjectAtIndex:presetSelected];
        [DefaultsDataManager saveData:_arrayPickerGrids forKey:_keyForPickerGrids];
        
        //adjust coordinates
        
        for (int i = 0; i<_arrayCoordinatesGrids.count; i++) {
            if ([[_arrayCoordinatesGrids objectAtIndex:i] integerValue]==presetSelected){
                [_arrayCoordinatesGrids replaceObjectAtIndex:i withObject:@(0)];
            }
            if ([[_arrayCoordinatesGrids objectAtIndex:i] integerValue]>presetSelected){
                [_arrayCoordinatesGrids replaceObjectAtIndex:i withObject:@([_arrayCoordinatesGrids[i] integerValue] - 1)];
            }
        }
        [DefaultsDataManager saveData:_arrayCoordinatesGrids forKey:_keyForCoordinatesGrid];
        [_pickerPresets selectRow:0 inComponent:2 animated:YES];
        
        
    }

}


#pragma mark  TEXT FIELD RESPONSES

-(IBAction)editEndedTextFieldNameOfGame:(id)sender{
    [_arrayCoordinatesNameOfGame replaceObjectAtIndex:_gameNumber withObject:_textFieldNameOfGame.text];
    [DefaultsDataManager saveData:_arrayCoordinatesNameOfGame forKey:_keyForCoordinatesNameOfGame];
    
    

}


-(IBAction)enteredTextFieldRedValue:(id)sender{
    
    
    
    if ([_textFieldRedValue.text integerValue] > 255) {
        _textFieldRedValue.text = @"255";
    }
    if ([_textFieldRedValue.text integerValue] <= 0) {
        _textFieldRedValue.text = @"0";
    }
    _sliderRed.value = [_textFieldRedValue.text integerValue];
    
    [self sliderChanged:self];
    
   
}

-(IBAction)enteredTextFieldGreenValue:(id)sender{
    if ([_textFieldGreenValue.text integerValue] > 255) {
        _textFieldGreenValue.text = @"255";
    }
    if ([_textFieldGreenValue.text integerValue] <= 0) {
        _textFieldGreenValue.text = @"0";
    }
    _sliderGreen.value = [_textFieldGreenValue.text integerValue];
     [self sliderChanged:self];
}


-(IBAction)enteredTextFieldBlueValue:(id)sender{
    if ([_textFieldBlueValue.text integerValue] > 255) {
        _textFieldBlueValue.text = @"255";
    }
    if ([_textFieldBlueValue.text integerValue] <= 0) {
        _textFieldBlueValue.text = @"0";
    }
    _sliderBlue.value = [_textFieldBlueValue.text integerValue];
     [self sliderChanged:self];
    
    
}

- (IBAction)startedEditTextFieldRedValue:(id)sender {
    
    if (_presetSelected<_protectedPresets) {
        [self colorChangeAlert];
    }
    else{
    _textFieldRedValue.text = nil;
    [_textFieldRedValue setKeyboardType:UIKeyboardTypeNumberPad];
    
    }
    
}

- (IBAction)startedEditTextFieldGreenValue:(id)sender {
    if (_presetSelected<_protectedPresets) {
        [self colorChangeAlert];
    }
    else{
    _textFieldGreenValue.text = nil;
    [_textFieldGreenValue setKeyboardType:UIKeyboardTypeNumberPad];
    }
}

- (IBAction)startedEditTextFieldBlueValue:(id)sender {
    if (_presetSelected<_protectedPresets) {
        [self colorChangeAlert];
    }
    else{
    _textFieldBlueValue.text = nil;
    [_textFieldBlueValue setKeyboardType:UIKeyboardTypeNumberPad];
    }
}



-(void)textViewDidBeginEditing:(UITextView *)textView {
    
 
    float height = self.view.bounds.size.height;
    float width = self.view.bounds.size.width;
    [UIView animateWithDuration:1 animations:^{
        
    [self.view setFrame:CGRectMake(0,-height*.45,width,height)];
    }];
    
    
}

-(void)textViewDidEndEditing:(UITextView *)textView {
    float height = self.view.bounds.size.height;
    float width = self.view.bounds.size.width;
    
    [UIView animateWithDuration:1 animations:^{
        [self.view setFrame:CGRectMake(0,0,width,height)];
    }];
    
   
    [_arrayGameComments replaceObjectAtIndex:_gameNumber withObject:textView.text];
    [DefaultsDataManager saveData:_arrayGameComments forKey:_keyForGameComments];
    
    
    
   
}


@end
