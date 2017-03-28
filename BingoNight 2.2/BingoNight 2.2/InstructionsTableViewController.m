//
//  InstructionsTableViewController.m
//  BingoNight 2.2
//
//  Created by Adam Schor on 12/5/16.
//  Copyright © 2016 AandA Development. All rights reserved.
//

#import "InstructionsTableViewController.h"
#import "TextViewController.h"

@interface InstructionsTableViewController ()

@end

@implementation InstructionsTableViewController

- (void)viewDidLoad {
    [super viewDidLoad];
     [self.navigationController setNavigationBarHidden:NO];
    
    
    
    [self createArrayOfSections];
    [self createArrayOfTopics];
    
    // Uncomment the following line to preserve selection between presentations.
    // self.clearsSelectionOnViewWillAppear = NO;
    
    // Uncomment the following line to display an Edit button in the navigation bar for this view controller.
    // self.navigationItem.rightBarButtonItem = self.editButtonItem;
}
-(void)viewDidAppear:(BOOL)animated{
   
}

-(void)popoverPresentationControllerDidDismissPopover:(UIPopoverPresentationController *)popoverPresentationController{
   //   _path = [NSIndexPath indexPathForRow:_path.row inSection:_path.section];
  //  [self tableView:_tableViewInstructions didSelectRowAtIndexPath:_path];
    
    
}



-(void)createArrayOfSections{
    _arrayOfSections = [[NSMutableArray alloc] initWithObjects:
                      @"Introduction",
                      @"Play Game",
                      @"Set Up Local",
                      @"Set Up Global",
                      @"Restore and Backup",
                        nil
                        ];
    
}

-(void)createArrayOfTopics{
    _arrayOfTopicsIntro = [[NSMutableArray alloc] initWithObjects:
                      @"Welcome",
                    nil];
    
    _arrayOfTopicsPlay = [[NSMutableArray alloc] initWithObjects:
                          @"Choose Game Screen",
                          @"Raffle",
                          @"Theme Song",
                          @"Game Display",
                          @"Ball Display",
                          @"Checking",
                          @"Winner",
                          nil];
    
    _arrayOfTopicsSetupLocal = [[NSMutableArray alloc] initWithObjects:
                            @"Overview",
                            @"Number of Games",
                            @"Color Schemes",
                            @"Grids",
                            @"Customize Grid",
                            @"Game Comments",
                            nil];
    
    _arrayOfTopicsSetupGlobal = [[NSMutableArray alloc] initWithObjects:
                                @"Event Screen",
                                @"Add Image",
                                @"Use Auto Select",
                                @"Smart Ball Choice",
                                @"Special Checking",
                                @"Ball Animation Settings",
                                @"Raffle",
                                @"Make Cards",
                                @"Theme Song",
                                nil];

    _arrayOfTopicsRestore = [[NSMutableArray alloc] initWithObjects:
                                 @"Restore Game",
                                 @"iCloud Settings",
                                 nil];

}


- (void)didReceiveMemoryWarning {
    [super didReceiveMemoryWarning];
    // Dispose of any resources that can be recreated.
}

- (BOOL)prefersStatusBarHidden{
    return YES;
}

#pragma mark - Table view data source

- (NSInteger)numberOfSectionsInTableView:(UITableView *)tableView {
    return _arrayOfSections.count;
}

- (NSInteger)tableView:(UITableView *)tableView numberOfRowsInSection:(NSInteger)section {
    NSInteger rows;
    switch (section) {
        case 0:
           rows = _arrayOfTopicsIntro.count;
            break;
        case 1:
            rows = _arrayOfTopicsPlay.count;
            break;
        case 2:
            rows = _arrayOfTopicsSetupLocal.count;
            break;
        case 3:
            rows = _arrayOfTopicsSetupGlobal.count;
            break;
        case 4:
            rows = _arrayOfTopicsRestore.count;
            break;
        
        default:
            rows = 2;
            break;
    }
    return rows;
}

