//
//  EditItemVC.m
//  SmartRecord
//
//  Created by Patrik Vaberer on 11/7/14.
//  Copyright (c) 2014 Patrik Vaberer. All rights reserved.
//

#import "EditItemVC.h"

#import "PVAnimator.h"

@interface EditItemVC()<UITextFieldDelegate>
@property (weak, nonatomic) IBOutlet UILabel *lDescription;
@property (weak, nonatomic) IBOutlet UITextField *fTextField;
@property (weak, nonatomic) IBOutlet UIVisualEffectView *vVisual;
@property (weak, nonatomic) IBOutlet UIButton *bOK;

@end



@implementation EditItemVC


- (void) viewDidLoad {
    
    
    [super viewDidLoad];
    self.lDescription.text = self.desc;
    self.fTextField.text = self.textFieltText;
    self.fTextField.delegate = self;
    [self.fTextField becomeFirstResponder];
    self.vView.layer.cornerRadius = 5;
    
}


- (IBAction)bDismissController {
    
    
    [self.fTextField resignFirstResponder];
    [self dismissViewControllerAnimated:YES completion:^{
        
        
        
        
    }];
    
    
}

- (IBAction)bOKPressed {
    
    
    [self.fTextField resignFirstResponder];
    [self dismissViewControllerAnimated:YES completion:^{
        
        if ([self.delegateEdit respondsToSelector:@selector(didDismissEditControllerWithNewValue:identificator:)]) {
            
            [self.delegateEdit didDismissEditControllerWithNewValue:self.fTextField.text identificator:self.identificator];
        }
        
        
        
    }];
    
}

#pragma mark - UITextViewDelegate
- (BOOL)textFieldShouldReturn:(UITextField *)textField {
    
    
    [self dismissViewControllerAnimated:YES completion:^{
        
        if ([self.delegateEdit respondsToSelector:@selector(didDismissEditControllerWithNewValue:identificator:)]) {
            [self.delegateEdit didDismissEditControllerWithNewValue:self.fTextField.text identificator:self.identificator];
            
        }
        
    }];
    return YES;
}




- (IBAction)tapView:(id)sender {
    
    [self bDismissController];
}


//MARK: animators
- (id <UIViewControllerAnimatedTransitioning>)animationControllerForPresentedController:(UIViewController *)presented presentingController:(UIViewController *)presenting sourceController:(UIViewController *)source {
    
    return [[PVAnimator alloc] initWithShow:YES];
    
}

- (id <UIViewControllerAnimatedTransitioning>)animationControllerForDismissedController:(UIViewController *)dismissed {
    
    return [[PVAnimator alloc] initWithShow:NO];
    
}
@end
