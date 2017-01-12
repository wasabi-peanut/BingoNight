//
//  CheckingSetUpViewController.m
//  BingoNight 2.2
//
//  Created by Schor on 12/11/16.
//  Copyright © 2016 AandA Development. All rights reserved.
//

#import "CheckingSetUpViewController.h"
#import "DefaultsDataManager.h"
#import "checkingPatterns.h"


#warning Credit BenMusic (for checking) and SoundBible (for winner)


@interface CheckingSetUpViewController ()
{AVAudioPlayer *avPlayer;
}

@end

@implementation CheckingSetUpViewController

- (void)viewDidLoad {
    
    //GET NUMBER OF GAMES
    _keyForNumberOfGames = @"keyForNumberOfGames";
    _numberOfGames = [[DefaultsDataManager getDataForKey:_keyForNumberOfGames] integerValue];
    if (_numberOfGames ==0) {
        _numberOfGames = 8;
    }

    
    //Set up preview Window
    
    
    
    
    _keyForCoordinatesCheckingPatterns = @"keyForCoordinatesCheckingPatterns";
    _keyForCoordinatesCheckingSongs = @"keyForCoordinatesCheckingSongs";
    _keyForCoordinatesWinnerSounds = @"keyForCoordinatesWinnerSounds";

    _arrayCoordinatesCheckingPatterns = [[NSMutableArray alloc] initWithArray:[DefaultsDataManager getArrayForKey:_keyForCoordinatesCheckingPatterns]];
    _arrayCoordinatesCheckingSongs = [[NSMutableArray alloc] initWithArray:[DefaultsDataManager getArrayForKey:_keyForCoordinatesCheckingSongs]];
    _arrayCoordinatesWinnerSounds = [[NSMutableArray alloc] initWithArray:[DefaultsDataManager getArrayForKey:_keyForCoordinatesWinnerSounds]];
    
    [self makeArrays];
    
    NSInteger  currentCheckingPattern =  [_arrayCoordinatesCheckingPatterns[0] integerValue];
    NSInteger  currentCheckingSong =     [_arrayCoordinatesCheckingSongs[0] integerValue];
    NSInteger  currentWinnerSound =      [_arrayCoordinatesWinnerSounds[0] integerValue];
    
    [_pickerChecking selectRow:currentCheckingPattern inComponent:1 animated:YES];
    [_pickerChecking selectRow:currentCheckingSong inComponent:2 animated:YES];
    [_pickerChecking selectRow:currentWinnerSound inComponent:3 animated:YES];
    
    
    [self pickerView:_pickerChecking didSelectRow:0 inComponent:0];
    [self pickerView:_pickerChecking didSelectRow:[_arrayCoordinatesCheckingPatterns[0] integerValue] inComponent:1];
    [self pickerView:_pickerChecking didSelectRow:[_arrayCoordinatesCheckingSongs[0] integerValue] inComponent:2];
    [self pickerView:_pickerChecking didSelectRow:[_arrayCoordinatesWinnerSounds[0] integerValue] inComponent:3];

    
    
    _gameNumber = 0;
    
    
   
    [super viewDidLoad];
    // Do any additional setup after loading the view.
}

- (void)didReceiveMemoryWarning {
    [super didReceiveMemoryWarning];
    // Dispose of any resources that can be recreated.
}




#pragma mark PICKER CONTROLS


