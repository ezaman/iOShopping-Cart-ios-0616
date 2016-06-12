//
//  FISShoppingCart.m
//  iOShoppingCart
//
//  Created by Ehsan Zaman on 6/10/16.
//  Copyright © 2016 FIS. All rights reserved.
//

#import "FISShoppingCart.h"


@implementation FISShoppingCart

//// 1
- (NSUInteger) calculateTotalPriceInCents; {
   NSUInteger totalPriceInCents = 0;
   for (NSUInteger i = 0; i < (self.items.count); i++) {
       if (self.items > 0) {
           FISItem *items = self.items[i];
           totalPriceInCents += items.priceInCents;
           
       }
   }
    
   return totalPriceInCents;
    
}

////// 2
- (void)addItem: (FISItem*)item; {
    
   [self.items addObject:item];
    
}

////// 3
- (void)removeItem: (FISItem*)item{
    NSUInteger itemLocation = [self.items indexOfObject:item];
    [self.items removeObjectAtIndex: itemLocation];
}
////// 4
- (void) removeAllItemsLikeItem: (FISItem*) item{
    [self.items removeObjectIdenticalTo: item];
}

///// 5
- (void) sortItemsByNameAsc{
    NSSortDescriptor *sortItemsByNameAsc = [NSSortDescriptor sortDescriptorWithKey: @"name" ascending: YES];
    [self.items sortUsingDescriptors:@[sortItemsByNameAsc]];
}


////// 6
- (void) sortItemsByNameDesc{
    NSSortDescriptor *sortItemsByNameDesc = [NSSortDescriptor sortDescriptorWithKey: @"name" ascending: NO];
    [self.items sortUsingDescriptors:@[sortItemsByNameDesc]];
    
}


///// 7
- (void) sortItemsByPriceInCentsAsc{
    NSSortDescriptor *sortItemsByPriceInCentsAsc = [NSSortDescriptor sortDescriptorWithKey: @"priceInCents"  ascending: YES];
    [self.items sortUsingDescriptors:@[sortItemsByPriceInCentsAsc]];
    
}


///// 8
- (void) sortItemsByPriceInCentsDesc{
    
    NSSortDescriptor *sortItemsByPriceInCentsDesc = [NSSortDescriptor sortDescriptorWithKey: @"priceInCents"  ascending: NO];
    [self.items sortUsingDescriptors:@[sortItemsByPriceInCentsDesc]];
    
}


///// 9
- (NSArray*) allItemsWithName: (NSString*) name{
    
    NSMutableArray *mAllItemsWithName = [[NSMutableArray alloc]init];
    for(FISItem *allItems in self.items){
        if ([allItems.name isEqualToString: name])
            [mAllItemsWithName addObject: allItems];
    }
return mAllItemsWithName;
    
}

///// 10
- (NSArray*) allItemsWithMinimumPriceInCents: (NSUInteger) number{
    NSMutableArray *minimumPrice = [[NSMutableArray alloc]init];
    for (FISItem *items in self.items) {
        if (items.priceInCents >= number)
            [minimumPrice addObject: items];
    }
    
    return minimumPrice;
}


//////  11
- (NSArray*) allItemsWithMaximumPriceInCents: (NSUInteger) number{
    NSMutableArray *maxPrice = [[NSMutableArray alloc]init];
    for (FISItem *items in self.items) {
        if (items.priceInCents <= number)
            [maxPrice addObject: items];
    
    }
    
    return maxPrice;

}




@end
