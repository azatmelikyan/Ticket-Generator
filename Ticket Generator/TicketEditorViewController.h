//
//  TicketEditorViewController.h
//  Ticket Generator
//
//  Created by Azat on 12/16/15.
//  Copyright © 2015 Azat. All rights reserved.
//

#import <UIKit/UIKit.h>

@protocol TicketEditorViewControllerDelegate;

@interface TicketEditorViewController : UIViewController

@property (weak, nonatomic) id <TicketEditorViewControllerDelegate> delegate;

@property (weak, nonatomic) IBOutlet UIButton *backButton;
@property (weak, nonatomic) IBOutlet UIImageView *TicketImageView;
@property (nonatomic) UIImage* ticketImage;
@property (nonatomic) NSString* topText;
@property (nonatomic) NSString* bottomText;
@property (nonatomic) float firstGradientStartX;
@property (nonatomic) float firstGradientEndX;
@property (nonatomic) float secondGradientStartX;
@property (nonatomic) float secondGradientEndX;
@property (nonatomic) float firstTextStartY;
@property (nonatomic) float firstTextEndY;
@property (nonatomic) float secondTextStartY;
@property (nonatomic) float secondTextEndY;
@property (nonatomic) float dateInGradientStartY;
@property (nonatomic) float dateInGradientEndY;
@property (nonatomic) float currentDateStartX;
@property (nonatomic) float currentDateEndX;
@property (nonatomic) float currentDateStartY;
@property (nonatomic) float currentDateEndY;
@property (nonatomic) float expirationDateStartX;
@property (nonatomic) float expirationDateEndX;
@property (nonatomic) float expirationDateStartY;
@property (nonatomic) float expirationDateEndY;



@property (nonatomic) int imageWidth;
@property (nonatomic) int imageHeight;

@end

@protocol TicketEditorViewControllerDelegate <NSObject>

-(void)ticketEditorViewControllerDidFinidh:(TicketEditorViewController*)controller;

@end