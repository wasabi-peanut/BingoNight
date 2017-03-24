//
//  InstructionsTableViewController.h
//  BingoNight 2.2
//
//  Created by Adam Schor on 12/5/16.
//  Copyright © 2016 AandA Development. All rights reserved.
//

#import <UIKit/UIKit.h>


@interface InstructionsTableViewController : UITableViewController <UIPopoverPresentationControllerDelegate>

@property NSInteger rowSelected;
@property NSInteger sectionSelected;
@property NSString *topic;

@property (strong,nonatomic) NSMutableArray *arrayOfTopicsIntro;
@property (strong,nonatomic) NSMutableArray *arrayOfTopicsPlay;
@property (strong,nonatomic) NSMutableArray *arrayOfTopicsSetupLocal;
@property (strong,nonatomic) NSMutableArray *arrayOfTopicsSetupGlobal;
@property (strong,nonatomic) NSMutableArray *arrayOfTopicsRestore;

-(void)tableView:(UITableView *)tableView didSelectRowAtIndexPath:(NSIndexPath *)indexPath;
-(void)createArrayOfSections;

@property (strong, nonatomic) IBOutlet UITableView *tableViewInstructions;
@property NSIndexPath *path;
@property UIPopoverPresentationController *popView;

@property (strong,nonatomic) NSMutableArray *arrayOfSections;



@end
