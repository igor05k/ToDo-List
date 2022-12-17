//
//  DetailsViewController.m
//  ToDo-List
//
//  Created by Igor Fernandes on 16/12/22.
//

#import "DetailsViewController.h"
#import "Notes.h"
#import "ViewController.h"

@interface DetailsViewController ()

@property (strong, nonatomic) UITextView *customTextView;

@end

@implementation DetailsViewController

- (void)viewDidLoad {
    [super viewDidLoad];
    [self configTextField];
    
    UITapGestureRecognizer *singleFingerTap =
      [[UITapGestureRecognizer alloc] initWithTarget:self
                                              action:@selector(handleSingleTap:)];
    [self.customTextView addGestureRecognizer:singleFingerTap];
    NSLog(@"%@", self.notes.identifier);
    NSLog(@"%@", self.notes.description);
}

- (void)handleSingleTap:(UITapGestureRecognizer *)recognizer {
    [self.customTextView becomeFirstResponder];

    UIBarButtonItem *customButtonItem = [[UIBarButtonItem alloc] initWithBarButtonSystemItem:UIBarButtonSystemItemSave target:self action:@selector(didTapSaveButton)];
    
    self.navigationItem.rightBarButtonItem = customButtonItem;
    self.customTextView.editable = YES;
}

- (void)configTextField {
    _customTextView = [[UITextView alloc] initWithFrame:CGRectMake(0, 0, self.view.frame.size.width, self.view.frame.size.height)];
    

    self.customTextView.font = [UIFont systemFontOfSize:22.0];
    self.customTextView.backgroundColor = [UIColor colorWithRed:0.95 green:0.95 blue:0.93 alpha:1];
    self.customTextView.scrollEnabled = YES;
    self.customTextView.alwaysBounceVertical = YES;
    self.customTextView.editable = NO;
    
    self.customTextView.clipsToBounds = YES;
    self.customTextView.keyboardDismissMode = UIScrollViewKeyboardDismissModeInteractive;
    self.customTextView.keyboardType = UIKeyboardTypeDefault;
    
    [self.view addSubview:_customTextView];
    [self configBarButtonItem];
}

- (void)configBarButtonItem {
    UIBarButtonItem *customButtonItem = [[UIBarButtonItem alloc] initWithBarButtonSystemItem:UIBarButtonSystemItemEdit target:self action:@selector(didTapEditButton)];
    
    self.navigationItem.rightBarButtonItem = customButtonItem;
}

- (void)didTapSaveButton {
    UIBarButtonItem *customButtonItem = [[UIBarButtonItem alloc] initWithBarButtonSystemItem:UIBarButtonSystemItemEdit target:self action:@selector(didTapEditButton)];
    [self.customTextView resignFirstResponder];

    NSUserDefaults *defaults = [NSUserDefaults standardUserDefaults];
    
    [self.notes setNoteDescription:self.customTextView.text];
    // save description text into userdefaults
    [defaults setObject:self.customTextView.text forKey:self.notes.identifier.UUIDString];
    [defaults synchronize];
    
//    NSString *valueSaved = [defaults objectForKey:self.notes.identifier.UUIDString];
    NSLog(@"%@", self.notes.description);
    NSLog(@"%@", self.customTextView.text);
//    NSLog(@"%@", valueSaved);
    
    self.navigationItem.rightBarButtonItem = customButtonItem;
    self.customTextView.editable = NO;
}


- (void)didTapEditButton {
    [self.customTextView becomeFirstResponder];

    UIBarButtonItem *customButtonItem = [[UIBarButtonItem alloc] initWithBarButtonSystemItem:UIBarButtonSystemItemSave target:self action:@selector(didTapSaveButton)];
    
    self.navigationItem.rightBarButtonItem = customButtonItem;
    self.customTextView.editable = YES;
    NSLog(@"%@", self.notes.noteTitle);
    NSLog(@"%@", self.notes.description);
}

- (BOOL)canBecomeFirstResponder {
    return true;
}

@end
