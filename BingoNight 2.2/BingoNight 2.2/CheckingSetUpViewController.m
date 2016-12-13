//
//  CheckingSetUpViewController.m
//  BingoNight 2.2
//
//  Created by Schor on 12/11/16.
//  Copyright © 2016 AandA Development. All rights reserved.
//

#import "CheckingSetUpViewController.h"

@interface CheckingSetUpViewController ()

@end

@implementation CheckingSetUpViewController

- (void)viewDidLoad {
    
    [self showPreview2];
    
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



-(void)showPreview1 {
    
    
    
    float height = _viewPreviewWindow.bounds.size.height;
    float width = _viewPreviewWindow.bounds.size.width;
    
    _viewPreviewWindow.layer.borderWidth = 3;
    _viewPreviewWindow.layer.borderColor = [[UIColor blueColor] CGColor];
    _viewPreviewWindow.backgroundColor = [UIColor blueColor];
    
    
    UIView *checkingTopView = [[UIView alloc] initWithFrame:CGRectMake(100, 50, 100, 100)];
    checkingTopView.layer.cornerRadius = 50;
    checkingTopView.clipsToBounds = YES;
    
    
    checkingTopView.layer.borderColor = [[UIColor lightGrayColor] CGColor];
    checkingTopView.layer.borderWidth = 2;
    
    
    UIView *checkingBottomView = [[UIView alloc] initWithFrame:CGRectMake(width - 100, height-100, 100, 100)];
    
    checkingBottomView.layer.cornerRadius = 50;
    checkingBottomView.clipsToBounds = YES;
    
    
    checkingBottomView.layer.borderColor = [[UIColor lightGrayColor] CGColor];
    checkingBottomView.layer.borderWidth = 2;
    
    [_viewPreviewWindow addSubview:checkingTopView];
    [_viewPreviewWindow addSubview:checkingBottomView];
    
    
    UILabel *labelBackground = [[UILabel alloc] initWithFrame:CGRectMake(75, 0, width-75, height)];
    labelBackground.text = @"Hold Cards";
    labelBackground.font = [UIFont fontWithName:@"Helvetica" size:75];
    labelBackground.numberOfLines = 0;
    labelBackground.textColor = [UIColor yellowColor];
    labelBackground.textAlignment = NSTextAlignmentCenter;
    
    
    
    
    [_viewPreviewWindow addSubview: labelBackground];
    
    
    CABasicAnimation *spinning = [CABasicAnimation animationWithKeyPath:@"transform.rotation.y"];
    //for backward text
    spinning.toValue = [NSNumber numberWithFloat:2*M_PI];
    //only forward text
    //spinning.toValue = [NSNumber numberWithFloat:.5*M_PI];
    
    spinning.autoreverses = YES;
    spinning.duration = 2;
    spinning.repeatCount = HUGE_VALF;
    
    CABasicAnimation *colorAnimation = [CABasicAnimation animationWithKeyPath:@"backgroundColor"];
    UIColor *fromColor = [UIColor redColor];
    UIColor *toColor = [UIColor greenColor];
    
    colorAnimation.duration = 2.0;
    colorAnimation.fromValue = (id)fromColor.CGColor;
    colorAnimation.toValue = (id)toColor.CGColor;
    colorAnimation.repeatCount = HUGE_VALF;
    colorAnimation.autoreverses = YES;
    
    
    CABasicAnimation *colorAnimation2 = [CABasicAnimation animationWithKeyPath:@"backgroundColor"];
    UIColor *fromColor2 = [UIColor greenColor];
    UIColor *toColor2 = [UIColor redColor];
    
    colorAnimation2.duration = 2.0;
    colorAnimation2.fromValue = (id)fromColor2.CGColor;
    colorAnimation2.toValue = (id)toColor2.CGColor;
    colorAnimation2.repeatCount = HUGE_VALF;
    colorAnimation2.autoreverses = YES;
    
    
    [checkingTopView.layer addAnimation:spinning forKey:nil];
    [checkingTopView.layer addAnimation:colorAnimation forKey:nil];
    
    [checkingBottomView.layer addAnimation:spinning forKey:nil];
    [checkingBottomView.layer addAnimation:colorAnimation2 forKey:nil];
}

-(void)showPreview2{
    
    float height = _viewPreviewWindow.bounds.size.height;
    float width = _viewPreviewWindow.bounds.size.width;
    
    _viewPreviewWindow.layer.borderWidth = 3;
    _viewPreviewWindow.layer.borderColor = [[UIColor blueColor] CGColor];
    _viewPreviewWindow.backgroundColor = [UIColor blueColor];

    CABasicAnimation *shake = [CABasicAnimation animationWithKeyPath:@"transform.translation.y"];
    
    shake.toValue = [NSNumber numberWithFloat:10];
    shake.autoreverses = YES;
    shake.duration = 0.1;
    shake.repeatCount = HUGE_VALF;
    
    
    for (int c= 0; c<9; c++) {
        
        UILabel *letter = [[UILabel alloc]init];
        letter.font = [UIFont fontWithName:@"Courier" size:25];
        letter.textAlignment = NSTextAlignmentCenter;
        float letterWidth = width/10;
        if (c%2) {
            letter.frame = CGRectMake(letterWidth+letterWidth*c, height/2, 50, 50);
        }
        else{
            letter.frame = CGRectMake(letterWidth+letterWidth*c, height/2+50/4, 50, 50);
            
        }
        
        letter.layer.cornerRadius = 100/4;
        letter.clipsToBounds = YES;
        
        switch (c) {
            case 0:
                letter.text = @"C";
                letter.backgroundColor = [UIColor whiteColor];
                break;
            case 1:
                letter.text = @"H";
                letter.backgroundColor = [UIColor redColor];
                break;
            case 2:
                letter.text = @"E";
                letter.backgroundColor = [UIColor greenColor];
                break;
            case 3:
                letter.text = @"C";
                letter.backgroundColor = [UIColor orangeColor];
                break;
            case 4:
                letter.text = @"K";
                letter.backgroundColor = [UIColor magentaColor];
                break;
            case 5:
                letter.text = @"I";
                letter.backgroundColor = [UIColor cyanColor];
                break;
            case 6:
                letter.text = @"N";
                letter.backgroundColor = [UIColor brownColor];
                break;
            case 7:
                letter.text = @"G";
                letter.backgroundColor = [UIColor lightGrayColor];
                break;
            case 8:
                letter.text = @"HOLD CARDS";
                letter.backgroundColor = [UIColor grayColor];
                letter.textColor = [UIColor redColor];
                letter.font = [UIFont fontWithName:@"Courier" size:90];
                letter.frame = CGRectMake(width/2-350, 75, 700, 200);
                letter.textAlignment = NSTextAlignmentCenter;
                letter.numberOfLines = 0;
                
                
                
                break;
                
            default:
                break;
        }
        
        
        
        [_viewPreviewWindow addSubview:letter];
        
        [letter.layer addAnimation:shake forKey:nil];
        [_viewPreviewWindow sendSubviewToBack:letter];
        
        
        
        
    }

}
- (IBAction)switchButton:(id)sender {
    
    [_viewPreviewWindow removeFromSuperview];
    
  
}
@end
