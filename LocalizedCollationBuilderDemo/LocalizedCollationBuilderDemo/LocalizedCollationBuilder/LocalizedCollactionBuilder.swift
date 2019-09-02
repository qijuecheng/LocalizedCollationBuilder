//
//  SortNameable.swift
//  SortNameable
//
//  Created by apple on 2019/9/1.
//  Copyright © 2019 apple. All rights reserved.
//

import UIKit

/// 根据当前地区字母或者中文拼音快速排序的整理器
class LocalizedCollactionBuilder {
    private init() {}
    static let builder = Builder.getBuilder();
}

extension LocalizedCollactionBuilder {
  public class Builder {
    static func getBuilder() -> LocalizedCollactionBuilder {
      return LocalizedCollactionBuilder();
    }
  }
}

extension LocalizedCollactionBuilder {
  public func sorted<Element: LocalizedCollationable>(array: [Element]) -> LocalizedCollationResult<Element> {
    let collation = UILocalizedIndexedCollation.current();
    let sectionTitlesCount = collation.sectionIndexTitles.count;
    
    var newSectionsArray: [[Element]] = [];
    for _ in 0..<sectionTitlesCount {
      let array: [Element] = []
      newSectionsArray.append(array);
    }
    
    for temp in array {
      let sectionNumber = collation.section(for: temp, collationStringSelector: #selector(getter: LocalizedCollationable.collationKey))
      var sectionNames = newSectionsArray[sectionNumber]
      sectionNames.append(temp);
      newSectionsArray[sectionNumber] = sectionNames
    }
    
    for i in 0..<sectionTitlesCount {
      let beansArrayForSection = newSectionsArray[i]
      //获得排序结果
      let sortedBeansArrayForSection = collation.sortedArray(from: beansArrayForSection, collationStringSelector:  #selector(getter: LocalizedCollationable.collationKey));
      
      //替换原来数组
      newSectionsArray[i] = sortedBeansArrayForSection as! [Element];
    }
    var index = 0;
    var sectionTitles: [String] = [];
    let section = newSectionsArray.filter { (array) -> Bool in
      if array.count > 0 {
        let title = collation.sectionTitles[index];
        sectionTitles.append(title);
      }
      index += 1;
      return array.count != 0 ? true : false;
    }
    let result = LocalizedCollationResult<Element>(sectionTitles, section);
    return result;
  }
}





