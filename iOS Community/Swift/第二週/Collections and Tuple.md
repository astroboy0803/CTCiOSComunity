### Collections
- #### Array
	- Create and Initialize
		- Array
		- []，偏好使用這種寫法
		- 在建立array時，要確認element的資料型態，想要任意(or 通用)型態的話可以設定為**Any**或**AnyObject**，但不建議這樣使用，因為**type safety**是swift非常重視的理念
		- Elements' type is optional?
	- 最後元素後的,(逗號)可以保留
	- Iterating
	- Access and Replace
	- isEmpty and Count
		- isEmpty vs Count == 0：[Check if a Swift Array Is Empty: Best Practice Revisited](https://betterprogramming.pub/check-swift-array-is-empty-f15e63bf1026)
	- Add and Remove
	- Merge and SubArray
	- Bulk changes
	- Methods
		- foreach
		- filter
		- map/compactMap/flatMap
		- sort / sorted
		- reduce and joined

- #### Set
	- each item must be unique => conform **Hashable**
	- 資料型態不可為**Any**或**AnyObject**
	- Create and Initialize
	- Add and Remove
	- Methods
	- Iterating
	- Operations-集合操作
	
- #### Dictionary
	- a container that stores multiple key-value pairs
		- key: unique identifier =>  conform **Hashable**
		- value: 可指定任意型態，如果value的型態非單一種資料型態的話，也是可以用**Any**或**AnyObject**，但一樣不建議這樣使用。
	- 不保證存放順序
	- Create and Initialize
		- Dictionary
		- [:]，偏好使用這種寫法
	- Access and Replace
		- 取出來的資料為optinal型態
	- Add and Remove
	- Methods
	- Iterating

### tuple
- group multiple values into a single compound value
- values in the tuple do not have to be of the same type
- Create and Initialize
- Manipulation