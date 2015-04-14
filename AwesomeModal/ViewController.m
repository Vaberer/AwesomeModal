//
//  ViewController.m
//  AwesomeModal
//
//  Created by Patrik Vaberer on 4/14/15.
//  Copyright (c) 2015 Patrik Vaberer. All rights reserved.
//

#import "ViewController.h"
#import "EditItemVC.h"
@interface ViewController ()<EditControllerDelegate>
@property (weak, nonatomic) IBOutlet UILabel *lReturnedText;

@end

@implementation ViewController

- (void)viewDidLoad {
    [super viewDidLoad];
    // Do any additional setup after loading the view, typically from a nib.
}

- (IBAction)bShowModal:(id)sender {
    
    UIStoryboard *storyboard = self.storyboard;
    EditItemVC *controller = (EditItemVC *)[storyboard instantiateViewControllerWithIdentifier:@"editItem"];
    controller.delegateEdit = self;
    controller.textFieltText = @"Patrik Vaberer";
    controller.desc = @"Change your name";
    controller.identificator = @(2);
    
    controller.modalPresentationStyle = UIModalPresentationCustom;
    controller.transitioningDelegate = controller;
    [self presentViewController:controller animated:YES completion:nil];
    
}

- (void)didDismissEditControllerWithNewValue:(NSString *)newValue identificator:(id)identificator {
    
    self.lReturnedText.text = [NSString stringWithFormat:@"ID returned: %@, value: %@", identificator, newValue];
    
}


@end
