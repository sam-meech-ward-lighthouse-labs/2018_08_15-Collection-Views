//
//  RecipeTurtleDrink.h
//  RecipeTurtleDrinks
//
//  Created by April Mulvey on 2018-08-15.
//  Copyright © 2018 April Mulvey. All rights reserved.
//

#import <Foundation/Foundation.h>

@interface RecipeTurtleDrink : NSObject

@property (nonatomic, strong) NSArray<NSString *> *ingredients;
@property (nonatomic, strong) NSString *imageName;
@property (nonatomic, strong) NSString *turtleName;

- (instancetype)initWithIngredients:(NSArray<NSString *> *)ingredients imageName:(NSString *)imageName turtleName:(NSString *)turtleName;

@end
