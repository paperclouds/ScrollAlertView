//
//  ViewController.m
//  ScrollAlertView
//
//  Created by sw on 2022/10/31.
//

#import "ViewController.h"

@interface ViewController ()

@property (weak, nonatomic) IBOutlet UILabel *label;
@property (weak, nonatomic) IBOutlet UIScrollView *scrollView;
@property (weak, nonatomic) IBOutlet NSLayoutConstraint *scrollHeight;


@end

@implementation ViewController

- (void)viewDidLoad {
    [super viewDidLoad];
    // Do any additional setup after loading the view.

    
//    self.label.text = @"测试";
    self.label.text = @"本科生教务系统(含选课及教务服务)将于9月6日23:00起进行维护，维护时间预计1小时，期间系统可能无法访问。为了避免影响您正常使用相关服务，请您提前做好相应处理。带来的不便，敬请广大师生谅解。本科生教务系统(含选课及教务服务)将于9月6日23:00起进行维护。";
//    self.label.text = @"本科生教务系统(含选课及教务服务)将于9月6日23:00起进行维护，维护时间预计1小时，期间系统可能无法访问。为了避免影响您正常使用相关服务，请您提前做好相应处理。带来的不便，敬请广大师生谅解。本科生教务系统(含选课及教务服务)将于9月6日23:00起进行维护，维护时间预计1小时，期间系统可能无法访问。为了避免影响您正常使用相关服务，请您提前做好相应处理。带来的不便，敬请广大师生谅解。";
}

-(void)viewDidAppear:(BOOL)animated{
    if(self.scrollView.contentSize.height < 138){
        self.scrollHeight.constant = 138;
    }else if (self.scrollView.contentSize.height > 230){
        self.scrollHeight.constant = 230;
    }else{
        self.scrollHeight.constant = self.scrollView.contentSize.height;
    }
}


@end
