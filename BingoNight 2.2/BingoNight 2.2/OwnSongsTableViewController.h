//
//  OwnSongsTableViewController.h
//  BingoNight 2.2
//
//  Created by Adam Schor on 2/27/17.
//  Copyright © 2017 AandA Development. All rights reserved.
//

#import <UIKit/UIKit.h>
#import <MediaPlayer/MediaPlayer.h>

@interface OwnSongsTableViewController : UITableViewController <MPMediaPickerControllerDelegate>

@property MPMediaItem *item;
@property MPMediaItemCollection *mediaItemCollection;
@property MPMediaPickerController *mediaPicker;

@property (strong,nonatomic) NSString *nameOfSong;
@property (strong, nonatomic) NSString *persistentID;




@property (strong, nonatomic) NSMutableArray *arrayOfSongNames;
@property (strong, nonatomic) NSMutableArray *arrayOfSongsPicked;

@property (strong, nonatomic) NSString *keyForArrayOfSongNames;
@property (strong, nonatomic) NSString *keyForArrayOfSongsPicked;

- (IBAction)btnSelectSongs:(id)sender;
@property MPMusicPlayerController *musicPlayer;

@end
