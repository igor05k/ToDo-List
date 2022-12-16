//
//  ViewController.m
//  ToDo-List
//
//  Created by Igor Fernandes on 16/12/22.
//

#import "ViewController.h"
#import "DetailsViewController.h"

@interface ViewController () <UITableViewDelegate, UITableViewDataSource>

@property (strong, nonatomic) UITableView *tableView;

@end

@implementation ViewController

NSMutableArray *namesArray = nil;

+ (void)initialize {
    if(!namesArray) {
        namesArray = [NSMutableArray arrayWithObjects:@"Igor", @"Jessica", @"Caio", nil];
//        namesArray = [NSMutableArray new];
    }
}

- (void)viewDidLoad {
    [super viewDidLoad];
    // Do any additional setup after loading the view.
    _tableView = [[UITableView alloc] initWithFrame:CGRectMake(0, 0, self.view.frame.size.width, self.view.frame.size.height) style:UITableViewStylePlain];
    
    self.view.backgroundColor = [UIColor colorWithRed:0.95 green:0.95 blue:0.93 alpha:1];
    
    _tableView.dataSource = self;
    _tableView.delegate = self;
    [self.view addSubview:_tableView];
    
    [self configBarButtonItem];
}

- (void)configBarButtonItem {
    UIBarButtonItem *customButtonItem = [[UIBarButtonItem alloc] initWithBarButtonSystemItem:UIBarButtonSystemItemAdd target:self action:@selector(didTapAddButton)];
    
    self.navigationItem.rightBarButtonItem = customButtonItem;
}

- (void)didTapAddButton {
    UIAlertController *alertController = [UIAlertController alertControllerWithTitle:@"Attention" message:@"This is an alert" preferredStyle:UIAlertControllerStyleAlert];
    [alertController addTextFieldWithConfigurationHandler:^(UITextField * _Nonnull textField) {
        textField.placeholder = @"Type anything..";
    }];
    UIAlertAction *okAction = [UIAlertAction actionWithTitle:@"OK" style:UIAlertActionStyleDefault handler:^(UIAlertAction * _Nonnull action) {
        NSString *nameToAdd = alertController.textFields[0].text;
        NSString *nameTrimmed = [nameToAdd stringByTrimmingCharactersInSet:[NSCharacterSet whitespaceCharacterSet]];
        if (![nameTrimmed isEqualToString:@""]) {
            [namesArray addObject: nameTrimmed];
            [self.tableView reloadData];
        }
        
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
    
    UIStoryboard* storyboard = [UIStoryboard storyboardWithName:@"Main" bundle:nil];
    
    DetailsViewController* controller = [storyboard instantiateViewControllerWithIdentifier:@"details"];
    [self.navigationController pushViewController:controller animated:YES];
}


@end
