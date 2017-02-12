//
//  ViewController.m
//  getImageTest
//
//  Created by Adam Schor on 2/7/17.
//  Copyright © 2017 AandA Development. All rights reserved.
//

#import "ViewController.h"

@interface ViewController ()

@end

@implementation ViewController

- (void)viewDidLoad {
    [super viewDidLoad];
    // Do any additional setup after loading the view, typically from a nib.
    _imageView = [[UIImageView alloc] initWithFrame:CGRectMake(0, 0, 300, 300)];
    [self.view addSubview:_imageView];
    _imageView.layer.borderColor =[[UIColor redColor] CGColor];
}


- (void)didReceiveMemoryWarning {
    [super didReceiveMemoryWarning];
    // Dispose of any resources that can be recreated.
}


- (IBAction)btnGallery:(id)sender {
    ipc = [[UIImagePickerController alloc] init];
    
    ipc.delegate = self;
    ipc.sourceType = UIImagePickerControllerSourceTypePhotoLibrary;
    //ipc.sourceType = UIImagePickerControllerSourceTypeSavedPhotosAlbum;
    
    popover = [[UIPopoverController alloc] initWithContentViewController:ipc];
    
    [popover presentPopoverFromRect:_btnGallery.frame  inView:self.view permittedArrowDirections:UIPopoverArrowDirectionAny animated:YES];
    

}


- (IBAction)btnCamera:(id)sender {
    ipc = [[UIImagePickerController alloc] init];
    ipc.delegate = self;
    ipc.sourceType = UIImagePickerControllerSourceTypeCamera;
    [self presentViewController:ipc animated:YES completion:NULL];
    

}


-(void)imagePickerController:(UIImagePickerController *)picker didFinishPickingMediaWithInfo:(NSDictionary<NSString *,id> *)info{
    [popover dismissPopoverAnimated:YES];
    [picker dismissViewControllerAnimated:YES completion:nil];

 //   _ivPickedImage.image = [info objectForKey:UIImagePickerControllerOriginalImage];
    _imageView.image = [info objectForKey:UIImagePickerControllerOriginalImage];
    [self saveImage];
    
    
}

-(void)imagePickerControllerDidCancel:(UIImagePickerController *)picker {
    [picker dismissViewControllerAnimated:YES completion:nil];
    
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
