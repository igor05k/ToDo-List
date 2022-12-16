//
//  DetailsViewController.m
//  ToDo-List
//
//  Created by Igor Fernandes on 16/12/22.
//

#import "DetailsViewController.h"

@interface DetailsViewController ()

@property (strong, nonatomic) UITextView *customTextView;

@end

@implementation DetailsViewController

NSString *inputText = @"";

- (void)viewDidLoad {
    [super viewDidLoad];
    [self configTextField];
    
    UITapGestureRecognizer *singleFingerTap =
      [[UITapGestureRecognizer alloc] initWithTarget:self
                                              action:@selector(handleSingleTap:)];
    [self.customTextView addGestureRecognizer:singleFingerTap];
}

- (void)handleSingleTap:(UITapGestureRecognizer *)recognizer
{
//  CGPoint location = [recognizer locationInView:[recognizer.view superview]];

  //Do stuff here...
    printf("tappp");
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
    
    self.navigationItem.rightBarButtonItem = customButtonItem;
    self.customTextView.editable = NO;
}


- (void)didTapEditButton {
    [self.customTextView becomeFirstResponder];

    UIBarButtonItem *customButtonItem = [[UIBarButtonItem alloc] initWithBarButtonSystemItem:UIBarButtonSystemItemSave target:self action:@selector(didTapSaveButton)];
    
    self.navigationItem.rightBarButtonItem = customButtonItem;
    self.customTextView.editable = YES;
}

- (BOOL)canBecomeFirstResponder {
    return true;
}

@end
