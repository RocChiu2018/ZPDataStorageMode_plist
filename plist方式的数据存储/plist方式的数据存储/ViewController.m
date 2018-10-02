//
//  ViewController.m
//  plist方式的数据存储
//
//  Created by apple on 16/6/28.
//  Copyright © 2016年 apple. All rights reserved.
//

/**
 每个iOS应用都有自己的应用沙盒(应用沙盒就是文件系统目录)，与其他文件系统隔离。应用必须待在自己的沙盒里，其他应用不能访问该沙盒。
 
 沙盒里面的文件夹有如下几个：
 1、Documents文件夹：保存应用运行时生成的需要持久化的数据，iTunes同步设备时会备份该目录。例如，游戏应用可将游戏存档保存在该目录；
 2、tmp：保存应用运行时所需的临时数据，使用完毕后再将相应的文件从该目录中删除。应用没有运行时，系统也可能会清除该目录下的文件。iTunes同步设备时不会备份该目录；
 3、Library文件夹中的Caches文件夹：保存应用运行时生成的需要持久化的数据，iTunes同步设备时不会备份该目录。一般存储体积大、不需要备份的不重要的数据；
 4、Library文件夹中的Preference文件夹：保存应用的所有偏好设置，iOS的Settings(设置)应用会在该目录中查找应用的设置信息。iTunes同步设备时会备份该目录。
 
 iOS中数据存储的常用方式：
 1、XML属性列表(plist)存储方式：这种存储方式只能存储一些Foundation框架中的对象类型（数组、字典等）的数据，而不能存储非对象类型（基本数据类型）或者自定义对象类型的数据，所以这种存储方式具有一定的局限性。这种存储方式是把要存储的数据以plist文件的方式存储到手机沙盒中的Documents文件夹中；
 2、Preferences（偏好设置）存储方式：这种存储方式一般存储简单的软件参数配置的数据，比如是否自动登录等等，而不能存储大批量的数据。这种存储方式可以存储一些Foundation框架中的对象类型（数组、字典等）的数据，同时也可以存储非对象类型（基本数据类型）的数据，只不过在存储非对象类型数据的时候在系统编译的时候系统会自动把非对象类型的数据转换为对象类型的数据存储在plist文件中，例如：在编译过程中系统会把float类型的数据转换为NSNumber类型的数据。但是这种存储方式不能存储自定义对象类型的数据，所以它具有一定的局限性。这种存储方式是把要存储的数据以plist文件的方式存储到手机沙盒中的Library文件夹中的Preferences文件夹里面；
 3、NSKeyedArchiver归档(NSCoding)存储方式：这种存储方式不仅可以存储Foundation框架中的对象类型（数组、字典等）的数据以及非对象类型（基本数据类型）的数据，还可以存储自定义对象类型的数据，所以这种存储方式具有广泛性；
 4、SQLite3：适用于存储大批量的数据；
 5、Core Data：封装了SQLite3，但是效率低下。
 */

#import "ViewController.h"

@interface ViewController ()

@end

@implementation ViewController

#pragma mark ————— 生命周期 —————
- (void)viewDidLoad
{
    [super viewDidLoad];
    // Do any additional setup after loading the view, typically from a nib.
}

#pragma mark ————— 点击保存按钮 —————
- (IBAction)save
{
    //获取沙盒的根路径
    NSString *homePath = NSHomeDirectory();
    
    //获取沙盒里面的Documents文件夹的路径
    NSString *documentsPath = [homePath stringByAppendingPathComponent:@"Documents"];
    
    //获取将要存储在沙盒中的Documents文件夹内的plist文件的路径
    NSString *filePath = [documentsPath stringByAppendingPathComponent:@"data.plist"];
    NSLog(@"filePath = %@", filePath);
    
    NSArray *array = [NSArray arrayWithObjects:[NSNumber numberWithFloat:0.3], @"dddddvf", @"ddmckdmck", nil];
    
    //用plist的存储方式把数据存储在沙盒中的Documents文件夹内
    [array writeToFile:filePath atomically:YES];
}

#pragma mark ————— 点击读取按钮 —————
- (IBAction)read
{
    NSString *documentsPath = [NSHomeDirectory() stringByAppendingPathComponent:@"Documents"];
    NSString *filePath = [documentsPath stringByAppendingPathComponent:@"data.plist"];
    
    //从沙盒中的Documents文件夹内读取数据
    NSArray *array = [NSArray arrayWithContentsOfFile:filePath];
    NSLog(@"array = %@", array);
}

- (void)didReceiveMemoryWarning {
    [super didReceiveMemoryWarning];
    // Dispose of any resources that can be recreated.
}

@end
