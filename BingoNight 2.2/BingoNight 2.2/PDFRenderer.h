//
//  PDFRenderer.h
//  Bingo Night 3.0
//
//  Created by Adam Schor on 10/6/16.
//  Copyright © 2016 AandA Development. All rights reserved.
//

#import <UIKit/UIKit.h>
#import <CoreText/CoreText.h>

@interface PDFRenderer : NSObject
//+(void)drawText:(NSString*)pdfFileName;
+(void)drawPDF:(NSString*)fileName Pages: (int)pages;

+(void)drawText;







@end
