//
//  XmlNode.m
//  EhighsunMerchandise
//
//  Created by loohcs on 14-2-23.
//  Copyright (c) 2014年 loohcs. All rights reserved.
//

#import "XmlNode.h"

@implementation XmlNode
@synthesize Attributes=_Attributes;
@synthesize ChildNodes=_ChildNodes;
@synthesize FirstChild=_FirstChild;
@synthesize HasChildNodes=_HasChildNodes;
@synthesize InnerText=_InnerText;
@synthesize InnerXml=_InnerXml;
@synthesize LastChild=_LastChild;
@synthesize Name=_Name;
@synthesize NextSibling=_NextSibling;
@synthesize OuterXml=_OuterXml;
@synthesize ParentNode=_ParentNode;
@synthesize PreviousSibling=_PreviousSibling;
@synthesize Value=_Value;
-(XmlNode*)FirstChild{
    if (_ChildNodes&&[_ChildNodes count]>0) {
        return [_ChildNodes objectAtIndex:0];
    }
    return nil;
}
-(XmlNode*)LastChild{
    if (_ChildNodes&&[_ChildNodes count]>0) {
        return [_ChildNodes lastObject];
    }
    return nil;
}
-(BOOL)HasChildNodes{
    if (_ChildNodes&&[_ChildNodes count]>0) {
        return YES;
    }
    return NO;
}
@end
