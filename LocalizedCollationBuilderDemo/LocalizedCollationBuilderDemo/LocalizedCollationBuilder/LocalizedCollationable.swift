//
//  LocalizedCollationable.swift
//  LocalCollationable
//
//  Created by 漆珏成 on 2019/9/2.
//  Copyright © 2019 漆珏成. All rights reserved.
//

import Foundation

/// 根据字母或中文拼音排序的model需要遵守该协议
/// collationKey: 字母或中文拼音排序的key
/// 需要重写该属性get返回需要排序的字母或中文拼音的字符串属性
@objc public protocol LocalizedCollationable: class {
  var collationKey: String? { get }
}

extension Array where Element: LocalizedCollationable{
  public func localizedCollaction() -> LocalizedCollationResult<Element> {
    let collactor =  LocalizedCollactionBuilder.Builder.getBuilder();
    return collactor.sorted(array: self);
  }
}
