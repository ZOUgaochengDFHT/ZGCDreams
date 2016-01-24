//
//  ZGCMovieMediaListViewController.m
//  GCDDownProject
//
//  Created by GaoCheng.Zou on 16/1/23.
//  Copyright © 2016年 like. All rights reserved.
//

#import "ZGCMovieMediaListViewController.h"
#import "ZGCMovieListTableViewCell.h"
#import "ZGCMovieListTableView.h"
#import "ZGCMovieAlbumModel.h"
#import "ZGCTracksModel.h"
#import "ZGCMediaListModel.h"
#import "ZGCLiveBlurView.h"
#import <UIImageView+WebCache.h>

@interface ZGCMovieMediaListViewController ()<UITableViewDataSource, UITableViewDelegate>
@property (weak, nonatomic) IBOutlet ZGCMovieListTableView *movieListTableView;
/**
 *  专辑数据模型
 */
@property (nonatomic, strong) ZGCMovieAlbumModel *movieAlbumModel;

@property (nonatomic, strong) ZGCTracksModel *tracksModel;
/**
 *  列表数据数组
 */
@property (nonatomic, strong) NSMutableArray *movieMediaListArr;

@end

@implementation ZGCMovieMediaListViewController

- (void)viewDidLoad {
    [super viewDidLoad];
    // Do any additional setup after loading the view.
    self.navigationItem.title = @"光影留声机【周三】";
    
    _movieMediaListArr = [NSMutableArray array];
    
    
//    [self setNavTitleColor:[UIColor whiteColor]];
    
    [self showLoadingStatus:@""
             requestWithUrl:[NSString stringWithFormat:@"%@%@%@", BASEURL, @"1/20?", DEVICECOMPONENT]
                 parameters:nil
          completionHandler:^(id result) {
              MYLog(@"result :%@", result);
              
              self.movieAlbumModel = [[ZGCMovieAlbumModel alloc]initContentWithDic:[result objectForKey:@"album"]];
              
              _tracksModel = [[ZGCTracksModel alloc]initContentWithDic:[result objectForKey:@"tracks"]];
              
              [_tracksModel.list enumerateObjectsUsingBlock:^(id  _Nonnull obj, NSUInteger idx, BOOL * _Nonnull stop) {
                  ZGCMediaListModel *mediaListModel = [[ZGCMediaListModel alloc]initContentWithDic:obj];
                  [_movieMediaListArr addObject:mediaListModel];
              }];
              
              [_movieListTableView reloadData];
              
    }];
    _movieListTableView.delegate = self;
    _movieListTableView.dataSource = self;
    
   }

- (void)setMovieAlbumModel:(ZGCMovieAlbumModel *)movieAlbumModel {
    _movieAlbumModel = movieAlbumModel;
    UIImageView *backgroundView = [[UIImageView alloc] initWithFrame:CGRectMake(0, 0, KScreenWidth, 200)];
    
//    [backgroundView sd_setImageWithURL:[NSURL URLWithString:_movieAlbumModel.coverOrigin] placeholderImage:PNGImage(@"shadow_albumView_header")];
//    backgroundView.isGlassEffectOn = YES;
    backgroundView.image = PNGImage(@"bgCover.jpg");
    backgroundView.contentMode = UIViewContentModeBottomRight;
    backgroundView.alpha = 0.5;
    _movieListTableView.tableHeaderView = backgroundView;
//    backgroundView.scrollView = _movieListTableView;

}

- (NSInteger)tableView:(UITableView *)tableView numberOfRowsInSection:(NSInteger)section {
    return _movieMediaListArr.count;
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
