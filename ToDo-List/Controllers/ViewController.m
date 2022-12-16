//
//  ViewController.m
//  ToDo-List
//
//  Created by Igor Fernandes on 16/12/22.
//

#import "ViewController.h"

@interface ViewController () <UITableViewDelegate, UITableViewDataSource>

@property (strong, nonatomic) UITableView *tableView;

@end

@implementation ViewController 

NSArray *names = @[@"Igor", @"Jessica", @"Caio"];

- (void)viewDidLoad {
    [super viewDidLoad];
    // Do any additional setup after loading the view.
    _tableView = [[UITableView alloc] initWithFrame:CGRectMake(0, 0, self.view.frame.size.width, self.view.frame.size.height) style:UITableViewStylePlain];
    
    _tableView.dataSource = self;
    _tableView.delegate = self;
    [self.view addSubview:_tableView];
    
    UIButton *customButtom = [UIButton buttonWithType:UIButtonTypeCustom];
    [customButtom setTitle:@"Add" forState:UIControlStateNormal];
    [customButtom setTitleColor:UIColor.blueColor forState:UIControlStateNormal];
    customButtom.frame = CGRectMake(0, 0, 50, 50);
    
    UIBarButtonItem *customButtonItem = [[UIBarButtonItem alloc] initWithCustomView:customButtom];
    
    self.navigationItem.rightBarButtonItem = customButtonItem;
    
   
}

- (UITableViewCell *)tableView:(UITableView *)tableView cellForRowAtIndexPath:(NSIndexPath *)indexPath {
    UITableViewCell *cell = [tableView dequeueReusableCellWithIdentifier:@"cell"];
    if (cell == nil) {
        cell = [[UITableViewCell alloc] initWithStyle:UITableViewCellStyleDefault reuseIdentifier:@"cell"];
    }
    cell.textLabel.text = names[indexPath.row];
    return cell;
}

- (NSInteger)tableView:(UITableView *)tableView numberOfRowsInSection:(NSInteger)section {
    return names.count;
}

- (void)tableView:(UITableView *)tableView didSelectRowAtIndexPath:(NSIndexPath *)indexPath {
    [tableView deselectRowAtIndexPath: indexPath animated: true];
}


@end
