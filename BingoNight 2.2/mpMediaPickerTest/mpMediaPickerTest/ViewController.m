//
//  ViewController.m
//  mpMediaPickerTest
//
//  Created by Adam Schor on 2/7/17.
//  Copyright © 2017 AandA Development. All rights reserved.
//

#import "ViewController.h"

@interface ViewController ()
{AVAudioPlayer *avPlayer;
}
@end

@implementation ViewController

- (void)viewDidLoad {
    [super viewDidLoad];
    // Do any additional setup after loading the view, typically from a nib.
    _musicPlayer = [MPMusicPlayerController applicationMusicPlayer];
    _arrayOfSongs = [[NSMutableArray alloc]init];
    

}


- (void)didReceiveMemoryWarning {
    [super didReceiveMemoryWarning];
    // Dispose of any resources that can be recreated.
}




- (IBAction)btnChoosePressed:(UIButton*)sender {
    
    if (sender == _btnPlayFromArray) {
        _buttonPressed = 3;
    }
    
    if (sender == _btnChoose) {
        _buttonPressed = 1;}
    else {
        _buttonPressed = 2;
    }
    

    MPMediaPickerController *mediaPicker= [[MPMediaPickerController alloc] initWithMediaTypes:MPMediaTypeMusic];
    mediaPicker.delegate = self;
    mediaPicker.allowsPickingMultipleItems = YES;
    [self presentViewController:mediaPicker animated:YES completion:nil];
    
    
}

-(void)mediaPickerDidCancel:(MPMediaPickerController *)mediaPicker{
    [self dismissViewControllerAnimated:mediaPicker completion:nil];
}

-(void)mediaPicker:(MPMediaPickerController *)mediaPicker didPickMediaItems:(MPMediaItemCollection *)mediaItemCollection{
 
    [self dismissViewControllerAnimated:mediaPicker completion:nil];
    
    
    _item = [[mediaItemCollection items] objectAtIndex:0];
    //_mediaItemCollection = mediaItemCollection;
    
   NSString *keyForData;
    if (_buttonPressed == 1) {
        keyForData = @"keySongOne";
    }

    else{
        keyForData = @"keySongTwo";
    }
    
    
    NSData *data = [NSKeyedArchiver archivedDataWithRootObject:mediaItemCollection];
  
    NSUserDefaults *defaults = [NSUserDefaults standardUserDefaults];
    [defaults setObject:data forKey:keyForData];
    [defaults synchronize];
    [_arrayOfSongs addObject:data];
    
    
   
    _labelSongData.text= [_item valueForProperty:MPMediaItemPropertyTitle];

    NSString *label = [_item valueForProperty:MPMediaItemPropertyTitle];
    NSUserDefaults *defaults2 = [NSUserDefaults standardUserDefaults];
    [defaults2 setObject:label forKey:@"songText"];
    [defaults2 synchronize];
    NSLog(@"Here");
    
    
//    [_musicPlayer setQueueWithItemCollection:mediaItemCollection];
  //  [_musicPlayer play];
   
     
   //OR TO USE AVPLAYER-- NOT WORKING SO THINK ABOUT MUSICPLAYER
  /*  NSURL *url = [item valueForProperty:MPMediaItemPropertyAssetURL];
    
    AVPlayerItem *playerItem = [[AVPlayerItem alloc] initWithURL:url];
    AVPlayer *player = [[AVPlayer alloc] initWithPlayerItem:playerItem];
    [player play];
   */
    
   // _targetURL = [item valueForProperty: MPMediaItemPropertyAssetURL];
    
    
}


- (IBAction)btnReplay:(UIButton*)sender {
    [_musicPlayer stop];
    NSString *keyForData;
    NSData *data;
    
    if (sender == _btnPlayOne) {
            keyForData = @"keySongOne";
        }
        
        else{
            keyForData = @"keySongTwo";
        }

    
    NSUserDefaults *defaults = [NSUserDefaults standardUserDefaults];
    data = [defaults objectForKey:keyForData];
    
    if (sender == _btnPlayFromArray) {
        data = _arrayOfSongs[1];
    }
    
    MPMediaItemCollection *mediaItemCollection = [NSKeyedUnarchiver unarchiveObjectWithData:data];
  
    
    NSUserDefaults *defaults2 = [NSUserDefaults standardUserDefaults];
    NSString *label =  [defaults2 objectForKey:@"songText"];
    [defaults2 synchronize];
   
    _labelSongData.text = label;
    
    [_musicPlayer setQueueWithItemCollection:mediaItemCollection];
    [_musicPlayer play];
    
    
}

- (IBAction)btnStop:(id)sender {
    //[_musicPlayer stop];
    [_musicPlayer skipToNextItem];
    
    NSLog(@"The data of songs is %@",_arrayOfSongs);
}
@end
