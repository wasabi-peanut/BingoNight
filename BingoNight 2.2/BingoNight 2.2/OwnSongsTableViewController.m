//
//  OwnSongsTableViewController.m
//  BingoNight 2.2
//
//  Created by Adam Schor on 2/27/17.
//  Copyright © 2017 AandA Development. All rights reserved.
//

#import "OwnSongsTableViewController.h"
#import "DefaultsDataManager.h"

@interface OwnSongsTableViewController ()

@end

@implementation OwnSongsTableViewController

- (void)viewDidLoad {
    
     _musicPlayer = [MPMusicPlayerController applicationMusicPlayer];
    _keyForArrayOfSongNames = @"keyForArrayOfSongNames";
    _keyForArrayOfSongsPicked = @"keyForArrayOfSongsPicked";
    
   
    
    [super viewDidLoad];
    
    [self loadThePlayList];
    
    // Uncomment the following line to preserve selection between presentations.
    // self.clearsSelectionOnViewWillAppear = NO;
    
    // Uncomment the following line to display an Edit button in the navigation bar for this view controller.
     self.navigationItem.rightBarButtonItem = self.editButtonItem;
    
        }

- (void)didReceiveMemoryWarning {
    [super didReceiveMemoryWarning];
    // Dispose of any resources that can be recreated.
}

#pragma mark - Table view data source

- (NSInteger)numberOfSectionsInTableView:(UITableView *)tableView {

    return 1;
}

- (NSInteger)tableView:(UITableView *)tableView numberOfRowsInSection:(NSInteger)section {

    return _arrayOfSongNames.count;
}


- (UITableViewCell *)tableView:(UITableView *)tableView cellForRowAtIndexPath:(NSIndexPath *)indexPath {
    UITableViewCell *cell = [tableView dequeueReusableCellWithIdentifier:@"cell" forIndexPath:indexPath];
    
    // Configure the cell...
    NSString *title = _arrayOfSongNames[indexPath.row];
    
    cell.textLabel.text = title;
    return cell;
}

-(void)tableView:(UITableView *)tableView didSelectRowAtIndexPath:(NSIndexPath *)indexPath {
    
    MPMediaQuery *query = [MPMediaQuery songsQuery];
    [query addFilterPredicate:[MPMediaPropertyPredicate predicateWithValue:_arrayOfSongsPicked[indexPath.row] forProperty:MPMediaItemPropertyPersistentID]];
    
    
    [_musicPlayer setQueueWithQuery:query];
    
    [_musicPlayer play];

}

/*
// Override to support conditional editing of the table view.
- (BOOL)tableView:(UITableView *)tableView canEditRowAtIndexPath:(NSIndexPath *)indexPath {
    // Return NO if you do not want the specified item to be editable.
    return YES;
}
*/


// Override to support editing the table view.
- (void)tableView:(UITableView *)tableView commitEditingStyle:(UITableViewCellEditingStyle)editingStyle forRowAtIndexPath:(NSIndexPath *)indexPath {
    if (editingStyle == UITableViewCellEditingStyleDelete) {
        // Delete the row from the data source
        [tableView deleteRowsAtIndexPaths:@[indexPath] withRowAnimation:UITableViewRowAnimationFade];
    } else if (editingStyle == UITableViewCellEditingStyleInsert) {
        // Create a new instance of the appropriate class, insert it into the array, and add a new row to the table view
    }   
}



// Override to support rearranging the table view.
- (void)tableView:(UITableView *)tableView moveRowAtIndexPath:(NSIndexPath *)fromIndexPath toIndexPath:(NSIndexPath *)toIndexPath {
}



// Override to support conditional rearranging of the table view.
- (BOOL)tableView:(UITableView *)tableView canMoveRowAtIndexPath:(NSIndexPath *)indexPath {
    // Return NO if you do not want the item to be re-orderable.
    return YES;
}

-(void)loadThePlayList {

    
    
  /*  NSData *data = [DefaultsDataManager getDataForKey:_keyForArrayOfSongsPicked];
     MPMediaItemCollection *mediaItemCollection = [NSKeyedUnarchiver unarchiveObjectWithData:data];
    _arrayOfSongsPicked = [[NSMutableArray alloc] initWithArray:[mediaItemCollection items]];*/
    
    _arrayOfSongNames = [[NSMutableArray alloc] initWithArray:[DefaultsDataManager getArrayForKey:_keyForArrayOfSongNames]];
    _arrayOfSongsPicked = [[NSMutableArray alloc] initWithArray:[DefaultsDataManager getArrayForKey:_keyForArrayOfSongsPicked]];
    
       NSLog(@"The playlist is %@",_arrayOfSongNames);
    NSLog(@"The playlist locations are %@",_arrayOfSongsPicked);
    
   }


- (IBAction)btnSelectSongs:(id)sender {
 
    _mediaPicker = [[MPMediaPickerController alloc] initWithMediaTypes:MPMediaTypeMusic];
    _mediaPicker.delegate = self;
    _mediaPicker.allowsPickingMultipleItems = YES;
    [self presentViewController:_mediaPicker animated:YES completion:nil];
    
}


-(void)mediaPicker:(MPMediaPickerController *)mediaPicker didPickMediaItems:(MPMediaItemCollection *)mediaItemCollection {
   
    [self dismissViewControllerAnimated:mediaPicker completion:nil];
  
   // _arrayOfSongsPicked = [[NSMutableArray alloc] initWithArray:[mediaItemCollection items]];
   // NSLog(@"This is the array of picks %@",_arrayOfSongsPicked);
    
    for (_item in [mediaItemCollection items]) {
        _nameOfSong = [_item valueForProperty:MPMediaItemPropertyTitle];
        [_arrayOfSongNames addObject:_nameOfSong];
    }
    for (_item in [mediaItemCollection items]){
        _persistentID = [_item valueForProperty:MPMediaItemPropertyPersistentID];
        [_arrayOfSongsPicked addObject:_persistentID];
        
    }
    [DefaultsDataManager saveData:_arrayOfSongsPicked forKey:_keyForArrayOfSongsPicked];
    [DefaultsDataManager saveData:_arrayOfSongNames forKey:_keyForArrayOfSongNames];
    
 /*   [DefaultsDataManager saveData:_arrayOfSongNames forKey:_keyForArrayOfSongNames];
    
    NSData *dataMediaItemCollection = [NSKeyedArchiver archivedDataWithRootObject:mediaItemCollection];
    [DefaultsDataManager saveData:dataMediaItemCollection forKey:_keyForArrayOfSongsPicked];
   */
    [self playMusic];
   
}

-(void)mediaPickerDidCancel:(MPMediaPickerController *)mediaPicker{
    [self dismissViewControllerAnimated:mediaPicker completion:nil];
    
}




-(void)playMusic{
   
    MPMediaQuery *query = [MPMediaQuery songsQuery];
    [query addFilterPredicate:[MPMediaPropertyPredicate predicateWithValue:_arrayOfSongsPicked[1] forProperty:MPMediaItemPropertyPersistentID]];
    
    
    [_musicPlayer setQueueWithQuery:query];
    
    [_musicPlayer play];
    
    
    
}


@end
