//
//  JWHorizontalScrollView.m
//
//  Created by Jhonathan Wyterlin on 31/05/15.
//  Copyright (c) 2015 Jhonathan Wyterlin. All rights reserved.
//

#import "JWHorizontalScrollView.h"

@interface JWHorizontalScrollView()

@property(nonatomic) int numberOfColumns;
@property(nonatomic,strong) NSMutableArray *buttons;
@property(nonatomic) int axisX;

@end

@implementation JWHorizontalScrollView

-(id)init {
    
    self = [super init];
    
    if ( ! self )
        return nil;
    
    [self loadData];
    
    return self;
    
}

#pragma mark - IBAction methods

-(IBAction)buttonPressed:(UIButton *)sender {

    if ( [self.horizontalDelegate respondsToSelector:@selector(scrollView:didSelectColumnAtIndex:)] )
        [self.horizontalDelegate scrollView:self didSelectColumnAtIndex:(int)sender.tag];

}

#pragma mark - Private methods

-(void)loadData {
    
    if ( [self.horizontalDelegate respondsToSelector:@selector(numberOfColumnsInScrollView:)] )
        self.numberOfColumns = [self.horizontalDelegate numberOfColumnsInScrollView:self];
    
    for ( int x = 0; x < self.numberOfColumns; x++ ) {
        
        CGFloat width;
        
        if ( [self.horizontalDelegate respondsToSelector:@selector(scrollView:widthForColumnAtIndex:)] )
            width = [self.horizontalDelegate scrollView:self widthForColumnAtIndex:x];
        else
            width = 80;

        NSString *textForColumn = [self.horizontalDelegate scrollView:self textForColumn:x];

        [self.buttons addObject:[self createButtonAtIndex:x width:width text:textForColumn]];
        
    }

}

-(UIButton *)createButtonAtIndex:(int)index width:(CGFloat)width text:(NSString *)text {
    
    UIButton *button = [[UIButton alloc] initWithFrame:CGRectMake( self.axisX, 0, width, self.frame.size.height )];
    [button setTitle:text forState:UIControlStateNormal];
    [button setTitle:text forState:UIControlStateHighlighted];
    [button setTitle:text forState:UIControlStateSelected];
    [button setTitleColor:[UIColor blackColor] forState:UIControlStateNormal];
    [button setTitleColor:[UIColor blackColor] forState:UIControlStateHighlighted];
    [button setTitleColor:[UIColor blackColor] forState:UIControlStateSelected];
    button.layer.borderColor = [UIColor blackColor].CGColor;
    button.layer.borderWidth = 1.0;
    button.backgroundColor = [UIColor whiteColor];
    button.contentHorizontalAlignment = UIControlContentHorizontalAlignmentCenter;
    [button sizeToFit];
    
    CGRect f = button.frame;
    f.size.width += 20;
    f.size.height = self.frame.size.height;
    button.frame = f;
    
    self.axisX += button.frame.size.width;
    
    button.tag = index;
    
    [button addTarget:self action:@selector(buttonPressed:) forControlEvents:UIControlEventTouchUpInside];
    
    return button;
    
}

@end