-(void)pickerView:(UIPickerView *)pickerView didSelectRow:(NSInteger)row inComponent:(NSInteger)component {
    switch (component) {
        case 0:
            //change game
            _gameNumber = row;
            
            

            
            [_pickerChecking selectRow:[_arrayCoordinatesCheckingPatterns[row] integerValue] inComponent:1 animated:YES];
            [self pickerView:_pickerChecking didSelectRow:[_arrayCoordinatesCheckingPatterns[row] integerValue] inComponent:1];
            
            [_pickerChecking selectRow:[_arrayCoordinatesCheckingSongs[row] integerValue] inComponent:2 animated:YES];
            [self pickerView:_pickerChecking didSelectRow:[_arrayCoordinatesCheckingSongs[row] integerValue] inComponent:2];
            
            [_pickerChecking selectRow:[_arrayCoordinatesWinnerSounds[row] integerValue] inComponent:3 animated:YES];
           [self pickerView:_pickerChecking didSelectRow:[_arrayCoordinatesWinnerSounds[row] integerValue] inComponent:3];
            
            
            
            break;
        case 1:
            //choose checking
            _patternSelected = row;
            [_arrayCoordinatesCheckingPatterns replaceObjectAtIndex:_gameNumber withObject:@(row)];
            [_myView removeFromSuperview];
            [self runPreview];
            break;
            
        case 2:
            //choose checkingSong
            switch (row) {
                    
                case 0:
                    _checkingSongTitle = @"countryboy";
                    break;
                case 1:
                    _checkingSongTitle = @"dance";
                    break;
                case 2:
                    _checkingSongTitle = @"dubstep";
                    break;
                case 3:
                    _checkingSongTitle = @"epic";
                    break;
                case 4:
                    _checkingSongTitle = @"groovy";
                    break;
                case 5:
                    _checkingSongTitle = @"happyrock";
                    break;
                case 6:
                    _checkingSongTitle = @"jazzpiano";
                    break;
                case 7:
                    _checkingSongTitle = @"love";
                    break;
                case 8:
                    _checkingSongTitle = @"moose";
                    break;
                case 9:
                    _checkingSongTitle = @"popdance";
                    break;
                case 10:
                    _checkingSongTitle = @"retrosoul";
                    break;
                case 11:
                    _checkingSongTitle = @"rumble";
                    break;
                case 12:
                    _checkingSongTitle = @"samba";
                    break;
                    
                default:
                    break;
            }
            [avPlayer stop];
            [_arrayCoordinatesCheckingSongs replaceObjectAtIndex:_gameNumber withObject:@(row)];
            
    
                      break;
            
    
           
            
           
        case 3:
            //choose Winner Sound
            switch (row) {
                case 0:
                    _winnerSoundTitle = @"applause";
                    break;
                case 1:
                    _winnerSoundTitle = @"computer";
                    break;
                case 2:
                    _winnerSoundTitle = @"lion";
                    break;
                case 3:
                    _winnerSoundTitle = @"rooster";
                    break;
                case 4:
                    _winnerSoundTitle = @"stadium";
                    break;
                case 5:
                    _winnerSoundTitle = @"tada";
                    break;
                    
                default:
                    break;
            }
            [avPlayer stop];
                [_arrayCoordinatesWinnerSounds replaceObjectAtIndex:_gameNumber withObject:@(row)];
            break;
            
            
            
        default:
            break;
    }
    
    
    [DefaultsDataManager saveData:_arrayCoordinatesCheckingPatterns forKey:_keyForCoordinatesCheckingPatterns];
    [DefaultsDataManager saveData:_arrayCoordinatesCheckingSongs forKey:_keyForCoordinatesCheckingSongs];
    [DefaultsDataManager saveData:_arrayCoordinatesWinnerSounds forKey:_keyForCoordinatesWinnerSounds];
    
   

}

-(NSInteger)pickerView:(UIPickerView *)pickerView numberOfRowsInComponent:(NSInteger)component{
    NSInteger rows;
    if (pickerView == _pickerChecking) {
        switch (component) {
            case 0:
                rows = _arrayGameNumbers.count;
                break;
            case 1:
                rows = _arrayCheckingPatterns.count;
                break;
            case 2:
                rows = _arrayCheckingSongs.count;
                break;
            case 3:
                rows = _arrayWinnerSounds.count;
                break;
                
            default:
                break;
        }
  
    }
    
    return rows;
}

-(NSInteger)numberOfComponentsInPickerView:(UIPickerView *)pickerView {
    return 4;
}

-(NSString*)pickerView:(UIPickerView *)pickerView titleForRow:(NSInteger)row forComponent:(NSInteger)component{
    
    NSString *title;
    switch (component) {
        case 0:
            title = _arrayGameNumbers[row];
            break;
        case 1:
            title = _arrayCheckingPatterns[row];
            break;
        case 2:
            title = _arrayCheckingSongs[row];
            break;
        case 3:
            title = _arrayWinnerSounds[row];
            break;
            
        default:
            break;
    }
    
    return title;
}
-(CGFloat)pickerView:(UIPickerView *)pickerView rowHeightForComponent:(NSInteger)component{
    return 50;
}


#pragma mark MAKE ARRAYS

