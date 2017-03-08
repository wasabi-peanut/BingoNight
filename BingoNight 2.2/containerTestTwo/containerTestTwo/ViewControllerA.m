//
//  ViewControllerA.m
//  containerTestTwo
//
//  Created by Adam Schor on 3/6/17.
//  Copyright © 2017 AandA Development. All rights reserved.
//

#import "ViewControllerA.h"

@interface ViewControllerA ()

@end

@implementation ViewControllerA

- (void)viewDidLoad {
    [super viewDidLoad];
    
    
    
    
    // Do any additional setup after loading the view.
}

- (void)didReceiveMemoryWarning {
    [super didReceiveMemoryWarning];
    // Dispose of any resources that can be recreated.
}

/*
#pragma mark - Navigation

// In a storyboard-based application, you will often want to do a little preparation before navigation
- (void)prepareForSegue:(UIStoryboardSegue *)segue sender:(id)sender {
    // Get the new view controller using [segue destinationViewController].
    // Pass the selected object to the new view controller.
}
*/

- (IBAction)btnSendPressed:(id)sender {
   /* ViewController *viewControllerParent = [[ViewController alloc] initWithNibName:@"ViewController" bundle:nil];
    viewControllerParent.labelSentMsg.text = @"Hello, it worked";*/
    [self performSegueWithIdentifier:@"segueToParent" sender:self];
   

}

-(void)prepareForSegue:(UIStoryboardSegue *)segue sender:(id)sender {
    if ([segue.identifier isEqualToString:@"segueToParent"]) {
        ViewController *controller = [segue destinationViewController];
        controller.incomingMessage = @"Yes, it worked";
        
    }
    
    
}

@end
