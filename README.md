# UITableView_Placeholder
效果：页面包含一个UITableVeiw，当没有数据的时候显示一张占位图片，点击图片可以重新刷新数据。
思路：为UITableView增加个Category，利用方法method_exchangeImplementations交换reloadData方法为real_ReloadData，
在real_ReloadData方法内判断是否有数据源，再动态显示占位的UIView。
有数据时：
![](http://upload-images.jianshu.io/upload_images/7567615-77ed47aaa1e8807b.png?imageMogr2/auto-orient/strip) 
无数据时：
![](http://upload-images.jianshu.io/upload_images/7567615-efbd420eab33f882.png?imageMogr2/auto-orient/strip%7CimageView2/2/w/1240) 
