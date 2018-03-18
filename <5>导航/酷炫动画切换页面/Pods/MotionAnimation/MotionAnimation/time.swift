import Foundation

extension Int {
    var second:  NSTimeInterval { return NSTimeInterval(self) }
    var seconds: NSTimeInterval { return NSTimeInterval(self) }
    var minute:  NSTimeInterval { return NSTimeInterval(self * 60) }
    var minutes: NSTimeInterval { return NSTimeInterval(self * 60) }
    var hour:    NSTimeInterval { return NSTimeInterval(self * 3600) }
    var hours:   NSTimeInterval { return NSTimeInterval(self * 3600) }
}

extension Double {
    var second:  NSTimeInterval { return self }
    var seconds: NSTimeInterval { return self }
    var minute:  NSTimeInterval { return self * 60 }
    var minutes: NSTimeInterval { return self * 60 }
    var hour:    NSTimeInterval { return self * 3600 }
    var hours:   NSTimeInterval { return self * 3600 }
}// 版权属于原作者
// http://code4app.com (cn) http://code4app.net (en)
// 发布代码于最专业的源码分享网站: Code4App.com