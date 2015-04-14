//
//  EditItemVC.h
//  SmartRecord
//
//  Created by Patrik Vaberer on 11/7/14.
//  Copyright (c) 2014 Patrik Vaberer. All rights reserved.
//

#import <UIKit/UIKit.h>


@protocol EditControllerDelegate <NSObject>

- (void)didDismissEditControllerWithNewValue:(NSString *)newValue identificator:(id)identificator;

@end


@interface EditItemVC : UIViewController<UIViewControllerTransitioningDelegate>
@property (nonatomic, strong) NSString *desc;
@property (nonatomic, strong) NSString *textFieltText;
@property (nonatomic, weak) id delegateEdit;

@property (nonatomic, strong) id identificator;

@property (weak, nonatomic) IBOutlet UIView *vView;
@property (weak, nonatomic) IBOutlet UIButton *bDismiss;


@end
