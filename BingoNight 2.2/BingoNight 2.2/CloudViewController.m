//
//  CloudViewController.m
//  BingoNight 2.2
//
//  Created by Adam Schor on 3/18/17.
//  Copyright © 2017 AandA Development. All rights reserved.
//

#import "CloudViewController.h"
#import "MKiCloudSync.h"


@interface CloudViewController ()

@end

@implementation CloudViewController

- (void)viewDidLoad {
    [super viewDidLoad];
    // Do any additional setup after loading the view.
}

- (void)didReceiveMemoryWarning {
    [super didReceiveMemoryWarning];
    // Dispose of any resources that can be recreated.
}



- (IBAction)btnCloudLoadPressed:(id)sender {
    [MKiCloudSync updateFromiCloud];

}

- (IBAction)btnCloudSavePressed:(id)sender {
    [MKiCloudSync updateToiCloud];

}
@end
