//
//  RecipeTurtleDrink.m
//  RecipeTurtleDrinks
//
//  Created by April Mulvey on 2018-08-15.
//  Copyright © 2018 April Mulvey. All rights reserved.
//

#import "RecipeTurtleDrink.h"

@implementation RecipeTurtleDrink

- (instancetype)initWithIngredients:(NSArray<NSString *> *)ingredients imageName:(NSString *)imageName turtleName:(NSString *)turtleName
{
    self = [super init];
    if (self) {
        _ingredients = ingredients;
        _imageName = imageName;
        _turtleName = turtleName;
    }
    return self;
}

@end
