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

@property (weak, nonatomic) IBOutlet ZGCMovieListTableView *movieListTableView;
@end
@implementation ZGCMovieViewController


- (void)viewDidLoad {
    [super viewDidLoad];
    // Do any additional setup after loading the view.
    self.navigationItem.title = @"电影";
    _movieListTableView.delegate = self;
    _movieListTableView.dataSource = self;
}

- (NSInteger)tableView:(UITableView *)tableView numberOfRowsInSection:(NSInteger)section {
    return 10;
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
