//
//  ViewController.m
//  Lecture3HomeWork
//
//  Created by Yevhen Herasymenko on 21/10/2015.
//  Copyright © 2015 YevhenHerasymenko. All rights reserved.
//

#import "ViewController.h"

@interface ViewController ()

@end

@implementation ViewController

- (void)viewDidLoad {
    [super viewDidLoad];
    
    NSNumber *myNum = [self indexPower:@[] index:2];
    
}

- (void)didReceiveMemoryWarning {
    [super didReceiveMemoryWarning];
    // Dispose of any resources that can be recreated.
}

/*Дан массив целых чисел. Нужно найти сумму элементов с четными индексами (0-й, 2-й, 4-й итд), 
 затем перемножить эту сумму и последний элемент исходного массива. 
 Не забудьте, что первый элемент массива имеет индекс 0.

Для пустого массива результат всегда 0 (ноль).*/

- (NSNumber *)evenTheLast:(NSArray *)array {
    
    NSInteger resultInt = 0;
    
    for (int i = 0; i < array.count; i+=2) {
        resultInt += [array[i] integerValue];
    }
    
    resultInt *= [array.lastObject integerValue];
    return @(resultInt);
}


/*Дан массив с положительными числами и число N. Вы должны найти N-ую степень элемента в массиве с индексом N. Если N за границами массива, тогда вернуть -1. Не забывайте, что первый элемент имеет индекс 0.

Давайте посмотрим на несколько примеров:
- массив = [1, 2, 3, 4] и N = 2, тогда результат 32 == 9;
- массив = [1, 2, 3] и N = 3, но N за границами массива, так что результат -1.*/

- (NSNumber *)indexPower:(NSArray *)array
                   index:(NSInteger)index {
    if (array.count < index) {
        return @(-1);
    }
    NSInteger result = pow([array[index] doubleValue], index);
    
    return @(result);
}

/*В комьютерной науке и дискретной математике, инверсия - это пара позиций последовательности, где элементы на этих позициях выпадают из естественного порядка. Таким образом, если мы используем порядок по возрастанию для группы чисел, то инверсия получается, когда более крупные цифры стоят перед меньшим значением в последовательности.
 
 Проверим такой пример последовательности: (1, 2, 5, 3, 4, 7, 6) и мы можем видеть здесь три инверсии
 - 5 и 3; - 5 и 4; - 7 и 6.
 
 Вам дана последовательность уникальных чисел и вы должны подсчитать число инверсий в этой последовательности.*/

- (NSNumber *)countInversion:(NSArray *)array {
    NSInteger result = 0;
    for (int i = 0; i < array.count - 1; i++) {
        for (int j = i+1; j < array.count; j++) {
            if ([array[j] integerValue] < [array[i] integerValue]) {
                result++;
            }
        }
        
    }
    
    return @(result);
}

/*Медиана - это числовое значение, которое делит сортированый массив чисел на большую и меньшую половины. В сортированом массиве с нечетным числом элементов медиана - это число в середине массива. Для массива с четным числом элементов, где нет одного элемента точно посередине, медиана - это среднее значение двух чисел, находящихся в середине массива. В этой задаче дан непустой массив натуральных чисел. Вам необходимо найти медиану данного массива.*/

- (NSNumber *)median:(NSArray *)array {
    NSSortDescriptor *highestToLowest = [NSSortDescriptor sortDescriptorWithKey:@"self" ascending:NO];
    NSArray *sortedArray = [array sortedArrayUsingDescriptors:@[highestToLowest]];
    double result = 0;
    if (sortedArray.count%2 == 0) {
        result = ([sortedArray[array.count/2-1] doubleValue] + [sortedArray[array.count/2] doubleValue])/2;
    } else {
        result = [sortedArray[array.count/2] doubleValue];
    }
    
    return @(result);
}

/*Дан непустой массив целых чисел (X). В этой задаче вам нужно вернуть массив, состоящий только из неуникальных элементов данного массива. Для этого необходимо удалить все уникальные элементы (которые присутствуют в данном массиве только один раз). Для решения этой задачи не меняйте оригинальный порядок элементов. Пример: [1, 2, 3, 1, 3], где 1 и 3 неуникальные элементы и результат будет [1, 3, 1, 3].*/

- (NSArray *)nonUniqueElements:(NSArray *)array {
    NSMutableArray *result = [[NSMutableArray alloc] initWithArray:array];
    BOOL isUniq = YES;
    NSMutableIndexSet *set = [[NSMutableIndexSet alloc] init];
    for (int i = 0; i < array.count; i++) {
        isUniq = YES;
        for (int j=0; j < array.count; j++) {
            if (i != j && [array[i] integerValue] == [array[j] integerValue]) {
                isUniq = NO;
                break;
            }
        }
        if (isUniq) {
            [set addIndex:i];
        }
    }
    
    [result removeObjectsAtIndexes:set];
    return result;
}


@end
