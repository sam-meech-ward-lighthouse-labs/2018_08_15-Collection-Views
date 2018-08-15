//
//  RecipeTurtleDrinkDetailViewController.m
//  RecipeTurtleDrinks
//
//  Created by April Mulvey on 2018-08-15.
//  Copyright © 2018 April Mulvey. All rights reserved.
//

#import "RecipeTurtleDrinkDetailViewController.h"

@interface RecipeTurtleDrinkDetailViewController ()

@property (weak, nonatomic) IBOutlet UILabel *nameLabel;
@property (weak, nonatomic) IBOutlet UIImageView *imageView;

@end

@implementation RecipeTurtleDrinkDetailViewController

- (void)viewDidLoad {
    [super viewDidLoad];
    // Do any additional setup after loading the view.
    

    self.nameLabel.text = self.recipeTurtleDrink.turtleName;
    self.imageView.image = [UIImage imageNamed:self.recipeTurtleDrink.imageName];
}

- (void)didReceiveMemoryWarning {
    [super didReceiveMemoryWarning];
    // Dispose of any resources that can be recreated.
}

/*
#pragma mark - Navigation

// In a storyboard-based application, you will often want to do a little preparation before navigation
- (void)prepareForSegue:(UIStoryboardSegue *)segue sender:(id)sender {
    // Get the new view controller using [segue destinationViewController].
    // Pass the selected object to the new view controller.
}
*/

- (IBAction)goBack:(id)sender {
    [self dismissViewControllerAnimated:YES completion:nil];
}

@end
