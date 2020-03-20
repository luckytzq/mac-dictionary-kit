//
//  DUImageView.m
//  DictUnifier
//
//  Created by Jjgod Jiang on 3/11/10.
//

#import "DUImageView.h"

@implementation DUImageView

- (void) awakeFromNib
{
    [self registerForDraggedTypes: [NSArray arrayWithObjects: NSPasteboardTypeFileURL, nil]];
}

- (NSDragOperation) draggingEntered: (id < NSDraggingInfo >) sender
{
    NSPasteboard *pboard = [sender draggingPasteboard];
    NSDragOperation opType = NSDragOperationNone;

    if ([[pboard types] containsObject: NSPasteboardTypeFileURL])
        opType = NSDragOperationCopy;

    return opType;
}

- (BOOL) performDragOperation: (id < NSDraggingInfo >) sender
{
    NSPasteboard *pboard = [sender draggingPasteboard];
    BOOL successful = NO;

    if ([[pboard types] containsObject: NSPasteboardTypeFileURL])
    {
       NSArray* filePaths = [[sender draggingPasteboard] propertyListForType:NSFilenamesPboardType];

        NSLog(@"file path:%@", [filePaths objectAtIndex:0]);
        [controller startConversion:[filePaths objectAtIndex:0]];
        successful = NO;
    }

    return successful;
}

@end
