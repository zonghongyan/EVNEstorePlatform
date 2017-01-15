//
//  MineCenterViewController.m
//  EVNEstorePlatform
//
//  Created by developer on 2016/12/30.
//  Copyright © 2016年 仁伯安. All rights reserved.
//

#import "MineCenterViewController.h"
#import "UIView+MJExtension.h"
#import "HelpHeaderFile.h"

@interface MineCenterViewController ()
{
    NSArray *dataArray;
    NSArray *imageArray;
    CGFloat cellHeight;
}

@end

@implementation MineCenterViewController

- (void)viewDidLoad
{
    [super viewDidLoad];
    // Do any additional setup after loading the view.

    [self.view setBackgroundColor:[UIColor whiteColor]];
    cellHeight = 66;
    dataArray = @[@"蒙奇.D.路飞-船长-橡胶果实能力者",@"诺诺亚罗.索隆-副船长角色",@"乌索普-狙击手",@"娜美-航海士-(兼财产保管员)",@"山治-厨师-2号恶魔之子",@"乔巴-船医-蓝鼻子驯鹿",@"弗兰奇-船工",@"尼克.罗宾-历史学家-花花果实能力者",@"布鲁克-音乐家-黄泉果实能力者-西洋剑客"];
    imageArray = @[@"lufei.png",@"suolong.png",@"wusuopu.png",@"namei.png",@"shanzhi.png",@"qiaoba.png",@"fulanqi.png",@"luobin.png",@"buluke.png"];
    [self.view addSubview:self.tableView];

    UIView *topBkView = [[UIView alloc] initWithFrame:CGRectMake(0, 0, 66, 30)];
    topBkView.backgroundColor = [UIColor clearColor];
    [topBkView addSubview:self.navTitleView];
    self.navigationItem.titleView = topBkView;

}

- (void)didReceiveMemoryWarning {
    [super didReceiveMemoryWarning];
    // Dispose of any resources that can be recreated.
}

- (UIImageView *)navTitleView
{
    if (!_navTitleView)
    {
        _navTitleView = [[UIImageView alloc] initWithFrame:CGRectMake(0, 0, 66, 66)];
        _navTitleView.image = [UIImage imageNamed:@"lufei.png"];
        _navTitleView.contentMode = UIViewContentModeScaleAspectFit;
        _navTitleView.layer.cornerRadius = _navTitleView.bounds.size.width/2;
        _navTitleView.layer.masksToBounds = YES;
    }

    return _navTitleView;
}

- (UITableView *)tableView
{
    if (!_tableView)
    {
        _tableView = [[UITableView alloc] initWithFrame:CGRectMake(0, 0, MainScreenWidth, MainScreenHeight - 64 - 49)];
        _tableView.dataSource = self;
        _tableView.delegate = self;
        _tableView.separatorStyle = UITableViewCellSeparatorStyleNone;

    }

    return _tableView;
}

- (NSInteger)numberOfSectionsInTableView:(UITableView *)tableView
{
    return 2;
}

- (NSInteger)tableView:(UITableView *)tableView numberOfRowsInSection:(NSInteger)section {
    if (section == 0)
    {
        return 1;
    }
    else
    {
        return dataArray.count;
    }
}

