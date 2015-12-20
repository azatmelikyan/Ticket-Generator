//
//  ViewController.m
//  Ticket Generator
//
//  Created by Azat on 12/15/15.
//  Copyright © 2015 Azat. All rights reserved.
//

#import "ViewController.h"
#import "LandscapeUIImagePickerController.h"
#import "TicketEditorViewController.h"

@interface ViewController () <UIImagePickerControllerDelegate, TicketEditorViewControllerDelegate>

@property (weak, nonatomic) IBOutlet UIImageView *imageView;
@property (strong,nonatomic) LandscapeUIImagePickerController* imagePicker;
@property (strong,nonatomic) TicketEditorViewController* ticketEditor;

@end

@implementation ViewController

- (void)viewDidLoad {
    [super viewDidLoad];
    self.view.backgroundColor = [UIColor grayColor];
    self.topTextField.autocorrectionType = UITextAutocorrectionTypeNo;
    self.bottomTextField.autocorrectionType = UITextAutocorrectionTypeNo;
    UITapGestureRecognizer *tapGesture = [UITapGestureRecognizer new];
    [tapGesture addTarget:self action:@selector(handleTap:)];
    [self.view addGestureRecognizer:tapGesture];
    // Do any additional setup after loading the view, typically from a nib.
}

-(void)handleTap:(UITapGestureRecognizer*)sender {
    [self.view endEditing:YES];
}

- (IBAction)screenshotButtonTouchUpInside:(id)sender {
    self.imagePicker = [[LandscapeUIImagePickerController alloc] init];
    self.imagePicker.allowsEditing = NO;
    self.imagePicker.delegate = self;
//    self.imagePicker.sourceType = UIImagePickerControllerSourceTypePhotoLibrary;
    
    [self presentViewController:self.imagePicker animated:YES completion:nil];
}

- (IBAction)startButtonTouchUpInside:(id)sender {
    if (self.imageView.image == nil) {
        UIAlertView *alert = [[UIAlertView alloc] initWithTitle:@"Error"
                                                        message:@"Please choose screenshot!"
                                                       delegate:nil
                                              cancelButtonTitle:@"OK"
                                              otherButtonTitles:nil];
        [alert show];
        return;
    }
    if (!(self.topTextField.text) || self.topTextField.text.length <= 0) {
        UIAlertView *alert = [[UIAlertView alloc] initWithTitle:@"Error"
                                                        message:@"Please insert the top text!"
                                                       delegate:nil
                                              cancelButtonTitle:@"OK"
                                              otherButtonTitles:nil];
        [alert show];
        return;
    }
    if (!(self.bottomTextField.text) || self.bottomTextField.text.length <= 0) {
        UIAlertView *alert = [[UIAlertView alloc] initWithTitle:@"Error"
                                                        message:@"Please insert the bottom text!"
                                                       delegate:nil
                                              cancelButtonTitle:@"OK"
                                              otherButtonTitles:nil];
        [alert show];
        return;
    }
    self.ticketEditor = [TicketEditorViewController new];
    self.ticketEditor.ticketImage = self.imageView.image;
    self.ticketEditor.topText = self.topTextField.text;
    self.ticketEditor.bottomText = self.bottomTextField.text;
    self.ticketEditor.delegate = self;
    self.ticketEditor.topText = self.topTextField.text;
    self.ticketEditor.bottomText = self.bottomTextField.text;
    [self presentViewController:self.ticketEditor animated:YES completion:nil];
}

- (void)didReceiveMemoryWarning {
    [super didReceiveMemoryWarning];
    // Dispose of any resources that can be recreated.
}

#pragma mark - UIImagePickerDelegate

-(void)imagePickerControllerDidCancel:(UIImagePickerController *)picker{
    [[picker presentingViewController] dismissViewControllerAnimated:YES completion:nil];
}

-(void)imagePickerController:(UIImagePickerController *)picker didFinishPickingMediaWithInfo:(NSDictionary<NSString *,id> *)info{
    [[picker presentingViewController] dismissViewControllerAnimated:YES completion:nil];
    self.imageView.image = info[UIImagePickerControllerOriginalImage];
}


#pragma mark - TicketEditorViewControllerDelegate

-(void)ticketEditorViewControllerDidFinidh:(TicketEditorViewController *)controller{
    [[controller presentingViewController] dismissViewControllerAnimated:YES completion:nil];
    self.ticketEditor = nil;
}

@end
