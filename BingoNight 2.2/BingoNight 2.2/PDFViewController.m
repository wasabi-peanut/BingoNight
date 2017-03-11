//
//  PDFViewController.m
//  Bingo Night 3.0
//
//  Created by Adam Schor on 10/6/16.
//  Copyright © 2016 AandA Development. All rights reserved.
//

#import "PDFViewController.h"
#import "PDFRenderer.h"
#import "CreateCardArrays.h"





@interface PDFViewController ()

@end

@implementation PDFViewController

- (BOOL)prefersStatusBarHidden{
    return YES;
}


- (void)viewDidLoad {
    
  
    NSString* fileName = [self getPDFFileName];
    [PDFRenderer drawPDF:fileName Pages:_pages];
    [self showPDFFile];
    
    [super viewDidLoad];
    // Do any additional setup after loading the view.
}



- (void)didReceiveMemoryWarning {
    [super didReceiveMemoryWarning];
    // Dispose of any resources that can be recreated.
}




-(NSString*)getPDFFileName
{
    NSString* fileName = @"BingoCard.PDF";
    
    NSArray *arrayPaths =
    NSSearchPathForDirectoriesInDomains(
                                        NSDocumentDirectory,
                                        NSUserDomainMask,
                                        YES);
    NSString *path = [arrayPaths objectAtIndex:0];
    NSString* pdfFileName = [path stringByAppendingPathComponent:fileName];
    
    return pdfFileName;
    
}

-(void)showPDFFile
{
    NSString* fileName = @"BingoCard.PDF";
    NSArray *arrayPaths = NSSearchPathForDirectoriesInDomains(NSDocumentDirectory,NSUserDomainMask,YES);
    NSString *path = [arrayPaths objectAtIndex:0];
    NSString* pdfFileName = [path stringByAppendingPathComponent:fileName];
    
    float height = [UIScreen mainScreen].bounds.size.height;
    float width = [UIScreen mainScreen].bounds.size.width;
    
//retina, air and pro 9.7 is is 1024 W and 768 tall pro 12.9 is 1366 W and  1024 T
 
    
    
    UIWebView* webView = [[UIWebView alloc] initWithFrame:CGRectMake(0, 0, width, height)];
    
    
    NSURL *url = [NSURL fileURLWithPath:pdfFileName];
    NSURLRequest *request = [NSURLRequest requestWithURL:url];
    [webView setScalesPageToFit:YES];
    [webView loadRequest:request];
    
    [webView.scrollView setContentOffset:CGPointMake(0, 0)];
    
    webView.scrollView.scrollEnabled = NO;
    webView.scrollView.bounces = YES;
    webView.scalesPageToFit = YES;
    
    [self.view addSubview:webView];
    
    [self printFile];
    
    
}


-(void)printFile{
    NSString *fileName = @"BingoCard.PDF";
    NSArray *arrayPaths = NSSearchPathForDirectoriesInDomains(NSDocumentDirectory, NSUserDomainMask, YES);
    NSString *path = [arrayPaths objectAtIndex:0];
    NSString *pdfFileName = [path stringByAppendingPathComponent:fileName];
    
    NSURL *myData = [NSURL fileURLWithPath:pdfFileName];
    
    UIPrintInteractionController *pic = [UIPrintInteractionController sharedPrintController];
   
  // if (pic && [UIPrintInteractionController canPrintData:myData]) {
        pic.delegate=self;
       
        UIPrintInfo *printInfo = [UIPrintInfo printInfo];
        printInfo.outputType = UIPrintInfoOutputGeneral;
        printInfo.jobName = [path lastPathComponent];
        printInfo.duplex = UIPrintInfoDuplexLongEdge;
        pic.printInfo = printInfo;
        //pic.showsPageRange = YES;
        pic.printingItem = myData;
        
        void (^completionHandler)(UIPrintInteractionController *, BOOL,NSError *) = ^(UIPrintInteractionController *pic, BOOL completed, NSError *error){
            if (!completed && error){
               
            }
        };
    
        [pic presentAnimated:YES completionHandler:completionHandler];
   // }
    
}

@end
