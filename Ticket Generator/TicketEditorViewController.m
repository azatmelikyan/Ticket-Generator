//
//  TicketEditorViewController.m
//  Ticket Generator
//
//  Created by Azat on 12/16/15.
//  Copyright © 2015 Azat. All rights reserved.
//

#import "TicketEditorViewController.h"

@interface TicketEditorViewController ()
{
    UILabel *_firstTextLabel;
    UILabel *_secondTextLabel;
    UILabel *_dateInGradientMonthTextLabel;
    UILabel *_dateInGradientYearTextLabel;
    UILabel *_currentDateTextLabel;
    UILabel *_expirationDateTextLabel;
}
@property (weak, nonatomic) IBOutlet UIView *ticketContainerView;

@end

@implementation TicketEditorViewController

- (void)viewDidLoad {
    [super viewDidLoad];
    //self.TicketImageView.image = self.ticketImage;
    //self.TicketImageView.frame = self.view.frame;
    [self initializeCordinates];
    //self.TicketImageView.image = self.ticketImage;
    [self cleanChangeableAreasAndSetTicketImage];
    
    [self setupTextLabels];
    // Do any additional setup after loading the view from its nib.
    
//    UIView *v = [UIView new];
//    v.frame = CGRectMake(164, 8, 240, 128);
//    v.backgroundColor = [UIColor redColor];
//    v.autoresizingMask =
////    UIViewAutoresizingFlexibleRightMargin |
////                        UIViewAutoresizingFlexibleLeftMargin |
////                        UIViewAutoresizingFlexibleBottomMargin |
////                        UIViewAutoresizingFlexibleTopMargin |
//    UIViewAutoresizingFlexibleWidth |
//    UIViewAutoresizingFlexibleHeight;
//    [self.ticketContainerView addSubview:v];
    
}

-(void)initializeCordinates {
    float width = 2208;
    float height = 1242;
    self.firstGradientStartX = 25 / width;
    self.firstGradientEndX = 740 / width;
    self.secondGradientStartX = 1525 / width;
    self.secondGradientEndX = 2167 / width;
    self.firstTextStartY = 70 / height;
    self.firstTextEndY = 155 / height;
    self.secondTextStartY = 458 / height;
    self.secondTextEndY = 537 / height;
    self.dateInGradientMonthStartX = 1678 / width;
    self.dateInGradientMonthEndX = 2015 / width;
    self.dateInGradientMonthStartY = 139 / height;
    self.dateInGradientMonthEndY = 268 / height;
    self.dateInGradientYearStartX = 1628 / width;
    self.dateInGradientYearEndX = 2065 / width;
    self.dateInGradientYearStartY = 347 / height;
    self.dateInGradientYearEndY = 477 / height;
    self.currentDateStartX = 420 / width;
    self.currentDateEndX = 1782 / width;
    self.currentDateStartY = 851 / height;
    self.currentDateEndY = 951 / height;
    self.expirationDateStartX = 668 / width;
    self.expirationDateEndX = 1600 / width;
    self.expirationDateStartY = 1130 / height;
    self.expirationDateEndY = 1210 / height;
    self.imageWidth = self.ticketImage.size.width;
    self.imageHeight = self.ticketImage.size.height;

}

-(void)cleanChangeableAreasAndSetTicketImage {
    CGRect firstTextRect = CGRectMake(self.firstGradientStartX * self.imageWidth, self.firstTextStartY * self.imageHeight, self.firstGradientEndX * self.imageWidth - self.firstGradientStartX * self.imageWidth, self.firstTextEndY * self.imageHeight - self.firstTextStartY * self.imageHeight);
    UIImage* img = [self getRGBAsFromImage:self.ticketImage withRect:firstTextRect];
    CGRect secondTextRect = CGRectMake(self.firstGradientStartX * self.imageWidth, self.secondTextStartY * self.imageHeight, self.firstGradientEndX * self.imageWidth - self.firstGradientStartX * self.imageWidth, self.secondTextEndY * self.imageHeight - self.secondTextStartY * self.imageHeight);
    img = [self getRGBAsFromImage:img withRect:secondTextRect];
    
    CGRect dateInGradientMonthRect = CGRectMake(self.secondGradientStartX * self.imageWidth, self.dateInGradientMonthStartY * self.imageHeight, self.secondGradientEndX * self.imageWidth - self.secondGradientStartX * self.imageWidth, self.dateInGradientMonthEndY * self.imageHeight - self.dateInGradientMonthStartY * self.imageHeight);
    img = [self getRGBAsFromImage:img withRect:dateInGradientMonthRect];
    
    CGRect dateInGradientYearRect = CGRectMake(self.secondGradientStartX * self.imageWidth, self.dateInGradientYearStartY * self.imageHeight, self.secondGradientEndX * self.imageWidth - self.secondGradientStartX * self.imageWidth, self.dateInGradientYearEndY * self.imageHeight - self.dateInGradientYearStartY * self.imageHeight);
    img = [self getRGBAsFromImage:img withRect:dateInGradientYearRect];
    
    
    CGRect currentDateRect = CGRectMake(self.currentDateStartX * self.imageWidth, self.currentDateStartY * self.imageHeight, self.currentDateEndX * self.imageWidth - self.currentDateStartX * self.imageWidth, self.currentDateEndY * self.imageHeight - self.currentDateStartY * self.imageHeight);
    img = [self getRGBAsFromImage:img withRect:currentDateRect];
    CGRect expirationDateRect = CGRectMake(self.expirationDateStartX * self.imageWidth, self.expirationDateStartY * self.imageHeight, self.expirationDateEndX * self.imageWidth - self.expirationDateStartX * self.imageWidth, self.expirationDateEndY * self.imageHeight - self.expirationDateStartY * self.imageHeight);
    img = [self getRGBAsFromImage:img withRect:expirationDateRect];
    self.TicketImageView.image = img;

}

