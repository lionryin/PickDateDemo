//
//  ViewController.m
//  PickDateDemo
//
//  Created by MacAir2 on 15/6/6.
//  Copyright (c) 2015年 lixiang. All rights reserved.
//

#import "ViewController.h"

@interface ViewController ()<UITextFieldDelegate>
@property (weak, nonatomic) IBOutlet UITextField *dateTF;
@property (strong, nonatomic) UIDatePicker *pick;

@end

@implementation ViewController

- (void)viewDidLoad {
    [super viewDidLoad];
    // Do any additional setup after loading the view, typically from a nib.
}

- (void)didReceiveMemoryWarning {
    [super didReceiveMemoryWarning];
    // Dispose of any resources that can be recreated.
}

- (void)selectDoneAction{
    [_dateTF resignFirstResponder];
    
    NSDateFormatter *formatter=[[NSDateFormatter alloc]init];
    formatter.dateFormat=@"yy-MM-dd HH:mm:ss";
    NSString *timeStr=[formatter stringFromDate:_pick.date];
    
    
    _dateTF.text = timeStr;
}

#pragma mark - UITextFieldDelegate
- (void)textFieldDidBeginEditing:(UITextField *)textField{
    _pick = [[UIDatePicker alloc] init];
    
    _dateTF.inputView = _pick;
    
    UIToolbar *accessoryView = [[UIToolbar alloc] init];
    accessoryView.frame = CGRectMake(0, 0, self.view.frame.size.width, 38);
    accessoryView.backgroundColor = [UIColor grayColor];
    
    UIBarButtonItem *doneBtn = [[UIBarButtonItem alloc] initWithTitle:@"完成" style:UIBarButtonItemStylePlain target:self action:@selector(selectDoneAction)];
    [doneBtn setTintColor:[UIColor blueColor]];
    
   UIBarButtonItem *spaceBtn=[[UIBarButtonItem alloc]initWithBarButtonSystemItem:UIBarButtonSystemItemFlexibleSpace target:nil action:nil];
    accessoryView.items=@[spaceBtn,doneBtn];
    _dateTF.inputAccessoryView = accessoryView;
}

- (void)textFieldDidEndEditing:(UITextField *)textField{
    
}

@end
