//
//  ViewController.m
//  keyBoard
//
//  Created by Chau Chu on 2/27/15.
//  Copyright (c) 2015 chuchau. All rights reserved.
//

#import "ViewController.h"



@interface ViewController (){
    UITextField* currentTextField;
}

@end

@implementation ViewController

- (void)viewDidLoad {
    [super viewDidLoad];
    UITapGestureRecognizer* tap = [[UITapGestureRecognizer alloc] initWithTarget:self action:@selector(tapView:)];
    [self.mainScrollView addGestureRecognizer:tap];
    // Do any additional setup after loading the view, typically from a nib.
}

- (void)didReceiveMemoryWarning {
    [super didReceiveMemoryWarning];
    // Dispose of any resources that can be recreated.
}

-(void)tapView:(id)sender{
    if (currentTextField) {
        [currentTextField resignFirstResponder];
        UIEdgeInsets contentInsets = UIEdgeInsetsZero;
        self.mainScrollView.contentInset = contentInsets;
        self.mainScrollView.scrollIndicatorInsets = contentInsets;
    }
}


-(void)textFieldDidBeginEditing:(UITextField *)textField{
    float  HEIGHTKEYBOARD = 216;
    currentTextField = textField;
    CGRect aRect = self.view.frame;
    aRect.size.height -= HEIGHTKEYBOARD;
    CGPoint point = CGPointMake(textField.frame.origin.x, textField.frame.origin.y+textField.frame.size.height) ;
    BOOL iscontainer = CGRectContainsPoint(aRect, point);
    if (!iscontainer) {
        float orginY = textField.frame.origin.y+ textField.frame.size.height - HEIGHTKEYBOARD;
        UIEdgeInsets contentInsets = UIEdgeInsetsMake(0.0, 0.0, orginY, 0.0);
        self.mainScrollView.contentInset = contentInsets;
        self.mainScrollView.scrollIndicatorInsets = contentInsets;
        CGPoint scrollPoint = CGPointMake(0.0, orginY);
        [self.mainScrollView setContentOffset:scrollPoint animated:YES];
    }
    
}

-(void)touchesBegan:(NSSet *)touches withEvent:(UIEvent *)event{
    if (currentTextField) {
        [currentTextField resignFirstResponder];
    }
}

@end
