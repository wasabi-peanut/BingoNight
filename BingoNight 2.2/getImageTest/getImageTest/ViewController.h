//
//  ViewController.h
//  getImageTest
//
//  Created by Adam Schor on 2/7/17.
//  Copyright © 2017 AandA Development. All rights reserved.
//

#import <UIKit/UIKit.h>

@interface ViewController : UIViewController <UIImagePickerControllerDelegate, UINavigationControllerDelegate, UIPopoverPresentationControllerDelegate>


{
    UIImagePickerController *ipc;
   // UIPopoverPresentationController *popover;
    UIPopoverController *popover;
}
- (IBAction)btnGallery:(id)sender;
- (IBAction)btnCamera:(id)sender;

@property UIImageView *imageView;


@property (weak, nonatomic) IBOutlet UIButton *btnGallery;
@property (weak, nonatomic) IBOutlet UIButton *btnCamera;
@property (weak, nonatomic) IBOutlet UIImageView *ivPickedImage;

@end