- (UITableViewCell *)tableView:(UITableView *)tableView cellForRowAtIndexPath:(NSIndexPath *)indexPath
{
    if (indexPath.section == 0)
    {
        NSString *ident = @"AboutCell";
        UITableViewCell *cell = [tableView dequeueReusableCellWithIdentifier:ident];
        if (!cell)
        {
            cell = [[UITableViewCell alloc] initWithStyle:UITableViewCellStyleDefault reuseIdentifier:ident];
            cell.selectionStyle = UITableViewCellSelectionStyleNone;

            UILabel *titleLab = [[UILabel alloc] initWithFrame:CGRectMake((MainScreenWidth - 110)/2.f, 33, 110, 30)];
            titleLab.textColor = [UIColor darkTextColor];
            titleLab.tag = 110;
            [cell.contentView addSubview:titleLab];
            titleLab.font = [UIFont systemFontOfSize:20];

            UILabel *contentLab = [[UILabel alloc] initWithFrame:CGRectMake((MainScreenWidth - 250)/2.f, titleLab.frame.origin.y + titleLab.frame.size.height, 250, 30)];
            contentLab.textColor = [UIColor darkTextColor];
            contentLab.tag = 111;
            contentLab.textAlignment = NSTextAlignmentCenter;
            [cell.contentView addSubview:contentLab];
            contentLab.font = [UIFont systemFontOfSize:14];

        }

        UILabel *titleLab = (UILabel *)[cell.contentView viewWithTag:110];
        titleLab.text = @"蒙奇.D.路飞";
        UILabel *contentLab = (UILabel *)[cell.contentView viewWithTag:111];
        contentLab.text = @"一个要成为海贼王的男人";

        return cell;
    }
    else
    {

        static NSString *reUseID = @"contentCellID";
        UITableViewCell *cell = [tableView dequeueReusableCellWithIdentifier:reUseID];

        if (!cell)
        {
            cell = [[UITableViewCell alloc] initWithStyle:UITableViewCellStyleDefault reuseIdentifier:reUseID];
            cell.selectionStyle = UITableViewCellSelectionStyleNone;


            UIImageView *imageView = [[UIImageView alloc] initWithFrame:CGRectMake(10, 10, cellHeight - 20, cellHeight - 20)];
            imageView.tag = 110;
            imageView.layer.cornerRadius = imageView.bounds.size.width/2;
            imageView.clipsToBounds = YES;

            [cell.contentView addSubview:imageView];

            UILabel *titleLab = [[UILabel alloc] initWithFrame:CGRectMake(imageView.frame.origin.x + imageView.frame.size.width + 10, (cellHeight - 30)/2.f, MainScreenWidth- 20 - imageView.frame.size.width - 10, 30)];
            titleLab.textColor = [UIColor darkTextColor];
            titleLab.tag = 111;
            [cell.contentView addSubview:titleLab];
            titleLab.font = [UIFont systemFontOfSize:14];
        }

        UIImageView *imageView = (UIImageView *)[cell.contentView viewWithTag:110];
        imageView.image = [UIImage imageNamed:imageArray[indexPath.row]];

        UILabel *titleLab = (UILabel *)[cell.contentView viewWithTag:111];
        titleLab.text  = dataArray[indexPath.row];

        return cell;
    }
}

- (CGFloat)tableView:(UITableView *)tableView heightForRowAtIndexPath:(NSIndexPath *)indexPath
{
    if (indexPath.section == 0)
    {
        return 99;
    }
    else
    {
        return cellHeight;
    }
}

- (UIView *)tableView:(UITableView *)tableView viewForHeaderInSection:(NSInteger)section
{
    if (section == 1)
    {
        UIView *buttonView = [[UIView alloc] initWithFrame:CGRectMake(0, 0, MainScreenWidth, cellHeight - 20)];
        buttonView.backgroundColor = [UIColor colorWithRed:27/255.f green:29/255.f blue:41/255.f alpha:1.0];
        UIButton *button = [UIButton buttonWithType:UIButtonTypeCustom];
        button.frame = CGRectMake(10, 0, MainScreenWidth - 20, buttonView.frame.size.height);

        [button setTitle:@"草帽军团" forState:UIControlStateNormal];
        button.titleLabel.font = [UIFont systemFontOfSize:22];
        button.titleLabel.textColor = [UIColor whiteColor];
        button.contentHorizontalAlignment = UIControlContentHorizontalAlignmentLeft;

        [buttonView addSubview:button];
        return buttonView;
    }
    else
    {
        return nil;
    }
}

- (CGFloat)tableView:(UITableView *)tableView heightForHeaderInSection:(NSInteger)section
{
    if (section == 0)
    {
        return 0;
    }
    else
    {
        return cellHeight - 20;
    }
}

// MARK: 滑动代理
- (void)scrollViewDidScroll:(UIScrollView *)scrollView
{
    CGFloat contentSet = scrollView.contentOffset.y + _tableView.contentInset.top;

    if (contentSet >= 0 && contentSet <= 30)
    {
        _navTitleView.transform = CGAffineTransformMakeScale(1 - contentSet/60.f, 1-contentSet/60.f);
        _navTitleView.mj_y = 0;
    }
    else if (contentSet > 30)
    {
        _navTitleView.transform = CGAffineTransformMakeScale(0.5, 0.5);
        _navTitleView.mj_y = 0;
    }
    else if (contentSet < 0 )
    {
        _navTitleView.transform = CGAffineTransformMakeScale(1, 1);
        _navTitleView.mj_y = 0;
    }
    
}



@end
