//
//  ViewController.h
//  resizeUIImageView
//
//  Created by Adam Schor on 2/10/17.
//  Copyright © 2017 AandA Development. All rights reserved.
//

#import <UIKit/UIKit.h>

@interface ViewController : UIViewController <UIImagePickerControllerDelegate, UINavigationControllerDelegate, UIPopoverPresentationControllerDelegate>

@property UIImagePickerController *ipc;

@property (weak, nonatomic) IBOutlet UISlider *sliderHeight;

@property (weak, nonatomic) IBOutlet UISlider *sliderWidth;
@property (weak, nonatomic) IBOutlet UISlider *sliderY;

@property (weak, nonatomic) IBOutlet UISlider *sliderX;
@property float totalWidth;
@property float totalHeight;
@property float frameWidth;
@property float frameHeight;
- (IBAction)sliderWidthChange:(id)sender;

@property UIImageView *imageView;
@property UITextView *textView;
@property (weak, nonatomic) IBOutlet UIButton *btnGetImage;
- (IBAction)btnGetImagePressed:(id)sender;

@property UIPopoverController *popover;

@end

