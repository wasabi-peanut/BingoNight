//
//  CursorFixedTextView.m
//  BingoNight 2.2
//
//  Created by Adam Schor on 3/17/17.
//  Copyright © 2017 AandA Development. All rights reserved.
//

#import "CursorFixedTextView.h"

@implementation CursorFixedTextView

/*
// Only override drawRect: if you perform custom drawing.
// An empty implementation adversely affects performance during animation.
 */
- (void)drawRect:(CGRect)rect {

}



- (CGRect)caretRectForPosition:(UITextPosition *)position {
    CGRect originalRect = [super caretRectForPosition:position];
    originalRect.size.height = self.font.pointSize * 0.25;
    originalRect.size.width = self.font.pointSize * 0.25;
    return originalRect;
}


@end
