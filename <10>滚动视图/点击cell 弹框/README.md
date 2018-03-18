# SSTableViewPopover
![](https://raw.githubusercontent.com/immrss/SSTableViewPopover/master/Demo.gif)

## Usage
`#import "UITableView+Popover.h"`

```objective-c
- (void)tableView:(UITableView *)tableView didSelectRowAtIndexPath:(NSIndexPath *)indexPath {
    PopoverItem *item = [[PopoverItem alloc]initWithName:@"Item" image:[UIImage imageNamed:@"example.png"] selectedHandler:^(PopoverItem *popoverItem) {
        //handle callback
    }];
    PopoverItem *item1 = [[PopoverItem alloc]initWithName:@"Item1" image:[UIImage imageNamed:@"example1.png"] selectedHandler:^(PopoverItem *popoverItem) {
        //handle callback
    }];
    [tableView showPopoverWithItems:@[item,item1] forIndexPath:indexPath];
}

```

## License
The project is available under the MIT license.
