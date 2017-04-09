//
//  InAppPurchaseViewController.m
//  BingoNight 2.2
//
//  Created by Adam Schor on 4/3/17.
//  Copyright © 2017 AandA Development. All rights reserved.
//

#import "InAppPurchaseViewController.h"

#import <StoreKit/StoreKit.h>


@interface InAppPurchaseViewController () <SKProductsRequestDelegate, SKPaymentTransactionObserver>

@end

@implementation InAppPurchaseViewController


#define kBuyLicenseProductIdentifier @"CommercialUse_1YR"


- (void)viewDidLoad {
    [super viewDidLoad];
    // Do any additional setup after loading the view.
}

- (void)didReceiveMemoryWarning {
    [super didReceiveMemoryWarning];
    // Dispose of any resources that can be recreated.
}

-(IBAction)tapBuyLicense{
    NSLog(@"A request to buy license");
    
    if ([SKPaymentQueue canMakePayments]) {
        NSLog(@"User can make payments");
        SKProductsRequest *productRequest  = [[SKProductsRequest alloc]initWithProductIdentifiers:[NSSet setWithObject:kBuyLicenseProductIdentifier]];
        productRequest.delegate = self;
        [productRequest start];
    }
    else {
        NSLog(@"Could not make purchase");
    }
}

-(void)productsRequest:(SKProductsRequest *)request didReceiveResponse:(SKProductsResponse *)response {
    SKProduct *validProduct = nil;
    NSInteger count = [response.products count];
    if (count>0){
        validProduct = [response.products objectAtIndex:0];
        NSLog(@"Product Available");
        
    }
    else if(!validProduct){
        NSLog(@"No product available");
    }
        
    }

-(void)purchase:(SKProduct *)product {
    SKPayment *payment = [SKPayment paymentWithProduct:product];
    
    [[SKPaymentQueue defaultQueue] addTransactionObserver:self];
    [[SKPaymentQueue defaultQueue] addPayment:payment];
    
}

-(IBAction)restore {
    //this is called when the user restores purchases, you should hook this up to a button
    [[SKPaymentQueue defaultQueue] addTransactionObserver:self];
    [[SKPaymentQueue defaultQueue] restoreCompletedTransactions];
}
- (void) paymentQueueRestoreCompletedTransactionsFinished:(SKPaymentQueue *)queue
{
    NSLog(@"received restored transactions: %lu", (unsigned long)queue.transactions.count);
    for(SKPaymentTransaction *transaction in queue.transactions){
        if(transaction.transactionState == SKPaymentTransactionStateRestored){
            //called when the user successfully restores a purchase
            NSLog(@"Transaction state -> Restored");
            
            [self removeLicenseSign];
            [[SKPaymentQueue defaultQueue] finishTransaction:transaction];
            break;
        }
    }
}

-(void)paymentQueue:(SKPaymentQueue *)queue updatedTransactions:(NSArray<SKPaymentTransaction *> *)transactions{
    for (SKPaymentTransaction *transaction in transactions) {
       
        switch (transaction.transactionState) {
            case SKPaymentTransactionStatePurchasing:
                NSLog(@"transaction state: Purchasing");
                break;
            case SKPaymentTransactionStatePurchased:
                NSLog(@"transaction state: Purchased");
                [self removeLicenseSign];
                [[SKPaymentQueue defaultQueue] finishTransaction:transaction];
                break;
            case SKPaymentTransactionStateRestored:
                 NSLog(@"transaction state: Restored");
                [[SKPaymentQueue defaultQueue] finishTransaction:transaction];
                break;
            case SKPaymentTransactionStateFailed:
                 NSLog(@"transaction state: Failed");
                if (transaction.error.code == SKErrorPaymentCancelled) {
                     NSLog(@"transaction state: Cancelled");
                }
                [[SKPaymentQueue defaultQueue] finishTransaction:transaction];
                break;
                
            default:
                break;
        }
    }
}







-(void)removeLicenseSign{
    //Add the update to global settings and to defaults to note that the license was purchased
    

}

@end
