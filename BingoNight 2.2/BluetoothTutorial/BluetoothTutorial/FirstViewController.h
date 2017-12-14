//
//  FirstViewController.h
//  BluetoothTutorial
//
//  Created by Adam Schor on 4/11/17.
//  Copyright © 2017 AandA Development. All rights reserved.
//

#import <UIKit/UIKit.h>

@interface FirstViewController : UIViewController <UITextFieldDelegate>


@property (weak, nonatomic) IBOutlet UITextField *txtMessage;
@property (weak, nonatomic) IBOutlet UITextView *tvChat;

- (IBAction)sendMessage:(id)sender;
- (IBAction)cancelMessage:(id)sender;
-(void)sendMyMessage;
-(void)didReceiveDataWithNotification:(NSNotification *)notification;


@end

