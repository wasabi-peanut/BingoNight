//
//  ViewController.h
//  mpMediaPickerTest
//
//  Created by Adam Schor on 2/7/17.
//  Copyright © 2017 AandA Development. All rights reserved.
//

#import <UIKit/UIKit.h>
#import <MediaPlayer/MediaPlayer.h>
#import <AVFoundation/AVFoundation.h>



@interface ViewController : UIViewController <MPMediaPickerControllerDelegate>

@property NSInteger buttonPressed;

@property (strong, nonatomic) IBOutlet UIButton *btnChoose;
- (IBAction)btnChoosePressed:(UIButton *)sender;

@property NSURL *targetURL;

@property MPMusicPlayerController  *mediaPicker;
@property MPMusicPlayerController *musicPlayer;
@property MPMediaItem *item;
@property MPMediaItemCollection *mediaItemCollection;

- (IBAction)btnReplay:(id)sender;
@property (weak, nonatomic) IBOutlet UILabel *labelSongData;
@property (weak, nonatomic) IBOutlet UIButton *btnPlayOne;
@property (weak, nonatomic) IBOutlet UIButton *btnPlayTwo;
@property (weak, nonatomic) IBOutlet UIButton *btnPlayFromArray;

@property (strong, nonatomic) NSMutableArray *arrayOfSongs;


- (IBAction)btnStop:(id)sender;
@end

