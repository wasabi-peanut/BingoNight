//
//  ViewController.m
//  resizeUIImageView
//
//  Created by Adam Schor on 2/10/17.
//  Copyright © 2017 AandA Development. All rights reserved.
//

#import "ViewController.h"

@interface ViewController ()

@end

@implementation ViewController

- (void)viewDidLoad {
    [super viewDidLoad];
    // Do any additional setup after loading the view, typically from a nib.
    
    _totalWidth = [UIScreen mainScreen].bounds.size.width;
    _totalHeight = [UIScreen mainScreen].bounds.size.height;
    
    
    _sliderWidth.minimumValue = 0;
    _sliderWidth.maximumValue = _totalWidth;
    
    _sliderHeight.minimumValue = 0;
    _sliderHeight.maximumValue = _totalHeight*.5;
    
    _sliderX.minimumValue = 0;
    _sliderX.maximumValue=_totalWidth;
    
    _sliderY.minimumValue = 0;
    _sliderY.maximumValue = _totalHeight*.5;
    
    
}


- (void)didReceiveMemoryWarning {
    [super didReceiveMemoryWarning];
    // Dispose of any resources that can be recreated.
}


-(void)setFrameOfUIImageView{
    
    if (_sliderX.value>_totalWidth-_sliderWidth.value) {
        _sliderX.value =_totalWidth-_sliderWidth.value;
    }
    
    if (_sliderY.value > _totalHeight*.5 - _sliderHeight.value) {
        _sliderY.value = _totalHeight*.5 - _sliderHeight.value;
    }
    _imageView = [[UIImageView alloc] initWithFrame:CGRectMake(_sliderX.value, _sliderY.value, _sliderWidth.value, _sliderHeight.value)];
    [self.view addSubview:_imageView];
    _imageView.layer.borderWidth = 3;
   
    [self getImageView:self];
    
    _textView = [[UITextView alloc] initWithFrame:CGRectMake(0, 0, _totalWidth, _totalHeight*.5)];
    _textView.layer.borderWidth = 3;
    _textView.layer.borderColor = [[UIColor redColor] CGColor];
    _textView.text = @"Hello World";
    _textView.font = [UIFont fontWithName:@"Helvetica" size:150];
    _textView.textAlignment = NSTextAlignmentCenter;
    
    [self.view addSubview:_textView];
    
    [self.view bringSubviewToFront:_imageView];
    
    
    
}

- (IBAction)sliderWidthChange:(id)sender {
    
    [_imageView removeFromSuperview];
    [_textView removeFromSuperview];
    
    [self setFrameOfUIImageView];
    
}
- (IBAction)btnGetImagePressed:(id)sender {
    
    _ipc = [[UIImagePickerController alloc] init];
    
    _ipc.delegate = self;
    _ipc.sourceType = UIImagePickerControllerSourceTypePhotoLibrary;
    //ipc.sourceType = UIImagePickerControllerSourceTypeSavedPhotosAlbum;
    
    _popover = [[UIPopoverController alloc] initWithContentViewController:_ipc];
    
    [_popover presentPopoverFromRect:_btnGetImage.frame  inView:self.view permittedArrowDirections:UIPopoverArrowDirectionAny animated:YES];
    
}

-(void)imagePickerController:(UIImagePickerController *)picker didFinishPickingMediaWithInfo:(NSDictionary<NSString *,id> *)info {
    [_popover dismissPopoverAnimated:YES];
    [picker dismissViewControllerAnimated:YES completion:nil];
    
    _imageView.image = [info objectForKey:UIImagePickerControllerOriginalImage];
    [self saveImage];
    
    
    
}

-(void)saveImage{
    NSData *data;
    data = UIImagePNGRepresentation(_imageView.image);
    
    NSUserDefaults *defaults = [NSUserDefaults standardUserDefaults];
    [defaults setObject:data forKey:@"someKey"];
    [defaults synchronize];
    
    
}

-(IBAction)getImageView:(id)sender {
    NSUserDefaults *defaults = [NSUserDefaults standardUserDefaults];
    _imageView.image = [UIImage imageWithData:[defaults objectForKey:@"someKey"]];
    
}


@end
