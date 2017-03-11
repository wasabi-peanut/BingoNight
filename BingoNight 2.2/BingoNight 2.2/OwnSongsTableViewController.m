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
    _keyForArrayOfSongArtists = @"keyForArrayOfSongArtists";
   
    _keyForCoordinatesCheckingSongs = @"keyForCoordinatesCheckingSongs";
    

    
    [super viewDidLoad];
    
   
    
    // Uncomment the following line to preserve selection between presentations.
    // self.clearsSelectionOnViewWillAppear = NO;
    
    // Uncomment the following line to display an Edit button in the navigation bar for this view controller.
     self.navigationItem.rightBarButtonItem = self.editButtonItem;
    
        }

-(void)viewDidAppear:(BOOL)animated {
    [self loadThePlayList];
}

- (void)didReceiveMemoryWarning {
    [super didReceiveMemoryWarning];
    // Dispose of any resources that can be recreated.
}

-(void)viewWillDisappear:(BOOL)animated{
    [self saveThePlaylist];
    [_musicPlayer stop];
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
    NSString *subTitle = _arrayOfSongArtists[indexPath.row];
    cell.textLabel.text = title;
    cell.detailTextLabel.text = subTitle;
    
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
        [_arrayOfSongNames removeObjectAtIndex:indexPath.row];
        [_arrayOfSongsPicked removeObjectAtIndex:indexPath.row];
        [_arrayOfSongArtists removeObjectAtIndex:indexPath.row];
        NSLog(@"The deleted row is %li",indexPath.row);
        
        
       for (int x = 0; x<_arrayCoordinatesCheckingSongs.count; x++) {
            if ([_arrayCoordinatesCheckingSongs[x] integerValue]==indexPath.row+14) {
                [_arrayCoordinatesCheckingSongs replaceObjectAtIndex:x withObject:@(0)];
                NSLog(@"I change coordinate to 0 for index path %li",indexPath.row);
                
            }
           
           if ([_arrayCoordinatesCheckingSongs[x] integerValue] > indexPath.row+14) {
               [_arrayCoordinatesCheckingSongs replaceObjectAtIndex:x withObject:@([_arrayCoordinatesCheckingSongs[x] integerValue]-1)];
               NSLog(@"I lowered coordinate by 1 for index path %li ",indexPath.row);
           }
            
        }
       
        [tableView deleteRowsAtIndexPaths:@[indexPath] withRowAnimation:UITableViewRowAnimationFade];
        NSLog(@"The array of song names i %@",_arrayOfSongNames);
        
        
    } else if (editingStyle == UITableViewCellEditingStyleInsert) {
        // Create a new instance of the appropriate class, insert it into the array, and add a new row to the table view
    }
    [DefaultsDataManager saveData:_arrayCoordinatesCheckingSongs forKey:_keyForCoordinatesCheckingSongs];
    
    [self saveThePlaylist];
    
}



// Override to support rearranging the table view.
- (void)tableView:(UITableView *)tableView moveRowAtIndexPath:(NSIndexPath *)fromIndexPath toIndexPath:(NSIndexPath *)toIndexPath {
    NSUInteger fromIndex = fromIndexPath.row;
    NSUInteger toIndex = toIndexPath.row;
    
    if (fromIndex != toIndex) {
        NSString *name = [_arrayOfSongNames objectAtIndex:fromIndex];
        [_arrayOfSongNames removeObjectAtIndex:fromIndex];
        [_arrayOfSongNames insertObject:name atIndex:toIndex];
        
        NSString *location = [_arrayOfSongsPicked objectAtIndex:fromIndex];
        [_arrayOfSongsPicked removeObjectAtIndex:fromIndex];
        [_arrayOfSongsPicked insertObject:location atIndex:toIndex];
        
        NSString *artist = [_arrayOfSongArtists objectAtIndex:fromIndex];
        [_arrayOfSongArtists removeObjectAtIndex:fromIndex];
        [_arrayOfSongArtists insertObject:artist atIndex:toIndex];
        
    }
    [self.tableView reloadData];
    [self saveThePlaylist];

}



// Override to support conditional rearranging of the table view.
- (BOOL)tableView:(UITableView *)tableView canMoveRowAtIndexPath:(NSIndexPath *)indexPath {
    // Return NO if you do not want the item to be re-orderable.
    return YES;
}

-(void)loadThePlayList {

    
    _arrayOfSongNames = [[NSMutableArray alloc] initWithArray:[DefaultsDataManager getArrayForKey:_keyForArrayOfSongNames]];
    _arrayOfSongsPicked = [[NSMutableArray alloc] initWithArray:[DefaultsDataManager getArrayForKey:_keyForArrayOfSongsPicked]];
    _arrayOfSongArtists = [[NSMutableArray alloc] initWithArray:[DefaultsDataManager getArrayForKey:_keyForArrayOfSongArtists]];
    
    _arrayCoordinatesCheckingSongs = [[NSMutableArray alloc] initWithArray:[DefaultsDataManager getArrayForKey:_keyForCoordinatesCheckingSongs]];
    
    
    
    
    [self.tableView reloadData];
   }

-(void)saveThePlaylist{
    [DefaultsDataManager saveData:_arrayOfSongsPicked forKey:_keyForArrayOfSongsPicked];
    [DefaultsDataManager saveData:_arrayOfSongNames forKey:_keyForArrayOfSongNames];
    [DefaultsDataManager saveData:_arrayOfSongArtists forKey:_keyForArrayOfSongArtists];
    [DefaultsDataManager saveData:_arrayCoordinatesCheckingSongs forKey:_keyForCoordinatesCheckingSongs];
    
    
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
    
    for (_item in [mediaItemCollection items]){
        _nameOfArtist = [_item valueForProperty:MPMediaItemPropertyArtist];
        [_arrayOfSongArtists addObject:_nameOfArtist];
        
    }
    
    [self saveThePlaylist];
    [self.tableView reloadData];
    
  
   
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
