### Structure
- **Value Type**
- 不可繼承，conform多個protocol
- 沒有deinit
- 自動產生init，init的參數是根據定義的常數與變數
- [[Property]]
- [[Methods]]
	- method如果會改變自己的store property要加上**mutating**

### Class
- **Reference Type**
- 可以被繼承也可以繼承其它class(單一繼承)，conform多個protocol
- 有deinit
- init
	- 若有非optional的變數或常數在宣告時沒有給值的話，至少要建立一個init(參數任意)且要將沒設定的值設定
	-  implicit initializer：非optional的變數或常數全部都有給初始值的話，就會自動產生init且不接任何參數
- [[Property]]
- [[Methods]]
- 繼承：使用「:」，第一個要放class，後面再接protocol

### Initializer
- 正常的init不用下return
- 可能會初始不成功，要回傳nil，使用**init?**

### Class Initializer
> **Designated initializers** are the **primary initializers** for a class. A designated initializer fully initializes all properties introduced by that class and calls an appropriate superclass initializer to continue the initialization process up the superclass chain.
> **Convenience initializers** are **secondary, supporting initializers** for a class. You can define a **convenience initializer to call a designated initializer** from the same class as the convenience initializer with some of the designated initializer’s parameters set to default values. You can also define a convenience initializer to create an instance of that class for a specific use case or input value type.
> Write the **required** modifier before the definition of a class initializer to indicate that **every subclass of the class must implement** that initialize

### Enumeration
Enumerations (also known as enums) are a special data type that enables us to **group related types together** and **use them in a type-safe manner**.

Swift的enum比其它程式語言來的強大
- **Value Type**
- 可讀性
- create
	- normal
	- short
- 比對
	1. switch: 必須列出所有條件，或使用defatult
	2. if
- CaseIterable
- 預設是沒有型別, 但可設定為任意型態
	- rawValue
	- init(rawValue:)
- associated value
	- 不可以設定型別
- [[Optional Variables]]是enum

> **Structures** and **classes** are general-purpose, flexible constructs that become the building blocks of your program’s code. You define properties and methods to add functionality to your structures and classes using the same syntax you use to define constants, variables, and functions.

P.S. 
- 三種結構都可以在內部建立彼此，namespace的概念
