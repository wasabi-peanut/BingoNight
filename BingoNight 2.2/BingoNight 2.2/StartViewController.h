//
//  StartViewController.h
//  Bingo Night 3.0
//
//  Created by Adam Schor on 7/31/15.
//  Copyright (c) 2015 AandA Development. All rights reserved.
//

#import <UIKit/UIKit.h>
#import <MediaPlayer/MediaPlayer.h>


@interface StartViewController : UIViewController

@property NSInteger numberOfGames;
@property (strong,nonatomic) NSString *keyForNumberOfGames;
@property (strong,nonatomic) NSString *keyForGlobalSettings;
@property NSInteger gameSelected;

@property (strong,nonatomic) UITextView *nameOfEvent;

@property (strong,nonatomic) NSMutableArray *arrayGlobalSettings;

@property CGFloat height;
@property CGFloat width;

//MUSIC
@property MPMusicPlayerController *musicPlayer;
- (IBAction)btnPlay:(id)sender;
- (IBAction)btnStop:(id)sender;
@end
