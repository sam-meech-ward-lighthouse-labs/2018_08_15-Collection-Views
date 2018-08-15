//
//  ViewController.m
//  RecipeTurtleDrinks
//
//  Created by April Mulvey on 2018-08-15.
//  Copyright © 2018 April Mulvey. All rights reserved.
//

#import "ViewController.h"
#import "RecipeTurtleDrink.h"
#import "RecipeTurtleDrinkDetailViewController.h"

@interface ViewController () <UITableViewDelegate, UITableViewDataSource>

@property (nonatomic, strong) NSArray <RecipeTurtleDrink *> *recipeTurtleDrinks;
@property (weak, nonatomic) IBOutlet UITableView *tableView;

@end

@implementation ViewController

- (void)viewDidLoad {
    [super viewDidLoad];
    // Do any additional setup after loading the view, typically from a nib.
    
    [self setupRecipeTurtleDrinks];
}

- (void)setupRecipeTurtleDrinks {
    RecipeTurtleDrink *rtd1 = [[RecipeTurtleDrink alloc] initWithIngredients:@[@"Lies", @"Decibtep"] imageName:@"nixon" turtleName:@"The Nixon"];
    RecipeTurtleDrink *rtd2 = [[RecipeTurtleDrink alloc] initWithIngredients:@[@"Denchers", @"Bad Acting", @"Wrinkles"] imageName:@"regan" turtleName:@"The Regan"];
    RecipeTurtleDrink *rtd3 = [[RecipeTurtleDrink alloc] initWithIngredients:@[@"Tupe", @"Hot Air", @"Orange"] imageName:@"trump" turtleName:@"The Trump"];
    self.recipeTurtleDrinks = @[rtd1, rtd2, rtd3,rtd1, rtd2, rtd3,rtd1, rtd2, rtd3,rtd1, rtd2, rtd3,rtd1, rtd2, rtd3,rtd1, rtd2, rtd3];
    
}


- (void)didReceiveMemoryWarning {
    [super didReceiveMemoryWarning];
    // Dispose of any resources that can be recreated.
}

#pragma mark - Navigation

- (void)prepareForSegue:(UIStoryboardSegue *)segue sender:(id)sender {
    if ([segue.identifier isEqualToString:@"com.meech-ward.RecipeTurtleDrinkDetailViewController"]) {
        RecipeTurtleDrinkDetailViewController *vc = segue.destinationViewController;
        
        NSInteger selectedIndex = [self.tableView indexPathForSelectedRow].row;
        vc.recipeTurtleDrink = self.recipeTurtleDrinks[selectedIndex];
    }
}

#pragma mark - Table View

//- (NSInteger)numberOfSectionsInTableView:(UITableView *)tableView {
//
//}

- (NSInteger)tableView:(UITableView *)tableView numberOfRowsInSection:(NSInteger)section {
    return self.recipeTurtleDrinks.count;
}

- (UITableViewCell *)tableView:(UITableView *)tableView cellForRowAtIndexPath:(NSIndexPath *)indexPath {
    UITableViewCell *cell = [tableView dequeueReusableCellWithIdentifier:@"Cell"];
    
    RecipeTurtleDrink *rtd = self.recipeTurtleDrinks[indexPath.row];
    cell.textLabel.text = rtd.turtleName;
    cell.detailTextLabel.text = [rtd.ingredients componentsJoinedByString:@", "];
    
    return cell;
}

- (void)tableView:(UITableView *)tableView didSelectRowAtIndexPath:(NSIndexPath *)indexPath {
    NSLog(@"%li", (long)indexPath.row);
}


@end
