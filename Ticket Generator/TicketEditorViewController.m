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
    UIView *_colorLineHiderView;
}
@property (weak, nonatomic) IBOutlet UIView *ticketContainerView;

@end

@implementation TicketEditorViewController

- (void)viewDidLoad {
    [super viewDidLoad];
    [self initializeCordinates];
    //self.TicketImageView.image = self.ticketImage; // TODO for testing
    [self cleanChangeableAreasAndSetTicketImage];
    [self setupTextLabels];
    [self setUpColorLineHiderView];
}

-(void)handleTap:(UITapGestureRecognizer*)sender {
    [self.view endEditing:YES];
}

- (UIInterfaceOrientationMask)supportedInterfaceOrientations {
    return UIInterfaceOrientationMaskLandscape;
}


-(void)initializeCordinates {
    float width = 2208;
    float height = 1242;
    self.firstGradientStartX = 30 / width;
    self.firstGradientEndX = 740 / width;
    self.secondGradientStartX = 1525 / width;
    self.secondGradientEndX = 2167 / width;
    self.firstTextStartY = 56 / height;
    self.firstTextEndY = 171 / height;
    self.secondTextStartY = 443 / height;
    self.secondTextEndY = 552 / height;
    self.dateInGradientMonthStartX = 1678 / width;
    self.dateInGradientMonthEndX = 2015 / width;
    self.dateInGradientMonthStartY = 125 / height;
    self.dateInGradientMonthEndY = 282 / height;
    self.dateInGradientYearStartX = 1628 / width;
    self.dateInGradientYearEndX = 2065 / width;
    self.dateInGradientYearStartY = 333 / height;
    self.dateInGradientYearEndY = 491 / height;
    self.currentDateStartX = 420 / width;
    self.currentDateEndX = 1782 / width;
    self.currentDateStartY = 851 / height;
    self.currentDateEndY = 951 / height;
    self.expirationDateStartX = 668 / width;
    self.expirationDateEndX = 1600 / width;
    self.expirationDateStartY = 1130 / height;
    self.expirationDateEndY = 1210 / height;
    self.colorLineStartY = 1005 / height;
    self.colorLineEndY = 1090 / height;
    self.colorLineStartX = 30 / width;
    self.colorLineEndX = 2180 / width;
    self.xCoordinateOfColorForColorLineHiderView = self.firstGradientStartX;
    self.xCoordinateOfColorForColorLineHiderView = 1000 / height;
    self.imageWidth = self.ticketImage.size.width;
    self.imageHeight = self.ticketImage.size.height;
}

-(void)cleanChangeableAreasAndSetTicketImage {
    CGRect firstTextRect = CGRectMake(self.firstGradientStartX * self.imageWidth, self.firstTextStartY * self.imageHeight, self.firstGradientEndX * self.imageWidth - self.firstGradientStartX * self.imageWidth, self.firstTextEndY * self.imageHeight - self.firstTextStartY * self.imageHeight);
    
    UIImage* img = [self cleanChangeableAreaFromImage:self.ticketImage withRect:firstTextRect];
    CGRect secondTextRect = CGRectMake(self.firstGradientStartX * self.imageWidth, self.secondTextStartY * self.imageHeight, self.firstGradientEndX * self.imageWidth - self.firstGradientStartX * self.imageWidth, self.secondTextEndY * self.imageHeight - self.secondTextStartY * self.imageHeight);
    img = [self cleanChangeableAreaFromImage:img withRect:secondTextRect];
    
    CGRect dateInGradientMonthRect = CGRectMake(self.secondGradientStartX * self.imageWidth, self.dateInGradientMonthStartY * self.imageHeight, self.secondGradientEndX * self.imageWidth - self.secondGradientStartX * self.imageWidth, self.dateInGradientMonthEndY * self.imageHeight - self.dateInGradientMonthStartY * self.imageHeight);
    img = [self cleanChangeableAreaFromImage:img withRect:dateInGradientMonthRect];
    
    CGRect dateInGradientYearRect = CGRectMake(self.secondGradientStartX * self.imageWidth, self.dateInGradientYearStartY * self.imageHeight, self.secondGradientEndX * self.imageWidth - self.secondGradientStartX * self.imageWidth, self.dateInGradientYearEndY * self.imageHeight - self.dateInGradientYearStartY * self.imageHeight);
    img = [self cleanChangeableAreaFromImage:img withRect:dateInGradientYearRect];
    
    CGRect currentDateRect = CGRectMake(self.currentDateStartX * self.imageWidth, self.currentDateStartY * self.imageHeight, self.currentDateEndX * self.imageWidth - self.currentDateStartX * self.imageWidth, self.currentDateEndY * self.imageHeight - self.currentDateStartY * self.imageHeight);
    img = [self cleanChangeableAreaFromImage:img withRect:currentDateRect];
    CGRect expirationDateRect = CGRectMake(self.expirationDateStartX * self.imageWidth, self.expirationDateStartY * self.imageHeight, self.expirationDateEndX * self.imageWidth - self.expirationDateStartX * self.imageWidth, self.expirationDateEndY * self.imageHeight - self.expirationDateStartY * self.imageHeight);
    img = [self cleanChangeableAreaFromImage:img withRect:expirationDateRect];
    self.TicketImageView.image = img;
}

