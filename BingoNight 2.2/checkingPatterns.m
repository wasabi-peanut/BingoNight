//
//  checkingPatterns.m
//  BingoNight 2.2
//
//  Created by Adam Schor on 12/26/16.
//  Copyright © 2016 AandA Development. All rights reserved.
//

#import "checkingPatterns.h"

@interface checkingPatterns()  <UICollisionBehaviorDelegate>


@end


@implementation checkingPatterns : UIView

-(id) initWithFrame:(CGRect)frame {
    self = [super initWithFrame:frame];
    return self;
}

+(checkingPatterns *)  frameX:(CGFloat) x frameY: (CGFloat) y width: (CGFloat) w height: (CGFloat) h {
    
    checkingPatterns *frame = [[checkingPatterns alloc] initWithFrame:CGRectMake(x, y, w, h)];
    
    frame.height = h;
    frame.width = w;
    
    
    
    
    
    return frame;

}

-(void)runAnimationWithPatternSelected:(NSInteger)patternSelected{
    switch (patternSelected) {
        case 0:
            [self pattern0];
            break;
        case 1:
            [self pattern1];
            break;
        case 2:
            [self pattern2];
            break;
        case 3:
            [self pattern3];
            break;
        case 4:
            [self pattern4];
            break;
        case 5:
            [self pattern5];
            break;
        case 6:
            [self pattern6];
            break;
        case 7:
            [self patternWithImage:@"fractal" frames:12 duration:0.5 widthMultiplier:1 heightMultiplier:1 xPosition:75 yPosition:0 ];
            break;
        case 8:
            [self patternWithImage:@"bird" frames:27 duration:1.0 widthMultiplier:.2 heightMultiplier:.2 xPosition:_width/2 yPosition:_height/2];
            break;
        case 9:
            [self patternWithImage:@"handClap" frames:8 duration:0.5 widthMultiplier:.4  heightMultiplier: 0.4  xPosition:_width*.3 yPosition:_height*.3];
            break;
        case 10:
            [self babyDance];
            break;
        case 11:
            [self ballDrop];
            break;
        
        default:
            break;
    }
}



#pragma mark PATTERNS START HERE


