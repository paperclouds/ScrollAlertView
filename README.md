# ScrollAlertView
Xib弹框展示多行文字父视图根据子视图高度自适应
项目开发中经常会遇到弹框的需求，如果弹框中文字内容是固定的那么弹框高度也是固定的很好写。如果文字从接口获取，并且要求弹框高度随文字高度变化就要考虑多种情况了。

至少要考虑三种情况，分别给弹框设置一个最小高度和最大高度。

1.如果当前文字内容高度<规定的文字内容最小高度 ，那么当前弹框高度=规定的弹框最小高度

2.如果规定的文字内容最小高度<当前文字内容高度<规定的文字内容最大高度 ，那么当前弹框高度根据当前文字高度自适应

3.如果当前文字内容高度>规定的文字内容最大高度 ，那么当前弹框高度=规定的弹框最大高度，并且多出来的文字通过滑动展示


Xib中具体操作如下：
1.添加一个ScrollView，添加上下左右和高度约束

![](https://upload-images.jianshu.io/upload_images/2466108-092780d7bdf161aa.png?imageMogr2/auto-orient/strip%7CimageView2/2/w/1240)

2.在ScrollView里面添加一个Label，并设置文字为多行

![](https://upload-images.jianshu.io/upload_images/2466108-54db688a97567477.png?imageMogr2/auto-orient/strip%7CimageView2/2/w/1240)

3.双指按住Label，拖向ScrollView松开，分别添加上下左右约束，并且把约束设置为0

![](https://upload-images.jianshu.io/upload_images/2466108-3fb8e1820be8c735.png?imageMogr2/auto-orient/strip%7CimageView2/2/w/1240)

4.设置Label和ScrollView的宽度相等
![](https://upload-images.jianshu.io/upload_images/2466108-b6c6d74dd882237a.png?imageMogr2/auto-orient/strip%7CimageView2/2/w/1240)

5.把Label、ScrollView和ScrollView的高度约束拖动到.m文件

![image](https://user-images.githubusercontent.com/8154610/198965529-a2f50e86-396e-4029-8910-2a8150097e13.png)


6.在.m文件添加如下代码，给ScrollView分别设置一个最小高度和最大高度，分别测试短文本和长文本的效果。注：如果是UIView，设置高度的代码要放在  `layoutSubviews`方法里面

```
- (void)viewDidLoad {
    [super viewDidLoad];
    // Do any additional setup after loading the view.

    
//    self.label.text = @"测试";
//    self.label.text = @"本科生教务系统(含选课及教务服务)将于9月6日23:00起进行维护，维护时间预计1小时，期间系统可能无法访问。为了避免影响您正常使用相关服务，请您提前做好相应处理。带来的不便，敬请广大师生谅解。本科生教务系统(含选课及教务服务)将于9月6日23:00起进行维护。";
    self.label.text = @"本科生教务系统(含选课及教务服务)将于9月6日23:00起进行维护，维护时间预计1小时，期间系统可能无法访问。为了避免影响您正常使用相关服务，请您提前做好相应处理。带来的不便，敬请广大师生谅解。本科生教务系统(含选课及教务服务)将于9月6日23:00起进行维护，维护时间预计1小时，期间系统可能无法访问。为了避免影响您正常使用相关服务，请您提前做好相应处理。带来的不便，敬请广大师生谅解。";
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
```

7.测试效果如下：

![超短文本](https://upload-images.jianshu.io/upload_images/2466108-7ef295c9fc8035c7.jpeg?imageMogr2/auto-orient/strip%7CimageView2/2/w/500)

![短文本](https://upload-images.jianshu.io/upload_images/2466108-4c76adbc352427f5.jpeg?imageMogr2/auto-orient/strip%7CimageView2/2/w/500)

![长文本](https://upload-images.jianshu.io/upload_images/2466108-b97007b30892e5c4.jpeg?imageMogr2/auto-orient/strip%7CimageView2/2/w/500)