-(void)setupTextLabels {
    NSDateFormatter* formatter = [[NSDateFormatter alloc] init];
    NSDate *date = [NSDate date];
    [formatter setTimeZone:[NSTimeZone systemTimeZone]];
    [formatter setDateFormat:@"MMM"];
    NSString * month = [formatter stringFromDate:date].uppercaseString;
    [formatter setDateFormat:@"y"];
    NSString * year = [formatter stringFromDate:date];
    
    NSString* fontName = self.fontName;
    _dateInGradientMonthTextLabel = [self setUpLabel:_dateInGradientMonthTextLabel withStartX:self.secondGradientStartX startY:self.dateInGradientMonthStartY endX:self.secondGradientEndX endY:self.dateInGradientMonthEndY text:month fontSize:45.0f fontName:fontName];
    _dateInGradientYearTextLabel = [self setUpLabel:_dateInGradientYearTextLabel withStartX:self.secondGradientStartX startY:self.dateInGradientYearStartY endX:self.secondGradientEndX endY:self.dateInGradientYearEndY text:year fontSize:45.0f fontName:fontName];
    _firstTextLabel = [self setUpLabel:_firstTextLabel withStartX:self.firstGradientStartX startY:self.firstTextStartY endX:self.firstGradientEndX endY:self.firstTextEndY text:self.topText fontSize:28.0f fontName:fontName];
    _secondTextLabel = [self setUpLabel:_secondTextLabel withStartX:self.firstGradientStartX startY:self.secondTextStartY endX:self.firstGradientEndX endY:self.secondTextEndY text:self.bottomText fontSize:28.0f fontName:fontName];
    CGFloat w = self.ticketContainerView.bounds.size.width / self.ticketContainerView.bounds.size.width;
    _currentDateTextLabel = [self setUpLabel:_currentDateTextLabel withStartX:0.0f startY:self.currentDateStartY endX:w endY:self.currentDateEndY text:@"" fontSize:28.0f fontName:fontName];
    
    _expirationDateTextLabel = [self setUpLabel:_expirationDateTextLabel withStartX:0.0f startY:self.expirationDateStartY endX:w endY:self.expirationDateEndY text:@"" fontSize:21.0f fontName:fontName];
    
    [self updateCountdown];
}