-(void) pattern0 {
    
    self.layer.borderColor = [[UIColor blueColor] CGColor];
    self.layer.borderWidth = 2;
    self.backgroundColor = [UIColor cyanColor];
    CGFloat sizeOfDisc = .1*_width;
    
    
    
    UIView *checkingTopView = [[UIView alloc] initWithFrame:CGRectMake(_width/2-sizeOfDisc/2,10, sizeOfDisc, sizeOfDisc)];
    checkingTopView.layer.cornerRadius = sizeOfDisc/2;
    checkingTopView.clipsToBounds = YES;
    
    
    checkingTopView.layer.borderColor = [[UIColor lightGrayColor] CGColor];
    checkingTopView.layer.borderWidth = 2;
    
    
    UIView *checkingBottomView = [[UIView alloc] initWithFrame:CGRectMake(_width/2-sizeOfDisc/2,_height-10-sizeOfDisc, sizeOfDisc, sizeOfDisc)];
    
    checkingBottomView.layer.cornerRadius = sizeOfDisc/2;
    checkingBottomView.clipsToBounds = YES;
    
    checkingBottomView.layer.borderColor = [[UIColor lightGrayColor] CGColor];
    checkingBottomView.layer.borderWidth = 2;
    
    [self addSubview:checkingTopView];
    [self addSubview:checkingBottomView];
    
    
    UILabel *labelBackground = [[UILabel alloc] initWithFrame:CGRectMake(0, 0, _width, _height)];
    labelBackground.text = @"Hold Cards";
    labelBackground.font = [UIFont fontWithName:@"Helvetica" size:.1*_width];
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



-(void)pattern1 {
    
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
        letter.font = [UIFont fontWithName:@"Courier" size:_height*.2];
        letter.textAlignment = NSTextAlignmentCenter;
        float letterWidth = _width/10;
        if (c%2) {
            letter.frame = CGRectMake(letterWidth*c, _height/2, _width/5, _width/5);
        }
        else{
            letter.frame = CGRectMake(letterWidth*c, _height/2+50, _width/5, _width/5);
            
        }
        
        letter.layer.cornerRadius = _width/5/2;
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
                letter.font = [UIFont fontWithName:@"Courier" size:_height*.2];
                letter.frame = CGRectMake(25, 25, _width*.9 ,_height/2);
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

-(void)pattern2 {
    
    CABasicAnimation *moveUpAndDown = [CABasicAnimation animationWithKeyPath:@"transform.translation.y" ];
    [moveUpAndDown setFromValue:[NSNumber numberWithFloat:0]];
    [moveUpAndDown setByValue:[NSNumber numberWithFloat:_height-350]];
    [moveUpAndDown setBeginTime:CACurrentMediaTime() ];
    [moveUpAndDown setDuration:2];
    moveUpAndDown.removedOnCompletion = NO;
    moveUpAndDown.autoreverses = YES;
    moveUpAndDown.fillMode = kCAFillModeForwards;
    moveUpAndDown.repeatCount =HUGE_VALF;
    
    UILabel *labelBackground = [[UILabel alloc] initWithFrame:CGRectMake(75, 0, _width-75, _height)];
    labelBackground.text = @"Hold Cards";
    labelBackground.font = [UIFont fontWithName:@"Helvetica" size:300];
    labelBackground.numberOfLines = 0;
    labelBackground.textColor = [UIColor yellowColor];
    labelBackground.textAlignment = NSTextAlignmentCenter;
    
    float letterWidth = _width/10;
    
    
    [self addSubview: labelBackground];
    
    
    
    for (int c= 0; c<8; c++) {
        
        UILabel *letter = [[UILabel alloc]init];
        letter.font = [UIFont fontWithName:@"Courier" size:100];
        letter.textAlignment = NSTextAlignmentCenter;
        if (c%2) {
            letter.frame = CGRectMake(letterWidth+letterWidth*c, 150, 200, 200);
        }
        else{
            letter.frame = CGRectMake(letterWidth+letterWidth*c, 50, 200, 200);
            
        }
        
        letter.layer.cornerRadius = 100;
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
                
            default:
                break;
        }
        
        
        
        [self addSubview:letter];
        
        [letter.layer addAnimation:moveUpAndDown forKey:nil];
        
        
        }
    
}

-(void)pattern3{
    UILabel *labelBackground = [[UILabel alloc] initWithFrame:CGRectMake(75, 0, _width-75, _height)];
    labelBackground.text = @"Hold Cards";
    labelBackground.font = [UIFont fontWithName:@"Helvetica" size:300];
    labelBackground.numberOfLines = 0;
    labelBackground.textColor = [UIColor yellowColor];
    labelBackground.textAlignment = NSTextAlignmentCenter;
    
    
    
    
    [self addSubview: labelBackground];
    
    CABasicAnimation *moveDown = [CABasicAnimation animationWithKeyPath:@"transform.translation.y" ];
    [moveDown setFromValue:[NSNumber numberWithFloat:0]];
    [moveDown setByValue:[NSNumber numberWithFloat:_height-200]];
    [moveDown setBeginTime:CACurrentMediaTime()];
    [moveDown setDuration:2];
    moveDown.removedOnCompletion = NO;
    moveDown.autoreverses = YES;
    moveDown.fillMode = kCAFillModeForwards;
    moveDown.repeatCount =HUGE_VALF;
    
    float letterWidth = _width/10;
    
    for (int c= 0; c<8; c++) {
        
        UILabel *letter = [[UILabel alloc]init];
        letter.font = [UIFont fontWithName:@"Courier" size:100];
        letter.textAlignment = NSTextAlignmentCenter;
        letter.frame = CGRectMake(letterWidth+letterWidth*c,0, 200, 200);
        letter.layer.cornerRadius = 100;
        letter.clipsToBounds = YES;
        
        switch (c) {
            case 0:
                letter.text = @"C";
                letter.backgroundColor = [UIColor whiteColor];
                [moveDown setBeginTime:CACurrentMediaTime()+c];
                [letter.layer addAnimation:moveDown forKey:nil];
                
                break;
            case 1:
                letter.text = @"H";
                letter.backgroundColor = [UIColor redColor];
                [moveDown setBeginTime:CACurrentMediaTime()+c];
                [letter.layer addAnimation:moveDown forKey:nil];
                break;
            case 2:
                letter.text = @"E";
                letter.backgroundColor = [UIColor greenColor];
                [moveDown setBeginTime:CACurrentMediaTime()+c];
                [letter.layer addAnimation:moveDown forKey:nil];
                
                break;
            case 3:
                letter.text = @"C";
                letter.backgroundColor = [UIColor orangeColor];
                [moveDown setBeginTime:CACurrentMediaTime()+c];
                [letter.layer addAnimation:moveDown forKey:nil];
                
                break;
            case 4:
                letter.text = @"K";
                letter.backgroundColor = [UIColor magentaColor];
                [moveDown setBeginTime:CACurrentMediaTime()+c];
                [letter.layer addAnimation:moveDown forKey:nil];
                
                break;
            case 5:
                letter.text = @"I";
                letter.backgroundColor = [UIColor cyanColor];
                [moveDown setBeginTime:CACurrentMediaTime()+c];
                [letter.layer addAnimation:moveDown forKey:nil];
                
                break;
            case 6:
                letter.text = @"N";
                letter.backgroundColor = [UIColor brownColor];
                [moveDown setBeginTime:CACurrentMediaTime()+c];
                [letter.layer addAnimation:moveDown forKey:nil];
                
                
                break;
            case 7:
                letter.text = @"G";
                letter.backgroundColor = [UIColor lightGrayColor];
                [moveDown setBeginTime:CACurrentMediaTime()+c];
                [letter.layer addAnimation:moveDown forKey:nil];
                
                break;
                
            default:
                break;
        }
        
        [self addSubview:letter];
        
        
    }
    
}

-(void)pattern4 {
    UILabel *labelBackground = [[UILabel alloc] initWithFrame:CGRectMake(75, 0, _width-75, _height)];
    labelBackground.text = @"Hold Cards";
    labelBackground.font = [UIFont fontWithName:@"Helvetica" size:300];
    labelBackground.numberOfLines = 0;
    labelBackground.textColor = [UIColor redColor];
    labelBackground.textAlignment = NSTextAlignmentCenter;
    
    [self addSubview: labelBackground];
    
    CABasicAnimation *colorAnimation = [CABasicAnimation animationWithKeyPath:@"backgroundColor"];
    UIColor *fromColor = [UIColor whiteColor];
    UIColor *toColor = [UIColor blackColor];
    
    colorAnimation.duration = 3;
    colorAnimation.fromValue = (id)fromColor.CGColor;
    colorAnimation.toValue = (id)toColor.CGColor;
    colorAnimation.repeatCount = HUGE_VALF;
    colorAnimation.autoreverses = YES;
    
    [self.layer addAnimation:colorAnimation forKey:nil];
    
    }

-(void)pattern5 {
    UILabel *checkingTopLabel = [[UILabel alloc] initWithFrame:CGRectMake(100, 0, _width-100, _height/2)];
    checkingTopLabel.text = @"Checking";
    checkingTopLabel.font = [UIFont fontWithName:@"Courier" size:100];
    // spinLabel.backgroundColor = [UIColor yellowColor];
    checkingTopLabel.textAlignment = NSTextAlignmentCenter;
    checkingTopLabel.layer.cornerRadius = 25;
    checkingTopLabel.clipsToBounds = YES;
    
    
    checkingTopLabel.layer.borderColor = [[UIColor lightGrayColor] CGColor];
    checkingTopLabel.layer.borderWidth = 2;
    
    
    UILabel *checkingBottomLabel = [[UILabel alloc] initWithFrame:CGRectMake(100, _height/2, _width-100, _height/2)];
    checkingBottomLabel.text = @"Hold Your Cards";
    checkingBottomLabel.font = [UIFont fontWithName:@"Courier" size:100];
    // spinLabel.backgroundColor = [UIColor yellowColor];
    checkingBottomLabel.textAlignment = NSTextAlignmentCenter;
    checkingBottomLabel.layer.cornerRadius = 25;
    checkingBottomLabel.clipsToBounds = YES;
    
    
    checkingBottomLabel.layer.borderColor = [[UIColor lightGrayColor] CGColor];
    checkingBottomLabel.layer.borderWidth = 2;
    
    [self addSubview:checkingTopLabel];
    [self addSubview:checkingBottomLabel];
    
    
    UILabel *labelBackground = [[UILabel alloc] initWithFrame:CGRectMake(75, 0, _width-75, _height)];
    // labelBackground.text = @"Hold Cards";
    labelBackground.font = [UIFont fontWithName:@"Helvetica" size:300];
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
    spinning.duration = 4;
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
    
    
    [checkingTopLabel.layer addAnimation:spinning forKey:nil];
    [checkingTopLabel.layer addAnimation:colorAnimation forKey:nil];
    
    [checkingBottomLabel.layer addAnimation:spinning forKey:nil];
    [checkingBottomLabel.layer addAnimation:colorAnimation2 forKey:nil];
    
    

}

-(void)pattern6 {
    UILabel *checkingTopLabel = [[UILabel alloc] initWithFrame:CGRectMake(100, 0, _width-100, _height/2)];
    checkingTopLabel.text = @"Checking";
    checkingTopLabel.font = [UIFont fontWithName:@"Courier" size:100];
    
    checkingTopLabel.textAlignment = NSTextAlignmentCenter;
    checkingTopLabel.layer.cornerRadius = 25;
    checkingTopLabel.clipsToBounds = YES;
    
    
    checkingTopLabel.layer.borderColor = [[UIColor lightGrayColor] CGColor];
    checkingTopLabel.layer.borderWidth = 2;
    
    
    UILabel *checkingBottomLabel = [[UILabel alloc] initWithFrame:CGRectMake(100, _height/2, _width-100, _height/2)];
    checkingBottomLabel.text = @"Hold Your Cards";
    checkingBottomLabel.font = [UIFont fontWithName:@"Courier" size:100];
    
    checkingBottomLabel.textAlignment = NSTextAlignmentCenter;
    checkingBottomLabel.layer.cornerRadius = 25;
    checkingBottomLabel.clipsToBounds = YES;
    
    
    checkingBottomLabel.layer.borderColor = [[UIColor lightGrayColor] CGColor];
    checkingBottomLabel.layer.borderWidth = 2;
    
    [self addSubview:checkingTopLabel];
    [self addSubview:checkingBottomLabel];
    
    
    UILabel *labelBackground = [[UILabel alloc] initWithFrame:CGRectMake(75, 0, _width-75, _height)];
    
    labelBackground.font = [UIFont fontWithName:@"Helvetica" size:300];
    labelBackground.numberOfLines = 0;
    labelBackground.textColor = [UIColor yellowColor];
    labelBackground.textAlignment = NSTextAlignmentCenter;
    
    
    
    
    [self addSubview: labelBackground];
    
    
    CABasicAnimation *spinning = [CABasicAnimation animationWithKeyPath:@"transform.rotation.x"];
    //for backward text
    spinning.toValue = [NSNumber numberWithFloat:2*M_PI];
    //only forward text
    //spinning.toValue = [NSNumber numberWithFloat:.5*M_PI];
    
    spinning.autoreverses = YES;
    spinning.duration = 4;
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
    
    
    [checkingTopLabel.layer addAnimation:spinning forKey:nil];
    [checkingTopLabel.layer addAnimation:colorAnimation forKey:nil];
    
    [checkingBottomLabel.layer addAnimation:spinning forKey:nil];
    [checkingBottomLabel.layer addAnimation:colorAnimation2 forKey:nil];
    
}

-(void)patternWithImage: (NSString *)imageID frames:(NSInteger)frames duration:(NSInteger)duration widthMultiplier:(float)widthMult heightMultiplier: (float)heightMult xPosition: (float)xPos yPosition: (float)yPos{
    
  
    NSString *imageName;
    NSMutableArray *arrayImages = [[NSMutableArray alloc] init];
    
    for (int x=1; x<frames; x++) {
        imageName = [NSString stringWithFormat:@"%@%i.png",imageID,x];
        [arrayImages addObject: [UIImage imageNamed:imageName]];
        
    }
   
    
    UIImageView *animationView = [[UIImageView alloc] initWithFrame:CGRectMake(xPos,yPos, _width*widthMult, _height*heightMult)];
    animationView.animationImages = arrayImages;
    animationView.animationDuration = duration;
    [self addSubview:animationView];
    [animationView startAnimating];
     
     }


-(void)pattern8 {
    
    
    
    
    
}

-(void)babyDance {
    
    UIGraphicsBeginImageContext(self.frame.size);
    [[UIImage imageNamed:@"stageBaby.png"] drawInRect:self.bounds];
    UIImage *image = UIGraphicsGetImageFromCurrentImageContext();
    UIGraphicsEndImageContext();
    
    self.backgroundColor = [UIColor colorWithPatternImage:image];
    
    
   // [self playMusic:self];
    
    
    _baby1Images = [NSMutableArray array];
    
    
    for (int i= 1; i<15; i++) {
        NSString *objectName = [NSString stringWithFormat:@"baby%d",i];
        [_baby1Images addObject:[UIImage imageWithContentsOfFile:[[NSBundle mainBundle] pathForResource:objectName ofType:@"png"]]];
        
        //Using imageWithContentsOfFile instead of imageNamed to allow memory usage to clear
        
    }
    
    _baby1Frame = [[UIImageView alloc] initWithFrame:CGRectMake(150, 500, 100, 100)];
    _baby2Frame = [[UIImageView alloc] initWithFrame:CGRectMake(450, 500, 100, 100)];
    _baby3Frame = [[UIImageView alloc] initWithFrame:CGRectMake(750, 500, 100, 100)];
    
    _baby1Frame.image = [UIImage imageNamed:@"baby7"];//seven works
    _baby3Frame.image = [UIImage imageNamed:@"baby7"];
    
    [self addSubview:_baby1Frame];
    [self addSubview:_baby2Frame];
    [self addSubview:_baby3Frame];
    
    
    //   _baby1Frame.animationImages = _baby1Images;
    //   _baby1Frame.animationDuration= 2;
    //  [_baby1Frame startAnimating];
    
    _baby2Frame.animationImages = _baby1Images;
    _baby2Frame.animationDuration= 2;
    [_baby2Frame startAnimating];
    
    //   _baby3Frame.animationImages = _baby1Images;
    //   _baby3Frame.animationDuration= 2;
    // [_baby3Frame startAnimating];
    
    [UIView animateWithDuration:1 animations:^{
        
        _baby2Frame.alpha = 0.95;
    } completion:^(BOOL finished) {
        _baby2Frame.alpha = 1;
        _baby1Frame.animationImages = _baby1Images;
        _baby1Frame.animationDuration= 2;
        [_baby1Frame startAnimating];
        _baby3Frame.animationImages = _baby1Images;
        _baby3Frame.animationDuration= 2;
        [_baby3Frame startAnimating];
    }];
    
    
    [self Baby1];
}

-(void)Baby1{
    
    [UIView animateWithDuration:5 animations:^{
        
        _baby1Frame.frame = CGRectMake(150, 500, 100, 100);
        _baby2Frame.frame = CGRectMake(450, 550, 200, 200);
        _baby3Frame.frame = CGRectMake(750, 500, 100, 100);
        
    } completion:^(BOOL finished) {
        
        [self Baby2];
    }];
    
}

-(void)Baby2 {
    
    
    [UIView animateWithDuration:5 animations:^{
        
        _baby1Frame.frame = CGRectMake(150, 550, 200, 200);
        _baby2Frame.frame = CGRectMake(450, 550, 200, 200);
        _baby3Frame.frame = CGRectMake(750, 550, 200, 200);
        
    } completion:^(BOOL finished) {
        [self Baby3];
    }];
    
}

-(void)Baby3 {
    
    
    [UIView animateWithDuration:1.5 animations:^{
        
        _baby1Frame.frame = CGRectMake(0, 550, 200, 200);
        _baby2Frame.frame = CGRectMake(300, 550, 200, 200);
        _baby3Frame.frame = CGRectMake(600, 550, 200, 200);
    } completion:^(BOOL finished) {
        [self Baby4];
    }];
    
    
    
}

-(void)Baby4{
    
    [UIView animateWithDuration:3 animations:^{
        
        _baby1Frame.frame = CGRectMake(300, 550, 200, 200);
        _baby2Frame.frame = CGRectMake(600, 550, 200, 200);
        _baby3Frame.frame = CGRectMake(900, 550, 200, 200);
    } completion:^(BOOL finished) {
        [self Baby5];
    }];
    
    
    
    
    
}


-(void)Baby5 {
    [UIView animateWithDuration:3 animations:^{
        
        _baby1Frame.frame = CGRectMake(150, 550, 200, 200);
        _baby2Frame.frame = CGRectMake(450, 550, 200, 200);
        _baby3Frame.frame = CGRectMake(750, 550, 200, 200);
        
        
    } completion:^(BOOL finished) {
        [self Baby6];
    }];
}

-(void)Baby6 {
    
    _baby4Frame = [[UIImageView alloc] initWithFrame:CGRectMake(-200, 550, 200, 200)];
    _baby5Frame = [[UIImageView alloc] initWithFrame:CGRectMake(1224, 550, 200, 200)];
    
    [self addSubview:_baby4Frame];
    [self addSubview:_baby5Frame];
    
    _baby4Frame.animationImages = _baby1Images;
    _baby4Frame.animationDuration= 2;
    [_baby4Frame startAnimating];
    
    _baby5Frame.animationImages = _baby1Images;
    _baby5Frame.animationDuration= 2;
    [_baby5Frame startAnimating];
    
    
    
    [UIView animateWithDuration:5 animations:^{
        
        _baby1Frame.frame = CGRectMake(150, 500, 100, 100);
        _baby2Frame.frame = CGRectMake(450, 500, 100, 100);
        _baby3Frame.frame = CGRectMake(750, 500, 100, 100);
        _baby4Frame.frame = CGRectMake(300, 550, 200, 200);
        _baby5Frame.frame = CGRectMake(600, 550, 200, 200);
        
    } completion:^(BOOL finished) {
        [self Baby7];
    }];
}

-(void)Baby7 {
    [UIView animateWithDuration:1 animations:^{
        CGAffineTransform affineTransform = CGAffineTransformMakeRotation(M_PI);
        _baby4Frame.image = [UIImage imageNamed:@"baby14.png"];
        _baby5Frame.image = [UIImage imageNamed:@"baby9.png"];
        _baby4Frame.transform = affineTransform;
        _baby4Frame.frame = CGRectMake(450, 550, 200, 200);
        _baby5Frame.transform = affineTransform;
        _baby5Frame.frame = CGRectMake(450, 550, 200, 200);
        
        
        
    } completion:^(BOOL finished) {
        [UIView animateWithDuration:1 animations:^{
            CGAffineTransform affineTransform = CGAffineTransformMakeRotation(0);
            _baby4Frame.transform = affineTransform;
            _baby4Frame.frame = CGRectMake(600, 550, 200, 200);
            
            _baby5Frame.transform = affineTransform;
            _baby5Frame.frame = CGRectMake(300, 550, 200, 200);
            
            
        } completion:^(BOOL finished) {
            
            _baby4Frame.image = [UIImage imageNamed:@"baby1.png"];
            _baby5Frame.image = [UIImage imageNamed:@"baby1.png"];
            
            [self Baby8];
            
            
        }];
        
        
        
    }];
    
    
    
    
}

-(void)Baby8 {
    
    [UIView animateWithDuration:5 animations:^{
        
        _baby1Frame.frame = CGRectMake(150, 500, 100, 100);
        _baby2Frame.frame = CGRectMake(450, 500, 100, 100);
        _baby3Frame.frame = CGRectMake(750, 500, 100, 100);
        _baby4Frame.frame = CGRectMake(300, 500, 100, 100);
        _baby5Frame.frame = CGRectMake(600, 500, 100, 100);
        
        
    } completion:^(BOOL finished) {
        [self Baby9];
    }];
    
}



-(void)Baby9{
    [UIView animateWithDuration:5 animations:^{
        
        _baby1Frame.frame = CGRectMake(150, 550, 200, 200);
        _baby2Frame.frame = CGRectMake(450, 550, 200, 200);
        _baby3Frame.frame = CGRectMake(750, 550, 200, 200);
        _baby4Frame.frame = CGRectMake(300, 550, 200, 200);
        _baby5Frame.frame = CGRectMake(600, 550, 200, 200);
        
        
    } completion:^(BOOL finished) {
        [self Baby10];
    }];
    
    
    
    
}

-(void)Baby10{
    [UIView animateWithDuration:5 animations:^{
        
        _baby1Frame.frame = CGRectMake(150, 550, 200, 200);
        _baby2Frame.frame = CGRectMake(450, 550, 200, 200);
        _baby3Frame.frame = CGRectMake(750, 550, 200, 200);
        _baby4Frame.frame = CGRectMake(300, 500, 100, 100);
        _baby5Frame.frame = CGRectMake(600, 500, 100, 100);
        
        
    } completion:^(BOOL finished) {
        [self Baby11];
    }];
    
    
    
}

-(void)Baby11{
    [UIView animateWithDuration:5 animations:^{
        
        _baby1Frame.frame = CGRectMake(150, 550, 200, 200);
        _baby2Frame.frame = CGRectMake(450, 550, 200, 200);
        _baby3Frame.frame = CGRectMake(750, 550, 200, 200);
        _baby4Frame.frame = CGRectMake(300, 550, 200, 200);
        _baby5Frame.frame = CGRectMake(600, 550, 200, 200);
        
        
    } completion:^(BOOL finished) {
        
        
        [self Baby8];
        
        
    }];
}

#pragma mark BALL CODES


-(void) ballDrop {
    [self createGrid];
    
   // [self playMusic:self];
}

-(void)createGrid{
    
    
    //CGFloat width = [UIScreen mainScreen].bounds.size.width;
    
    
    self.backgroundColor = [UIColor yellowColor];
    
    _banner.alpha = 1;
    _banner = [[UILabel alloc] initWithFrame:CGRectMake(self.bounds.origin.x,self.bounds.origin.y, _width, 100)];
    _banner.text = @"Pick The Color";
    _banner.textColor = [UIColor blueColor];
    _banner.font = [UIFont fontWithName:@"Chalkboard SE" size:52];
    _banner.textAlignment = NSTextAlignmentCenter;
    
    [self addSubview:_banner];
    
    
    //_height = [UIScreen mainScreen].bounds.size.height;
  //  _width = [UIScreen mainScreen].bounds.size.width;
    
    _animator = [[UIDynamicAnimator alloc] initWithReferenceView:self];
    
    
    //tap gesture
    
    UITapGestureRecognizer *tapGesture = [[UITapGestureRecognizer alloc] initWithTarget:self action:@selector(onTap:)];
    [self addGestureRecognizer:tapGesture];
    
    
    //Gravity
    
    _gravityBehavior = [[UIGravityBehavior alloc] initWithItems:@[]];
    _gravityBehavior.magnitude = 1;
    [_animator addBehavior:_gravityBehavior];
    
    
    //Collision
    
    _collisionBehavior = [[UICollisionBehavior alloc] initWithItems:@[]];
    _collisionBehavior.translatesReferenceBoundsIntoBoundary = YES;
    
    [_animator addBehavior:_collisionBehavior];
    
    
    //Bounce
    
    _bounceBehavior = [[UIDynamicItemBehavior alloc] initWithItems:@[ ] ];
    _bounceBehavior.elasticity = 1;
    [_animator addBehavior:_bounceBehavior];
    
    
    _bounceBehaviorDense = [[UIDynamicItemBehavior alloc] initWithItems:@[ ] ];
    _bounceBehaviorDense.density = 100000;
    [_animator addBehavior:_bounceBehaviorDense];
    
    
    [_pushBehavior removeItem:_ball];
    
    
    
    _ballReleasePointX = 400;
    
    //set up grid
    
    
    for (int count =1; count <20; count ++) {
        int ylevel = 0;
        int xlevel = 0;
        int xstart = self.bounds.origin.x;
        int xgap = _width/7;
        
        if (count<=6) {
            ylevel = _height*.3;
            xlevel = xstart + xgap *count;
            if (count&2) {//was 1
                _obstacleColor = [UIColor cyanColor];
            }
            else {_obstacleColor = [UIColor magentaColor];}
        }
        if (count>6 && count <=12){
            ylevel  = _height*.5;
            xlevel  =  xstart + xgap * (count-7)+xgap;
            if( count&1){
                _obstacleColor = [UIColor cyanColor];}
        }else {
            _obstacleColor = [UIColor magentaColor];
        }
        
       
        
        
        if (count>12) {
            ylevel = _height*.7;
            xlevel  = (xstart + xgap) + (xgap * (count-13.5));
            
            if (count&1) {
                _obstacleColor = [UIColor magentaColor];
            }
            else {
                _obstacleColor = [UIColor cyanColor];
            }
            
            
            
            
            
        }
        
        
        
        
        UIView *obstacles = [[UIView alloc] initWithFrame:CGRectMake(xlevel, ylevel, 50, 50)];
        
        CGAffineTransform affineTransform = CGAffineTransformMakeRotation(M_PI_4);
        obstacles.transform = affineTransform;
        
        obstacles.backgroundColor = _obstacleColor;
        
        [self addSubview:obstacles];
        [_collisionBehavior addItem:obstacles];
        [_bounceBehaviorDense addItem:obstacles];
        
    }
    
    //add the boxes,
    float boxHeight = _height*.15;
    float boxYValue = _height-boxHeight;
    
    
    _labelDads = [[UILabel alloc] initWithFrame:CGRectMake(0, boxYValue, _width/4, boxHeight)];
    _labelDads.backgroundColor =[UIColor blueColor];
    _labelDads.text = @"Blue";
    _labelDads.font = [UIFont fontWithName:@"Chalkboard SE" size:32];
    _labelDads.textColor = [UIColor whiteColor];
    _labelDads.textAlignment = NSTextAlignmentCenter;
    _labelDads.numberOfLines = 0;
    
    _labelLower = [[UILabel alloc] initWithFrame:CGRectMake(_width*.25, boxYValue, _width/4, boxHeight)];
    _labelLower.backgroundColor =[UIColor redColor];
    _labelLower.text = @"Red";
    _labelLower.font = [UIFont fontWithName:@"Chalkboard SE" size:32];
    _labelLower.textColor = [UIColor whiteColor];
    _labelLower.textAlignment = NSTextAlignmentCenter;
    _labelLower.numberOfLines = 0;
    
    _labelMiddle = [[UILabel alloc] initWithFrame:CGRectMake(_width*.5, boxYValue, _width/4, boxHeight)];
    _labelMiddle.backgroundColor =[UIColor greenColor];
    _labelMiddle.text = @"Green";
    _labelMiddle.font = [UIFont fontWithName:@"Chalkboard SE" size:32];
    _labelMiddle.textColor = [UIColor whiteColor];
    _labelMiddle.textAlignment = NSTextAlignmentCenter;
    _labelMiddle.numberOfLines = 0;
    
    _labelMoms = [[UILabel alloc] initWithFrame:CGRectMake(_width*.75, boxYValue, _width/4, boxHeight)];
    _labelMoms.backgroundColor =[UIColor orangeColor];
    _labelMoms.text = @"Orange";
    _labelMoms.font = [UIFont fontWithName:@"Chalkboard SE" size:32];
    _labelMoms.textColor = [UIColor whiteColor];
    _labelMoms.textAlignment = NSTextAlignmentCenter;
    _labelMoms.numberOfLines = 0;
    
    [self addSubview:_labelDads];
    [self addSubview:_labelLower];
    [self addSubview:_labelMiddle];
    [self addSubview:_labelMoms];
    
    
    
    [self releaseBall];
    
}

-(void)releaseBall {
    
    int high = _width*.8;
    int low = _width*.2;
    
    _ballReleasePointX = arc4random() % (high-low+1) + low;
    
  
    
    [self timingMethod];
    //[_bounceBehaviorDense removeItem:_ball];
    _bounceBehavior.elasticity = 1;
    
    float kballSize = _width/15;
    
    
    
    
    _ball = [[UIView alloc] initWithFrame:CGRectMake(_ballReleasePointX - kballSize/2, 0, kballSize, kballSize)];
    
    _ball.layer.borderColor = [[UIColor blackColor] CGColor];
    _ball.layer.borderWidth = 1;
    
    _ball.backgroundColor = [UIColor darkGrayColor];
    _ball.layer.cornerRadius = kballSize/2;
    _ball.layer.masksToBounds = YES;
    
    _ball.alpha = 1;
    [self addSubview:_ball];
    [_gravityBehavior addItem:_ball];
    [_collisionBehavior addItem:_ball];
    [_pushBehavior addItem:_ball];
    [_bounceBehavior addItem:_ball];
    
    
    [self bringSubviewToFront:_labelDads];
    [self bringSubviewToFront:_labelLower];
    [self bringSubviewToFront:_labelMiddle];
    [self bringSubviewToFront:_labelMoms];
    
    _collisionBehavior.collisionDelegate = self;
    
    
    
}





-(void)timingMethod {
    
    //be sure to use [ballTimer invalidate] when moving to winner program!!
    
    ballTimer = [NSTimer scheduledTimerWithTimeInterval:.1
                                                 target:self
                                               selector:@selector(checkPosition)
                                               userInfo:nil repeats:YES];
}


-(void)checkPosition {
    
    
    if (_ball.frame.origin.y>_height*.75 && _ball.frame.origin.x<=_width*.25-_ball.frame.size.width/2) {
        _pointsDads = _pointsDads + 1;
        _strPointsDads = [NSString stringWithFormat:@"Blue: %d",_pointsDads];
        _labelDads.text = _strPointsDads;
        
        _banner.alpha = 1;
        _banner.text = @"Blue!";
        _banner.backgroundColor =[UIColor blueColor];
        _banner.textColor = [UIColor whiteColor];
        
        [_banner sizeToFit];
        [_banner setCenter:CGPointMake(self.center.x, 200)];
        _ballReleasePointX = 800;
        
        [_ball removeFromSuperview];
        [ballTimer invalidate];
        ballTimer = NULL;
        [self releaseBall];
        
        
        [UIView animateWithDuration:3 animations:^{
            _banner.alpha = 0;
        }];
    }
    
    if (_ball.frame.origin.y>_height*.75 && _ball.frame.origin.x>_width*.25 && _ball.frame.origin.x <= _width*.5-_ball.frame.size.width/2) {
        _pointsLower = _pointsLower + 1;
        _strPointsLower = [NSString stringWithFormat:@"Red: %d",_pointsLower];
        _labelLower.text = _strPointsLower;
        
        _banner.alpha = 1;
        _banner.text = @"Red!";
        _banner.backgroundColor =[UIColor redColor];
        _banner.textColor = [UIColor whiteColor];
        
        [_banner sizeToFit];
        [_banner setCenter:CGPointMake(self.center.x, 200)];
        
        [_ball removeFromSuperview];
        _ballReleasePointX = 600;
        
        
        [_ball removeFromSuperview];
        [ballTimer invalidate];
        ballTimer = NULL;
        [self releaseBall];
        
        [UIView animateWithDuration:3 animations:^{
            _banner.alpha = 0;
        }];
    }
    
    if (_ball.frame.origin.y>_height*.75 && _ball.frame.origin.x>_width*.5 && _ball.frame.origin.x <= _width*.75-_ball.frame.size.width/2) {
        _pointsMiddle = _pointsMiddle + 1;
        _strPointsMiddle = [NSString stringWithFormat:@"Green: %d",_pointsMiddle];
        _labelMiddle.text = _strPointsMiddle;
        
        _banner.alpha = 1;
        _banner.text = @"Green!";
        _banner.backgroundColor =[UIColor greenColor];
        _banner.textColor = [UIColor whiteColor];
        
        [_banner sizeToFit];
        [_banner setCenter:CGPointMake(self.center.x, 200)];
        _ballReleasePointX = 300;
        
        [_ball removeFromSuperview];
        [ballTimer invalidate];
        ballTimer = NULL;
        [self releaseBall];
        
        
        
        [UIView animateWithDuration:3 animations:^{
            _banner.alpha = 0;
        }];
        
        
    }
    if (_ball.frame.origin.y>_height*.75 && _ball.frame.origin.x>_width*.75 && _ball.frame.origin.x <= _width-_ball.frame.size.width/2) {
        _pointsMoms = _pointsMoms + 1;
        _strPointsMoms = [NSString stringWithFormat:@"Orange: %d",_pointsMoms];
        _labelMoms.text = _strPointsMoms;
        
        _banner.alpha = 1;
        _banner.text = @"Orange!";
        _banner.backgroundColor =[UIColor orangeColor];
        _banner.textColor = [UIColor whiteColor];
        
        [_banner sizeToFit];
        [_banner setCenter:CGPointMake(self.center.x, 200)];
        _ballReleasePointX = 200;
        
        [_ball removeFromSuperview];
        [ballTimer invalidate];
        ballTimer = NULL;
        [self releaseBall];
        
        
        [UIView animateWithDuration:3 animations:^{
            _banner.alpha = 0;
        }];
    }
    
    
    
}

-(void)onTap:(UIGestureRecognizer *)gesture {
    if (gesture.state == UIGestureRecognizerStateEnded) {
        
        [self pushBall];
        
    }
}

-(void)pushBall{
    
    _pushBehavior = [[UIPushBehavior alloc] initWithItems:@[] mode:UIPushBehaviorModeInstantaneous];
    _pushBehavior.magnitude =0.5;
    _pushBehavior.angle = M_2_PI/2;
    [_pushBehavior addItem:_ball];
    
    [_animator addBehavior:_pushBehavior];
    
    
    
}




@end
