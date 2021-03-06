//
//  ECOrderTableViewCell.m
//  XQBCommunityApp
//
//  Created by City-Online on 14/12/19.
//  Copyright (c) 2014年 City-Online. All rights reserved.
//

#import "ECOrderTableViewCell.h"
#import "Global.h"
#import "MakePhoneCall.h"

#define MOCLeftMargin 14
#define MOCIconWidth 75
#define MOCIconHeigth 75
#define MOCLabelWidth 160

@interface ECOrderTableViewCell ()



@end

@implementation ECOrderTableViewCell

- (id)initWithStyle:(UITableViewCellStyle)style reuseIdentifier:(NSString *)reuseIdentifier
{
    self = [super initWithStyle:style reuseIdentifier:reuseIdentifier];
    
    if (self) {
        _shoppingIconView = [[UIImageView alloc] initWithFrame:CGRectMake(MOCLeftMargin, MOCLeftMargin, MOCIconWidth, MOCIconHeigth)];
        [self addSubview:_shoppingIconView];
        
        _shoppingNameLabel = [[UILabel alloc] initWithFrame:CGRectMake(_shoppingIconView.frame.size.width+_shoppingIconView.frame.origin.x+MOCLeftMargin, _shoppingIconView.frame.origin.y+14, MOCLabelWidth, 30)];
        _shoppingNameLabel.font = [UIFont systemFontOfSize:15];
        _shoppingNameLabel.textColor = XQBColorContent;
        _shoppingNameLabel.numberOfLines = 0;
        [self addSubview:_shoppingNameLabel];
        
        _shoppingTypeLabel = [[UILabel alloc] initWithFrame:CGRectMake(_shoppingNameLabel.frame.origin.x, _shoppingNameLabel.frame.origin.y+_shoppingNameLabel.frame.size.height, MOCLabelWidth, 17)];
        _shoppingTypeLabel.font = [UIFont systemFontOfSize:12];
        _shoppingTypeLabel.textColor = XQBColorExplain;
        [self addSubview:_shoppingTypeLabel];
        
        _afterSalesButton = [UIButton buttonWithType:UIButtonTypeCustom];
        _afterSalesButton.frame = CGRectMake(_shoppingTypeLabel.frame.origin.x, _shoppingTypeLabel.frame.origin.y+_shoppingTypeLabel.frame.size.height, 50, 17);
        [_afterSalesButton setTitle:@"申请售后" forState:UIControlStateNormal];
        [_afterSalesButton setTitleColor:[UIColor colorWithRed:255/255 green:80/255 blue:0/255 alpha:1] forState:UIControlStateNormal];
        [_afterSalesButton.titleLabel setFont:[UIFont systemFontOfSize:12]];
        [_afterSalesButton addTarget:self action:@selector(afterSalesButtonAction) forControlEvents:UIControlEventTouchUpInside];
        _afterSalesButton.hidden = YES;
        [self addSubview:_afterSalesButton];
        
        _shoppingPriceLabel = [[UILabel alloc] initWithFrame:CGRectMake(_shoppingNameLabel.frame.origin.x+_shoppingNameLabel.frame.size.width, _shoppingIconView.frame.origin.y+MOCIconHeigth/2-12.5, 320-MOCLeftMargin-_shoppingNameLabel.frame.origin.x-_shoppingNameLabel.frame.size.width, 10)];
        _shoppingPriceLabel.font = [UIFont systemFontOfSize:10];
        _shoppingPriceLabel.textColor = XQBColorContent;
        _shoppingPriceLabel.textAlignment = NSTextAlignmentRight;
        [self addSubview:_shoppingPriceLabel];
        
        _shoppingCountLabel = [[UILabel alloc] initWithFrame:CGRectMake(_shoppingPriceLabel.frame.origin.x, _shoppingPriceLabel.frame.origin.y+_shoppingPriceLabel.frame.size.height+5, _shoppingPriceLabel.frame.size.width, 10)];
        _shoppingCountLabel.font = [UIFont systemFontOfSize:10];
        _shoppingCountLabel.textColor = XQBColorExplain;
        _shoppingCountLabel.textAlignment = NSTextAlignmentRight;
        [self addSubview:_shoppingCountLabel];

    }
    return self;
}

- (void)layoutSubviews
{
    [super layoutSubviews];
    
    for (UIView *subview in self.contentView.superview.subviews) {
        if ([NSStringFromClass(subview.class) hasSuffix:@"SeparatorView"]) {
            if (subview.frame.origin.x == 0) {
                subview.hidden = YES;
            } else {
                subview.hidden = NO;
            }
        }
    }
}

- (void)awakeFromNib
{
    // Initialization code
}

- (void)setSelected:(BOOL)selected animated:(BOOL)animated
{
    [super setSelected:selected animated:animated];
    
    // Configure the view for the selected state
}

- (void)afterSalesButtonAction
{
    MakePhoneCall *instance = [MakePhoneCall getInstance];
    BOOL call_ok = [instance makeCall:@"4008338528"];
    
    if (call_ok) {
        //上报
        //        [self requestReport:model.shopId];
    }else{
        MsgBox(@"设备不支持电话功能");
        //[self alertWithFistButton:@"确定" SencodButton:nil Message:@"设备不支持电话功能"];
    }
}


@end
