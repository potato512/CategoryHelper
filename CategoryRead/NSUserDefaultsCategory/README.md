# SYCategory
NSUserDefaults：

# 使用
``` javascript
/// 保存信息
void NSUserDefaultsSave(id object, NSString *key);

/// 读取保存的信息
id NSUserDefaultsRead(NSString *key);

/// 删除保存的信息
void NSUserDefaultsRemove(NSString *key);
```
