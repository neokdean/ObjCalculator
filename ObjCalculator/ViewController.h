//
//  ViewController.h
//  ObjCalculator
//
//  Created by xtol bruce on 2/9/16.
//  Copyright © 2016 xtol bruce. All rights reserved.
//

#import <UIKit/UIKit.h>

typedef enum {
    STATUS_DEFAULT = 0,
    STATUS_DIVISION,
    STATUS_MULTIPLY,
    STATUS_MINUS,
    STATUS_PLUS,
    STATUS_RETURN
}kStatusCode;


@interface ViewController : UIViewController {

double curValue;
double totalCurValue;
NSString *curInputValue;
kStatusCode curStatusCode;
}

-(IBAction)digitPressed:(UIButton*)sender;
-(IBAction)operationPressed:(UIButton*)sender;

@property (weak,nonatomic)IBOutlet UILabel *displayLabel;
@end

