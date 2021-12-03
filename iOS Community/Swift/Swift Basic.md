### Basic Type
- Numberic
	- 整數
		- signed：positive + negative + zero
			- Int、Int8、Int16、Int32、Int64
		- unsigned：positive + zero
			- UInt、UInt8、UInt16、UInt32、UInt64\
		- 可以用來表示其它進制，必須加上prefix
			- Decimal：預設，不用加
			- Binary：0b
			- Octal：0o
			- Hexadecimal：0x
		- 除非有特殊用途，不然就使用**Int或UInt(不含位元數)**的即可
	- 浮點數
		- Float：
			- Float、Float16、Float32、Float64、Float80
		- Double：64-bit
		- 除非有特殊用途，不然就使用**Double**較為精確
	- 數字表示位元數，會影響最大與最小值
	- compiler會忽略數字型態的underscore(下底線)，可以使用在較長的數字以做識別
	- 相同型態才可以做計算，不同型態要**先轉型**才可操作
- Boolean
	- true
	- false
- String：A Unicode string value that is a collection of characters
	- 文字內容同其它程式語言，使用double quote(")包住
	- 多行可以使用三個double quote(")包住，可避免使用過多的跳脫字元
	- 字串相加方式：+、\(變數) 
	- 常用方法與屬性：uppercased、lowercased、isEmpty、hasPrefix、hasSuffix
	- substring方法棄用，改成
		- 找出截取字串的start與end的Index
		- 用 subscript 語法取得Substring Type
		- 必要時再將Substring轉成String
	- **Swift 5後，為提升字串的處理速度，其它有做一些底層處理與調整，上述的Substring Type就是一種，可參考[ 深入了解 Swift String 字串型別 讓你的程式跑得更快更好](https://www.appcoda.com.tw/swift-string/)**

### Constants and Variables
- Definition:
	- Constants cannot be changed once a value is assigned to it
	- Variables can be updated or changed
- Declaring:
	- Keyword:
		- let:
		- var: 
	- Explicit Types
	- Type Inference
	- Type Safety
- Naming Rules:
	1. An identifier must **not contain any whitespace**.
	2. It must **not contain any mathematical symbols or arrows**.
	3. An identifier must **not contain private-use or invalid Unicode characters**.
	4. It must **not contain line- or box-drawing characters**.
	5. It must **not start with a number**, but it **can contain numbers**.
	6. If you use a **Swift keyword as an identifier, surround it with back ticks**; using a Swift keyword as an identifier is **strongly discouraged**.
	
	```
	var `self`: Int = 0
	print(`self`)
	```
