//
//  PDFRenderer.m
//  Bingo Night 3.0
//
//  Created by Adam Schor on 10/6/16.
//  Copyright © 2016 AandA Development. All rights reserved.
//
//

#import "PDFRenderer.h"
#import "CreateCardArrays.h"


int adjuster = 0;

CGFloat heightMultiplier = 65.0f;//WAS 85 for pro 12.3
CGFloat widthMultiplier = 65.0f;
NSMutableArray * cardNumbers;



@implementation PDFRenderer




+(void)drawText
{
    CGFloat height = [UIScreen mainScreen].bounds.size.height;
    float fontSizeForLetters;
    float fontSizeForFree;
    float fontSizeForNumbers;
    
    if (height>768) {
        fontSizeForLetters=65;
        fontSizeForFree = 22;
        fontSizeForNumbers= 60;
        heightMultiplier = 85;
        widthMultiplier = 85;
        
    }
    else{
        fontSizeForLetters=50;
        fontSizeForFree = 18;
        fontSizeForNumbers= 50;
        heightMultiplier = 64;
        widthMultiplier = 64;
    }

    

    NSMutableArray *arrayBNumbers = [[NSMutableArray alloc] initWithArray:[CreateCardArrays createNumbersWithLowNumber:1 highNumber:15]];
    [arrayBNumbers insertObject:@"B" atIndex:0];
    
    NSMutableArray *arrayINumbers = [[NSMutableArray alloc] initWithArray:[CreateCardArrays createNumbersWithLowNumber:16 highNumber:30]];
    [arrayINumbers insertObject:@"I" atIndex:0];
    
    NSMutableArray *arrayNNumbers = [[NSMutableArray alloc] initWithArray:[CreateCardArrays createNumbersWithLowNumber:31 highNumber:45]];
    [arrayNNumbers insertObject:@"N" atIndex:0];
    [arrayNNumbers insertObject:@"\nFREE" atIndex:3];
    
    NSMutableArray *arrayGNumbers = [[NSMutableArray alloc] initWithArray:[CreateCardArrays createNumbersWithLowNumber:46 highNumber:60]];
    [arrayGNumbers insertObject:@"G" atIndex:0];
    
    NSMutableArray *arrayONumbers = [[NSMutableArray alloc] initWithArray:[CreateCardArrays createNumbersWithLowNumber:61 highNumber:75]];
    [arrayONumbers insertObject:@"O" atIndex:0];
    
    
    NSMutableArray *arrayBNumbers1 = [[NSMutableArray alloc] initWithArray:[CreateCardArrays createNumbersWithLowNumber:1 highNumber:15]];
    [arrayBNumbers1 insertObject:@"B" atIndex:0];
    
    NSMutableArray *arrayINumbers1 = [[NSMutableArray alloc] initWithArray:[CreateCardArrays createNumbersWithLowNumber:16 highNumber:30]];
    [arrayINumbers1 insertObject:@"I" atIndex:0];
    
    NSMutableArray *arrayNNumbers1 = [[NSMutableArray alloc] initWithArray:[CreateCardArrays createNumbersWithLowNumber:31 highNumber:45]];
    [arrayNNumbers1 insertObject:@"N" atIndex:0];
    [arrayNNumbers1 insertObject:@"\nFREE" atIndex:3];
    
    NSMutableArray *arrayGNumbers1 = [[NSMutableArray alloc] initWithArray:[CreateCardArrays createNumbersWithLowNumber:46 highNumber:60]];
    [arrayGNumbers1 insertObject:@"G" atIndex:0];
    
    NSMutableArray *arrayONumbers1 = [[NSMutableArray alloc] initWithArray:[CreateCardArrays createNumbersWithLowNumber:61 highNumber:75]];
    [arrayONumbers1 insertObject:@"O" atIndex:0];
    
    
    
    NSMutableArray *arrayBNumbers2 = [[NSMutableArray alloc] initWithArray:[CreateCardArrays createNumbersWithLowNumber:1 highNumber:15]];
    [arrayBNumbers2 insertObject:@"B" atIndex:0];
    
    NSMutableArray *arrayINumbers2 = [[NSMutableArray alloc] initWithArray:[CreateCardArrays createNumbersWithLowNumber:16 highNumber:30]];
    [arrayINumbers2 insertObject:@"I" atIndex:0];
    
    NSMutableArray *arrayNNumbers2 = [[NSMutableArray alloc] initWithArray:[CreateCardArrays createNumbersWithLowNumber:31 highNumber:45]];
    [arrayNNumbers2 insertObject:@"N" atIndex:0];
    [arrayNNumbers2 insertObject:@"\nFREE" atIndex:3];
    
    NSMutableArray *arrayGNumbers2 = [[NSMutableArray alloc] initWithArray:[CreateCardArrays createNumbersWithLowNumber:46 highNumber:60]];
    [arrayGNumbers2 insertObject:@"G" atIndex:0];
    
    NSMutableArray *arrayONumbers2 = [[NSMutableArray alloc] initWithArray:[CreateCardArrays createNumbersWithLowNumber:61 highNumber:75]];
    [arrayONumbers2 insertObject:@"O" atIndex:0];
    
    NSMutableArray *arrayBNumbers3 = [[NSMutableArray alloc] initWithArray:[CreateCardArrays createNumbersWithLowNumber:1 highNumber:15]];
    [arrayBNumbers3 insertObject:@"B" atIndex:0];
    
    NSMutableArray *arrayINumbers3 = [[NSMutableArray alloc] initWithArray:[CreateCardArrays createNumbersWithLowNumber:16 highNumber:30]];
    [arrayINumbers3 insertObject:@"I" atIndex:0];
    
    NSMutableArray *arrayNNumbers3 = [[NSMutableArray alloc] initWithArray:[CreateCardArrays createNumbersWithLowNumber:31 highNumber:45]];
    [arrayNNumbers3 insertObject:@"N" atIndex:0];
    [arrayNNumbers3 insertObject:@"\nFREE" atIndex:3];
    
    NSMutableArray *arrayGNumbers3 = [[NSMutableArray alloc] initWithArray:[CreateCardArrays createNumbersWithLowNumber:46 highNumber:60]];
    [arrayGNumbers3 insertObject:@"G" atIndex:0];
    
    NSMutableArray *arrayONumbers3 = [[NSMutableArray alloc] initWithArray:[CreateCardArrays createNumbersWithLowNumber:61 highNumber:75]];
    [arrayONumbers3 insertObject:@"O" atIndex:0];
    
    
    NSString *textToDraw;
    
    for (int x=0; x<120; x++) {//120
        
        if (x<6) {
            textToDraw = [arrayBNumbers objectAtIndex:x];//0 to 5
        }
        if (x>5 && x<12) {
            textToDraw = [arrayINumbers objectAtIndex:x-6];//6 to 11
        }
        if (x>11 && x<18) {
            textToDraw = [arrayNNumbers objectAtIndex:x-12];//12 to 17
        }
        if (x>17 && x<24) {
            textToDraw = [arrayGNumbers objectAtIndex:x-18];//18 to 23
        }
        if (x>23 && x<30) {
            textToDraw = [arrayONumbers objectAtIndex:x-24];//24 to 29
        }
        //----
        if (x>29 && x<36) {
            textToDraw = [arrayBNumbers1 objectAtIndex:x-30];//30 to 35
        }
        if (x>35 && x<42) {
            textToDraw = [arrayINumbers1 objectAtIndex:x-36];//36 to 41
        }
        if (x>41 && x<48) {
            textToDraw = [arrayNNumbers1 objectAtIndex:x-42];//42 to 47
        }
        if (x>47 && x<54) {
            textToDraw = [arrayGNumbers1 objectAtIndex:x-48];//48 to 53
        }
        if (x>53 && x<60) {
            textToDraw = [arrayONumbers1 objectAtIndex:x-54];//54 to 59
        }
        //----
        if (x>59 && x<66) {
            textToDraw = [arrayBNumbers2 objectAtIndex:x-60];//60 to 65
        }
        if (x>65 && x<72) {
            textToDraw = [arrayINumbers2 objectAtIndex:x-66];//66 to 71
        }
        if (x>71 && x<78) {
            textToDraw = [arrayNNumbers2 objectAtIndex:x-72];//72 to 77
        }
        if (x>77 && x<84) {
            textToDraw = [arrayGNumbers2 objectAtIndex:x-78];//78 to 83
        }
        if (x>83 && x<90) {
            textToDraw = [arrayONumbers2 objectAtIndex:x-84];//84 to 89
        }
        //----
        if (x>89 && x<96) {
            textToDraw = [arrayBNumbers3 objectAtIndex:x-90];
        }
        if (x>95 && x<102) {
            textToDraw = [arrayINumbers3 objectAtIndex:x-96];
        }
        if (x>101 && x<108) {
            textToDraw = [arrayNNumbers3 objectAtIndex:x-102];
        }
        if (x>107 && x<114) {
            textToDraw = [arrayGNumbers3 objectAtIndex:x-108];
        }
        if (x>113 && x<120) {
            textToDraw = [arrayONumbers3 objectAtIndex:x-114];
        }
        
        
        
        
        CFStringRef stringRef = (__bridge CFStringRef)textToDraw;
        NSUInteger length = [textToDraw length];
        UIColor *color;
        CTFontRef font;
        
        switch (x) {
            case 0:
            case 6:
            case 12:
            case 18:
            case 24:
            case 30:
            case 36:
            case 42:
            case 48:
            case 54:
            case 60:
            case 66:
            case 72:
            case 78:
            case 84:
            case 90:
            case 96:
            case 102:
            case 108:
            case 114:
                color = [UIColor redColor];
                font = CTFontCreateWithName((CFStringRef)@"ChalkboardSE-Bold",fontSizeForLetters, nil);
                break;
            case 15:
            case 45:
            case 75:
            case 105:
                color = [UIColor redColor];
                font = CTFontCreateWithName((CFStringRef)@"Helvetica",fontSizeForFree, nil);
                break;
            default:
                color = [UIColor blueColor];
                font = CTFontCreateWithName((CFStringRef)@"Helvetica",fontSizeForNumbers, nil);
                break;
        }
        
        
        
        
        CFStringRef string = (__bridge CFStringRef) textToDraw;
        CFMutableAttributedStringRef currentText = CFAttributedStringCreateMutable(kCFAllocatorDefault, 0);
        CFAttributedStringReplaceString (currentText,CFRangeMake(0, 0), string);
        
        CFAttributedStringSetAttribute(currentText,CFRangeMake(0, length),kCTFontAttributeName,font);
        CFAttributedStringSetAttribute(currentText,CFRangeMake(0, length),kCTForegroundColorAttributeName,(__bridge CFTypeRef)(color));
        
        CTTextAlignment alignment = kCTTextAlignmentCenter;
        CTParagraphStyleSetting _settings[] = {{kCTParagraphStyleSpecifierAlignment, sizeof(alignment), &alignment}};
        CTParagraphStyleRef paragraphStyle = CTParagraphStyleCreate(_settings, sizeof(_settings) / sizeof(_settings[0]));
        
        CFAttributedStringSetAttribute(currentText, CFRangeMake(0, length), kCTParagraphStyleAttributeName, paragraphStyle);
        
        
        CTFramesetterRef framesetter = CTFramesetterCreateWithAttributedString(currentText);
        
        
        
        
        CGRect frameRect = CGRectMake(0, 0, heightMultiplier, height);
        
        
        CGMutablePathRef framePath = CGPathCreateMutable();
        CGPathAddRect(framePath, NULL, frameRect);
        
        CFRange currentRange = CFRangeMake(0, 0);
        CTFrameRef frameRef = CTFramesetterCreateFrame(framesetter, currentRange, framePath, NULL);
        
        CGContextRef currentContext = UIGraphicsGetCurrentContext();
        CGContextSetTextMatrix(currentContext, CGAffineTransformIdentity);
        //UPPER LEFT
        if (x<6) {
            
            CGContextTranslateCTM(currentContext, heightMultiplier, height);//was 0,792
            CGContextScaleCTM(currentContext, 1.0f, -1.0f);
            
            CTFrameDraw(frameRef, currentContext);
            
            CGContextScaleCTM(currentContext, 1.0f, -1.0f);
            CGContextTranslateCTM(currentContext,-heightMultiplier,-height+heightMultiplier);
            
        }
        
        if (x>5 && x<12) {
            
            CGContextTranslateCTM(currentContext, 2*heightMultiplier, height-(6*heightMultiplier));//was 0,792
            CGContextScaleCTM(currentContext, 1.0f, -1.0f);
            
            CTFrameDraw(frameRef, currentContext);
            
            CGContextScaleCTM(currentContext, 1.0f, -1.0f);
            CGContextTranslateCTM(currentContext,-2*heightMultiplier,-height+7*heightMultiplier);
        }
        
        if (x>11 && x<18) {
            CGContextTranslateCTM(currentContext, 3*heightMultiplier, height-12*heightMultiplier);//was 0,792
            CGContextScaleCTM(currentContext, 1.0f, -1.0f);
            
            CTFrameDraw(frameRef, currentContext);
            
            CGContextScaleCTM(currentContext, 1.0f, -1.0f);
            CGContextTranslateCTM(currentContext,-3*heightMultiplier,-height+13*heightMultiplier);
        }
        
        if (x>17 && x<24) {
            CGContextTranslateCTM(currentContext, 4*heightMultiplier, height-18*heightMultiplier);//was 0,792
            CGContextScaleCTM(currentContext, 1.0f, -1.0f);
            
            CTFrameDraw(frameRef, currentContext);
            
            CGContextScaleCTM(currentContext, 1.0f, -1.0f);
            CGContextTranslateCTM(currentContext,-4*heightMultiplier,-height+19*heightMultiplier);
        }
        
        if (x>23 && x<30) {
            CGContextTranslateCTM(currentContext, 5*heightMultiplier, height-24*heightMultiplier);//was 0,792
            CGContextScaleCTM(currentContext, 1.0f, -1.0f);
            
            CTFrameDraw(frameRef, currentContext);
            
            CGContextScaleCTM(currentContext, 1.0f, -1.0f);
            CGContextTranslateCTM(currentContext,-5*heightMultiplier,-height+25*heightMultiplier);
        }
        
        //UPPER RIGHT
        if (x>29 && x<36) {
            CGContextTranslateCTM(currentContext, 7*heightMultiplier, height-30*heightMultiplier);//was 0,792
            CGContextScaleCTM(currentContext, 1.0f, -1.0f);
            
            CTFrameDraw(frameRef, currentContext);
            
            CGContextScaleCTM(currentContext, 1.0f, -1.0f);
            CGContextTranslateCTM(currentContext,-7*heightMultiplier,-height+31*heightMultiplier);
        }
        
        
        if (x>35 && x<42) {
            CGContextTranslateCTM(currentContext, 8*heightMultiplier, height-36*heightMultiplier);//was 0,792
            CGContextScaleCTM(currentContext, 1.0f, -1.0f);
            
            CTFrameDraw(frameRef, currentContext);
            
            CGContextScaleCTM(currentContext, 1.0f, -1.0f);
            CGContextTranslateCTM(currentContext,-8*heightMultiplier,-height+37*heightMultiplier);
        }
        
        if (x>41 && x<48) {
            CGContextTranslateCTM(currentContext, 9*heightMultiplier, height-42*heightMultiplier);//was 0,792
            CGContextScaleCTM(currentContext, 1.0f, -1.0f);
            
            CTFrameDraw(frameRef, currentContext);
            
            CGContextScaleCTM(currentContext, 1.0f, -1.0f);
            CGContextTranslateCTM(currentContext,-9*heightMultiplier,-height+43*heightMultiplier);
        }
        
        if (x>47 && x<54) {
            CGContextTranslateCTM(currentContext, 10*heightMultiplier, height-48*heightMultiplier);//was 0,792
            CGContextScaleCTM(currentContext, 1.0f, -1.0f);
            
            CTFrameDraw(frameRef, currentContext);
            
            CGContextScaleCTM(currentContext, 1.0f, -1.0f);
            CGContextTranslateCTM(currentContext,-10*heightMultiplier,-height+49*heightMultiplier);
        }
        
        if (x>53 && x<60) {
            CGContextTranslateCTM(currentContext, 11*heightMultiplier, height-54*heightMultiplier);//was 0,792
            CGContextScaleCTM(currentContext, 1.0f, -1.0f);
            
            CTFrameDraw(frameRef, currentContext);
            
            CGContextScaleCTM(currentContext, 1.0f, -1.0f);
            CGContextTranslateCTM(currentContext,-11*heightMultiplier,-height+55*heightMultiplier);
        }
        
        //LOWER LEFT
        if (x>59 && x<66) {
            
            CGContextTranslateCTM(currentContext, 1*heightMultiplier, height-53*heightMultiplier);//was 0,792
            CGContextScaleCTM(currentContext, 1.0f, -1.0f);
            
            CTFrameDraw(frameRef, currentContext);
            
            CGContextScaleCTM(currentContext, 1.0f, -1.0f);
            CGContextTranslateCTM(currentContext,-1*heightMultiplier,-height+54*heightMultiplier);
        }
        if (x>65 && x<72) {
            
            CGContextTranslateCTM(currentContext, 2*heightMultiplier, height-59*heightMultiplier);//was 0,792
            CGContextScaleCTM(currentContext, 1.0f, -1.0f);
            
            CTFrameDraw(frameRef, currentContext);
            
            CGContextScaleCTM(currentContext, 1.0f, -1.0f);
            CGContextTranslateCTM(currentContext,-2*heightMultiplier,-height+60*heightMultiplier);
        }
        if (x>71 && x<78) {
            
            CGContextTranslateCTM(currentContext, 3*heightMultiplier, height-65*heightMultiplier);//was 0,792
            CGContextScaleCTM(currentContext, 1.0f, -1.0f);
            
            CTFrameDraw(frameRef, currentContext);
            
            CGContextScaleCTM(currentContext, 1.0f, -1.0f);
            CGContextTranslateCTM(currentContext,-3*heightMultiplier,-height+66*heightMultiplier);
        }
        
        if (x>77 && x<84) {
            
            CGContextTranslateCTM(currentContext, 4*heightMultiplier, height-71*heightMultiplier);//was 0,792
            CGContextScaleCTM(currentContext, 1.0f, -1.0f);
            
            CTFrameDraw(frameRef, currentContext);
            
            CGContextScaleCTM(currentContext, 1.0f, -1.0f);
            CGContextTranslateCTM(currentContext,-4*heightMultiplier,-height+72*heightMultiplier);
        }
        if (x>83 && x<90) {
            
            CGContextTranslateCTM(currentContext, 5*heightMultiplier, height-77*heightMultiplier);//was 0,792
            CGContextScaleCTM(currentContext, 1.0f, -1.0f);
            
            CTFrameDraw(frameRef, currentContext);
            
            CGContextScaleCTM(currentContext, 1.0f, -1.0f);
            CGContextTranslateCTM(currentContext,-5*heightMultiplier,-height+78*heightMultiplier);
        }
        
        //LOWER RIGHT
        if (x>89 && x<96) {
            
            CGContextTranslateCTM(currentContext, 7*heightMultiplier, height-83*heightMultiplier);//was 0,792
            CGContextScaleCTM(currentContext, 1.0f, -1.0f);
            
            CTFrameDraw(frameRef, currentContext);
            
            CGContextScaleCTM(currentContext, 1.0f, -1.0f);
            CGContextTranslateCTM(currentContext,-7*heightMultiplier,-height+84*heightMultiplier);
        }
        if (x>95 && x<102) {
            
            CGContextTranslateCTM(currentContext, 8*heightMultiplier, height-89*heightMultiplier);//was 0,792
            CGContextScaleCTM(currentContext, 1.0f, -1.0f);
            
            CTFrameDraw(frameRef, currentContext);
            
            CGContextScaleCTM(currentContext, 1.0f, -1.0f);
            CGContextTranslateCTM(currentContext,-8*heightMultiplier,-height+90*heightMultiplier);
        }
        if (x>101 && x<108) {
            
            CGContextTranslateCTM(currentContext, 9*heightMultiplier, height-95*heightMultiplier);//was 0,792
            CGContextScaleCTM(currentContext, 1.0f, -1.0f);
            
            CTFrameDraw(frameRef, currentContext);
            
            CGContextScaleCTM(currentContext, 1.0f, -1.0f);
            CGContextTranslateCTM(currentContext,-9*heightMultiplier,-height+96*heightMultiplier);
        }
        
        if (x>107 && x<114) {
            
            CGContextTranslateCTM(currentContext, 10*heightMultiplier, height-101*heightMultiplier);//was 0,792
            CGContextScaleCTM(currentContext, 1.0f, -1.0f);
            
            CTFrameDraw(frameRef, currentContext);
            
            CGContextScaleCTM(currentContext, 1.0f, -1.0f);
            CGContextTranslateCTM(currentContext,-10*heightMultiplier,-height+102*heightMultiplier);
        }
        if (x>113 && x<120) {
            
            CGContextTranslateCTM(currentContext, 11*heightMultiplier, height-107*heightMultiplier);//was 0,792
            CGContextScaleCTM(currentContext, 1.0f, -1.0f);
            
            CTFrameDraw(frameRef, currentContext);
            
            CGContextScaleCTM(currentContext, 1.0f, -1.0f);
            CGContextTranslateCTM(currentContext,-11*heightMultiplier,-height+108*heightMultiplier);
        }
        
        
        
        CFRelease(frameRef);
        CFRelease(stringRef);
        CFRelease(framesetter);
        
        
    }
    
}

