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
    if(_patternNumber == 1) {
        [self pattern1];
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







@end
