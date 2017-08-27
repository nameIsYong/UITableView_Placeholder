//
//  ViewController.m
//  TableViewPlaceholder
//
//  Created by administrator on 2017/8/26.
//
//

#import "ViewController.h"
#import "UITableView+Placeholder.h"
#import "PlaceholderView.h"
#import "SVProgressHUD.h"

#define WeakSelf(weakSelf)  __weak __typeof(&*self)weakSelf = self;
#define StrongSelf(strongSelf) __strong __typeof(self)strongSelf = weakSelf;

@interface ViewController ()<UITableViewDelegate,UITableViewDataSource>
@property(nonatomic,weak)UITableView *tableView;
@end

@implementation ViewController
{
    NSArray *_datas;
}

- (void)viewDidLoad {
    [super viewDidLoad];
    
//    _datas = @[@"第一条数据",@"第二条数据"];
    [self setupSubViews];
    //延迟两秒，模拟请求网络数据
//    dispatch_after(dispatch_time(DISPATCH_TIME_NOW, (int64_t)(2.0*NSEC_PER_SEC)),dispatch_get_main_queue(),^{
//        [self httpRequest_NoData];
//    });
}
-(void)setupSubViews
{
    CGRect frame = [UIScreen mainScreen].bounds;
    UITableView *tableView = [[UITableView alloc]initWithFrame:frame style:UITableViewStylePlain];
    tableView.delegate = self;
    tableView.dataSource = self;
    WeakSelf(weakSelf);
    tableView.placeHolderView = [[PlaceholderView alloc]initWithFrame:tableView.bounds onTapView:^{
        StrongSelf(strongSelf);
        [strongSelf httpRequest_data];
    }];
    self.tableView = tableView;
    [self.view addSubview:tableView];
}
- (NSInteger)tableView:(UITableView *)tableView numberOfRowsInSection:(NSInteger)section
{
    return _datas.count;
}
- (UITableViewCell *)tableView:(UITableView *)tableView cellForRowAtIndexPath:(NSIndexPath *)indexPath
{
    static NSString *ID=@"cell";
    UITableViewCell *cell = [[UITableViewCell alloc]initWithStyle:UITableViewCellStyleValue1 reuseIdentifier:ID];
    cell.textLabel.text = _datas[indexPath.row];
    return cell;
}
/** 模拟刷新 无数据  */
-(void)httpRequest_NoData
{
    [SVProgressHUD showWithStatus:@"正在刷新数据"];
    dispatch_after(dispatch_time(DISPATCH_TIME_NOW, (int64_t)(2.0*NSEC_PER_SEC)),dispatch_get_main_queue(),^{
        _datas = nil;
        [SVProgressHUD dismissWithDelay:0];
        [self.tableView reloadData];
    });
}
/** 模拟刷新 有数据  */
-(void)httpRequest_data
{
    [SVProgressHUD showWithStatus:@"正在刷新数据"];
    dispatch_after(dispatch_time(DISPATCH_TIME_NOW, (int64_t)(2.0*NSEC_PER_SEC)),dispatch_get_main_queue(),^{
        _datas = @[@"第一条数据",@"第二条数据",@"第三条",@"........"];
        [SVProgressHUD dismissWithDelay:0];
        [self.tableView reloadData];
    });
}



@end
