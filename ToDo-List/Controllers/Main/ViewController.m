//
//  ViewController.m
//  ToDo-List
//
//  Created by Igor Fernandes on 16/12/22.
//

#import "ViewController.h"
#import "DetailsViewController.h"
#import "Notes.h"

@interface ViewController () <UITableViewDelegate, UITableViewDataSource>

@property (strong, nonatomic) UITableView *tableView;
@property (strong, nonatomic) NSMutableArray<Notes *> *notesArray;

@end

@implementation ViewController

- (void)viewDidLoad {
    [super viewDidLoad];
    self.notesArray = [NSMutableArray new];
    self.title = @"Todo List";
    
    // Do any additional setup after loading the view.
    self.tableView = [[UITableView alloc] initWithFrame:CGRectMake(0, 0, self.view.frame.size.width, self.view.frame.size.height) style:UITableViewStylePlain];
    
    self.tableView.backgroundColor = [UIColor colorWithRed:0.95 green:0.95 blue:0.93 alpha:1];
    
    self.tableView.dataSource = self;
    self.tableView.delegate = self;
    [self.view addSubview:self.tableView];
    [self fetchNotes];
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
            Notes *myNotes = [[Notes alloc] initWithIdentifier:[NSUUID UUID] noteTitle:nameTrimmed noteText:@"NOTE TEXT PADRAO"];

            NSUserDefaults *defaults = [NSUserDefaults standardUserDefaults];
            NSData *data = [NSKeyedArchiver archivedDataWithRootObject:myNotes requiringSecureCoding:true error:nil];
            
            [defaults setObject:data forKey:@"notesArray"];
            [defaults synchronize];
            
            [self.notesArray addObject: myNotes];
            [self.tableView reloadData];
        }
    }];
    UIAlertAction *cancelAction = [UIAlertAction actionWithTitle:@"Cancel" style:UIAlertActionStyleDestructive handler: nil];
    
    [alertController addAction:cancelAction];
    [alertController addAction:okAction];
    [self presentViewController:alertController animated: true completion: nil];
}


- (UITableViewCell *)tableView:(UITableView *)tableView cellForRowAtIndexPath:(NSIndexPath *)indexPath {
    UITableViewCell *cell = [tableView dequeueReusableCellWithIdentifier:@"cell"];
    if (cell == nil) {
        cell = [[UITableViewCell alloc] initWithStyle:UITableViewCellStyleDefault reuseIdentifier:@"cell"];
    }
    
    cell.textLabel.text = self.notesArray[indexPath.row].noteTitle;
    return cell;
}

- (NSInteger)tableView:(UITableView *)tableView numberOfRowsInSection:(NSInteger)section {
    return self.notesArray.count;
}

- (void)fetchNotes {
    Notes *noteSelected;
//    NSUserDefaults *defaults = [NSUserDefaults standardUserDefaults];
//    NSString *value = [defaults objectForKey:noteSelected.identifier.UUIDString];
//    NSLog(@"%@", value);
    NSLog(@"%@", noteSelected.identifier.UUIDString);
    
    NSUserDefaults *defaults = [NSUserDefaults standardUserDefaults];
    if ([defaults boolForKey:noteSelected.identifier.UUIDString]) {
        NSLog(@"Data is saved in NSUserDefaults");
    } else {
        NSLog(@"Data is not saved in NSUserDefaults");
    }
}

- (void)tableView:(UITableView *)tableView didSelectRowAtIndexPath:(NSIndexPath *)indexPath {
    [tableView deselectRowAtIndexPath: indexPath animated: true];
    Notes *noteSelected = self.notesArray[indexPath.row];
    
//    NSUserDefaults *defaults = [NSUserDefaults standardUserDefaults];

    UIStoryboard* storyboard = [UIStoryboard storyboardWithName:@"Main" bundle:nil];
    DetailsViewController* controller = [storyboard instantiateViewControllerWithIdentifier:@"details"];
    controller.notes = noteSelected;
    
    [self.navigationController pushViewController:controller animated:YES];
}

@end
