//
//  ViewController.m
//  LOL-HeroList
//
//  Created by zhengna on 15/6/17.
//  Copyright (c) 2015年 zhengna. All rights reserved.
//

#import "ViewController.h"
#import "Hero.h"

@interface ViewController () <UITableViewDataSource, UITableViewDelegate>

@property (nonatomic,strong) NSArray *heros;

@end

@implementation ViewController

//lazy load
- (NSArray *)heros
{
    
    if(!_heros){
        NSString *path = [[NSBundle mainBundle] pathForResource:@"heros" ofType:@"plist"];
        NSArray *arr = [NSArray arrayWithContentsOfFile:path];
        NSMutableArray *arrm = [NSMutableArray arrayWithCapacity:arr.count];
        
        for (NSDictionary *dict in arr) {
            Hero *hero = [Hero heroWithDict:dict];
            [arrm addObject: hero];
        }
        _heros = [arrm copy];
    }
    
    return _heros;
}


- (void)viewDidLoad {
    [super viewDidLoad];
    // Do any additional setup after loading the view, typically from a nib.
}

- (void)didReceiveMemoryWarning {
    [super didReceiveMemoryWarning];
    // Dispose of any resources that can be recreated.
}

#pragma mark - UITableViewDataSource
- (NSInteger)tableView:(UITableView *)tableView numberOfRowsInSection:(NSInteger)section
{
    return self.heros.count;
    
}

//the return defaut value is 1 even the method was not overrided
//-(NSInteger)tableView:(UITableView *)tableView sectionForSectionIndexTitle:(NSString *)title atIndex:(NSInteger)index
//{
//    return 1;
//}

- (UITableViewCell *)tableView:(UITableView *)tableView cellForRowAtIndexPath:(NSIndexPath *)indexPath
{
    static NSString *identifier = @"heroCell";
    UITableViewCell *cell = [tableView dequeueReusableCellWithIdentifier:identifier];
    
    if (!cell) {
        cell = [[UITableViewCell alloc] initWithStyle:UITableViewCellStyleSubtitle reuseIdentifier:identifier];
    }
    //get the model of hero
    Hero *hero = self.heros[indexPath.row];
    cell.textLabel.text = hero.name;
    cell.detailTextLabel.text = hero.intro;
    cell.detailTextLabel.textColor = [UIColor orangeColor];
    cell.imageView.image = [UIImage imageNamed:hero.icon];
    
    cell.accessoryType = UITableViewCellAccessoryDisclosureIndicator;
    
    return cell;
}

#pragma mark - UITableViewDelegate
//the return value is 44 even the method is commented.
- (CGFloat) tableView:(UITableView *)tableView heightForRowAtIndexPath:(NSIndexPath *)indexPath
{
    return 60;
}

- (BOOL)prefersStatusBarHidden
{
    return YES;
}

@end
