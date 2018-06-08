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
            [self patternWithImage:@"fractal" frames:11 duration:4.0 widthMultiplier:1 heightMultiplier:1 xPosition:0 yPosition:0 ];
            break;
        case 8:
            [self patternWithImage:@"bird" frames:27 duration:1.0 widthMultiplier:.2 heightMultiplier:.2 xPosition:_width*.4 yPosition:_height/2];
            break;
        case 9:
            [self patternWithImage:@"cowboy" frames:2 duration:0.5 widthMultiplier:0.3  heightMultiplier: 0.3  xPosition:_width*.3 yPosition:_height*.5];
            break;
        case 10:
            [self patternWithImage:@"Shark-Bingo" frames:140 duration:20 widthMultiplier:1 heightMultiplier:1 xPosition:0 yPosition:0];
            break;
        case 11:
            [self patternWithImage:@"Basketball-Bingo" frames:177 duration:15 widthMultiplier:1 heightMultiplier:1 xPosition:0 yPosition:0];
            break;
        case 12:
            [self newBaby];
            break;
        case 13:
            [self ballDrop];
            break;
        
        default:
            break;
    }
}



#pragma mark PATTERNS START HERE


-(void) pattern0 {
    //COMPLETE
    
    float discSizeMultiplier = 0.15;
    float fontSizeMultiplier = 0.2;
    
    CGFloat sizeOfDisc = discSizeMultiplier*_width;
    
    
    self.layer.borderColor = [[UIColor blueColor] CGColor];
    self.layer.borderWidth = 2;
    self.backgroundColor = [UIColor cyanColor];
    
    
    
    
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
    labelBackground.font = [UIFont fontWithName:@"Helvetica" size:fontSizeMultiplier*_width];
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
    //COMPLETE
    
    float letterDiscSize = _width/10;
    
    float textSize = _width/10;
    float topRow = _height*.45;
    float bottomRow = _height *.55;
    
    
    self.layer.borderColor = [[UIColor blueColor] CGColor];
    self.layer.borderWidth = 2;
    self.backgroundColor = [UIColor yellowColor];
    
    
    CABasicAnimation *shake = [CABasicAnimation animationWithKeyPath:@"transform.translation.y"];
    
    shake.toValue = [NSNumber numberWithFloat:10];
    shake.autoreverses = YES;
    shake.duration = 0.1;
    shake.repeatCount = HUGE_VALF;
    
    
    for (int c= 0; c<8; c++) {
        
        UILabel *letter = [[UILabel alloc]init];
        letter.font = [UIFont fontWithName:@"Courier" size:textSize];
        letter.textAlignment = NSTextAlignmentCenter;
                if (c%2) {
            letter.frame = CGRectMake(letterDiscSize*c+letterDiscSize, bottomRow, letterDiscSize,letterDiscSize);
        }
        else{
            letter.frame = CGRectMake(letterDiscSize*c+letterDiscSize,topRow, letterDiscSize,letterDiscSize);
            
        }
        
        letter.layer.cornerRadius = letterDiscSize/2;
        letter.clipsToBounds = YES;
        
        switch (c) {
            case 0:
                letter.text = @"C";
                letter.backgroundColor = [UIColor grayColor];
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
        
        [letter.layer addAnimation:shake forKey:nil];
        [self sendSubviewToBack:letter];
        
        
        
        
    }
    UILabel *labelHold = [[UILabel alloc] initWithFrame:CGRectMake(_width*.1, _height*.1, _width*.8, _height*.2)];
    labelHold.text = @"Hold Cards";
    labelHold.backgroundColor = [UIColor whiteColor];
    labelHold.textColor = [UIColor redColor];
    labelHold.font = [UIFont fontWithName:@"Arial" size:_height*.2];
    labelHold.layer.borderColor = [[UIColor redColor] CGColor];
    labelHold.layer.borderWidth = 3;
    labelHold.textAlignment =NSTextAlignmentCenter;
    labelHold.numberOfLines = 0;
    labelHold.layer.cornerRadius = _height*.2/5;
    labelHold.clipsToBounds = YES;
    
    [self addSubview:labelHold];

}

-(void)pattern2 {
    
    
    
    
    //COMPLETE
    float letterDiscSize = _width/10;
    float topRow = _height*.0;
    float bottomRow = _height *.05;
    float letterWidth = _width/10;
    float labelFontSize = _height*.2;
    float diskFontSize = _height * .1;
    float moveRange = _height*.8;
    
    
    self.layer.borderColor = [[UIColor blueColor] CGColor];
    self.layer.borderWidth = 2;
    self.backgroundColor = [UIColor yellowColor];
    
    CABasicAnimation *moveUpAndDown = [CABasicAnimation animationWithKeyPath:@"transform.translation.y" ];
    [moveUpAndDown setFromValue:[NSNumber numberWithFloat:0]];
    [moveUpAndDown setByValue:[NSNumber numberWithFloat:moveRange]];
    [moveUpAndDown setBeginTime:CACurrentMediaTime() ];
    [moveUpAndDown setDuration:2];
    moveUpAndDown.removedOnCompletion = NO;
    moveUpAndDown.autoreverses = YES;
    moveUpAndDown.fillMode = kCAFillModeForwards;
    moveUpAndDown.repeatCount =HUGE_VALF;
    
    UILabel *labelBackground = [[UILabel alloc] initWithFrame:CGRectMake(_width*.1, 0, _width*.8, _height)];
    labelBackground.text = @"Hold Cards\nHold Cards\nHold Cards\nHold Cards";
    labelBackground.font = [UIFont fontWithName:@"Helvetica" size:labelFontSize];
    labelBackground.numberOfLines = 0;
    labelBackground.textColor = [UIColor redColor];
    labelBackground.textAlignment = NSTextAlignmentCenter;
    
    [self addSubview: labelBackground];
    [self bringSubviewToFront:labelBackground];
    
    
    for (int c= 0; c<8; c++) {
        
        UILabel *letter = [[UILabel alloc]init];
        letter.font = [UIFont fontWithName:@"Courier" size:diskFontSize];
        letter.textAlignment = NSTextAlignmentCenter;
        if (c%2) {
            letter.frame = CGRectMake(letterDiscSize+letterDiscSize*c, topRow, letterDiscSize, letterDiscSize);
        }
        else{
            letter.frame = CGRectMake(letterWidth+letterWidth*c, bottomRow, letterDiscSize, letterDiscSize);
            
        }
        
        letter.layer.cornerRadius = letterDiscSize/2;
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
    //COMPLETE
    float letterDiscSize = _width/10;
    float topRow = _height*.0;
   
    float labelFontSize = _height*.2;
    float diskFontSize = _height * .1;
    float moveRange = _height*.85;
    
    
    self.layer.borderColor = [[UIColor blueColor] CGColor];
    self.layer.borderWidth = 2;
    self.backgroundColor = [UIColor whiteColor];
    
    UILabel *labelBackground = [[UILabel alloc] initWithFrame:CGRectMake(0, 0, _width, _height)];
    labelBackground.text = @"Hold Cards\nHold Cards\nHold Cards\nHold Cards";
    labelBackground.font = [UIFont fontWithName:@"Helvetica" size:labelFontSize];
    labelBackground.numberOfLines = 0;
    labelBackground.textColor = [UIColor yellowColor];
    labelBackground.textAlignment = NSTextAlignmentCenter;
    
    
    
    
    [self addSubview: labelBackground];
    
    CABasicAnimation *moveDown = [CABasicAnimation animationWithKeyPath:@"transform.translation.y" ];
    [moveDown setFromValue:[NSNumber numberWithFloat:0]];
    [moveDown setByValue:[NSNumber numberWithFloat:moveRange]];
    [moveDown setBeginTime:CACurrentMediaTime()];
    [moveDown setDuration:2];
    moveDown.removedOnCompletion = NO;
    moveDown.autoreverses = YES;
    moveDown.fillMode = kCAFillModeForwards;
    moveDown.repeatCount =HUGE_VALF;
    
    
    for (int c= 0; c<8; c++) {
        
        UILabel *letter = [[UILabel alloc]init];
        letter.font = [UIFont fontWithName:@"Courier" size:diskFontSize];
        letter.textAlignment = NSTextAlignmentCenter;
        letter.frame = CGRectMake(letterDiscSize+letterDiscSize*c,topRow, letterDiscSize, letterDiscSize);
        letter.layer.cornerRadius = letterDiscSize/2;
        letter.clipsToBounds = YES;
        
        switch (c) {
            case 0:
                letter.text = @"C";
                letter.backgroundColor = [UIColor yellowColor];
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
    //COMPLETE
    
    UIColor *fromColor = [UIColor cyanColor];
    UIColor *toColor = [UIColor blueColor];
    float duration = 5;
    float labelFontSize = _height*.35;
    
    
    
    self.layer.borderColor = [[UIColor blueColor] CGColor];
    self.layer.borderWidth = 2;
    self.backgroundColor = [UIColor whiteColor];
    
    
    
    UILabel *labelBackground = [[UILabel alloc] initWithFrame:CGRectMake(_width*.1, 0, _width*.8, _height)];
    labelBackground.text = @"Hold Cards";
    labelBackground.font = [UIFont fontWithName:@"Helvetica" size:labelFontSize];
    labelBackground.numberOfLines = 0;
    labelBackground.textColor = [UIColor redColor];
    labelBackground.textAlignment = NSTextAlignmentCenter;
    
    [self addSubview: labelBackground];
    
    CABasicAnimation *colorAnimation = [CABasicAnimation animationWithKeyPath:@"backgroundColor"];
    
    
    colorAnimation.duration = duration  ;
    colorAnimation.fromValue = (id)fromColor.CGColor;
    colorAnimation.toValue = (id)toColor.CGColor;
    colorAnimation.repeatCount = HUGE_VALF;
    colorAnimation.autoreverses = YES;
    
    [self.layer addAnimation:colorAnimation forKey:nil];
    
    }

-(void)pattern5 {
    //COMPLETE
    
    self.backgroundColor = [UIColor colorWithPatternImage:[UIImage imageNamed:@"floral.jpg"]];
    
    float labelFontSize = _height*.2;
    UIColor *fromColor = [UIColor redColor];
    UIColor *toColor = [UIColor greenColor];
    
    
    self.layer.borderColor = [[UIColor blueColor] CGColor];
    self.layer.borderWidth = 2;
    //self.backgroundColor = [UIColor cyanColor];
    
    
    UILabel *checkingTopLabel = [[UILabel alloc] initWithFrame:CGRectMake(0, 0, _width, _height/2)];
    checkingTopLabel.text = @"Checking";
    checkingTopLabel.font = [UIFont fontWithName:@"Courier" size:labelFontSize];
    checkingTopLabel.textAlignment = NSTextAlignmentCenter;
    checkingTopLabel.layer.cornerRadius = 25;
    checkingTopLabel.clipsToBounds = YES;
    
    
    checkingTopLabel.layer.borderColor = [[UIColor lightGrayColor] CGColor];
    checkingTopLabel.layer.borderWidth = 2;
    
    
    UILabel *checkingBottomLabel = [[UILabel alloc] initWithFrame:CGRectMake(0, _height/2, _width, _height/2)];
    checkingBottomLabel.text = @"Hold\nYour Cards";
    checkingBottomLabel.font = [UIFont fontWithName:@"Courier" size:labelFontSize];
    checkingBottomLabel.numberOfLines = 0;
    checkingBottomLabel.lineBreakMode = NSLineBreakByWordWrapping;
    checkingBottomLabel.textAlignment = NSTextAlignmentCenter;
    checkingBottomLabel.layer.cornerRadius = 25;
    checkingBottomLabel.clipsToBounds = YES;
    
    
    checkingBottomLabel.layer.borderColor = [[UIColor lightGrayColor] CGColor];
    checkingBottomLabel.layer.borderWidth = 2;
    
    [self addSubview:checkingTopLabel];
    [self addSubview:checkingBottomLabel];
    
    
    
    
    CABasicAnimation *spinning = [CABasicAnimation animationWithKeyPath:@"transform.rotation.y"];
    //for backward text
    spinning.toValue = [NSNumber numberWithFloat:2*M_PI];
    //only forward text
    //spinning.toValue = [NSNumber numberWithFloat:.5*M_PI];
    
    spinning.autoreverses = YES;
    spinning.duration = 4;
    spinning.repeatCount = HUGE_VALF;
    
    CABasicAnimation *colorAnimation = [CABasicAnimation animationWithKeyPath:@"backgroundColor"];
   
    
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
    //COMPLETE
    
    self.backgroundColor = [UIColor colorWithPatternImage:[UIImage imageNamed:@"steel1.jpg"]];
    
    float labelFontSize = _height*.2;
    float spinDuration = 1;
    float colorDuration = 2;
    UIColor *fromColor = [UIColor whiteColor];
    UIColor *toColor = [UIColor blackColor];

    UIColor *fromColor2 = [UIColor blackColor];
    UIColor *toColor2 = [UIColor whiteColor];
    
    UIColor *labelTextColor = [UIColor redColor];

    self.layer.borderColor = [[UIColor blueColor] CGColor];
    self.layer.borderWidth = 2;
 //   self.backgroundColor = [UIColor lightGrayColor];
    
    UILabel *checkingTopLabel = [[UILabel alloc] initWithFrame:CGRectMake(0, 0, _width, _height/2)];
    checkingTopLabel.text = @"Checking";
    checkingTopLabel.font = [UIFont fontWithName:@"Courier" size:labelFontSize];
    checkingTopLabel.textColor = labelTextColor;
    
    checkingTopLabel.textAlignment = NSTextAlignmentCenter;
    checkingTopLabel.layer.cornerRadius = 25;
    checkingTopLabel.clipsToBounds = YES;
    
    checkingTopLabel.layer.borderColor = [[UIColor lightGrayColor] CGColor];
    checkingTopLabel.layer.borderWidth = 2;
    
    UILabel *checkingBottomLabel = [[UILabel alloc] initWithFrame:CGRectMake(0, _height/2, _width, _height/2)];
    checkingBottomLabel.text = @"Hold\nYour Cards";
    checkingBottomLabel.font = [UIFont fontWithName:@"Courier" size:labelFontSize];
    checkingBottomLabel.textColor = labelTextColor;
    checkingBottomLabel.lineBreakMode = NSLineBreakByWordWrapping;
    checkingBottomLabel.numberOfLines = 0;
    checkingBottomLabel.textAlignment = NSTextAlignmentCenter;
    checkingBottomLabel.layer.cornerRadius = 25;
    checkingBottomLabel.clipsToBounds = YES;
    
    checkingBottomLabel.layer.borderColor = [[UIColor lightGrayColor] CGColor];
    checkingBottomLabel.layer.borderWidth = 2;
    
    [self addSubview:checkingTopLabel];
    [self addSubview:checkingBottomLabel];
    
    
    CABasicAnimation *spinning = [CABasicAnimation animationWithKeyPath:@"transform.rotation.x"];
    //for backward text
   // spinning.toValue = [NSNumber numberWithFloat:2*M_PI];
    //only forward text
    spinning.toValue = [NSNumber numberWithFloat:.5*M_PI];
    
    spinning.autoreverses = YES;
    spinning.duration = spinDuration;
    spinning.repeatCount = HUGE_VALF;
    
    CABasicAnimation *colorAnimation = [CABasicAnimation animationWithKeyPath:@"backgroundColor"];
    
    
    colorAnimation.duration = colorDuration;
    colorAnimation.fromValue = (id)fromColor.CGColor;
    colorAnimation.toValue = (id)toColor.CGColor;
    colorAnimation.repeatCount = HUGE_VALF;
    colorAnimation.autoreverses = YES;
    
    
    CABasicAnimation *colorAnimation2 = [CABasicAnimation animationWithKeyPath:@"backgroundColor"];
    
    colorAnimation2.duration = colorDuration;
    colorAnimation2.fromValue = (id)fromColor2.CGColor;
    colorAnimation2.toValue = (id)toColor2.CGColor;
    colorAnimation2.repeatCount = HUGE_VALF;
    colorAnimation2.autoreverses = YES;
    
    
    [checkingTopLabel.layer addAnimation:spinning forKey:nil];
    [checkingTopLabel.layer addAnimation:colorAnimation forKey:nil];
    
    [checkingBottomLabel.layer addAnimation:spinning forKey:nil];
    [checkingBottomLabel.layer addAnimation:colorAnimation2 forKey:nil];
    
}

-(void)patternWithImage: (NSString *)imageID frames:(NSInteger)frames duration:(float)duration widthMultiplier:(float)widthMult heightMultiplier: (float)heightMult xPosition: (float)xPos yPosition: (float)yPos{
    //COMPLETE
    
    self.layer.borderColor = [[UIColor blueColor] CGColor];
    self.layer.borderWidth = 2;
    self.backgroundColor = [UIColor cyanColor];
    
    UILabel *labelHold = [[UILabel alloc] initWithFrame:CGRectMake(_width*.1, _height*.8, _width*.8, _height*.2)];
    labelHold.text = @"Hold Cards";
    labelHold.backgroundColor = [UIColor clearColor];
    labelHold.textColor = [UIColor redColor];
    labelHold.font = [UIFont fontWithName:@"Arial" size:_height*.2];
    labelHold.layer.borderColor = [[UIColor redColor] CGColor];
    labelHold.layer.borderWidth = 3;
    labelHold.textAlignment =NSTextAlignmentCenter;
    labelHold.numberOfLines = 0;
    labelHold.layer.cornerRadius = _height*.2/5;
    labelHold.clipsToBounds = YES;
    
    [self addSubview:labelHold];
    [self bringSubviewToFront:labelHold];
    
    
   
    
    NSString *imageName;
    //NSMutableArray *arrayImages = [[NSMutableArray alloc] init];
    NSMutableArray *arrayImages = [NSMutableArray array];
    
   
    for (int x=1; x<=frames; x++) {
        imageName = [NSString stringWithFormat:@"%@%i",imageID,x];
        
     
        //[arrayImages addObject:[UIImage imageNamed:imageName]];
        
        [arrayImages addObject:[UIImage imageWithContentsOfFile:[[NSBundle mainBundle] pathForResource:imageName ofType:@"png"]]];
        
        
    }
    
   
    UIImageView *animationView = [[UIImageView alloc] initWithFrame:CGRectMake(xPos,yPos, _width*widthMult, _height*heightMult)];
    animationView.animationImages = arrayImages;
    animationView.animationDuration = duration;
    [self addSubview:animationView];
    [animationView startAnimating];
    
    
    [self bringSubviewToFront:labelHold];

     }




-(void)newBaby{
    
    float babyWidth = _width/5;
    float babyHeight = babyWidth;
    float moveUpRange = _height*0.05;
    float moveDownRange = _height*-.05;
    float moveRightRange = 100.0f;
    float moveLeftRange =  -100.0f;
    
    float startTime = 5;

    
    float XstartBaby1 = _width/2- babyWidth/2;
    float XstartBaby2 = _width/4- babyWidth/2;
    float XstartBaby3 = _width*3/4- babyWidth/2;
    float YstartBaby1 = _height * .7;
    
    self.layer.borderColor = [[UIColor blueColor] CGColor];
    self.layer.borderWidth = 2;
    self.backgroundColor = [UIColor cyanColor];
    
   
    
    UIGraphicsBeginImageContext(self.frame.size);
    [[UIImage imageNamed:@"stageBaby.png"] drawInRect:self.bounds];
    UIImage *image = UIGraphicsGetImageFromCurrentImageContext();
    UIGraphicsEndImageContext();
    
    self.backgroundColor = [UIColor colorWithPatternImage:image];

  
    
    CABasicAnimation *fadeIn = [CABasicAnimation animationWithKeyPath:@"opacity"];
    fadeIn.duration = 0.1f;
    fadeIn.fromValue = [NSNumber numberWithFloat:0.0f];
    fadeIn.toValue = [NSNumber numberWithFloat:1.0f];
    [fadeIn setBeginTime:CACurrentMediaTime()+2];
    fadeIn.removedOnCompletion = YES;
    fadeIn.fillMode = kCAFillModeForwards;
    
    
    CABasicAnimation *fadeOut = [CABasicAnimation animationWithKeyPath:@"opacity"];
    fadeOut.duration = 5.0f;
    fadeOut.fromValue = [NSNumber numberWithFloat:1.0f];
    fadeOut.toValue = [NSNumber numberWithFloat:0.0f];
    [fadeOut setBeginTime:CACurrentMediaTime()+5];
    fadeOut.removedOnCompletion = YES;
    fadeOut.fillMode = kCAFillModeForwards;
   
    
    
    CABasicAnimation *moveUp = [CABasicAnimation animationWithKeyPath:@"transform.translation.y" ];
    [moveUp setByValue:[NSNumber numberWithFloat:moveUpRange]];
    moveUp.removedOnCompletion = NO;
    
    CABasicAnimation *moveDown = [CABasicAnimation animationWithKeyPath:@"transform.translation.y"];
    [moveUp setByValue:[NSNumber numberWithFloat:moveDownRange]];
    moveDown.removedOnCompletion = NO;
    
    
    
    CAKeyframeAnimation *shrink = [CAKeyframeAnimation animationWithKeyPath:@"transform.scale"];
    shrink.values =@[@1,@.75];
    shrink.autoreverses = NO;
    
    CAKeyframeAnimation *enlarge = [CAKeyframeAnimation animationWithKeyPath:@"transform.scale"];
    enlarge.values = @[@1,@1.25];
    enlarge.autoreverses = NO;
    
    
    CABasicAnimation *moveLeft = [CABasicAnimation animationWithKeyPath:@"transform.translation.x"];
    [moveLeft setByValue:[NSNumber numberWithFloat:moveLeftRange]];
    moveLeft.autoreverses = NO;
  
    CABasicAnimation *moveRight = [CABasicAnimation animationWithKeyPath:@"transform.translation.x"];
    [moveRight setByValue:[NSNumber numberWithFloat:moveRightRange]];
    moveRight.autoreverses = NO;
 

    
    CAKeyframeAnimation *rotation = [CAKeyframeAnimation animationWithKeyPath:@"transform.rotation"];
    rotation.values = @[@0,@(M_PI*4)];
    rotation.autoreverses = YES;
    rotation.repeatCount = 0;
    
    _babyImages = [NSMutableArray array];
    
    
    for (int i= 1; i<15; i++) {
        NSString *objectName = [NSString stringWithFormat:@"baby%d",i];
        [_babyImages addObject:[UIImage imageWithContentsOfFile:[[NSBundle mainBundle] pathForResource:objectName ofType:@"png"]]];
        
        //Using imageWithContentsOfFile instead of imageNamed to allow memory usage to clear
        
    }
 
    _baby1Frame = [[UIImageView alloc] initWithFrame:CGRectMake(XstartBaby1, YstartBaby1, babyWidth, babyHeight)];
    _baby1Frame.animationImages = _babyImages;
    _baby1Frame.animationDuration = 3;
    [_baby1Frame startAnimating];
    
    _baby2Frame = [[UIImageView alloc] initWithFrame:CGRectMake(XstartBaby2, YstartBaby1, babyWidth, babyHeight)];
    _baby2Frame.animationImages = _babyImages;
    _baby2Frame.animationDuration = 3;
    [_baby2Frame startAnimating];
    
    _baby3Frame = [[UIImageView alloc] initWithFrame:CGRectMake(XstartBaby3, YstartBaby1, babyWidth, babyHeight)];
    _baby3Frame.animationImages = _babyImages;
    _baby3Frame.animationDuration = 3;
    [_baby3Frame startAnimating];
    
    [self addSubview:_baby1Frame];
    [self addSubview:_baby2Frame];
    [self addSubview:_baby3Frame];
 
  
    CAAnimationGroup *group1 = [[CAAnimationGroup alloc] init];
    [group1 setAnimations: [NSArray arrayWithObjects: moveLeft, nil]];
    [group1 setDuration:3.0];
    [group1 setBeginTime:CACurrentMediaTime()+1+startTime];
    group1.fillMode = kCAFillModeForwards;
    group1.removedOnCompletion = NO;
  
   CAAnimationGroup *group2 = [[CAAnimationGroup alloc] init];
    [group2 setAnimations:[NSArray arrayWithObjects:moveRight,nil]];
    [group2 setDuration:3.0];
    [group2 setBeginTime:CACurrentMediaTime()+4+startTime];
    group2.fillMode = kCAFillModeForwards;
    group2.removedOnCompletion = NO;
    
    
    CAAnimationGroup *group3 = [[CAAnimationGroup alloc] init];
    [group3 setAnimations:[NSArray arrayWithObjects:moveRight,nil]];
    [group3 setDuration:3.0];
   [group3 setBeginTime:CACurrentMediaTime()+7+startTime];
    group3.fillMode = kCAFillModeForwards;
    group3.removedOnCompletion = NO;
    
    CAAnimationGroup *group4 = [[CAAnimationGroup alloc] init];
    [group4 setAnimations:[NSArray arrayWithObjects:moveLeft,nil]];
    [group4 setDuration:3.0];
    [group4 setBeginTime:CACurrentMediaTime()+10+startTime];
    group4.fillMode = kCAFillModeForwards;
    group4.removedOnCompletion = NO;

    CAAnimationGroup *group5 = [[CAAnimationGroup alloc]init];
    [group5 setAnimations:[NSArray arrayWithObjects:shrink,moveUp,nil]];
    [group5 setDuration:3.0];
    [group5 setBeginTime:CACurrentMediaTime()+13+startTime];
    group5.fillMode = kCAFillModeForwards;
    group5.removedOnCompletion = NO;
    
    CAAnimationGroup *group6 = [[CAAnimationGroup alloc]init];
    [group6 setAnimations:[NSArray arrayWithObjects:moveLeft,nil]];
    [group6 setDuration:2.0];
    [group6 setBeginTime:CACurrentMediaTime()+16+startTime];
     group6.fillMode = kCAFillModeForwards;
     group6.removedOnCompletion = NO;
    
    CAAnimationGroup *group7 = [[CAAnimationGroup alloc]init];
    [group7 setAnimations:[NSArray arrayWithObjects:moveRight,nil]];
    [group7 setDuration:2.0];
    [group7 setBeginTime:CACurrentMediaTime()+19+startTime];
    group7.fillMode = kCAFillModeForwards;
    group7.removedOnCompletion = NO;

    
    CAAnimationGroup *group8 = [[CAAnimationGroup alloc]init];
    [group8 setAnimations:[NSArray arrayWithObjects:moveRight,nil]];
    [group8 setDuration:2.0];
    [group8 setBeginTime:CACurrentMediaTime()+21+startTime];
    group8.fillMode = kCAFillModeForwards;
    group8.removedOnCompletion = NO;
   
    
    CAAnimationGroup *group9 = [[CAAnimationGroup alloc]init];
    [group9 setAnimations:[NSArray arrayWithObjects:moveLeft,nil]];
    [group9 setDuration:2.0];
    [group9 setBeginTime:CACurrentMediaTime()+23+startTime];
    group9.fillMode = kCAFillModeForwards;
    group9.removedOnCompletion = NO;

    
   [_baby1Frame.layer addAnimation:group1 forKey:nil];
   [_baby1Frame.layer addAnimation:group2 forKey:nil];
   [_baby1Frame.layer addAnimation:group3 forKey:nil];
   [_baby1Frame.layer addAnimation:group4 forKey:nil];
   [_baby1Frame.layer addAnimation:group5 forKey:nil];
   [_baby1Frame.layer addAnimation:group6 forKey:nil];
   [_baby1Frame.layer addAnimation:group7 forKey:nil];
   [_baby1Frame.layer addAnimation:group8 forKey:nil];
   [_baby1Frame.layer addAnimation:group9 forKey:nil];
 

    [_baby2Frame.layer addAnimation:group1 forKey:nil];
    [_baby2Frame.layer addAnimation:group2 forKey:nil];
    [_baby2Frame.layer addAnimation:group3 forKey:nil];
    [_baby2Frame.layer addAnimation:group4 forKey:nil];
    [_baby2Frame.layer addAnimation:group5 forKey:nil];

    
    [_baby3Frame.layer addAnimation:group1 forKey:nil];
    [_baby3Frame.layer addAnimation:group2 forKey:nil];
    [_baby3Frame.layer addAnimation:group3 forKey:nil];
    [_baby3Frame.layer addAnimation:group4 forKey:nil];
    [_baby3Frame.layer addAnimation:group5 forKey:nil];
  }




#pragma mark BALL CODES


-(void) ballDrop {
    
    _gameOver = 0;
    
        float pegSize = _width/20;
    
    
    self.backgroundColor = [UIColor yellowColor];
    
    _banner.alpha = 1;
    _banner = [[UILabel alloc] initWithFrame:CGRectMake(_width*.25,_height*.05, _width*.5, _height*.2)];
    _banner.text = @"Pick The Color";
    _banner.textColor = [UIColor blueColor];
    _banner.font = [UIFont fontWithName:@"Chalkboard SE" size:_height*.1];
    _banner.textAlignment = NSTextAlignmentCenter;
    
    [self addSubview:_banner];
    
    
    
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
            if (count&2) {
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
        
        
        
        
        UIView *obstacles = [[UIView alloc] initWithFrame:CGRectMake(xlevel, ylevel, pegSize,pegSize)];
        
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
    float fontSize = boxHeight * .4;
    
    
    _labelDads = [[UILabel alloc] initWithFrame:CGRectMake(0, boxYValue, _width/4, boxHeight)];
    _labelDads.backgroundColor =[UIColor blueColor];
    _labelDads.text = @"Blue";
    _labelDads.font = [UIFont fontWithName:@"Chalkboard SE" size:fontSize];
    _labelDads.textColor = [UIColor whiteColor];
    _labelDads.textAlignment = NSTextAlignmentCenter;
    _labelDads.numberOfLines = 0;
    
    _labelLower = [[UILabel alloc] initWithFrame:CGRectMake(_width*.25, boxYValue, _width/4, boxHeight)];
    _labelLower.backgroundColor =[UIColor redColor];
    _labelLower.text = @"Red";
    _labelLower.font = [UIFont fontWithName:@"Chalkboard SE" size:fontSize];
    _labelLower.textColor = [UIColor whiteColor];
    _labelLower.textAlignment = NSTextAlignmentCenter;
    _labelLower.numberOfLines = 0;
    
    _labelMiddle = [[UILabel alloc] initWithFrame:CGRectMake(_width*.5, boxYValue, _width/4, boxHeight)];
    _labelMiddle.backgroundColor =[UIColor greenColor];
    _labelMiddle.text = @"Green";
    _labelMiddle.font = [UIFont fontWithName:@"Chalkboard SE" size:fontSize];
    _labelMiddle.textColor = [UIColor whiteColor];
    _labelMiddle.textAlignment = NSTextAlignmentCenter;
    _labelMiddle.numberOfLines = 0;
    
    _labelMoms = [[UILabel alloc] initWithFrame:CGRectMake(_width*.75, boxYValue, _width/4, boxHeight)];
    _labelMoms.backgroundColor =[UIColor orangeColor];
    _labelMoms.text = @"Orange";
    _labelMoms.font = [UIFont fontWithName:@"Chalkboard SE" size:fontSize];
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
    
    float kballSize = _width/20;
    
    
    
    
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
        
    
        [_ball removeFromSuperview];
        [ballTimer invalidate];
        ballTimer = NULL;
        if (_pointsDads<5) {
            [self releaseBall];
        }
        else {
            _banner.text = @"Blue Wins";
            _gameOver = 1;
        }
        
       
    }
    
    if (_ball.frame.origin.y>_height*.75 && _ball.frame.origin.x>_width*.25 && _ball.frame.origin.x <= _width*.5-_ball.frame.size.width/2) {
        _pointsLower = _pointsLower + 1;
        _strPointsLower = [NSString stringWithFormat:@"Red: %d",_pointsLower];
        _labelLower.text = _strPointsLower;
        
        _banner.alpha = 1;
        _banner.text = @"Red!";
        _banner.backgroundColor =[UIColor redColor];
        _banner.textColor = [UIColor whiteColor];
        

        [_ball removeFromSuperview];
      
        
        
        [_ball removeFromSuperview];
        [ballTimer invalidate];
        ballTimer = NULL;
        
        if (_pointsLower<5) {
            [self releaseBall];
        }
        else {
            _banner.text = @"Red Wins";
            _gameOver = 1;
        }
       
    }
    
    if (_ball.frame.origin.y>_height*.75 && _ball.frame.origin.x>_width*.5 && _ball.frame.origin.x <= _width*.75-_ball.frame.size.width/2) {
        _pointsMiddle = _pointsMiddle + 1;
        _strPointsMiddle = [NSString stringWithFormat:@"Green: %d",_pointsMiddle];
        _labelMiddle.text = _strPointsMiddle;
        
        _banner.alpha = 1;
        _banner.text = @"Green!";
        _banner.backgroundColor =[UIColor greenColor];
        _banner.textColor = [UIColor whiteColor];
        
    
        
        [_ball removeFromSuperview];
        [ballTimer invalidate];
        ballTimer = NULL;
        
        if (_pointsMiddle<5) {
            [self releaseBall];
        }
        else {
            _banner.text = @"Green Wins";
            _gameOver = 1;
        }
        
       
        
        
    }
    if (_ball.frame.origin.y>_height*.75 && _ball.frame.origin.x>_width*.75 && _ball.frame.origin.x <= _width-_ball.frame.size.width/2) {
        _pointsMoms = _pointsMoms + 1;
        _strPointsMoms = [NSString stringWithFormat:@"Orange: %d",_pointsMoms];
        _labelMoms.text = _strPointsMoms;
        
        _banner.alpha = 1;
        _banner.text = @"Orange!";
        _banner.backgroundColor =[UIColor orangeColor];
        _banner.textColor = [UIColor whiteColor];
 
        
        [_ball removeFromSuperview];
        [ballTimer invalidate];
        ballTimer = NULL;
        
        if (_pointsMoms<5) {
            [self releaseBall];
        }
        else {
            _banner.text = @"Orange Wins";
            _gameOver =1;
        }
        
     
    }
    if (_gameOver == 0)  {
        [UIView animateWithDuration:3 animations:^{
            self->_banner.alpha = 0;
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
