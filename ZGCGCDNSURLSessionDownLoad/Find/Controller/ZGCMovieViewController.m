//
//  ZGCMovieViewController.m
//  GCDDownProject
//
//  Created by GaoCheng.Zou on 16/1/22.
//  Copyright © 2016年 like. All rights reserved.
//

#import "ZGCMovieViewController.h"
#import "ZGCMovieListTableViewCell.h"
#import "ZGCMovieListTableView.h"
@interface ZGCMovieViewController ()<UITableViewDataSource, UITableViewDelegate>
{
    UIView *_headView;
}
@property (weak, nonatomic) IBOutlet ZGCMovieListTableView *movieListTableView;
@end
@implementation ZGCMovieViewController


- (void)viewDidLoad {
    [super viewDidLoad];
    // Do any additional setup after loading the view.
    self.navigationItem.title = @"电影";
    _movieListTableView.delegate = self;
    _movieListTableView.dataSource = self;
    
//    _movieListTableView.contentInset = UIEdgeInsetsMake(200, 0, 0, 0);
//    //添加监听，动态观察tableview的contentOffset的改变
//    [_movieListTableView addObserver:self forKeyPath:@"contentOffset" options:NSKeyValueObservingOptionNew context:nil];
//    
//    
//    _headView = [[UIView alloc] initWithFrame:CGRectMake(0, 0, self.view.frame.size.width, 200)];
//    _headView.backgroundColor =[UIColor redColor];
//    [self.view addSubview:_headView];
//    
}

//#pragma mark KVC 回调
////本例设置headerView的最大高度为200，最小为64
//- (void)observeValueForKeyPath:(NSString *)keyPath ofObject:(id)object change:(NSDictionary *)change context:(void *)context
//{
//    if ([keyPath isEqualToString:@"contentOffset"])
//    {
//        CGPoint offset = [change[NSKeyValueChangeNewKey] CGPointValue];
//        if (offset.y <= 0 && -offset.y >= 64) {
//            
//            CGRect newFrame = CGRectMake(0, 0, self.view.frame.size.width, -offset.y);
//            _headView.frame = newFrame;
//            if (-offset.y <=200)
//            {
//                _movieListTableView.contentInset = UIEdgeInsetsMake(-offset.y, 0, 0, 0);
//            }
//        } else {
//            CGRect newFrame = CGRectMake(0, 0, self.view.frame.size.width, 64);
//            _headView.frame = newFrame;
//            _movieListTableView.contentInset = UIEdgeInsetsMake(64, 0, 0, 0);
//        }
//    }
//}

- (NSInteger)tableView:(UITableView *)tableView numberOfRowsInSection:(NSInteger)section {
    return 10;
}


- (CGFloat)tableView:(UITableView *)tableView heightForHeaderInSection:(NSInteger)section {
    return 40;
}

- (UITableViewCell *)tableView:(UITableView *)tableView cellForRowAtIndexPath:(NSIndexPath *)indexPath {
    /*
     *UITableView的MVC模式
     */
    static NSString *identifier = @"ZGCMovieListTableViewCell";
    ZGCMovieListTableViewCell *cell;
    //定义CustomCell的复用标识,这个就是刚才在CustomCell.xib中设置的那个Identifier,一定要相同,否则无法复用
    //根据复用标识查找TableView里是否有可复用的cell,有则返回给cell
    cell = (ZGCMovieListTableViewCell*)[tableView dequeueReusableCellWithIdentifier:identifier];
    //判断是否获取到复用cell,没有则从xib中初始化一个cell
    if (!cell) {
        //将Custom.xib中的所有对象载入
        NSArray *nib = [[NSBundle mainBundle] loadNibNamed:@"ZGCMovieListTableViewCell" owner:nil options:nil];
        //第一个对象就是CustomCell了
        cell = [nib objectAtIndex:0];
    }
    
    UIImage *cellArrowImage = PNGImage(@"cell_arrow");
    UIImageView *cellArrowImgView = [[UIImageView alloc]initWithFrame:(CGRect){0, 0, cellArrowImage.size.width, cellArrowImage.size.height}];
    cellArrowImgView.image = cellArrowImage;
    cell.accessoryView = cellArrowImgView;
    
    return cell;
}


- (void)tableView:(UITableView *)tableView didSelectRowAtIndexPath:(NSIndexPath *)indexPath {
    NSLog(@"WVWEVWEVWE :%ld", (long)indexPath.row);
}


- (void)didReceiveMemoryWarning {
    [super didReceiveMemoryWarning];
    // Dispose of any resources that can be recreated.
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
