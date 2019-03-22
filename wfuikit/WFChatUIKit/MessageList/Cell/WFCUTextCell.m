//
//  TextCell.m
//  WFChat UIKit
//
//  Created by WF Chat on 2017/9/1.
//  Copyright © 2017年 WildFireChat. All rights reserved.
//

#import "WFCUTextCell.h"
#import <WFChatClient/WFCChatClient.h>
#import "WFCUUtilities.h"
#import "AttributedLabel.h"
#import "TTTAttributedLabel.h"

#define TEXT_LABEL_TOP_PADDING 3
#define TEXT_LABEL_BUTTOM_PADDING 5

@interface WFCUTextCell () <TTTAttributedLabelDelegate>

@end

@implementation WFCUTextCell
+ (CGSize)sizeForClientArea:(WFCUMessageModel *)msgModel withViewWidth:(CGFloat)width {
  WFCCTextMessageContent *txtContent = (WFCCTextMessageContent *)msgModel.message.content;
    CGSize size = [WFCUUtilities getTextDrawingSize:txtContent.text font:[UIFont systemFontOfSize:18] constrainedSize:CGSizeMake(width, 8000)];
    size.height += TEXT_LABEL_TOP_PADDING + TEXT_LABEL_BUTTOM_PADDING;
    if (size.width < 40) {
        size.width += 4;
        if (size.width > 40) {
            size.width = 40;
        } else if (size.width < 24) {
            size.width = 24;
        }
    }
  return size;
}

- (void)setModel:(WFCUMessageModel *)model {
  [super setModel:model];
    
  WFCCTextMessageContent *txtContent = (WFCCTextMessageContent *)model.message.content;
    CGRect frame = self.contentArea.bounds;
  self.textLabel.frame = CGRectMake(0, TEXT_LABEL_TOP_PADDING, frame.size.width, frame.size.height - TEXT_LABEL_TOP_PADDING - TEXT_LABEL_BUTTOM_PADDING);
    self.textLabel.textAlignment = NSTextAlignmentLeft;
    [self.textLabel setText:txtContent.text];
}

- (UILabel *)textLabel {
    if (!_textLabel) {
        TTTAttributedLabel *textLabel = [[TTTAttributedLabel alloc] initWithFrame:CGRectZero];
        textLabel.numberOfLines = 0;
        textLabel.enabledTextCheckingTypes = NSTextCheckingTypeLink; // Automatically detect links when the label text is subsequently changed
        textLabel.delegate = self; // Delegate methods are called when the user taps on a link (see `TTTAttributedLabelDelegate` protocol)

        textLabel.font = [UIFont systemFontOfSize:18];
        [self.contentArea addSubview:textLabel];
        _textLabel = textLabel;
    }
    return _textLabel;
}


#pragma mark - TTTAttributedLabelDelegate
- (void)attributedLabel:(TTTAttributedLabel *)label
   didSelectLinkWithURL:(NSURL *)url {
    
}

/**
 Tells the delegate that the user did select a link to an address.
 
 @param label The label whose link was selected.
 @param addressComponents The components of the address for the selected link.
 */
- (void)attributedLabel:(TTTAttributedLabel *)label
didSelectLinkWithAddress:(NSDictionary *)addressComponents {
    
}

/**
 Tells the delegate that the user did select a link to a phone number.
 
 @param label The label whose link was selected.
 @param phoneNumber The phone number for the selected link.
 */
- (void)attributedLabel:(TTTAttributedLabel *)label
didSelectLinkWithPhoneNumber:(NSString *)phoneNumber {
    
}

/**
 Tells the delegate that the user did select a link to a date.
 
 @param label The label whose link was selected.
 @param date The datefor the selected link.
 */
- (void)attributedLabel:(TTTAttributedLabel *)label
  didSelectLinkWithDate:(NSDate *)date {
    
}

/**
 Tells the delegate that the user did select a link to a date with a time zone and duration.
 
 @param label The label whose link was selected.
 @param date The date for the selected link.
 @param timeZone The time zone of the date for the selected link.
 @param duration The duration, in seconds from the date for the selected link.
 */
- (void)attributedLabel:(TTTAttributedLabel *)label
  didSelectLinkWithDate:(NSDate *)date
               timeZone:(NSTimeZone *)timeZone
               duration:(NSTimeInterval)duration {
    
}

