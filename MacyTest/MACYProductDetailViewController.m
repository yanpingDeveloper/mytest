//
//  MACYProductDetailViewController.m
//  MacyTest
//
//  Created by yanping Lan on 3/3/14.
//  Copyright (c) 2014 yanping Lan. All rights reserved.
//

#import "MACYProductDetailViewController.h"


#define productCellIdentify @"ProductDetailCell"
#define productCellButtonIdentify @"ProductButtonCell"

@interface MACYProductDetailViewController ()

@property (nonatomic) MACYProductDetailHeader * headerView;
@property (nonatomic) Product * detailProduct;


@end

@implementation MACYProductDetailViewController

- (id)initWithProduct:(Product *)detailProduct{
    
    self = [super initWithStyle:UITableViewStylePlain];
    
    if (self) {
        
        self.detailProduct = detailProduct;
        
    }
    return self;

}


- (void)viewDidLoad
{
    [super viewDidLoad];
    self.title = @"Product Details";
    self.tableView.separatorStyle = UITableViewCellSeparatorStyleNone;
    
    [self setUpHeaderView];
    [self.tableView registerClass:[MACYProductDetailCell class] forCellReuseIdentifier:productCellIdentify];
    [self.tableView registerClass:[MACYProductButtonCell class] forCellReuseIdentifier:productCellButtonIdentify];
    
    UIBarButtonItem *rightButton = [[UIBarButtonItem alloc] initWithTitle:@"Update" style:UIBarButtonItemStylePlain target:self action:@selector(updateProductInfo:)];
    self.navigationItem.rightBarButtonItem = rightButton;

    
}

- (void)didReceiveMemoryWarning
{
    [super didReceiveMemoryWarning];
    // Dispose of any resources that can be recreated.
}

#pragma mark - Table view data source

- (NSInteger)numberOfSectionsInTableView:(UITableView *)tableView
{
    return 1;
}

- (NSInteger)tableView:(UITableView *)tableView numberOfRowsInSection:(NSInteger)section
{
    return  MACYProductButtonCellType + 1;
}

- (UITableViewCell *)tableView:(UITableView *)tableView cellForRowAtIndexPath:(NSIndexPath *)indexPath
{
    if( indexPath.row == MACYProductDetailCellType){
        MACYProductDetailCell* cell = [tableView dequeueReusableCellWithIdentifier:productCellIdentify forIndexPath:indexPath];

        cell.delegate = self;
        [cell assignByProduct:self.detailProduct];
        return cell;
    }
    else{
        MACYProductButtonCell * cell = [tableView dequeueReusableCellWithIdentifier:productCellButtonIdentify forIndexPath:indexPath];
        [cell.buttonAction addTarget:self action:@selector(actionButtonPressed:) forControlEvents:UIControlEventTouchUpInside];
        
        return cell;

    }
}

-(CGFloat)tableView:(UITableView *)tableView heightForRowAtIndexPath:(NSIndexPath *)indexPath{
  
    return kActionViewHeight;
}

#pragma local methods

- (void) setUpHeaderView{
    
    self.headerView = [[MACYProductDetailHeader alloc]initWithFrame:CGRectMake(0, 0, kScreenWidth, kScreenHeight/7) Title: _detailProduct.name andSubTitle:_detailProduct.productDescription];
    
    self.tableView.tableHeaderView = self.headerView;
    
}

#pragma productDetailCell delegate

-(void)productDetail:(MACYProductDetailCell *)detailCell tappedOnImageView:(UIImage *)image{
    
    MACYImageDetailViewController *viewController = [[MACYImageDetailViewController alloc]init];
    viewController.imageView.imageView.image = image;
    [self.navigationController pushViewController:viewController animated:YES];
    
    
}

#pragma update Product

- (void)updateProductInfo:(id)sender{
    
    [[MACYDataManager sharedManager] updateProduct:self.detailProduct forKey:kProductName WithValue:@"test updated name"];
    
    [self.navigationController popViewControllerAnimated:YES];
    
    
}

#pragma actionButtonPressed

- (void)actionButtonPressed:(id)sender{
    
    [[MACYDataManager sharedManager] deleteProduct:self.detailProduct];
    [self.navigationController popViewControllerAnimated:YES];
    
}
@end