+(void)drawLineFromPoint:(CGPoint)from toPoint:(CGPoint)to lineWidth: (CGFloat)lw
{
    CGContextRef context = UIGraphicsGetCurrentContext();
    
    CGContextSetLineWidth(context, lw);
    
    CGColorSpaceRef colorspace = CGColorSpaceCreateDeviceRGB();
    
    CGFloat components[] = {0.0, 0.0, 0.0, 1.0};
    
    CGColorRef color = CGColorCreate(colorspace, components);
    
    CGContextSetStrokeColorWithColor(context, color);
    
    
    CGContextMoveToPoint(context, from.x, from.y);
    CGContextAddLineToPoint(context, to.x, to.y);
    
    CGContextStrokePath(context);
    CGColorSpaceRelease(colorspace);
    CGColorRelease(color);
    
}

+(void)drawLines {
    
    CGFloat height = [UIScreen mainScreen].bounds.size.height;
    if (height>768) {
        
        heightMultiplier = 85;
        widthMultiplier = 85;
        
    }
    else{
        heightMultiplier = 64;
        widthMultiplier = 64;
    }
    
    //VERTICAL LINES
    
    //-------UPPER LEFT----------
    CGPoint fromA = CGPointMake(widthMultiplier, 0);
    CGPoint toA = CGPointMake(widthMultiplier, 6*heightMultiplier);
    [PDFRenderer drawLineFromPoint:fromA toPoint:toA lineWidth:4.0f];
    
    CGPoint fromB = CGPointMake(2*widthMultiplier, 0);
    CGPoint toB = CGPointMake(2*widthMultiplier, 6*heightMultiplier);
    [PDFRenderer drawLineFromPoint:fromB toPoint:toB lineWidth:1.0f];
    
    CGPoint fromC = CGPointMake(3*widthMultiplier,0);
    CGPoint toC = CGPointMake(3*widthMultiplier, 6*heightMultiplier);
    [PDFRenderer drawLineFromPoint:fromC toPoint:toC lineWidth:1.0f];
    
    CGPoint fromD = CGPointMake(4*widthMultiplier,0);
    CGPoint toD = CGPointMake(4*widthMultiplier, 6*heightMultiplier);
    [PDFRenderer drawLineFromPoint:fromD toPoint:toD lineWidth:1.0f];
    
    CGPoint fromE = CGPointMake(5*widthMultiplier,0);
    CGPoint toE = CGPointMake(5*widthMultiplier, 6*heightMultiplier);
    [PDFRenderer drawLineFromPoint:fromE toPoint:toE lineWidth:1.0f];
    
    CGPoint fromF = CGPointMake(6*widthMultiplier,0);
    CGPoint toF = CGPointMake(6*widthMultiplier, 6*heightMultiplier);
    [PDFRenderer drawLineFromPoint:fromF toPoint:toF lineWidth:4.0f];
    
    //-------UPPER RIGHT--------
    CGPoint fromA1 = CGPointMake(7*widthMultiplier, 0);
    CGPoint toA1 = CGPointMake(7*widthMultiplier, 6*heightMultiplier);
    [PDFRenderer drawLineFromPoint:fromA1 toPoint:toA1 lineWidth:4.0f];
    
    CGPoint fromB1 = CGPointMake(8*widthMultiplier, 0);
    CGPoint toB1 = CGPointMake(8*widthMultiplier, 6*heightMultiplier);
    [PDFRenderer drawLineFromPoint:fromB1 toPoint:toB1 lineWidth:1.0f];
    
    CGPoint fromC1 = CGPointMake(9*widthMultiplier, 0);
    CGPoint toC1 = CGPointMake(9*widthMultiplier, 6*heightMultiplier);
    [PDFRenderer drawLineFromPoint:fromC1 toPoint:toC1 lineWidth:1.0f];
    
    CGPoint fromD1 = CGPointMake(10*widthMultiplier, 0);
    CGPoint toD1 = CGPointMake(10*widthMultiplier, 6*heightMultiplier);
    [PDFRenderer drawLineFromPoint:fromD1 toPoint:toD1 lineWidth:1.0f];
    
    CGPoint fromE1 = CGPointMake(11*widthMultiplier, 0);
    CGPoint toE1 = CGPointMake(11*widthMultiplier, 6*heightMultiplier);
    [PDFRenderer drawLineFromPoint:fromE1 toPoint:toE1 lineWidth:1.0f];
    
    CGPoint fromF1 = CGPointMake(12*widthMultiplier, 0);
    CGPoint toF1 = CGPointMake(12*widthMultiplier, 6*heightMultiplier);
    [PDFRenderer drawLineFromPoint:fromF1 toPoint:toF1 lineWidth:4.0f];
    
    //----------LOWER LEFT------
    
    CGPoint fromA2 = CGPointMake(1*widthMultiplier, 7*heightMultiplier);
    CGPoint toA2 = CGPointMake(1*widthMultiplier, 13*heightMultiplier);
    [PDFRenderer drawLineFromPoint:fromA2 toPoint:toA2 lineWidth:4.0f];
    
    CGPoint fromB2 = CGPointMake(2*widthMultiplier, 7*heightMultiplier);
    CGPoint toB2 = CGPointMake(2*widthMultiplier, 13*heightMultiplier);
    [PDFRenderer drawLineFromPoint:fromB2 toPoint:toB2 lineWidth:1.0f];
    
    CGPoint fromC2 = CGPointMake(3*widthMultiplier, 7*heightMultiplier);
    CGPoint toC2 = CGPointMake(3*widthMultiplier, 13*heightMultiplier);
    [PDFRenderer drawLineFromPoint:fromC2 toPoint:toC2 lineWidth:1.0f];
    
    CGPoint fromD2 = CGPointMake(4*widthMultiplier, 7*heightMultiplier);
    CGPoint toD2 = CGPointMake(4*widthMultiplier, 13*heightMultiplier);
    [PDFRenderer drawLineFromPoint:fromD2 toPoint:toD2 lineWidth:1.0f];
    
    CGPoint fromE2 = CGPointMake(5*widthMultiplier, 7*heightMultiplier);
    CGPoint toE2 = CGPointMake(5*widthMultiplier, 13*heightMultiplier);
    [PDFRenderer drawLineFromPoint:fromE2 toPoint:toE2 lineWidth:1.0f];
    
    CGPoint fromF2 = CGPointMake(6*widthMultiplier, 7*heightMultiplier);
    CGPoint toF2 = CGPointMake(6*widthMultiplier, 13*heightMultiplier);
    [PDFRenderer drawLineFromPoint:fromF2 toPoint:toF2 lineWidth:4.0f];
    
    //----------LOWER RIGHT------
    
    CGPoint fromA3 = CGPointMake(7*widthMultiplier, 7*heightMultiplier);
    CGPoint toA3 = CGPointMake(7*widthMultiplier, 13*heightMultiplier);
    [PDFRenderer drawLineFromPoint:fromA3 toPoint:toA3 lineWidth:4.0f];
    
    CGPoint fromB3 = CGPointMake(8*widthMultiplier, 7*heightMultiplier);
    CGPoint toB3 = CGPointMake(8*widthMultiplier, 13*heightMultiplier);
    [PDFRenderer drawLineFromPoint:fromB3 toPoint:toB3 lineWidth:1.0f];
    
    CGPoint fromC3 = CGPointMake(9*widthMultiplier, 7*heightMultiplier);
    CGPoint toC3 = CGPointMake(9*widthMultiplier, 13*heightMultiplier);
    [PDFRenderer drawLineFromPoint:fromC3 toPoint:toC3 lineWidth:1.0f];
    
    CGPoint fromD3 = CGPointMake(10*widthMultiplier, 7*heightMultiplier);
    CGPoint toD3 = CGPointMake(10*widthMultiplier, 13*heightMultiplier);
    [PDFRenderer drawLineFromPoint:fromD3 toPoint:toD3 lineWidth:1.0f];
    
    CGPoint fromE3 = CGPointMake(11*widthMultiplier, 7*heightMultiplier);
    CGPoint toE3 = CGPointMake(11*widthMultiplier, 13*heightMultiplier);
    [PDFRenderer drawLineFromPoint:fromE3 toPoint:toE3 lineWidth:1.0f];
    
    CGPoint fromF3 = CGPointMake(12*widthMultiplier, 7*heightMultiplier);
    CGPoint toF3 = CGPointMake(12*widthMultiplier, 13*heightMultiplier);
    [PDFRenderer drawLineFromPoint:fromF3 toPoint:toF3 lineWidth:4.0f];
    
    
    
    //HORIZONTAL LINES
    
    //-------UPPER LEFT----------
    
    CGPoint fromT = CGPointMake(widthMultiplier, 0);
    CGPoint toT = CGPointMake(widthMultiplier*6, 0);
    [PDFRenderer drawLineFromPoint:fromT toPoint:toT lineWidth:4.0f];
    
    CGPoint fromU = CGPointMake(widthMultiplier, heightMultiplier);
    CGPoint toU = CGPointMake(widthMultiplier*6, heightMultiplier);
    [PDFRenderer drawLineFromPoint:fromU toPoint:toU lineWidth:4.0f];
    
    CGPoint fromV = CGPointMake(widthMultiplier, heightMultiplier*2);
    CGPoint toV = CGPointMake(widthMultiplier*6, heightMultiplier*2);
    [PDFRenderer drawLineFromPoint:fromV toPoint:toV lineWidth:1.0f];
    
    CGPoint fromW = CGPointMake(widthMultiplier, heightMultiplier*3);
    CGPoint toW = CGPointMake(widthMultiplier*6, heightMultiplier*3);
    [PDFRenderer drawLineFromPoint:fromW toPoint:toW lineWidth:1.0f];
    
    CGPoint fromX = CGPointMake(widthMultiplier, heightMultiplier*4);
    CGPoint toX = CGPointMake(widthMultiplier*6, heightMultiplier*4);
    [PDFRenderer drawLineFromPoint:fromX toPoint:toX lineWidth:1.0f];
    
    CGPoint fromY = CGPointMake(widthMultiplier, heightMultiplier*5);
    CGPoint toY = CGPointMake(widthMultiplier*6, heightMultiplier*5);
    [PDFRenderer drawLineFromPoint:fromY toPoint:toY lineWidth:1.0f];
    
    CGPoint fromZ = CGPointMake(widthMultiplier, heightMultiplier*6);
    CGPoint toZ = CGPointMake(widthMultiplier*6, heightMultiplier*6);
    [PDFRenderer drawLineFromPoint:fromZ toPoint:toZ lineWidth:4.0f];
    
    //-------UPPER RIGHT----------
    CGPoint fromT1 = CGPointMake(widthMultiplier*7, 0);
    CGPoint toT1 = CGPointMake(widthMultiplier*12, 0);
    [PDFRenderer drawLineFromPoint:fromT1 toPoint:toT1 lineWidth:4.0f];
    
    CGPoint fromU1 = CGPointMake(widthMultiplier*7, heightMultiplier);
    CGPoint toU1 = CGPointMake(widthMultiplier*12, heightMultiplier);
    [PDFRenderer drawLineFromPoint:fromU1 toPoint:toU1 lineWidth:4.0f];
    
    CGPoint fromV1 = CGPointMake(widthMultiplier*7, heightMultiplier*2);
    CGPoint toV1 = CGPointMake(widthMultiplier*12, heightMultiplier*2);
    [PDFRenderer drawLineFromPoint:fromV1 toPoint:toV1 lineWidth:1.0f];
    
    CGPoint fromW1 = CGPointMake(widthMultiplier*7, heightMultiplier*3);
    CGPoint toW1 = CGPointMake(widthMultiplier*12, heightMultiplier*3);
    [PDFRenderer drawLineFromPoint:fromW1 toPoint:toW1 lineWidth:1.0f];
    
    CGPoint fromX1 = CGPointMake(widthMultiplier*7, heightMultiplier*4);
    CGPoint toX1 = CGPointMake(widthMultiplier*12, heightMultiplier*4);
    [PDFRenderer drawLineFromPoint:fromX1 toPoint:toX1 lineWidth:1.0f];
    
    CGPoint fromY1 = CGPointMake(widthMultiplier*7, heightMultiplier*5);
    CGPoint toY1 = CGPointMake(widthMultiplier*12, heightMultiplier*5);
    [PDFRenderer drawLineFromPoint:fromY1 toPoint:toY1 lineWidth:1.0f];
    
    CGPoint fromZ1 = CGPointMake(widthMultiplier*7, heightMultiplier*6);
    CGPoint toZ1 = CGPointMake(widthMultiplier*12, heightMultiplier*6);
    [PDFRenderer drawLineFromPoint:fromZ1 toPoint:toZ1 lineWidth:4.0f];
    
    
    //-------LOWER LEFT----------
    CGPoint fromT2 = CGPointMake(widthMultiplier*1, heightMultiplier*7);
    CGPoint toT2 = CGPointMake(widthMultiplier*6, heightMultiplier*7);
    [PDFRenderer drawLineFromPoint:fromT2 toPoint:toT2 lineWidth:4.0f];
    
    CGPoint fromU2 = CGPointMake(widthMultiplier*1, heightMultiplier*8);
    CGPoint toU2 = CGPointMake(widthMultiplier*6, heightMultiplier*8);
    [PDFRenderer drawLineFromPoint:fromU2 toPoint:toU2 lineWidth:4.0f];
    
    CGPoint fromV2 = CGPointMake(widthMultiplier*1, heightMultiplier*9);
    CGPoint toV2 = CGPointMake(widthMultiplier*6, heightMultiplier*9);
    [PDFRenderer drawLineFromPoint:fromV2 toPoint:toV2 lineWidth:1.0f];
    
    CGPoint fromW2 = CGPointMake(widthMultiplier*1, heightMultiplier*10);
    CGPoint toW2 = CGPointMake(widthMultiplier*6, heightMultiplier*10);
    [PDFRenderer drawLineFromPoint:fromW2 toPoint:toW2 lineWidth:1.0f];
    
    CGPoint fromX2 = CGPointMake(widthMultiplier*1, heightMultiplier*11);
    CGPoint toX2 = CGPointMake(widthMultiplier*6, heightMultiplier*11);
    [PDFRenderer drawLineFromPoint:fromX2 toPoint:toX2 lineWidth:1.0f];
    
    CGPoint fromY2 = CGPointMake(widthMultiplier*1, heightMultiplier*12);
    CGPoint toY2 = CGPointMake(widthMultiplier*6, heightMultiplier*12);
    [PDFRenderer drawLineFromPoint:fromY2 toPoint:toY2 lineWidth:1.0f];
    
    CGPoint fromZ2 = CGPointMake(widthMultiplier*1, heightMultiplier*13);
    CGPoint toZ2 = CGPointMake(widthMultiplier*6, heightMultiplier*13);
    [PDFRenderer drawLineFromPoint:fromZ2 toPoint:toZ2 lineWidth:4.0f];
    
    //-------LOWER RIGHT----------
    
    CGPoint fromT3 = CGPointMake(widthMultiplier*7, heightMultiplier*7);
    CGPoint toT3 = CGPointMake(widthMultiplier*12, heightMultiplier*7);
    [PDFRenderer drawLineFromPoint:fromT3 toPoint:toT3 lineWidth:4.0f];
    
    CGPoint fromU3 = CGPointMake(widthMultiplier*7, heightMultiplier*8);
    CGPoint toU3 = CGPointMake(widthMultiplier*12, heightMultiplier*8);
    [PDFRenderer drawLineFromPoint:fromU3 toPoint:toU3 lineWidth:4.0f];
    
    CGPoint fromV3 = CGPointMake(widthMultiplier*7, heightMultiplier*9);
    CGPoint toV3 = CGPointMake(widthMultiplier*12, heightMultiplier*9);
    [PDFRenderer drawLineFromPoint:fromV3 toPoint:toV3 lineWidth:1.0f];
    
    CGPoint fromW3 = CGPointMake(widthMultiplier*7, heightMultiplier*10);
    CGPoint toW3 = CGPointMake(widthMultiplier*12, heightMultiplier*10);
    [PDFRenderer drawLineFromPoint:fromW3 toPoint:toW3 lineWidth:1.0f];
    
    CGPoint fromX3 = CGPointMake(widthMultiplier*7, heightMultiplier*11);
    CGPoint toX3 = CGPointMake(widthMultiplier*12, heightMultiplier*11);
    [PDFRenderer drawLineFromPoint:fromX3 toPoint:toX3 lineWidth:1.0f];
    
    CGPoint fromY3 = CGPointMake(widthMultiplier*7, heightMultiplier*12);
    CGPoint toY3 = CGPointMake(widthMultiplier*12, heightMultiplier*12);
    [PDFRenderer drawLineFromPoint:fromY3 toPoint:toY3 lineWidth:1.0f];
    
    CGPoint fromZ3 = CGPointMake(widthMultiplier*7, heightMultiplier*13);
    CGPoint toZ3 = CGPointMake(widthMultiplier*12, heightMultiplier*13);
    [PDFRenderer drawLineFromPoint:fromZ3 toPoint:toZ3 lineWidth:4.0f];
    
    
}

+(void)drawPDF:(NSString*)fileName Pages:(int)pages

{
    
    CGFloat height = [UIScreen mainScreen].bounds.size.height;
    CGFloat width = [UIScreen mainScreen].bounds.size.width;
    
    
    // Create the PDF context using the default page size of 612 x 792.
    UIGraphicsBeginPDFContextToFile(fileName, CGRectZero, nil);
    
    // Mark the beginning of a new page.
    //NOTE: I did height and width backwards to allow for an 8.5 by 11 page in landscape mode
    // UIGraphicsBeginPDFPageWithInfo(CGRectMake(25, 25, height, width), nil);
    
    for (int p=0; p<pages; p++) {
        UIGraphicsBeginPDFPageWithInfo(CGRectMake(25, 25, height,width), nil);
        [self drawLines];
        
        [self drawText];
        
        
    }
    
    
    // Close the PDF context and write the contents out.
    UIGraphicsEndPDFContext();
    
}



@end