- (void)updateCountdown {
    NSDateFormatter *dateFormatter = [[NSDateFormatter alloc] init];
    [dateFormatter setDateFormat:@"YYYY-MM-dd"];
    NSDate *startingDate = [NSDate date];
    
    NSCalendar *gregorian = [NSCalendar currentCalendar];
    NSDateComponents *offsetComponents = [[NSDateComponents alloc] init];
    [offsetComponents setMonth:1];
    NSDate *nextMonth = [gregorian dateByAddingComponents:offsetComponents toDate:startingDate options:0];
    NSDateComponents *comp = [gregorian components:(NSCalendarUnitYear | NSCalendarUnitMonth | NSCalendarUnitDay) fromDate:nextMonth];
    [comp setDay:1];
    [comp setHour:14];
    [comp setSecond:1];
    NSDate *endingDate = [gregorian dateFromComponents:comp];
    
    NSCalendar *calendar = [NSCalendar currentCalendar];
    NSUInteger unitFlags = NSCalendarUnitDay| NSCalendarUnitHour | NSCalendarUnitMinute | NSCalendarUnitSecond;
    NSDateComponents *dateComponents = [calendar components:unitFlags fromDate:startingDate toDate:endingDate options:0];
    
    NSInteger days     = [dateComponents day];
    NSInteger hours    = [dateComponents hour];
    NSInteger minutes  = [dateComponents minute];
    NSInteger seconds  = [dateComponents second];
    
    NSDateFormatter* formatter = [[NSDateFormatter alloc] init];
    NSDate *date = [NSDate date];
    [formatter setTimeZone:[NSTimeZone systemTimeZone]];
    [formatter setDateFormat:@"EEE, MMM dd hh:mm:ss a"];
    NSString * time = [formatter stringFromDate:date];
    _currentDateTextLabel.text = time;
    
    NSString *secondsStr;
    NSString *daysStr;
    NSString *hoursStr;
    NSString *minutesStr;
    
    if (seconds < 10) {
        secondsStr = [NSString stringWithFormat: @"0%ld", (long)seconds];
    } else {
        secondsStr = [NSString stringWithFormat: @"%ld", (long)seconds];
    }
    
    if (days < 10) {
        daysStr = [NSString stringWithFormat: @"0%ld", (long)days];
    } else {
        daysStr = [NSString stringWithFormat: @"%ld", (long)days];
    }
    
    if (minutes < 10) {
        minutesStr = [NSString stringWithFormat: @"0%ld", (long)minutes];
    } else {
        minutesStr = [NSString stringWithFormat: @"%ld", (long)minutes];
    }
    
    if (hours < 10) {
        hoursStr = [NSString stringWithFormat: @"0%ld", (long)hours];
    } else {
        hoursStr = [NSString stringWithFormat: @"%ld", (long)hours];
    }
    NSString *countdownText =  [NSString stringWithFormat:@"Expires in %@:%@:%@:%@", daysStr,hoursStr, minutesStr, secondsStr];
    _expirationDateTextLabel.text = countdownText;
    NSLog(@"timer %@",countdownText);
    [self performSelector:@selector(updateCountdown) withObject:nil afterDelay:1];
}

-(void)updateColorLineHiderViewOpaque{
    _colorLineHiderView.hidden = !_colorLineHiderView.hidden;
    [self performSelector:@selector(updateColorLineHiderViewOpaque) withObject:nil afterDelay:0.5];
}

-(UILabel*)setUpLabel:(UILabel*)label withStartX:(CGFloat)startX startY:(CGFloat)startY endX:(CGFloat)endX endY:(CGFloat)endY text:(NSString*)text fontSize:(CGFloat)fontSize fontName:(NSString*)fontName{
    float width = self.ticketContainerView.bounds.size.width;
    float height = self.self.ticketContainerView.bounds.size.height;
    CGFloat x = startX * width;
    CGFloat y = startY * height;
    CGFloat w = endX * width - startX * width;
    CGFloat h = (endY - startY) * height;
    CGFloat cX = x + w / 2;
    CGFloat cY = y + h / 2;
    CGRect r = CGRectMake( 0, 0, w, h);
    label = [[UILabel alloc] initWithFrame:r];
    label.center = CGPointMake(cX, cY);
    [label setText:text];
    label.textColor = [UIColor blackColor];
//    label.textColor = [UIColor redColor]; //TODO for test
//    label.alpha = 0.7; //TODO for test
//    [label setBackgroundColor:[UIColor blueColor]]; //TODO for test
    [label setFont:[UIFont fontWithName: fontName size: fontSize]];
    label.textAlignment = NSTextAlignmentCenter;
    label.autoresizingMask =
    UIViewAutoresizingFlexibleLeftMargin |
    UIViewAutoresizingFlexibleWidth        |
    UIViewAutoresizingFlexibleRightMargin  |
    UIViewAutoresizingFlexibleTopMargin |
    UIViewAutoresizingFlexibleHeight      |
    UIViewAutoresizingFlexibleBottomMargin;
    [self.ticketContainerView addSubview:label];
    return label;
}


