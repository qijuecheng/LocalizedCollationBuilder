//
//  LocalizedCollationResult.swift
//  LocalCollationable
//
//  Created by 漆珏成 on 2019/9/2.
//  Copyright © 2019 漆珏成. All rights reserved.
//

import Foundation

/// 根据当前地区排序规则整理的结果
public struct LocalizedCollationResult<E: LocalizedCollationable> {
  /// 当前地区区域索引标题
  public private(set) var sectionTitles: [String]
  /// 当前地区区域模型对象数组
  public private(set) var section: [[E]]
  public init(_ sectionTitles: [String], _ section: [[E]]) {
    self.sectionTitles = sectionTitles;
    self.section = section;
  }
}
