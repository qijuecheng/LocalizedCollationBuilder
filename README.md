# LocalizedCollationBuilder
根据字母或者中文拼音快速排序
```
class Person: LocalizedCollationable {
  var collationKey: String? {
    return name;
  }
  var name: String?
}
```
模型遵守LocalizedCollationable协议
重写collationKey的get，返回需要字母排序的属性
```
let array = ["掌声", "莉丝", "张辉", "楚梦", "马云", "李斯", "李嘉琪", "王萌", "李云", "王五", "丽丽"];
let newArray = array.compactMap { (name) -> Person? in
   let person = Person();
   person.name = name;
   return person;
}
let collactor = newArray.localizedCollaction()
collactor.sectionTitles // 区域索引标题【a-z】
collactor.section  // 区域索引对应的对象数组
```
