//
//  TicketEditorViewController.m
//  Ticket Generator
//
//  Created by Azat on 12/16/15.
//  Copyright © 2015 Azat. All rights reserved.
//

#import "TicketEditorViewController.h"

@interface TicketEditorViewController ()

@end

@implementation TicketEditorViewController

- (void)viewDidLoad {
    [super viewDidLoad];
    //self.TicketImageView.image = self.ticketImage;
    //self.TicketImageView.frame = self.view.frame;
    float width = 2208;
    float height = 1242;
    self.firstGradientStartX = 25 / width;
    self.firstGradientEndX = 740 / width;
    self.secondGradientStartX = 1525 / width;
    self.secondGradientEndX = 2160 / width;
    self.firstTextStartY = 70 / height;
    self.firstTextEndY = 155 / height;
    self.secondTextStartY = 458 / height;
    self.secondTextEndY = 537 / height;
    self.dateInGradientStartY = 135 / height;
    self.dateInGradientEndY = 485 / height;
    self.currentDateStartX = 420 / width;
    self.currentDateEndX = 1782 / width;
    self.currentDateStartY = 856 / height;
    self.currentDateEndY = 950 / height;
    self.expirationDateStartX = 668 / width;
    self.expirationDateEndX = 1600 / width;
    self.expirationDateStartY = 1130 / height;
    self.expirationDateEndY = 1210 / height;
    self.imageWidth = self.ticketImage.size.width;
    self.imageHeight = self.ticketImage.size.height;
    
    CGRect firstTextRect = CGRectMake(self.firstGradientStartX * self.imageWidth, self.firstTextStartY * self.imageHeight, self.firstGradientEndX * self.imageWidth - self.firstGradientStartX * self.imageWidth, self.firstTextEndY * self.imageHeight - self.firstTextStartY * self.imageHeight);
    UIImage* img = [self getRGBAsFromImage:self.ticketImage withRect:firstTextRect];
    CGRect secondTextRect = CGRectMake(self.firstGradientStartX * self.imageWidth, self.secondTextStartY * self.imageHeight, self.firstGradientEndX * self.imageWidth - self.firstGradientStartX * self.imageWidth, self.secondTextEndY * self.imageHeight - self.secondTextStartY * self.imageHeight);
    img = [self getRGBAsFromImage:img withRect:secondTextRect];
    CGRect dateInGradientRect = CGRectMake(self.secondGradientStartX * self.imageWidth, self.dateInGradientStartY * self.imageHeight, self.secondGradientEndX * self.imageWidth - self.secondGradientStartX * self.imageWidth, self.dateInGradientEndY * self.imageHeight - self.dateInGradientStartY * self.imageHeight);
    img = [self getRGBAsFromImage:img withRect:dateInGradientRect];
    CGRect currentDateRect = CGRectMake(self.currentDateStartX * self.imageWidth, self.currentDateStartY * self.imageHeight, self.currentDateEndX * self.imageWidth - self.currentDateStartX * self.imageWidth, self.currentDateEndY * self.imageHeight - self.currentDateStartY * self.imageHeight);
    img = [self getRGBAsFromImage:img withRect:currentDateRect];
    CGRect expirationDateRect = CGRectMake(self.expirationDateStartX * self.imageWidth, self.expirationDateStartY * self.imageHeight, self.expirationDateEndX * self.imageWidth - self.expirationDateStartX * self.imageWidth, self.expirationDateEndY * self.imageHeight - self.expirationDateStartY * self.imageHeight);
    img = [self getRGBAsFromImage:img withRect:expirationDateRect];
    self.TicketImageView.image = img;
    // Do any additional setup after loading the view from its nib.
}

- (void)didReceiveMemoryWarning {
    [super didReceiveMemoryWarning];
    // Dispose of any resources that can be recreated.
}

- (IBAction)backButtonTouchUpInside:(id)sender {
    [self.delegate ticketEditorViewControllerDidFinidh:self];
}

- (UIImage*)getRGBAsFromImage:(UIImage*)image withRect:(CGRect)rect
{
    CGColorSpaceRef colorSpace = CGColorSpaceCreateDeviceRGB();
    
    CGImageRef imageRef = [image CGImage];
    
    NSUInteger width = CGImageGetWidth(imageRef);
    NSUInteger height = CGImageGetHeight(imageRef);
    
    unsigned char *imageData = malloc(height * width * 4);
    
    NSUInteger bytesPerPixel = CGImageGetBitsPerPixel(imageRef) / 8;
    NSUInteger bytesPerRow = CGImageGetBytesPerRow(imageRef);
    NSUInteger bitsPerComponent = CGImageGetBitsPerComponent(imageRef);
    
    CGContextRef context = CGBitmapContextCreate(imageData,
                                                 width,
                                                 height,
                                                 bitsPerComponent,
                                                 bytesPerRow,
                                                 colorSpace,
                                                 (CGBitmapInfo)kCGImageAlphaPremultipliedLast);
    CGColorSpaceRelease(colorSpace);
    
    CGContextDrawImage(context, CGRectMake(0, 0, width, height), imageRef);
    
    //Get color at start point
    for (int i = rect.origin.y; i < (rect.origin.y + rect.size.height); i++) {
        for (int j = rect.origin.x; j < (rect.origin.x + rect.size.width); j++) {
            //unsigned int byteIndex = (bytesPerRow * startY) + startX * bytesPerPixel;
            unsigned int copyByteIndex = (bytesPerRow * i) + ((j + 1) * bytesPerPixel);
            unsigned int sourceByteIndex =  (bytesPerRow * i) + (j * bytesPerPixel);
            imageData[copyByteIndex] = 111;//imageData[sourceByteIndex];
            imageData[copyByteIndex + 1] = 111;//imageData[sourceByteIndex + 1];
            imageData[copyByteIndex + 2] = 111;//imageData[sourceByteIndex + 2];
            imageData[copyByteIndex + 3] = 255;//imageData[sourceByteIndex + 3];
        }
    }
    
    
    CGImageRef newCGImage = CGBitmapContextCreateImage(context);
    
    UIImage *result = [UIImage imageWithCGImage:newCGImage];
    
    CGImageRelease(newCGImage);
    
    CGContextRelease(context);
    
    free(imageData);
    
    return  result;
    
//    int startX = x;
//    int startY = y;
//    unsigned int byteIndex = (bytesPerRow * startY) + startX * bytesPerPixel;
//    
//    unsigned int ocolor = getColorCode(byteIndex, imageData);
//    float red   = ((0xff000000 & ocolor) >> 24)/255.0f;
//    float green = ((0x00ff0000 & ocolor) >> 16)/255.0f;
//    float blue  = ((0x0000ff00 & ocolor) >> 8)/255.0f;
//    float alpha =  (0x000000ff & ocolor)/255.0f;
//    UIColor *acolor = [UIColor colorWithRed:red green:green blue:blue alpha:alpha];
//    return acolor;
}


unsigned int getColorCode (unsigned int byteIndex, unsigned char *imageData)
{
    unsigned int red   = imageData[byteIndex];
    unsigned int green = imageData[byteIndex + 1];
    unsigned int blue  = imageData[byteIndex + 2];
    unsigned int alpha = imageData[byteIndex + 3];
    
    return (red << 24) | (green << 16) | (blue << 8) | alpha;
                                          }

/*
#pragma mark - Navigation

// In a storyboard-based application, you will often want to do a little preparation before navigation
- (void)prepareForSegue:(UIStoryboardSegue *)segue sender:(id)sender {
    // Get the new view controller using [segue destinationViewController].
    // Pass the selected object to the new view controller.
}
*/

@end
