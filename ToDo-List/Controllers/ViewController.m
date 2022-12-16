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

NSMutableArray *namesArray = nil;

+ (void)initialize {
    if(!namesArray) {
        namesArray = [NSMutableArray arrayWithObjects:@"Igor", @"Jessica", @"Caio", nil];
    }
}

- (void)viewDidLoad {
    [super viewDidLoad];
    // Do any additional setup after loading the view.
    _tableView = [[UITableView alloc] initWithFrame:CGRectMake(0, 0, self.view.frame.size.width, self.view.frame.size.height) style:UITableViewStylePlain];
    
    _tableView.dataSource = self;
    _tableView.delegate = self;
    [self.view addSubview:_tableView];
    
    [self configBarButtonItem];
}

- (void)configBarButtonItem {
    UIButton *customButtom = [UIButton buttonWithType:UIButtonTypeCustom];
    [customButtom setTitle:@"Add" forState:UIControlStateNormal];
    [customButtom setTitleColor:UIColor.blueColor forState:UIControlStateNormal];
    customButtom.frame = CGRectMake(0, 0, 50, 50);
    
    UIBarButtonItem *customButtonItem = [[UIBarButtonItem alloc] initWithBarButtonSystemItem:UIBarButtonSystemItemAdd target:self action:@selector(didTapAddButton)];
    
    self.navigationItem.rightBarButtonItem = customButtonItem;
}

- (void)didTapAddButton {
    printf("tap add\n");
    
    UIAlertController *alertController = [UIAlertController alertControllerWithTitle:@"Attention" message:@"This is an alert" preferredStyle:UIAlertControllerStyleAlert];
    UIAlertAction *okAction = [UIAlertAction actionWithTitle:@"OK" style:UIAlertActionStyleDefault handler:^(UIAlertAction * _Nonnull action) {
        printf("ok tapped");
        [namesArray addObject:@"Anderson"];
        [self.tableView reloadData];
    }];
    [alertController addAction:okAction];
    [self presentViewController:alertController animated: true completion: nil];
    
}


- (UITableViewCell *)tableView:(UITableView *)tableView cellForRowAtIndexPath:(NSIndexPath *)indexPath {
    UITableViewCell *cell = [tableView dequeueReusableCellWithIdentifier:@"cell"];
    if (cell == nil) {
        cell = [[UITableViewCell alloc] initWithStyle:UITableViewCellStyleDefault reuseIdentifier:@"cell"];
    }
    cell.textLabel.text = namesArray[indexPath.row];
    return cell;
}

- (NSInteger)tableView:(UITableView *)tableView numberOfRowsInSection:(NSInteger)section {
    return namesArray.count;
}

- (void)tableView:(UITableView *)tableView didSelectRowAtIndexPath:(NSIndexPath *)indexPath {
    [tableView deselectRowAtIndexPath: indexPath animated: true];
}


@end
