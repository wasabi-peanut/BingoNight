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




@interface CheckingSetUpViewController ()
{AVAudioPlayer *avPlayer;
}

@end

@implementation CheckingSetUpViewController

- (void)viewDidLoad {
    NSLog(@"View Did Load");
      self.view.backgroundColor = [UIColor colorWithPatternImage:[UIImage imageNamed:@"greystone.jpg"]];
    
    _height = [UIScreen mainScreen].bounds.size.height ;
    _width = [UIScreen mainScreen].bounds.size.width ;

    
    _musicPlayer = [MPMusicPlayerController applicationMusicPlayer];
    _keyForArrayOfSongNames = @"keyForArrayOfSongNames";
    _keyForArrayOfSongsPicked = @"keyForArrayOfSongsPicked";
    
    //GET NUMBER OF GAMES
    _keyForNumberOfGames = @"keyForNumberOfGames";
    _numberOfGames = [[DefaultsDataManager getDataForKey:_keyForNumberOfGames] integerValue];
    if (_numberOfGames ==0) {
        _numberOfGames = 8;
    }

    
    //Set up preview Window
    
    
    _gameNumber = 0;
    
  
   
    [super viewDidLoad];
    // Do any additional setup after loading the view.
}
-(void)viewDidAppear:(BOOL)animated{
    NSLog(@"View Did Appear");
    _keyForCoordinatesCheckingPatterns = @"keyForCoordinatesCheckingPatterns";
    _keyForCoordinatesCheckingSongs = @"keyForCoordinatesCheckingSongs";
    _keyForCoordinatesWinnerSounds = @"keyForCoordinatesWinnerSounds";

    _arrayCoordinatesCheckingPatterns = [[NSMutableArray alloc] initWithArray:[DefaultsDataManager getArrayForKey:_keyForCoordinatesCheckingPatterns]];
    _arrayCoordinatesCheckingSongs = [[NSMutableArray alloc] initWithArray:[DefaultsDataManager getArrayForKey:_keyForCoordinatesCheckingSongs]];
    _arrayCoordinatesWinnerSounds = [[NSMutableArray alloc] initWithArray:[DefaultsDataManager getArrayForKey:_keyForCoordinatesWinnerSounds]];
    
    [self makeArrays];
    [self addToMusicArray];
    
    
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

 }

-(void)viewWillDisappear:(BOOL)animated{
    [avPlayer stop];
    [_musicPlayer stop];
    
}

- (void)didReceiveMemoryWarning {
    [super didReceiveMemoryWarning];
    // Dispose of any resources that can be recreated.
}




#pragma mark PICKER CONTROLS


