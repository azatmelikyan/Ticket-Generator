//
//  ViewController.h
//  Ticket Generator
//
//  Created by Azat on 12/15/15.
//  Copyright © 2015 Azat. All rights reserved.
//

#import <UIKit/UIKit.h>

@interface ViewController : UIViewController<UIPickerViewDataSource, UIPickerViewDelegate>

@property (weak, nonatomic) IBOutlet UITextField *topTextField;

@property (weak, nonatomic) IBOutlet UITextField *bottomTextField;

@end

