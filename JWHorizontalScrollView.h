//
//  JWHorizontalScrollView.h
//
//  Created by Jhonathan Wyterlin on 31/05/15.
//  Copyright (c) 2015 Jhonathan Wyterlin. All rights reserved.
//

#import <Foundation/Foundation.h>
#import <UIKit/UIKit.h>

@protocol JWHorizontalScrollViewDelegate <NSObject>

-(int)numberOfColumnsInScrollView:(UIScrollView *)scrollView;

-(NSString *)scrollView:(UIScrollView *)scrollView textForColumn:(int)column;

@optional

-(void)scrollView:(UIScrollView *)scrollView didSelectColumnAtIndex:(int)index;

-(CGFloat)scrollView:(UIScrollView *)scrollView widthForColumnAtIndex:(int)index;

@end

@interface JWHorizontalScrollView : UIScrollView

@property (nonatomic, weak) IBOutlet id<JWHorizontalScrollViewDelegate> horizontalDelegate;

@end
