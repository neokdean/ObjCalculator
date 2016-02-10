//
//  ViewController.m
//  ObjCalculator
//
//  Created by xtol bruce on 2/9/16.
//  Copyright © 2016 xtol bruce. All rights reserved.
//

#import "ViewController.h"

@interface ViewController ()

@end

@implementation ViewController

@synthesize displayLabel;
@synthesize curValue;
@synthesize totalCurValue;
@synthesize curStatusCode;


- (void)viewDidLoad {
    [self ClearCalculation];
    [super viewDidLoad];
    
    // Do any additional setup after loading the view, typically from a nib.
}

- (void)didReceiveMemoryWarning {
    [super didReceiveMemoryWarning];
    // Dispose of any resources that can be recreated.
}

- (void)ClearCalculation {
    curValue = 0;
    totalCurValue = 0;
    curInputValue = @"";
    curStatusCode = STATUS_DEFAULT;
    [self DisplayInputValue:curInputValue];
}

- (void)DisplayInputValue:(NSString *)displayText {
    NSString *CommaText;
    CommaText = [self ConvertComma:displayText];
    [displayLabel setText:CommaText];
    
}

-(void)DisplayCalculationValue {
    NSString *displayText;
    displayText = [NSString stringWithFormat:@"%g", totalCurValue];
    [displayLabel setText:displayText];
    curInputValue = @"";
}


- (NSString *)ConvertComma:(NSString *)data {
    return data;
}


-(IBAction)digitPressed:(UIButton*)sender {
    NSString *strNum = [[sender titleLabel] text];
    curInputValue = [curInputValue stringByAppendingFormat:strNum];
    [self DisplayInputValue:curInputValue];
}
-(IBAction)operationPressed:(UIButton*)sender {
    NSString *strOp = [[sender titleLabel] text];
    if ([@"+" isEqualToString:strOp]) {
        [self Calculation:curStatusCode CurStatusCode:STATUS_PLUS];
    }
    else if ([@"-" isEqualToString:strOp]) {
        [self Calculation:curStatusCode CurStatusCode:STATUS_MINUS];
    }
    else if ([@"*" isEqualToString:strOp]) {
        [self Calculation:curStatusCode CurStatusCode:STATUS_MULTIPLY];
    }
    else if ([@"/" isEqualToString:strOp]) {
        [self Calculation:curStatusCode CurStatusCode:STATUS_DIVISION];
    }
    else if ([@"C" isEqualToString:strOp]) {
        [self ClearCalculation];
    }
    else if ([@"=" isEqualToString:strOp]) {
        [self Calculation:curStatusCode CurStatusCode:STATUS_RETURN];
   }
}

-(void) Calculation:(kStatusCode)StatusCode CurStatusCode:(kStatusCode)cStatusCode {
    [self CalculationCore:StatusCode];
    [self DisplayCalculationValue];
    curStatusCode = cStatusCode;
}

-(void) CalculationCore:(kStatusCode)StatusCode {
    curValue = [curInputValue doubleValue];
    switch (StatusCode) {
        case STATUS_DEFAULT:
            totalCurValue = curValue;
            break;
        //case STATUS_RETURN:
        //    totalCurValue = curValue;
        //    break;
        case STATUS_PLUS:
            totalCurValue += curValue;
            break;
        case STATUS_MINUS:
            totalCurValue -= curValue;
            break;
        case STATUS_MULTIPLY:
            totalCurValue *= curValue;
            break;
        case STATUS_DIVISION:
            totalCurValue /= curValue;
            break;
    }

}
@end
