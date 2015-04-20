# AwesomeModal
Custom Modal Window to change text




<p align="center">
  <img src="https://github.com/Vaberer/AwesomeModal/blob/master/demo.gif" />
</p>

Custom Modal Abstract Window with UITextfield input and custom transitions. 
Modal window is designed to call the whole controller, set title, textfield text and new value is returned  by calling delegate.


Installation

Copy the controller from the storyboard to your project.

Copy files <code>AwesomeModalVC.h</code>, <code>AwesomeModalVC.m</code> and <code>PVAnimator.h</code>, <code>PVAnimator.m</code>

Calling the controller and setting values:

```Objective-C
    UIStoryboard *storyboard = self.storyboard;
    AwesomeModalVC *controller = (AwesomeModalVC *)[storyboard instantiateViewControllerWithIdentifier:@"AwesomeModalVC"];
    controller.delegateEdit = self;
    controller.textFieltText = @"Patrik Vaberer";
    controller.desc = @"Change your name";
    controller.identificator = @(2);
    
    controller.modalPresentationStyle = UIModalPresentationCustom;
    controller.transitioningDelegate = controller;
    [self presentViewController:controller animated:YES completion:nil];
```

<code>identificator</code> property is just for your own purposes. The same value will be returned in the delegate method.


Calling <code>AwesomeModalDelegate</code> delegate:

```Objective-C
- (void)didDismissAwesomeModalWithNewValue:(NSString *)newValue identificator:(id)identificator {
    
	//callback when modal window is dismissed by pressing OK button
    
}
```
<h2>Author</h2>

Patrik Vaberer, patrik.vaberer@gmail.com<br/>
<a target="_blank" href="https://sk.linkedin.com/in/vaberer">LinkedIn</a><br>
<a target="_blank" href="http://vaberer.me">Blog</a>


<h2>Licence</h2>

AwesomeModal is available under the MIT license. See the LICENSE file for more info.
