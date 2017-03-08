//
//  RaffleSetUpTableViewController.m
//  BingoNight 2.2
//
//  Created by Adam Schor on 2/2/17.
//  Copyright © 2017 AandA Development. All rights reserved.
//

#import "RaffleSetUpTableViewController.h"
#import "DefaultsDataManager.h"

@interface RaffleSetUpTableViewController ()

@end

@implementation RaffleSetUpTableViewController

- (void)viewDidLoad {
    [super viewDidLoad];
   
    _height = [UIScreen mainScreen].bounds.size.height;
    _width = [UIScreen mainScreen].bounds.size.width;
    
    _keyForArrayRaffleItems = @"keyForArrayRaffleItems";
    _rowHeight = 50;
    _arrayRaffleItems = [[NSMutableArray alloc] initWithArray:[DefaultsDataManager getDataForKey:_keyForArrayRaffleItems]];
    
    if (_arrayRaffleItems.count ==0) {
        
        _arrayRaffleItems = [[NSMutableArray alloc] initWithObjects:@"This is a sample\nReplace with real prizes", nil];
      
    }
    
    
    
    // Uncomment the following line to preserve selection between presentations.
    // self.clearsSelectionOnViewWillAppear = NO;
    
    // Uncomment the following line to display an Edit button in the navigation bar for this view controller.
     self.navigationItem.rightBarButtonItem = self.editButtonItem;
    
   
    
}

- (void)didReceiveMemoryWarning {
    [super didReceiveMemoryWarning];
    // Dispose of any resources that can be recreated.
}



-(void)reloadTable{
    
     [self.tableView reloadData];
    [DefaultsDataManager saveData:_arrayRaffleItems forKey:_keyForArrayRaffleItems];
   
    
}


- (CGFloat)tableView:(UITableView *)tableView heightForRowAtIndexPath:(NSIndexPath *)indexPath{
    return _rowHeight;
}

#pragma mark - Table view data source

- (NSInteger)numberOfSectionsInTableView:(UITableView *)tableView {
    return 1;
}

- (NSInteger)tableView:(UITableView *)tableView numberOfRowsInSection:(NSInteger)section {
    return _arrayRaffleItems.count;
}


- (UITableViewCell *)tableView:(UITableView *)tableView cellForRowAtIndexPath:(NSIndexPath *)indexPath {
    UITableViewCell *cell = [tableView dequeueReusableCellWithIdentifier:@"cell" forIndexPath:indexPath];
    
    
    cell.textLabel.text = [NSString stringWithFormat:@"Item %li:",indexPath.row+1];
    
    cell.detailTextLabel.text = _arrayRaffleItems[indexPath.row];
    
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
          [_arrayRaffleItems removeObjectAtIndex:indexPath.row];
        [tableView deleteRowsAtIndexPaths:@[indexPath] withRowAnimation:UITableViewRowAnimationFade];
         [DefaultsDataManager saveData:_arrayRaffleItems forKey:_keyForArrayRaffleItems];
     
       
    } else if (editingStyle == UITableViewCellEditingStyleInsert) {
        
        
        // Create a new instance of the appropriate class, insert it into the array, and add a new row to the table view
    }

}



// Override to support rearranging the table view.
- (void)tableView:(UITableView *)tableView moveRowAtIndexPath:(NSIndexPath *)fromIndexPath toIndexPath:(NSIndexPath *)toIndexPath {
    
    NSUInteger fromIndex = fromIndexPath.row;
    NSUInteger toIndex = toIndexPath.row;
    
    if (fromIndex != toIndex) {
        NSString *item = [_arrayRaffleItems objectAtIndex:fromIndex];
        [_arrayRaffleItems removeObjectAtIndex:fromIndex];
        [_arrayRaffleItems insertObject:item atIndex:toIndex];
    }
     [DefaultsDataManager saveData:_arrayRaffleItems forKey:_keyForArrayRaffleItems];
     [self.tableView reloadData];
  
}

- (void)setEditing:(BOOL)editing animated:(BOOL)animated {
    
    [_textViewDetail removeFromSuperview];
    [super setEditing:editing animated:animated];
}



// Override to support conditional rearranging of the table view.
- (BOOL)tableView:(UITableView *)tableView canMoveRowAtIndexPath:(NSIndexPath *)indexPath {
    // Return NO if you do not want the item to be re-orderable.
    return YES;
}




-(void)tableView:(UITableView *)tableView didSelectRowAtIndexPath:(NSIndexPath *)indexPath{
    
    _activeRow = indexPath.row;
    _action = @"Change";
    [_textViewDetail removeFromSuperview];
    [self openTableViewWithRow:_activeRow action:_action];
 
  }


- (IBAction)addItemPressed:(id)sender {
   
     _action = @"Add";
    [_arrayRaffleItems addObject:@""];
    _activeRow = _arrayRaffleItems.count-1;
    [self reloadTable];
    [self openTableViewWithRow:_activeRow action:_action];
}

-(void)openTableViewWithRow:(NSInteger) row action:(NSString *) action  {
    
    [self setEditing:NO];
        float currentX = self.tableView.bounds.origin.x;
        float currentY = self.tableView.bounds.origin.y;
        
        _textViewDetail = [[UITextView alloc] initWithFrame:CGRectMake(currentX+_width*.1, currentY+_height*.1, _width*.8, _height*.6)];
        _textViewDetail.layer.borderWidth = 3;
        _textViewDetail.font = [UIFont fontWithName:@"Helvetica" size:72];
        _textViewDetail.adjustsFontForContentSizeCategory = YES;
        _textViewDetail.textColor = [UIColor redColor];
    
        _textViewDetail.delegate = self;
    
        [self.view addSubview:_textViewDetail];
    
    
    if ([action isEqualToString:@"Add"]) {
        _textViewDetail.layer.borderColor = [[UIColor greenColor] CGColor];
        
    
    }
    if ([action isEqualToString:@"Change"]) {
        _textViewDetail.layer.borderColor = [[UIColor redColor] CGColor];
        
    }
    _textViewDetail.text = _arrayRaffleItems[row];
    
}

-(void)textViewDidChange:(UITextView *)textView{
    
        [_arrayRaffleItems replaceObjectAtIndex:_activeRow withObject:_textViewDetail.text];

        [self reloadTable];
    
}

-(void)doneWithTextView{
    [_textViewDetail removeFromSuperview];
    
}

- (IBAction)btnFinishAdd:(id)sender {
    [_textViewDetail removeFromSuperview];
}
@end
