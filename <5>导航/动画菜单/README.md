# EFAnimationMenu
* This is a rotating menu, it is very convenient to use.
* Special thanks to the effect of the original author:czda1100.
![cmd-markdown-logo](http://ww3.sinaimg.cn/bmiddle/a47c92bdjw1es8d0dzmayg20a30ibwt7.gif)

# Communication
* If you found a bug, and can provide steps to reliably reproduce it, open an issue.
* If you have a feature request, open an issue.
* If you want to contribute, submit a pull request.

# Installation

* pod 'EFAnimationMenu', '~> 0.0.8'

# Usage 
```javascript
- (void)viewDidLoad {
    [super viewDidLoad];
    // Do any additional setup after loading the view, typically from a nib.

    self.viewController = ({
    EFAnimationViewController *viewController = [[EFAnimationViewController alloc] init];
    [self.view addSubview:viewController.view];
    [self addChildViewController:viewController];
    [viewController didMoveToParentViewController:self];
    viewController;
    });
}
```

# Feedback
* Have any problem in use, welcome back to me, you can communicate with me with the following contact
* QQMail: 327592992@qq.com

# About author

* With their own strength and speed, go where you want to go!