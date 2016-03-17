//
//  twoViewController.m
//  B
//
//  Created by 王帅 on 16/3/17.
//  Copyright © 2016年 Mr.wang. All rights reserved.
//

#import "twoViewController.h"

@implementation twoViewController

- (void)viewDidLoad {
    [super viewDidLoad];
    // Do any additional setup after loading the view.
    [self buildUI];
}

- (void)buildUI {
  
    [self.view addSubview:self.tt];
    [self.tt becomeFirstResponder];
}

- (void)didReceiveMemoryWarning {
    [super didReceiveMemoryWarning];
    // Dispose of any resources that can be recreated.
}

- (void)touchesEnded:(NSSet<UITouch *> *)touches withEvent:(UIEvent *)event {
    
    [self.view endEditing:YES];
    if (self.myBlock) {
         self.myBlock(self.tt.text);
    }
}

- (UITextField *)tt {
    if (!_tt) {
        _tt = [[UITextField alloc] initWithFrame:CGRectMake(30, 80, 80, 30)];
        _tt.backgroundColor = [UIColor lightGrayColor];
        _tt.layer.borderColor = [UIColor orangeColor].CGColor;
        _tt.layer.borderWidth = 3;
    }
    return _tt;
}


/*
#pragma mark - Navigation

// In a storyboard-based application, you will often want to do a little preparation before navigation
- (void)prepareForSegue:(UIStoryboardSegue *)segue sender:(id)sender {
    // Get the new view controller using [segue destinationViewController].
    // Pass the selected object to the new view controller.
}
*/

@end
