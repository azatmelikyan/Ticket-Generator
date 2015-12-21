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

@interface ViewController () <UIImagePickerControllerDelegate, TicketEditorViewControllerDelegate>{
    
    NSArray *_pickerData;
    NSString* _fontName;
}

@property (weak, nonatomic) IBOutlet UIImageView *imageView;
@property (strong,nonatomic) LandscapeUIImagePickerController* imagePicker;
@property (strong,nonatomic) TicketEditorViewController* ticketEditor;
@property (weak, nonatomic) IBOutlet UIPickerView *FontTypePicker;

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
    
    // Connect data:
    self.FontTypePicker.delegate = self;
    self.FontTypePicker.dataSource = self;
    _pickerData = @[@"HelveticaNeue-Bold", @"Arial-BoldMT", @"AppleSDGothicNeo-SemiBold", @"AppleSDGothicNeo-Bold", @"ArialHebrew-Bold", @"ArialRoundedMTBold", @"AvenirNext-Bold", @"AvenirNext-DemiBold", @"AvenirNextCondensed-Bold", @"TrebuchetMS-Bold"];
    // Do any additional setup after loading the view, typically from a nib.
}

-(void)handleTap:(UITapGestureRecognizer*)sender {
    [self.view endEditing:YES];
}

- (NSUInteger)supportedInterfaceOrientations {
    return UIInterfaceOrientationMaskLandscape;
}

// Tell the system It should autorotate
- (BOOL) shouldAutorotate {
    return YES;
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
    self.ticketEditor.fontName = _fontName;
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


#pragma Picker
// The number of columns of data
- (int)numberOfComponentsInPickerView:(UIPickerView *)pickerView
{
    return 1;
}

// The number of rows of data
- (int)pickerView:(UIPickerView *)pickerView numberOfRowsInComponent:(NSInteger)component
{
    return _pickerData.count;
}

// The data to return for the row and component (column) that's being passed in
- (NSString*)pickerView:(UIPickerView *)pickerView titleForRow:(NSInteger)row forComponent:(NSInteger)component
{
    _fontName = _pickerData[row];
    return _fontName;
}

@end
