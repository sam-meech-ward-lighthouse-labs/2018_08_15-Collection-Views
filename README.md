## Table Views

## Detail View Controller

A view contoller that displays details about the selected item in a table view or collection view or whatever.

## Collection Views

* Customize layouts a lot. Way more than table views
* More than 1 item per row, you can't use a table view.
* Good for grids

--- 

## Manipulating Flow Layout

* Collection Views have a layout object that manages all of the layout.
* `UICOLLECTIONViewFlowLayout` is the default collection view layout object used by collection views.


* Directly

```
UICollectionViewFlowLayout *layout = [[UICollectionViewFlowLayout alloc] init];
layout.itemSize = CGSizeMake(100, 100);
layout.sectionInset = UIEdgeInsetsMake(50, 50, 50, 50);
layout.minimumLineSpacing = 50;
layout.minimumInteritemSpacing = 50;

self.collectionView.collectionViewLayout = layout;
```

* `UICollectionViewDelegateFlowLayout`

## Custom Flow Layout

---

## Snippets

```objc
- (UICollectionViewFlowLayout *)setupSmallLayout
{
    UICollectionViewFlowLayout *smallLayout = [[UICollectionViewFlowLayout alloc] init];
    smallLayout.itemSize = CGSizeMake(50, 50);
    smallLayout.sectionInset = UIEdgeInsetsMake(5, 5, 5, 5);
    smallLayout.minimumLineSpacing = 5;
    smallLayout.minimumInteritemSpacing = 5;
    return smallLayout;
}
```

```objc
- (NSArray<UICollectionViewLayoutAttributes *> *)layoutAttributesForElementsInRect:(CGRect)rect
{
    NSArray<UICollectionViewLayoutAttributes *> *superAttrs = [super layoutAttributesForElementsInRect:rect];
    
    // Need to copy attrs from super to avoid cached frame mismatch
    NSMutableArray<UICollectionViewLayoutAttributes *> *newAttrs = [[NSMutableArray alloc] init];
    
    for (UICollectionViewLayoutAttributes *superAttr in superAttrs) {
        UICollectionViewLayoutAttributes *attributes = [superAttr copy];
        [newAttrs addObject:attributes];
        
        // We can now modify attributes to modify the appearance.
        // Modify attributes here (attributes.transform)
    }
    
    return newAttrs;
}
```

```objc
- (UICollectionReusableView *)collectionView:(UICollectionView *)collectionView
           viewForSupplementaryElementOfKind:(NSString *)kind
                                 atIndexPath:(NSIndexPath *)indexPath
{
    if ([kind isEqualToString:UICollectionElementKindSectionHeader]) {
        MyHeaderView *headerView = [self.collectionView dequeueReusableSupplementaryViewOfKind:UICollectionElementKindSectionHeader
                                                withReuseIdentifier:@"MyHeaderView"
                                                       forIndexPath:indexPath];
        headerView.label.text = [NSString stringWithFormat:@"%ld", (long)indexPath.section];
        return headerView;
    }
    else if ([kind isEqualToString:UICollectionElementKindSectionFooter]) {
        MyFooterView *footerView = [self.collectionView dequeueReusableSupplementaryViewOfKind:UICollectionElementKindSectionFooter
                                                                           withReuseIdentifier:@"MyFooterView"
                                                                                  forIndexPath:indexPath];
        footerView.label.text = [NSString stringWithFormat:@"%ld", (long)indexPath.section];
        return footerView;
    }
    else {
        return nil;
    }
}
```
