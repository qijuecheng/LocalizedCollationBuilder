//
//  ViewController.swift
//  LocalizedCollationBuilderDemo
//
//  Created by 漆珏成 on 2019/9/2.
//  Copyright © 2019 漆珏成. All rights reserved.
//

import UIKit

class Person: LocalizedCollationable {
  var collationKey: String? {
    return name;
  }
  var name: String?
}

class ViewController: UIViewController {
  
  var collactor:LocalizedCollationResult<Person>?
  
  override func viewDidLoad() {
    super.viewDidLoad()
    let array = ["掌声", "莉丝", "张辉", "楚梦", "马云", "李斯", "李嘉琪", "王萌", "李云", "王五", "丽丽"];
    let newArray = array.compactMap { (name) -> Person? in
      let person = Person();
      person.name = name;
      return person;
    }
    collactor = newArray.localizedCollaction();
    view.addSubview(tableView);
  }
  
  lazy var tableView: UITableView = {
    let tableView = UITableView(frame: view.frame, style: .grouped);
    tableView.dataSource = self;
    tableView.register(UITableViewCell.self, forCellReuseIdentifier: NSStringFromClass(UITableViewCell.self));
    return tableView;
  }()
}

extension ViewController : UITableViewDataSource {
  func numberOfSections(in tableView: UITableView) -> Int {
    return collactor?.section.count ?? 0;
  }
  func tableView(_ tableView: UITableView, numberOfRowsInSection section: Int) -> Int {
    return collactor?.section[section].count ?? 0;
  }
  
  func tableView(_ tableView: UITableView, cellForRowAt indexPath: IndexPath) -> UITableViewCell {
    let cell = tableView.dequeueReusableCell(withIdentifier: NSStringFromClass(UITableViewCell.self), for: indexPath);
    cell.textLabel?.text = collactor?.section[indexPath.section][indexPath.row].name;
    return cell;
  }
  
  func tableView(_ tableView: UITableView, titleForHeaderInSection section: Int) -> String? {
    return collactor?.sectionTitles[section];
  }
  func sectionIndexTitles(for tableView: UITableView) -> [String]? {
    return collactor?.sectionTitles;
  }
  
  func tableView(_ tableView: UITableView, sectionForSectionIndexTitle title: String, at index: Int) -> Int {
    return UILocalizedIndexedCollation.current().section(forSectionIndexTitle: index);
  }
}

