//
//  BallColorView.m
//  Bingo Night 3.0
//
//  Created by Schor on 8/8/16.
//  Copyright © 2016 AandA Development. All rights reserved.
//

#import "BallColorView.h"

@implementation BallColorView



-(void)drawRect:(CGRect)rect {
    
    CGContextRef contextBackground = UIGraphicsGetCurrentContext();
    CGContextSaveGState(contextBackground);
    
    //gradient
    CGGradientRef myGradient;
    CGColorSpaceRef colorSpace = CGColorSpaceCreateDeviceRGB();
    double colorValR = 255/255.0f;
    double colorValG = 175/255.0f;
    double colorValB = 175/255.0f;
    
    
    CGFloat components[12] = {/*first*/1.0,1.0,1.0,1.0,/*second*/colorValR,colorValG,colorValB,1.0,/*third*/1.0,1.0,1.0,1.0};
    int num_locations = 3;
    CGFloat locations[3]= {0.1,0.95,1};
    
    
    myGradient = CGGradientCreateWithColorComponents(colorSpace, components, locations, num_locations);
    
    CGContextDrawRadialGradient(contextBackground, myGradient, CGPointMake(0, 0), 10, CGPointMake(0, 0), 245, kCGGradientDrawsBeforeStartLocation);
    
        
    //CGContextDrawLinearGradient (contextBackground, myGradient, CGPointMake(0, 0), CGPointMake(200, 200), 0);
    CGColorSpaceRelease(colorSpace);
    CGGradientRelease(myGradient);
    
}


@end
