//
//  checkingPatterns.m
//  BingoNight 2.2
//
//  Created by Adam Schor on 12/26/16.
//  Copyright © 2016 AandA Development. All rights reserved.
//

#import "checkingPatterns.h"

@implementation checkingPatterns : UIView

-(id) initWithFrame:(CGRect)frame {
    self = [super initWithFrame:frame];
    return self;
}

+(checkingPatterns *) frameWithPattern:(NSInteger) patternSelected frameX:(CGFloat) x frameY: (CGFloat) y width: (CGFloat) w height: (CGFloat) h {
    
    checkingPatterns *frame = [[checkingPatterns alloc] initWithFrame:CGRectMake(x, y, w, h)];
    frame.patternNumber = patternSelected;
    frame.w = w;
    frame.h = h;
    
    return frame;

}

-(void)runAnimation {
    switch (_patternNumber) {
        case 1:
            [self pattern1];
            break;
        case 2:
            [self pattern2];
            break;
            
        default:
            break;
    }
    
}



-(void) pattern1 {
    
    self.layer.borderColor = [[UIColor blueColor] CGColor];
    self.layer.borderWidth = 2;
    self.backgroundColor = [UIColor cyanColor];
    CGFloat sizeOfDisc = .2*_w;
    
    
    
    UIView *checkingTopView = [[UIView alloc] initWithFrame:CGRectMake(_w/2-sizeOfDisc/2,10, sizeOfDisc, sizeOfDisc)];
    checkingTopView.layer.cornerRadius = sizeOfDisc/2;
    checkingTopView.clipsToBounds = YES;
    
    
    checkingTopView.layer.borderColor = [[UIColor lightGrayColor] CGColor];
    checkingTopView.layer.borderWidth = 2;
    
    
    UIView *checkingBottomView = [[UIView alloc] initWithFrame:CGRectMake(_w/2-sizeOfDisc/2,_h-10-sizeOfDisc, sizeOfDisc, sizeOfDisc)];
    
    checkingBottomView.layer.cornerRadius = sizeOfDisc/2;
    checkingBottomView.clipsToBounds = YES;
    
    checkingBottomView.layer.borderColor = [[UIColor lightGrayColor] CGColor];
    checkingBottomView.layer.borderWidth = 2;
    
    [self addSubview:checkingTopView];
    [self addSubview:checkingBottomView];
    
    
    UILabel *labelBackground = [[UILabel alloc] initWithFrame:CGRectMake(0, 0, _w, _h)];
    labelBackground.text = @"Hold Cards";
    labelBackground.font = [UIFont fontWithName:@"Helvetica" size:.1*_w];
    labelBackground.numberOfLines = 0;
    labelBackground.textColor = [UIColor yellowColor];
    labelBackground.textAlignment = NSTextAlignmentCenter;
    
    
    
    
    [self addSubview: labelBackground];
    
    
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
    
    colorAnimation.duration = 1.0;
    colorAnimation.fromValue = (id)fromColor.CGColor;
    colorAnimation.toValue = (id)toColor.CGColor;
    colorAnimation.repeatCount = HUGE_VALF;
    colorAnimation.autoreverses = YES;
    
    
    CABasicAnimation *colorAnimation2 = [CABasicAnimation animationWithKeyPath:@"backgroundColor"];
    UIColor *fromColor2 = [UIColor greenColor];
    UIColor *toColor2 = [UIColor redColor];
    
    colorAnimation2.duration = 1.0;
    colorAnimation2.fromValue = (id)fromColor2.CGColor;
    colorAnimation2.toValue = (id)toColor2.CGColor;
    colorAnimation2.repeatCount = HUGE_VALF;
    colorAnimation2.autoreverses = YES;
    
    
    [checkingTopView.layer addAnimation:spinning forKey:nil];
    [checkingTopView.layer addAnimation:colorAnimation forKey:nil];
    
    [checkingBottomView.layer addAnimation:spinning forKey:nil];
    [checkingBottomView.layer addAnimation:colorAnimation2 forKey:nil];
}



-(void)pattern2 {
    
    self.layer.borderColor = [[UIColor blueColor] CGColor];
    self.layer.borderWidth = 2;
    self.backgroundColor = [UIColor yellowColor];
    
    
    CABasicAnimation *shake = [CABasicAnimation animationWithKeyPath:@"transform.translation.y"];
    
    shake.toValue = [NSNumber numberWithFloat:10];
    shake.autoreverses = YES;
    shake.duration = 0.1;
    shake.repeatCount = HUGE_VALF;
    
    
    for (int c= 0; c<9; c++) {
        
        UILabel *letter = [[UILabel alloc]init];
        letter.font = [UIFont fontWithName:@"Courier" size:_h*.2];
        letter.textAlignment = NSTextAlignmentCenter;
        float letterWidth = _w/10;
        if (c%2) {
            letter.frame = CGRectMake(letterWidth*c, _h/2, _w/5, _w/5);
        }
        else{
            letter.frame = CGRectMake(letterWidth*c, _h/2+50, _w/5, _w/5);
            
        }
        
        letter.layer.cornerRadius = _w/5/2;
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
                letter.font = [UIFont fontWithName:@"Courier" size:_h*.2];
                letter.frame = CGRectMake(25, 25, _w*.9 ,_h/2);
                letter.textAlignment = NSTextAlignmentCenter;
                letter.numberOfLines = 0;
                
                
                
                break;
                
            default:
                break;
        }
        
        
        
        [self addSubview:letter];
        
        [letter.layer addAnimation:shake forKey:nil];
        [self sendSubviewToBack:letter];
        
        
        
        
    }
    

}



@end
