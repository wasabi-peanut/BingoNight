//
//  RaffleSetUpTableViewController.m
//  BingoNight 2.2
//
//  Created by Adam Schor on 2/2/17.
//  Copyright © 2017 AandA Development. All rights reserved.
//

#import "RaffleSetUpTableViewController.h"



@interface RaffleSetUpTableViewController ()

@end

@implementation RaffleSetUpTableViewController

- (void)viewDidLoad {
    [super viewDidLoad];
    
    _test = [[NSMutableArray alloc] initWithObjects:@"Adam",@"Marcia",@"William",@"Alex",@"Julia",nil];
    
    
    // Uncomment the following line to preserve selection between presentations.
    // self.clearsSelectionOnViewWillAppear = NO;
    
    // Uncomment the following line to display an Edit button in the navigation bar for this view controller.
     self.navigationItem.rightBarButtonItem = self.editButtonItem;
}

- (void)didReceiveMemoryWarning {
    [super didReceiveMemoryWarning];
    // Dispose of any resources that can be recreated.
}

-(void)viewWillDisappear:(BOOL)animated{
    NSLog(@"Bye Bye");
    
}


#pragma mark - Table view data source

- (NSInteger)numberOfSectionsInTableView:(UITableView *)tableView {
    return 1;
}

- (NSInteger)tableView:(UITableView *)tableView numberOfRowsInSection:(NSInteger)section {
    return _test.count;
}


- (UITableViewCell *)tableView:(UITableView *)tableView cellForRowAtIndexPath:(NSIndexPath *)indexPath {
    UITableViewCell *cell = [tableView dequeueReusableCellWithIdentifier:@"cell" forIndexPath:indexPath];
    
    
    cell.textLabel.text = [NSString stringWithFormat:@"Item %li: %@",indexPath.row+1,_test[indexPath.row]];
    
    cell.detailTextLabel.text = @"Please Work";
    
    return cell;
}






// Override to support conditional editing of the table view.
- (BOOL)tableView:(UITableView *)tableView canEditRowAtIndexPath:(NSIndexPath *)indexPath {
    // Return NO if you do not want the specified item to be editable.
    return YES;
}



// Override to support editing the table view.
- (void)tableView:(UITableView *)tableView commitEditingStyle:(UITableViewCellEditingStyle)editingStyle forRowAtIndexPath:(NSIndexPath *)indexPath {
    if (editingStyle == UITableViewCellEditingStyleDelete) {
        // Delete the row from the data source
          [_test removeObjectAtIndex:indexPath.row];
        [tableView deleteRowsAtIndexPaths:@[indexPath] withRowAnimation:UITableViewRowAnimationFade];
     
        
    } else if (editingStyle == UITableViewCellEditingStyleInsert) {
        
        
        // Create a new instance of the appropriate class, insert it into the array, and add a new row to the table view
    }   
}



// Override to support rearranging the table view.
- (void)tableView:(UITableView *)tableView moveRowAtIndexPath:(NSIndexPath *)fromIndexPath toIndexPath:(NSIndexPath *)toIndexPath {
    
    NSUInteger fromIndex = fromIndexPath.row;
    NSUInteger toIndex = toIndexPath.row;
    
    if (fromIndex != toIndex) {
        NSString *item = [_test objectAtIndex:fromIndex];
        [_test removeObject:item];
        [_test insertObject:item atIndex:toIndex];
    }
    [self.tableView reloadData];
    NSLog(@"The new array is %@",_test);
}




// Override to support conditional rearranging of the table view.
- (BOOL)tableView:(UITableView *)tableView canMoveRowAtIndexPath:(NSIndexPath *)indexPath {
    // Return NO if you do not want the item to be re-orderable.
    return YES;
}


/*
#pragma mark - Navigation

// In a storyboard-based application, you will often want to do a little preparation before navigation
- (void)prepareForSegue:(UIStoryboardSegue *)segue sender:(id)sender {
    // Get the new view controller using [segue destinationViewController].
    // Pass the selected object to the new view controller.
}
*/

-(void)tableView:(UITableView *)tableView didSelectRowAtIndexPath:(NSIndexPath *)indexPath{
    NSLog(@"Picked this item: %@",_test[indexPath.row]);
    
          
}


- (IBAction)addItemPressed:(id)sender {
    [_test insertObject:@"Hello" atIndex:0];
    [self.tableView reloadData];
    [self performSegueWithIdentifier:@"segueRaffleSetUpToRaffleDetail" sender:self];
}



@end
