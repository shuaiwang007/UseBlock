//
//  twoViewController.h
//  B
//
//  Created by 王帅 on 16/3/17.
//  Copyright © 2016年 Mr.wang. All rights reserved.
//

#import <UIKit/UIKit.h>

typedef void(^MyBlock)(NSString *text);

@interface twoViewController : UIViewController
@property(nonatomic, copy) UITextField *tt;
@property(nonatomic, strong) MyBlock myBlock;
@end