-(void)makeArrays{
    
    
    _arrayGameNumbers = [[NSMutableArray alloc] init ];
                         
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
          
          [_arrayGameNumbers addObject:arrayItem];
          
          }
          
                         
                         
                         
                         
                         
                         
                         
    
    
    
    _arrayCheckingPatterns = [[NSMutableArray alloc] initWithObjects:
                              @"Pattern 1",
                              @"Pattern 2",
                              @"Pattern 3",
                              @"Pattern 4",
                              @"Pattern 5",
                              @"Pattern 6",
                              nil];
    
    _arrayCheckingSongs = [[NSMutableArray alloc] initWithObjects:
                   
                   
                                @"Country Boy",
                                @"Dance",
                                @"Dubstep",
                                @"Epic",
                                @"Groovy",
                                @"Happy Rock",
                                @"Jazz Piano",
                                @"Love",
                                @"Moose",
                                @"Pop Dance",
                                @"Retro Soul",
                                @"Rumble",
                                @"Samba",
                   
                   nil];
    
    
    _arrayWinnerSounds = [[NSMutableArray alloc] initWithObjects :
                                @"Applause",
                                @"Chimes",
                                @"Lion",
                                @"Rooster",
                                @"Stadium",
                                @"TaDa",
                                nil];
    
    
    
    if (!(_arrayCoordinatesCheckingPatterns.count)) {
        
        _arrayCoordinatesCheckingPatterns = [[NSMutableArray alloc] init];
        for (int n=0; n<12; n++) {
            [_arrayCoordinatesCheckingPatterns addObject:@0];
        }
    }
    if (!(_arrayCoordinatesCheckingSongs.count)) {
            
            _arrayCoordinatesCheckingSongs = [[NSMutableArray alloc] init];
            for (int n=0; n<12; n++) {
                [_arrayCoordinatesCheckingSongs addObject:@0];
            }
        }
        
    if (!(_arrayCoordinatesWinnerSounds.count)) {
        
        _arrayCoordinatesWinnerSounds = [[NSMutableArray alloc] init];
        for (int n=0; n<12; n++) {
            [_arrayCoordinatesWinnerSounds addObject:@0];
        }
    }
    
        [DefaultsDataManager saveData:_arrayCoordinatesCheckingSongs forKey:_keyForCoordinatesCheckingSongs];
        [DefaultsDataManager saveData:_arrayCoordinatesCheckingPatterns forKey:_keyForCoordinatesCheckingPatterns];
        [DefaultsDataManager saveData:_arrayCoordinatesWinnerSounds forKey:_keyForCoordinatesWinnerSounds];
    
    
}




#pragma mark PREVIEW METHODS

-(void)runPreview{
    CGFloat height = [UIScreen mainScreen].bounds.size.height ;
    CGFloat width = [UIScreen mainScreen].bounds.size.width ;
    
    _myView = [checkingPatterns frameX:0 frameY:height/2 width:width/2 height:height/2];
    
    
    [self.view addSubview:_myView];
    [_myView runAnimationWithPatternSelected:_patternSelected];
    
    

    
}




