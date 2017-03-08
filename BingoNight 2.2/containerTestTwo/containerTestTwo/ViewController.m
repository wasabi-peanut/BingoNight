//
//  ViewController.m
//  containerTestTwo
//
//  Created by Adam Schor on 3/6/17.
//  Copyright © 2017 AandA Development. All rights reserved.
//

#import "ViewController.h"

@interface ViewController ()

@end

@implementation ViewController

- (void)viewDidLoad {
    [super viewDidLoad];
    // Do any additional setup after loading the view, typically from a nib.
    
    _labelSentMsg.text = _incomingMessage;
    
    
}


- (void)didReceiveMemoryWarning {
    [super didReceiveMemoryWarning];
    // Dispose of any resources that can be recreated.
}


@end
