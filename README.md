JTSActionSheet
==============

*Replacement for UIActionSheet on iOS 7, with customizable fonts and colors, and block-based actions.*

## Why Use This?

As of this writing, I am working on a project that called for lots of action sheets, with the following requirements:

- Needed to specify custom fonts for buttons and titles.
- Needed to choose the colors not just for the button titles, but also for the background colors, including the backdrop shadow overlay.
- Needed a block-based API for ease of development.

Surprisingly, there weren't any ready-made solutions available in the wild. So I made one.

## When *Not* To Use This

Don't use this if you need:

- iOS 8 support (though it's coming soon). I don't plan on making this work like UIAlertController, either.
- iPad support. It might work on the iPad, but I highly doubt it will look good.
- Scrollable action sheets (you know, how the native UIActionSheet becomes a scrollable table view when there are too many items to fit in a given area).
- Landscape support (unless you don't mind a wide horizontal stretch).

## How to Use This

It's pretty easy. The steps are:

1. Create a `JTSActionSheetTheme`, either from scratch or with `defaultTheme`.
2. Setup `JTSActionSheetItems` representing your buttons and cancel button.
3. Create and show a new `JTSActionSheet`.

Here is some sample code showing it all together:

```objc

// Create a theme

JTSActionSheetTheme *theme = [JTSActionSheetTheme defaultTheme];


// Setup your buttons

JTSActionSheetItem *buyAll = [JTSActionSheetItem itemWithTitle:@"Buy All" action:^{
    // do stuff
} isDestructive:NO];

JTSActionSheetItem *deleteAll = [JTSActionSheetItem itemWithTitle:@"Delete All" action:^{
    // do stuff
} isDestructive:YES];

JTSActionSheetItem *cancel = [JTSActionSheetItem itemWithTitle:@"Cancel" action:^{
    // respond to cancellation
} isDestructive:NO];


// Create & Show an Action Sheet

JTSActionSheet *sheet = [[JTSActionSheet alloc] initWithTheme:theme
                                                        title:@"Your Options"
                                                  actionItems:@[buyAll, deleteAll]
                                                   cancelItem:cancel];
[sheet showInView:self.view];
```


