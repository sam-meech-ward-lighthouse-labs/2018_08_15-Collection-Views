//
//  TurtlesViewController.m
//  RecipeTurtleDrinks
//
//  Created by April Mulvey on 2018-08-15.
//  Copyright © 2018 April Mulvey. All rights reserved.
//

#import "TurtlesViewController.h"
#import "RecipeTurtleDrink.h"
#import "TurtleCollectionViewCell.h"
#import "RecipeTurtleDrinkDetailViewController.h"

@interface TurtlesViewController () <UICollectionViewDelegate, UICollectionViewDataSource>

@property (nonatomic, strong) NSArray <RecipeTurtleDrink *> *recipeTurtleDrinks;
@property (weak, nonatomic) IBOutlet UICollectionView *collectionView;

@end

@implementation TurtlesViewController

- (void)viewDidLoad {
    [super viewDidLoad];
    // Do any additional setup after loading the view.
    [self setupRecipeTurtleDrinks];
    
//    UICollectionViewFlowLayout *layout = (UICollectionViewFlowLayout *)self.collectionView.collectionViewLayout;
    
    UICollectionViewFlowLayout *layout = [[UICollectionViewFlowLayout alloc] init];
    layout.itemSize = CGSizeMake(100, 100);
    layout.sectionInset = UIEdgeInsetsMake(50, 50, 50, 50);
    layout.minimumLineSpacing = 50;
    layout.minimumInteritemSpacing = 50;
    
    self.collectionView.collectionViewLayout = layout;
}

- (void)didReceiveMemoryWarning {
    [super didReceiveMemoryWarning];
    // Dispose of any resources that can be recreated.
}

- (void)setupRecipeTurtleDrinks {
    RecipeTurtleDrink *rtd1 = [[RecipeTurtleDrink alloc] initWithIngredients:@[@"Lies", @"Decibtep"] imageName:@"nixon" turtleName:@"The Nixon"];
    RecipeTurtleDrink *rtd2 = [[RecipeTurtleDrink alloc] initWithIngredients:@[@"Denchers", @"Bad Acting", @"Wrinkles"] imageName:@"regan" turtleName:@"The Regan"];
    RecipeTurtleDrink *rtd3 = [[RecipeTurtleDrink alloc] initWithIngredients:@[@"Tupe", @"Hot Air", @"Orange"] imageName:@"trump" turtleName:@"The Trump"];
    self.recipeTurtleDrinks = @[rtd1, rtd2, rtd3,rtd1, rtd2, rtd3,rtd1, rtd2, rtd3,rtd1, rtd2, rtd3,rtd1, rtd2, rtd3,rtd1, rtd2, rtd3];
}



#pragma mark - Navigation

// In a storyboard-based application, you will often want to do a little preparation before navigation
- (void)prepareForSegue:(UIStoryboardSegue *)segue sender:(id)sender {
    // Get the new view controller using [segue destinationViewController].
    // Pass the selected object to the new view controller.
    
    if ([segue.identifier isEqualToString:@"com.meech-ward.RecipeTurtleDrinkDetailViewController2"]) {
        RecipeTurtleDrinkDetailViewController *vc = segue.destinationViewController;
        
//        NSInteger selectedIndex = [self.tableView indexPathForSelectedRow].row;
        NSInteger selectedIndex = [self.collectionView indexPathsForSelectedItems][0].item;
        vc.recipeTurtleDrink = self.recipeTurtleDrinks[selectedIndex];
    }
}


#pragma mark - collection View


- (NSInteger)collectionView:(UICollectionView *)collectionView numberOfItemsInSection:(NSInteger)section {
    return self.recipeTurtleDrinks.count;
}

- (UICollectionViewCell *)collectionView:(UICollectionView *)collectionView cellForItemAtIndexPath:(NSIndexPath *)indexPath {
    TurtleCollectionViewCell *cell = [collectionView dequeueReusableCellWithReuseIdentifier:@"Cell" forIndexPath:indexPath];
    
    RecipeTurtleDrink *rtd = self.recipeTurtleDrinks[indexPath.item];
    cell.imageView.image = [UIImage imageNamed:rtd.imageName];
    cell.nameLabel.text = rtd.turtleName;
    
    return cell;
}

@end
