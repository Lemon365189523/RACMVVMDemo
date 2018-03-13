//
//  LMHomeCell.h
//  RAC-Demo
//
//  Created by KADFWJ on 2018/3/12.
//  Copyright © 2018年 Lemon Fan. All rights reserved.
//

#import <UIKit/UIKit.h>
#import "LMHomeCellVM.h"

@interface LMHomeCell : UITableViewCell

-(void) bindViewModel:(LMHomeCellVM *) viewModel;

@end
