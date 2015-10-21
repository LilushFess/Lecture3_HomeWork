//
//  ViewController.h
//  Lecture3HomeWork
//
//  Created by Yevhen Herasymenko on 21/10/2015.
//  Copyright © 2015 YevhenHerasymenko. All rights reserved.
//

#import <UIKit/UIKit.h>

@interface ViewController : UIViewController

- (NSNumber *)evenTheLast:(NSArray *)array;
- (NSNumber *)indexPower:(NSArray *)array index:(NSInteger)index;
- (NSNumber *)countInversion:(NSArray *)array;
- (NSNumber *)median:(NSArray *)array;
- (NSArray *)nonUniqueElements:(NSArray *)array;

@end