-(NSString *)tableView:(UITableView *)tableView titleForHeaderInSection:(NSInteger)section {
     NSString *sectionName;
    
    sectionName = _arrayOfSections[section];
    return sectionName;
    
}


- (UITableViewCell *)tableView:(UITableView *)tableView cellForRowAtIndexPath:(NSIndexPath *)indexPath {
UITableViewCell *cell = [tableView dequeueReusableCellWithIdentifier:@"cell" forIndexPath:indexPath];
  
    // Configure the cell...
    
    if (cell == nil) {
        cell = [[UITableViewCell alloc] initWithStyle:UITableViewCellStyleSubtitle reuseIdentifier:@"cell"];
    }
    
    NSString * title;
    
    switch (indexPath.section) {
        case 0:
            title = _arrayOfTopicsIntro[indexPath.row];
            break;
        case 1:
            title= _arrayOfTopicsPlay[indexPath.row];
            break;
        case 2:
            title= _arrayOfTopicsSetupLocal[indexPath.row];
            break;
        case 3:
            title = _arrayOfTopicsSetupGlobal[indexPath.row];
            break;
        case 4:
            title = _arrayOfTopicsRestore[indexPath.row];
            break;
     
        default:
            break;
    }
    
    
    cell.textLabel.text = title;
    
    return cell;
}



-(CGFloat)tableView:(UITableView *)tableView heightForRowAtIndexPath:(NSIndexPath *)indexPath{
    return 50;
}

-(CGFloat)tableView:(UITableView *)tableView heightForHeaderInSection:(NSInteger)section{
    return 75;
}


-(void)tableView:(UITableView *)tableView didSelectRowAtIndexPath:(NSIndexPath *)indexPath {
    
    _rowSelected = indexPath.row;
    _sectionSelected = indexPath.section;
    
    switch (indexPath.section) {
        case 0:
            _topic = _arrayOfTopicsIntro[indexPath.row];
            break;
        case 1:
            _topic= _arrayOfTopicsPlay[indexPath.row];
            break;
        case 2:
            _topic= _arrayOfTopicsSetupLocal[indexPath.row];
            break;
        case 3:
            _topic = _arrayOfTopicsSetupGlobal[indexPath.row];
            break;
        case 4:
            _topic = _arrayOfTopicsRestore[indexPath.row];
            break;
            
        default:
            break;
    }
    
    
    
    [self performSegueWithIdentifier:@"segueInstructionsToText" sender:self];
    
}

-(void)prepareForSegue:(UIStoryboardSegue *)segue sender:(id)sender {
    if ([[segue identifier] isEqualToString: @"segueInstructionsToText"]){
        TextViewController *view = [segue destinationViewController];
    
        _popView = [view popoverPresentationController];
        _popView.delegate = self;
     
        _popView.sourceView = self.view;
        _popView.sourceRect = CGRectMake([UIScreen mainScreen].bounds.size.width*.3, [UIScreen mainScreen].bounds.size.height*.2, [UIScreen mainScreen].bounds.size.width, [UIScreen mainScreen].bounds.size.height);

      
        view.preferredContentSize = CGSizeMake([UIScreen mainScreen].bounds.size.width*.8, [UIScreen mainScreen].bounds.size.height*.9);
        view.sendingRow = _rowSelected ;
        view.sendingSection = _sectionSelected;
        view.incomingTopic = _topic;
        
        NSMutableArray *ptView = [[NSMutableArray alloc] init];
        UITableViewCell *cell;
        for (cell in _tableViewInstructions.visibleCells) {
            [ptView addObject:cell];
        }
        
        _popView.passthroughViews = ptView;
        [self dismissViewControllerAnimated:_popView completion:nil];
        
        
        
    }
 
}


/*
// Override to support conditional editing of the table view.
- (BOOL)tableView:(UITableView *)tableView canEditRowAtIndexPath:(NSIndexPath *)indexPath {
    // Return NO if you do not want the specified item to be editable.
    return YES;
}



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



*/

@end
