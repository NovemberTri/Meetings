//
//  CreateMeetingViewController.m
//  Meetings_OC
//
//  Created by sxq on 2017/3/20.
//  Copyright © 2017年 sxq. All rights reserved.
//

#import "CreateMeetingViewController.h"
#import "MeetingsUIKit.h"

@interface CreateMeetingViewController ()
@property (weak, nonatomic) IBOutlet UIView *containerView;

@end

@implementation CreateMeetingViewController

- (void)viewDidLoad {
    [super viewDidLoad];
    // Do any additional setup after loading the view.
}

- (void)viewWillAppear:(BOOL)animated{
    [super viewWillAppear:animated];
    self.containerView.transform = CGAffineTransformMakeTranslation(0, self.containerView.frame.size.height);
    [UIView animateWithDuration:0.3 animations:^{
        self.containerView.transform = CGAffineTransformMakeTranslation(0, 0);
    }];
}

- (void)didReceiveMemoryWarning {
    [super didReceiveMemoryWarning];
    // Dispose of any resources that can be recreated.
}

#pragma mark - Actions

- (IBAction)cancel:(id)sender {
    [self dismissViewControllerAnimated:YES completion:nil];
}



@end