/**
 Tells the delegate that the user did select a link to transit information
 
 @param label The label whose link was selected.
 @param components A dictionary containing the transit components. The currently supported keys are `NSTextCheckingAirlineKey` and `NSTextCheckingFlightKey`.
 */
- (void)attributedLabel:(TTTAttributedLabel *)label
didSelectLinkWithTransitInformation:(NSDictionary *)components {
    
}

/**
 Tells the delegate that the user did select a link to a text checking result.
 
 @discussion This method is called if no other delegate method was called, which can occur by either now implementing the method in `TTTAttributedLabelDelegate` corresponding to a particular link, or the link was added by passing an instance of a custom `NSTextCheckingResult` subclass into `-addLinkWithTextCheckingResult:`.
 
 @param label The label whose link was selected.
 @param result The custom text checking result.
 */
- (void)attributedLabel:(TTTAttributedLabel *)label
didSelectLinkWithTextCheckingResult:(NSTextCheckingResult *)result {
    
}

///---------------------------------
/// @name Responding to Long Presses
///---------------------------------

/**
 *  Long-press delegate methods include the CGPoint tapped within the label's coordinate space.
 *  This may be useful on iPad to present a popover from a specific origin point.
 */

/**
 Tells the delegate that the user long-pressed a link to a URL.
 
 @param label The label whose link was long pressed.
 @param url The URL for the link.
 @param point the point pressed, in the label's coordinate space
 */
- (void)attributedLabel:(TTTAttributedLabel *)label
didLongPressLinkWithURL:(NSURL *)url
                atPoint:(CGPoint)point {
    
}

/**
 Tells the delegate that the user long-pressed a link to an address.
 
 @param label The label whose link was long pressed.
 @param addressComponents The components of the address for the link.
 @param point the point pressed, in the label's coordinate space
 */
- (void)attributedLabel:(TTTAttributedLabel *)label
didLongPressLinkWithAddress:(NSDictionary *)addressComponents
                atPoint:(CGPoint)point {
    
}

/**
 Tells the delegate that the user long-pressed a link to a phone number.
 
 @param label The label whose link was long pressed.
 @param phoneNumber The phone number for the link.
 @param point the point pressed, in the label's coordinate space
 */
- (void)attributedLabel:(TTTAttributedLabel *)label
didLongPressLinkWithPhoneNumber:(NSString *)phoneNumber
                atPoint:(CGPoint)point {
    
}


/**
 Tells the delegate that the user long-pressed a link to a date.
 
 @param label The label whose link was long pressed.
 @param date The date for the selected link.
 @param point the point pressed, in the label's coordinate space
 */
- (void)attributedLabel:(TTTAttributedLabel *)label
didLongPressLinkWithDate:(NSDate *)date
                atPoint:(CGPoint)point {
    
}


/**
 Tells the delegate that the user long-pressed a link to a date with a time zone and duration.
 
 @param label The label whose link was long pressed.
 @param date The date for the link.
 @param timeZone The time zone of the date for the link.
 @param duration The duration, in seconds from the date for the link.
 @param point the point pressed, in the label's coordinate space
 */
- (void)attributedLabel:(TTTAttributedLabel *)label
didLongPressLinkWithDate:(NSDate *)date
               timeZone:(NSTimeZone *)timeZone
               duration:(NSTimeInterval)duration
                atPoint:(CGPoint)point {
    
}


/**
 Tells the delegate that the user long-pressed a link to transit information.
 
 @param label The label whose link was long pressed.
 @param components A dictionary containing the transit components. The currently supported keys are `NSTextCheckingAirlineKey` and `NSTextCheckingFlightKey`.
 @param point the point pressed, in the label's coordinate space
 */
- (void)attributedLabel:(TTTAttributedLabel *)label
didLongPressLinkWithTransitInformation:(NSDictionary *)components
                atPoint:(CGPoint)point {
    
}

/**
 Tells the delegate that the user long-pressed a link to a text checking result.
 
 @discussion Similar to `-attributedLabel:didSelectLinkWithTextCheckingResult:`, this method is called if a link is long pressed and the delegate does not implement the method corresponding to this type of link.
 
 @param label The label whose link was long pressed.
 @param result The custom text checking result.
 @param point the point pressed, in the label's coordinate space
 */
- (void)attributedLabel:(TTTAttributedLabel *)label
didLongPressLinkWithTextCheckingResult:(NSTextCheckingResult *)result
                atPoint:(CGPoint)point {
    
}
@end
