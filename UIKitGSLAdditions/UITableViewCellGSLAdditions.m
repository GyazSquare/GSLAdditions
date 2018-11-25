//
//  UITableViewCellGSLAdditions.m
//  UIKitGSLAdditions
//

@import ObjectiveC;
@import UIKit;

#import "UITableViewCellGSLAdditions.h"

@implementation UITableViewCell (GSLAdditions)

+ (void)load {
    if (@available(iOS 9.0, *)) {
        // iOS 9.0+
        // do nothing
    } else if (@available(iOS 8.0, *)) {
        // iOS 8.0-9.0
        // Subtitles of UITableViewCell won't update
        // http://stackoverflow.com/questions/25793074/subtitles-of-uitableviewcell-wont-update
        Method original = class_getInstanceMethod(self, @selector(layoutSubviews));
        Method replace = class_getInstanceMethod(self, @selector(gsl_layoutSubviews));
        method_exchangeImplementations(original, replace);
    } else {
        // iOS 2.0-8.0
        // do nothing
    }
}

#pragma mark - Class extensions

- (void)gsl_layoutSubviews {
    UILabel *detailTextLabel = self.detailTextLabel;
    if (detailTextLabel && !detailTextLabel.superview) {
        [self.contentView addSubview:detailTextLabel];
    }
    [self gsl_layoutSubviews];
}

@end
