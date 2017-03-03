//
//  CheckingViewController.h
//  Bingo Night 3.0
//
//  Created by Adam Schor on 9/11/15.
//  Copyright (c) 2015 AandA Development. All rights reserved.
//


#import <UIKit/UIKit.h>
#import <QuartzCore/QuartzCore.h>
#import "checkingPatterns.h"
#import <AVFoundation/AVFoundation.h>
#import <MediaPlayer/MediaPlayer.h>



@interface CheckingViewController : UIViewController



@property (strong,nonatomic) NSMutableArray *arrayCalledNumbers;

@property (strong,nonatomic) NSArray *arrayCalledNumbersSorted;
@property (strong, nonatomic) NSString *keyForCalledNumbers;

@property (strong, nonatomic) NSMutableArray *arrayCoordinatesCheckingPatterns;
@property (strong, nonatomic) NSString *keyForCoordinatesCheckingPatterns;

@property (strong, nonatomic) NSMutableArray *arrayCoordinatesCheckingSongs;
@property (strong, nonatomic) NSString *keyForCoordinatesCheckingSongs;

@property (strong, nonatomic) NSString *checkingSongTitle;

@property NSInteger gameNumber;




@property (strong, nonatomic) IBOutlet UITextView *textViewCalledNumbers;

@property (strong,nonatomic) UIView *animationView;

@property CGFloat height;
@property CGFloat width;


@property UILabel *labelCircleC;
@property UIView *viewCircleC;

@property CGFloat widthOfCalledDisplay;

@property checkingPatterns *myView;

//OWN SONGS DATA
@property MPMediaItem *item;
@property MPMediaItemCollection *mediaItemCollection;
@property MPMediaPickerController *mediaPicker;

@property (strong,nonatomic) NSString *nameOfSong;
@property (strong, nonatomic) NSString *persistentID;

@property NSInteger songRowSelected;


@property (strong, nonatomic) NSMutableArray *arrayOfSongNames;
@property (strong, nonatomic) NSMutableArray *arrayOfSongsPicked;

@property (strong, nonatomic) NSString *keyForArrayOfSongNames;
@property (strong, nonatomic) NSString *keyForArrayOfSongsPicked;
@property MPMusicPlayerController *musicPlayer;


@end