/*
-(void)createFrame{
    [_viewPreviewWindow removeFromSuperview];
    
    CGFloat height = [UIScreen mainScreen].bounds.size.height ;
    CGFloat width = [UIScreen mainScreen].bounds.size.width ;
    
    _viewPreviewWindow = [[UIView alloc] initWithFrame:CGRectMake(10, height/2-10, width/2, height/2)];
    _viewPreviewWindow.layer.borderWidth = 3;
    _viewPreviewWindow.layer.borderColor = [[UIColor yellowColor] CGColor];
    _viewPreviewWindow.backgroundColor = [UIColor blueColor];
    
    [self.view addSubview:_viewPreviewWindow];
}
-(void)showPreview1 {
    
    [self createFrame];
    
    
    float height = _viewPreviewWindow.bounds.size.height;
    float width = _viewPreviewWindow.bounds.size.width;
    
    
    
    UIView *checkingTopView = [[UIView alloc] initWithFrame:CGRectMake(100, 50, 100, 100)];
    checkingTopView.layer.cornerRadius = 50;
    checkingTopView.clipsToBounds = YES;
    
    
    checkingTopView.layer.borderColor = [[UIColor lightGrayColor] CGColor];
    checkingTopView.layer.borderWidth = 2;
    
    
    UIView *checkingBottomView = [[UIView alloc] initWithFrame:CGRectMake(width - 100, height-100, 100, 100)];
    
    checkingBottomView.layer.cornerRadius = 50;
    checkingBottomView.clipsToBounds = YES;
    
    
    checkingBottomView.layer.borderColor = [[UIColor lightGrayColor] CGColor];
    checkingBottomView.layer.borderWidth = 2;
    
    [_viewPreviewWindow addSubview:checkingTopView];
    [_viewPreviewWindow addSubview:checkingBottomView];
    
    
    UILabel *labelBackground = [[UILabel alloc] initWithFrame:CGRectMake(75, 0, width-75, height)];
    labelBackground.text = @"Hold Cards";
    labelBackground.font = [UIFont fontWithName:@"Helvetica" size:75];
    labelBackground.numberOfLines = 0;
    labelBackground.textColor = [UIColor yellowColor];
    labelBackground.textAlignment = NSTextAlignmentCenter;
    
    
    
    
    [_viewPreviewWindow addSubview: labelBackground];
    
    
    CABasicAnimation *spinning = [CABasicAnimation animationWithKeyPath:@"transform.rotation.y"];
    //for backward text
    spinning.toValue = [NSNumber numberWithFloat:2*M_PI];
    //only forward text
    //spinning.toValue = [NSNumber numberWithFloat:.5*M_PI];
    
    spinning.autoreverses = YES;
    spinning.duration = 2;
    spinning.repeatCount = HUGE_VALF;
    
    CABasicAnimation *colorAnimation = [CABasicAnimation animationWithKeyPath:@"backgroundColor"];
    UIColor *fromColor = [UIColor redColor];
    UIColor *toColor = [UIColor greenColor];
    
    colorAnimation.duration = 2.0;
    colorAnimation.fromValue = (id)fromColor.CGColor;
    colorAnimation.toValue = (id)toColor.CGColor;
    colorAnimation.repeatCount = HUGE_VALF;
    colorAnimation.autoreverses = YES;
    
    
    CABasicAnimation *colorAnimation2 = [CABasicAnimation animationWithKeyPath:@"backgroundColor"];
    UIColor *fromColor2 = [UIColor greenColor];
    UIColor *toColor2 = [UIColor redColor];
    
    colorAnimation2.duration = 2.0;
    colorAnimation2.fromValue = (id)fromColor2.CGColor;
    colorAnimation2.toValue = (id)toColor2.CGColor;
    colorAnimation2.repeatCount = HUGE_VALF;
    colorAnimation2.autoreverses = YES;
    
    
    [checkingTopView.layer addAnimation:spinning forKey:nil];
    [checkingTopView.layer addAnimation:colorAnimation forKey:nil];
    
    [checkingBottomView.layer addAnimation:spinning forKey:nil];
    [checkingBottomView.layer addAnimation:colorAnimation2 forKey:nil];
}

-(void)showPreview2{
    [self createFrame];
    
    float height = _viewPreviewWindow.bounds.size.height;
    float width = _viewPreviewWindow.bounds.size.width;
    
   
    CABasicAnimation *shake = [CABasicAnimation animationWithKeyPath:@"transform.translation.y"];
    
    shake.toValue = [NSNumber numberWithFloat:10];
    shake.autoreverses = YES;
    shake.duration = 0.1;
    shake.repeatCount = HUGE_VALF;
    
    
    for (int c= 0; c<9; c++) {
        
        UILabel *letter = [[UILabel alloc]init];
        letter.font = [UIFont fontWithName:@"Courier" size:25];
        letter.textAlignment = NSTextAlignmentCenter;
        float letterWidth = width/10;
        if (c%2) {
            letter.frame = CGRectMake(letterWidth+letterWidth*c, height/2, 50, 50);
        }
        else{
            letter.frame = CGRectMake(letterWidth+letterWidth*c, height/2+50/4, 50, 50);
            
        }
        
        letter.layer.cornerRadius = 100/4;
        letter.clipsToBounds = YES;
        
        switch (c) {
            case 0:
                letter.text = @"C";
                letter.backgroundColor = [UIColor whiteColor];
                break;
            case 1:
                letter.text = @"H";
                letter.backgroundColor = [UIColor redColor];
                break;
            case 2:
                letter.text = @"E";
                letter.backgroundColor = [UIColor greenColor];
                break;
            case 3:
                letter.text = @"C";
                letter.backgroundColor = [UIColor orangeColor];
                break;
            case 4:
                letter.text = @"K";
                letter.backgroundColor = [UIColor magentaColor];
                break;
            case 5:
                letter.text = @"I";
                letter.backgroundColor = [UIColor cyanColor];
                break;
            case 6:
                letter.text = @"N";
                letter.backgroundColor = [UIColor brownColor];
                break;
            case 7:
                letter.text = @"G";
                letter.backgroundColor = [UIColor lightGrayColor];
                break;
            case 8:
                letter.text = @"HOLD CARDS";
                letter.backgroundColor = [UIColor grayColor];
                letter.textColor = [UIColor redColor];
                letter.font = [UIFont fontWithName:@"Courier" size:90];
                letter.frame = CGRectMake(width/2-350, 75, 700/2, 200);
                letter.textAlignment = NSTextAlignmentCenter;
                letter.numberOfLines = 0;
                
                
                
                break;
                
            default:
                break;
        }
        
        
        [_viewPreviewWindow addSubview:letter];
        
        [letter.layer addAnimation:shake forKey:nil];
        [_viewPreviewWindow sendSubviewToBack:letter];
        
        
        
        
    }

}

-(void)showPreview3{
    [self createFrame];
    
    float height = _viewPreviewWindow.bounds.size.height;
    float width = _viewPreviewWindow.bounds.size.width;
    
    CABasicAnimation *moveUpAndDown = [CABasicAnimation animationWithKeyPath:@"transform.translation.y" ];
    [moveUpAndDown setFromValue:[NSNumber numberWithFloat:0]];
    [moveUpAndDown setByValue:[NSNumber numberWithFloat:height-350]];
    [moveUpAndDown setBeginTime:CACurrentMediaTime() ];
    [moveUpAndDown setDuration:2];
    moveUpAndDown.removedOnCompletion = NO;
    moveUpAndDown.autoreverses = YES;
    moveUpAndDown.fillMode = kCAFillModeForwards;
    moveUpAndDown.repeatCount =HUGE_VALF;
    
    UILabel *labelBackground = [[UILabel alloc] initWithFrame:CGRectMake(75, 0, width-75, height)];
    labelBackground.text = @"Hold Cards";
    labelBackground.font = [UIFont fontWithName:@"Helvetica" size:300];
    labelBackground.numberOfLines = 0;
    labelBackground.textColor = [UIColor yellowColor];
    labelBackground.textAlignment = NSTextAlignmentCenter;
    
    float letterWidth = width/10;
    
    
    [self.view addSubview: labelBackground];
    
    
    
    for (int c= 0; c<8; c++) {
        
        UILabel *letter = [[UILabel alloc]init];
        letter.font = [UIFont fontWithName:@"Courier" size:25];
        letter.textAlignment = NSTextAlignmentCenter;
        if (c%2) {
            letter.frame = CGRectMake(letterWidth+letterWidth*c, 150, 200, 200);
        }
        else{
            letter.frame = CGRectMake(letterWidth+letterWidth*c, 50, 200, 200);
            
        }
        
        letter.layer.cornerRadius = 100;
        letter.clipsToBounds = YES;
        
        switch (c) {
            case 0:
                letter.text = @"C";
                letter.backgroundColor = [UIColor whiteColor];
                break;
            case 1:
                letter.text = @"H";
                letter.backgroundColor = [UIColor redColor];
                break;
            case 2:
                letter.text = @"E";
                letter.backgroundColor = [UIColor greenColor];
                break;
            case 3:
                letter.text = @"C";
                letter.backgroundColor = [UIColor orangeColor];
                break;
            case 4:
                letter.text = @"K";
                letter.backgroundColor = [UIColor magentaColor];
                break;
            case 5:
                letter.text = @"I";
                letter.backgroundColor = [UIColor cyanColor];
                break;
            case 6:
                letter.text = @"N";
                letter.backgroundColor = [UIColor brownColor];
                break;
            case 7:
                letter.text = @"G";
                letter.backgroundColor = [UIColor lightGrayColor];
                break;
                
            default:
                break;
        }
        
        
        
        [self.view addSubview:letter];
        
        [letter.layer addAnimation:moveUpAndDown forKey:nil];
        
        
        
        
    }
    
    

}*/