-(void)setUpColorLineHiderView {
    float width = self.ticketContainerView.bounds.size.width;
    float height = self.self.ticketContainerView.bounds.size.height;
    CGFloat x = self.colorLineStartX * width;
    CGFloat y = self.colorLineStartY * height;
    CGFloat w = self.colorLineEndX * width - self.colorLineStartX * width;
    CGFloat h = (self.colorLineEndY - self.colorLineStartY) * height;
    CGFloat cX = x + w / 2;
    CGFloat cY = y + h / 2;
    CGRect r = CGRectMake( 0, 0, w, h);
    _colorLineHiderView = [[UILabel alloc] initWithFrame:r];
    _colorLineHiderView.center = CGPointMake(cX, cY);
    _colorLineHiderView.hidden = YES;
    UIColor* color = [self getColorForBackgroundOfHiderView:self.ticketImage withCoordinateX:self.xCoordinateOfColorForColorLineHiderView * self.imageWidth andY:self.yCoordinateOfColorForColorLineHiderView * self.imageHeight];
    _colorLineHiderView.backgroundColor = color;
    _colorLineHiderView.autoresizingMask =
    UIViewAutoresizingFlexibleLeftMargin |
    UIViewAutoresizingFlexibleWidth        |
    UIViewAutoresizingFlexibleRightMargin  |
    UIViewAutoresizingFlexibleTopMargin |
    UIViewAutoresizingFlexibleHeight      |
    UIViewAutoresizingFlexibleBottomMargin;
    [self.ticketContainerView addSubview:_colorLineHiderView];
    [self performSelector:@selector(updateColorLineHiderViewOpaque) withObject:nil afterDelay:0.5];
}



- (void)didReceiveMemoryWarning {
    [super didReceiveMemoryWarning];
    // Dispose of any resources that can be recreated.
}

- (IBAction)backButtonTouchUpInside:(id)sender {
    [NSObject cancelPreviousPerformRequestsWithTarget:self selector:@selector(updateColorLineHiderViewOpaque)  object:nil];
    [NSObject cancelPreviousPerformRequestsWithTarget:self selector:@selector(updateCountdown)  object:nil];
    [self.delegate ticketEditorViewControllerDidFinidh:self];
}

- (UIImage*)cleanChangeableAreaFromImage:(UIImage*)image withRect:(CGRect)rect
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
    
    //Clone rect area
    for (int i = rect.origin.y; i < (rect.origin.y + rect.size.height); i++) {
        for (int j = rect.origin.x; j < (rect.origin.x + rect.size.width); j++) {
            unsigned long copyByteIndex = (bytesPerRow * i) + ((j + 1) * bytesPerPixel);
            unsigned long sourceByteIndex =  (bytesPerRow * i) + (j * bytesPerPixel);
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
}


- (UIColor*)getColorForBackgroundOfHiderView:(UIImage*)image withCoordinateX:(CGFloat)x andY:(CGFloat)y
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
    
    //Get color at point
    unsigned int byteIndex = (bytesPerRow * y) + x * bytesPerPixel;
    CGFloat red = imageData[byteIndex];
    CGFloat green = imageData[byteIndex + 1];
    CGFloat blue = imageData[byteIndex + 2];
    CGFloat alpha = imageData[byteIndex + 3];
    
    CGContextRelease(context);
    free(imageData);
    
    return  [UIColor colorWithRed:red green:green blue:blue alpha:alpha];
}

//Helper function for future
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
