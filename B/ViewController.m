//
//  ViewController.m
//  B
//
//  Created by 王帅 on 16/3/17.
//  Copyright © 2016年 Mr.wang. All rights reserved.
//

#import "ViewController.h"
#import "twoViewController.h"

typedef  void(^returnValueBlock)(NSString *name, NSInteger age); // block作为参数返回值
typedef  void(^funcParamBlock)(NSString *name2, NSInteger age2);      // block作为函数参数

@interface ViewController ()

@property(nonatomic, strong) UITextField *textField;
@property(nonatomic, strong) twoViewController *twoVC;

@end

@implementation ViewController

- (void)viewDidLoad {
    [super viewDidLoad];
    // Do any additional setup after loading the view, typically from a nib.
    self.view.backgroundColor = [UIColor whiteColor];
    [self buildUI];
  
    /* 例1 这里b的值并不会改变，截获瞬间自动变量：在block中会保存自动变量的值，而不会随变量的值的改变而改变。
    int b = 0;
    void(^blo)() = ^(){
        NSLog(@"input: b = %d", b);
    };
    b = 3;
    blo();
    */
    
    /* 例2 如果想要改变b的值 请使用 __block 修饰
    __block int b = 0;
    void(^blo)() = ^(){
        b = 3;
        NSLog(@"-----: %d", b);
    };
    blo();
    */
    
    /** 注意！
     *  block 中不可以对C语言数组进行操作，不支持
     */
    
    /* 例3 这样是可以的，因为，我们只是对截获的自动变量进行了操作，而没有进行赋值。注意，是不能赋值而不是不能操作。
    NSMutableArray *array = [[NSMutableArray alloc] init];
    void(^blo)() = ^(){
        [array addObject:@"obj"];
    };
     */
    
    //完整block的写法
   /* ^NSString *(NSString *a, NSString *b) {
        return a;
    };
    ^ 表示这是个block
    NSString * ---> block的返回值（可省略）
    (NSString a,NSString b)这个括号中是Block的参数，语法和C语言类似。(若无返回值，可省略)
    
    //省略返回值和参数示例
    ^void(void) {
        .....
    }
   */
    
    
 /* Block在不同场合的写法
//    As a local variable:
    
    returnType (^blockName)(parameterTypes) = ^returnType(parameters) {...};
//    As a property:
    
    @property (nonatomic, copy) returnType (^blockName)(parameterTypes);
//    As a method parameter:
    
    - (void)someMethodThatTakesABlock:(returnType (^)(parameterTypes))blockName;
//    As an argument to a method call:
    
    [someObject someMethodThatTakesABlock:^returnType (parameters) {...}];
//    As a typedef:
    
    typedef returnType (^TypeName)(parameterTypes);
    TypeName blockName = ^returnType(parameters) {...};
*/
    
    [self test];
    [self test2];
    
}

- (void)buildUI {
    [self.view addSubview:self.textField];
    
    self.twoVC = [[twoViewController alloc] init];
    __weak ViewController *wself = self;
    self.twoVC.myBlock = ^(NSString *title) {
        wself.textField.text = title;
        
    };

} 


- (UITextField *)textField {
    if (!_textField) {
        _textField = [[UITextField alloc] initWithFrame:CGRectMake(30, 80, 80, 30)];
        _textField.layer.borderWidth = 3;
        _textField.layer.borderColor = [UIColor orangeColor].CGColor;
    }
    return _textField;
}

- (void)touchesEnded:(NSSet<UITouch *> *)touches withEvent:(UIEvent *)event {
    
   
    [self.navigationController pushViewController:self.twoVC animated:YES];
    
}


// block作为参数返回值test 供外界调用
- (returnValueBlock)testBlock {
    returnValueBlock block = ^(NSString *name, NSInteger age){
        NSLog(@"%@---%ld", name, (long)age);
    };
    return [block copy];
}
- (void)test{
    returnValueBlock block = [self testBlock];
    block(@"wsws", 40);
}

// block作为函数参数test
- (void)func:(funcParamBlock)funcParamBlockTest {
    funcParamBlockTest(@"wwww", 55);    //在方法的实现里给block回调传值。一般由于处理网络请求的回调。
}
- (void)test2 {
    [self func:^(NSString *name2, NSInteger age2) {
        NSLog(@"%@---%ld", name2, (long)age2);
    }];
}


- (void)didReceiveMemoryWarning {
    [super didReceiveMemoryWarning];
    // Dispose of any resources that can be recreated.
}

@end