#pragma mark MUSIC SECTION



- (IBAction)btnPlay:(UIButton *)sender {
   
    if (sender == _btnPlayChecking){
        _songTitle = _checkingSongTitle;    }
    
    if (sender == _btnPlayWinner) {
        _songTitle = _winnerSoundTitle;
    }
    


    NSString *songPath;
  
    songPath =[[NSBundle mainBundle]pathForResource:_songTitle ofType:@"mp3"];
    NSURL *url = [NSURL fileURLWithPath:songPath];
    
    NSError *error;
    
    avPlayer= [[AVAudioPlayer alloc]initWithContentsOfURL:url error:&error];
    
    [avPlayer setNumberOfLoops:-1];
    [avPlayer setVolume:5];
    [avPlayer play];
    
    NSLog(@"The sound playing is %@",_songTitle);
    

}

- (IBAction)btnStop:(id)sender {
    [avPlayer stop];
    
}

/*
-(void)createPreviewFrameTest{
    
    
    CGFloat height = [UIScreen mainScreen].bounds.size.height ;
    CGFloat width = [UIScreen mainScreen].bounds.size.width ;
    
    

    checkingPatterns *myView = [checkingPatterns frameWithPattern:2 frameX:0 frameY:height/2 width:width/2 height:height/2];
    
   
    [self.view addSubview:myView];
   // [myView runAnimation];
    
}*/



@end