-(void)pickerView:(UIPickerView *)pickerView didSelectRow:(NSInteger)row inComponent:(NSInteger)component {
    NSLog(@"Triggered");
    
    
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
            
             NSLog(@"Triggered");
            _songRowSelected = row;
            switch (row) {
                    
                case 0:
                    _checkingSongTitle = @"brazilsamba";
                    break;
                case 1:
                    _checkingSongTitle = @"clearday";
                    break;
                case 2:
                    _checkingSongTitle = @"countryboy";
                    break;
                case 3:
                    _checkingSongTitle = @"dance";
                    break;
                case 4:
                    _checkingSongTitle = @"dubstep";
                    break;
                case 5:
                    _checkingSongTitle = @"epic";
                    break;
                case 6:
                    _checkingSongTitle = @"groovyhiphop";
                    break;
                case 7:
                    _checkingSongTitle = @"happyrock";
                    break;
                case 8:
                    _checkingSongTitle = @"jazzpiano";
                    break;
                case 9:
                    _checkingSongTitle = @"love";
                    break;
                case 10:
                    _checkingSongTitle = @"moose";
                    break;
                case 11:
                    _checkingSongTitle = @"popdance";
                    break;
                case 12:
                    _checkingSongTitle = @"retrosoul";
                    break;
                case 13:
                    _checkingSongTitle = @"rumble";
                    break;
                default:
                    NSLog(@"Sending with row %li",row);
                    [self chooseOwnSong:row];
                    
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

/*-(NSString*)pickerView:(UIPickerView *)pickerView titleForRow:(NSInteger)row forComponent:(NSInteger)component{
    
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
}*/

-(CGFloat)pickerView:(UIPickerView *)pickerView rowHeightForComponent:(NSInteger)component{
    return 50;
}

-(CGFloat)pickerView:(UIPickerView *)pickerView widthForComponent:(NSInteger)component {
    float width;
    
    switch (component) {
        case 0:
            width = _width*.15;
            break;
            
        default:
            width = _width*.65/3;
            break;
    }
    return width;
}

-(UIView *)pickerView:(UIPickerView *)pickerView viewForRow:(NSInteger)row forComponent:(NSInteger)component reusingView:(UIView *)view {
    NSString *fontName = @"Helvetica";
    float fontSize = 36;
    
    UILabel *tview = (UILabel *) view;
    if (pickerView == _pickerChecking) {
        switch (component) {
            case 0:
                
                tview = [[UILabel alloc] init];
                tview.backgroundColor = [UIColor lightGrayColor];
                tview.textColor = [UIColor blueColor];
                
                tview.text = [_arrayGameNumbers objectAtIndex:row];
                break;
                
            case 1:
                    tview = [[UILabel alloc] init];
                    tview.backgroundColor = [UIColor yellowColor];
                    tview.textColor = [UIColor blueColor];
                
                
                tview.text = [_arrayCheckingPatterns objectAtIndex:row];
                break;
                
            case 2:
                if (row<14) {
                    
                    tview = [[UILabel alloc] init];
                    tview.backgroundColor = [UIColor yellowColor];
                    tview.textColor = [UIColor blueColor];
                }
                if (row>=14) {
                    
                    tview = [[UILabel alloc] init];
                    tview.backgroundColor = [UIColor greenColor];
                    tview.textColor = [UIColor blueColor];
                }
                tview.adjustsFontSizeToFitWidth = YES;
                tview.text = [_arrayCheckingSongs objectAtIndex:row];
                break;
            case 3:
                tview = [[UILabel alloc] init];
                tview.backgroundColor = [UIColor yellowColor];
                tview.textColor = [UIColor blueColor];
                tview.text = [_arrayWinnerSounds objectAtIndex:row];
                break;
                
                
            default:
                //do something else
                break;
                
        }
        
        
    }
    
    tview.font = [UIFont fontWithName:fontName size:fontSize];
    
    return tview;
    

}

#pragma mark MAKE ARRAYS

-(void)makeArrays{
    
    _arrayOfSongsPicked = [[NSMutableArray alloc] initWithArray:[DefaultsDataManager getArrayForKey:_keyForArrayOfSongsPicked]];
    NSLog(@"Make arrays: The array of songs picker is %li long",_arrayOfSongsPicked.count);
    
    _arrayOfSongNames = [[NSMutableArray alloc] initWithArray:[DefaultsDataManager getArrayForKey:_keyForArrayOfSongNames]];
    
    
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
                              @"Spin",
                              @"Shake",
                              @"Bounce",
                              @"Drop",
                              @"Fade",
                              @"Flop",
                              @"Rotate",
                              @"Wow",
                              @"Birdie",
                              @"Cowboy",
                              @"Shark",
                              @"Basketball",
                              @"Babies",
                              @"Game",
                              nil];
    
    _arrayCheckingSongs = [[NSMutableArray alloc] initWithObjects:
                   
                                @"Brazil Samba",
                                @"Clear Day",
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
    
    _myView = [checkingPatterns frameX:width*.25 frameY:height/2 width:width/2 height:height/2];
    
    
    [self.view addSubview:_myView];
    [_myView runAnimationWithPatternSelected:_patternSelected];
    
    

    
}



#pragma mark MUSIC SECTION



- (IBAction)btnPlay:(UIButton *)sender {
    [_musicPlayer stop];
    [avPlayer stop];
    
   
    if (sender == _btnPlayChecking){
        
        if (_songRowSelected<14) {
               _songTitle = _checkingSongTitle;
            [self playAVPlayer];
        }
        else{
            [self playOwnSong];
        }
    }
    if (sender == _btnPlayWinner) {
       _songTitle = _winnerSoundTitle;
         [self playAVPlayer];
    }
}

    -(void)playAVPlayer{

    NSString *songPath;
  
    songPath =[[NSBundle mainBundle]pathForResource:_songTitle ofType:@"mp3"];
    NSURL *url = [NSURL fileURLWithPath:songPath];
    
    NSError *error;
    
    avPlayer= [[AVAudioPlayer alloc]initWithContentsOfURL:url error:&error];
    
    [avPlayer setNumberOfLoops:-1];
    [avPlayer setVolume:3];
    [avPlayer play];
    }
    
    



- (IBAction)btnStop:(id)sender {
   
    _songTitle = nil;
    _winnerSoundTitle = nil;
    
    
    [avPlayer stop];
    [_musicPlayer stop];
    
    
}


- (IBAction)btnOwnSongsPressed:(id)sender {
}



-(void)addToMusicArray {
    
    [_arrayCheckingSongs addObjectsFromArray:_arrayOfSongNames];
    [_pickerChecking reloadAllComponents];
    
}

-(void)chooseOwnSong:(NSInteger)rowSelected {
    MPMediaQuery *query = [MPMediaQuery songsQuery];
    NSLog(@"The array of songs picked is %li items and the row selected is %li",_arrayOfSongsPicked.count, rowSelected);
    
    [query addFilterPredicate:[MPMediaPropertyPredicate predicateWithValue:_arrayOfSongsPicked[rowSelected-14] forProperty:MPMediaItemPropertyPersistentID]];
    
   // [query addFilterPredicate:[MPMediaPropertyPredicate predicateWithValue:_arrayOfSongsPicked[0] forProperty:MPMediaItemPropertyPersistentID]];
    
    [_musicPlayer setQueueWithQuery:query];
    
   
}

-(void)playOwnSong{
    [_musicPlayer play];
}


@end


//OWN MUSIC ADD TO ARRAY