-(void)setupTextLabels {
//    float width = self.ticketContainerView.bounds.size.width;
//    float height = self.self.ticketContainerView.bounds.size.height;
//    CGFloat x = self.secondGradientStartX * width;
//    CGFloat y = self.dateInGradientMonthStartY * height;
//    CGFloat w = self.secondGradientEndX * width - self.secondGradientStartX * width;
//    CGFloat h = (self.dateInGradientMonthEndY - self.dateInGradientMonthStartY) * height;
//    CGFloat cX = x + w / 2;
//    CGFloat cY = y + h / 2;
//    CGRect r = CGRectMake( 0, 0, w, h);
//    _dateInGradientMonthTextLabel = [[UILabel alloc] initWithFrame:r];
//    _dateInGradientMonthTextLabel.center = CGPointMake(cX, cY);
//    [_dateInGradientMonthTextLabel setText:@"DEC"];
//    _dateInGradientMonthTextLabel.textColor = [UIColor redColor];
//    _dateInGradientMonthTextLabel.alpha = 0.7;
//    [_dateInGradientMonthTextLabel setBackgroundColor:[UIColor blueColor]];
//    [_dateInGradientMonthTextLabel setFont:[UIFont fontWithName: @"HelveticaNeue-Bold" size: 50.0f]];
//    _dateInGradientMonthTextLabel.textAlignment = NSTextAlignmentCenter;
//    _dateInGradientMonthTextLabel.autoresizingMask =
//    UIViewAutoresizingFlexibleLeftMargin |
//    UIViewAutoresizingFlexibleWidth        |
//    UIViewAutoresizingFlexibleRightMargin  |
//    UIViewAutoresizingFlexibleTopMargin |
//    UIViewAutoresizingFlexibleHeight      |
//    UIViewAutoresizingFlexibleBottomMargin;
    NSString* fontName = @"HelveticaNeue-Bold";
    [self setUpLabel:_dateInGradientMonthTextLabel withStartX:self.secondGradientStartX startY:self.dateInGradientMonthStartY endX:self.secondGradientEndX endY:self.dateInGradientMonthEndY text:@"DEC" fontSize:50.0f fontName:fontName];
    fontName = @"Arial-BoldMT";
    [self setUpLabel:_dateInGradientYearTextLabel withStartX:self.secondGradientStartX startY:self.dateInGradientYearStartY endX:self.secondGradientEndX endY:self.dateInGradientYearEndY text:@"2015" fontSize:55.0f fontName:fontName];
    [self setUpLabel:_firstTextLabel withStartX:self.firstGradientStartX startY:self.firstTextStartY endX:self.firstGradientEndX endY:self.firstTextEndY text:self.topText fontSize:33.0f fontName:fontName];
    [self setUpLabel:_secondTextLabel withStartX:self.firstGradientStartX startY:self.secondTextStartY endX:self.firstGradientEndX endY:self.secondTextEndY text:self.bottomText fontSize:33.0f fontName:fontName];
    [self setUpLabel:_currentDateTextLabel withStartX:self.currentDateStartX startY:self.currentDateStartY endX:self.currentDateEndX endY:self.currentDateEndY text:@"Tue, Dec 15 04:06:31 PM" fontSize:33.0f fontName:fontName];
    [self setUpLabel:_expirationDateTextLabel withStartX:self.expirationDateStartX startY:self.expirationDateStartY endX:self.expirationDateEndX endY:self.expirationDateEndY text:@"Expires in 16:21:53:29" fontSize:25.0f fontName:fontName];
    //self.ticketContainerView.autoresizingMask;
    //[self.ticketContainerView addSubview:_dateInGradientMonthTextLabel];
}

-(void)setUpLabel:(UILabel*)laber withStartX:(CGFloat)startX startY:(CGFloat)startY endX:(CGFloat)endX endY:(CGFloat)endY text:(NSString*)text fontSize:(CGFloat)fontSize fontName:(NSString*)fontName{
    float width = self.ticketContainerView.bounds.size.width;
    float height = self.self.ticketContainerView.bounds.size.height;
    CGFloat x = startX * width;
    CGFloat y = startY * height;
    CGFloat w = endX * width - startX * width;
    CGFloat h = (endY - startY) * height;
    CGFloat cX = x + w / 2;
    CGFloat cY = y + h / 2;
    CGRect r = CGRectMake( 0, 0, w, h);
    laber = [[UILabel alloc] initWithFrame:r];
    laber.center = CGPointMake(cX, cY);
    [laber setText:text];
    laber.textColor = [UIColor blackColor];
    //laber.alpha = 0.7;
    //[laber setBackgroundColor:[UIColor blueColor]];
    [laber setFont:[UIFont fontWithName: fontName size: fontSize]]; // HelveticaNeue-Bold or Arial-BoldMT
    laber.textAlignment = NSTextAlignmentCenter;
    laber.autoresizingMask =
    UIViewAutoresizingFlexibleLeftMargin |
    UIViewAutoresizingFlexibleWidth        |
    UIViewAutoresizingFlexibleRightMargin  |
    UIViewAutoresizingFlexibleTopMargin |
    UIViewAutoresizingFlexibleHeight      |
    UIViewAutoresizingFlexibleBottomMargin;
    [self.ticketContainerView addSubview:laber];
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
            imageData[copyByteIndex] = imageData[sourceByteIndex];
            imageData[copyByteIndex + 1] = imageData[sourceByteIndex + 1];
            imageData[copyByteIndex + 2] = imageData[sourceByteIndex + 2];
            imageData[copyByteIndex + 3] = imageData[sourceByteIndex + 3];
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
