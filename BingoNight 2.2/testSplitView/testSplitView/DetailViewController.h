//
//  DetailViewController.h
//  testSplitView
//
//  Created by Adam Schor on 2/3/17.
//  Copyright © 2017 AandA Development. All rights reserved.
//

#import <UIKit/UIKit.h>

@interface DetailViewController : UIViewController

@property (strong, nonatomic) NSDate *detailItem;
@property (weak, nonatomic) IBOutlet UILabel *detailDescriptionLabel;
- (IBAction)btnTest:(id)sender;

@end

