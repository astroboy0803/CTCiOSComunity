Properties associate values with a particular **class**, **structure**, or **enumeration**.

### Stored Properties
> Stored properties will store **variable** or **constant** values as part of an instance of a **class** or **structure**.
- private(set)讓property為read-only(唯讀)
- Lazy Stored Properties	
	> a property whose **initial value isn’t calculated until the first time it’s used**. You indicate a lazy stored property by writing the `lazy` modifier before its declaration.
	> must always declare a **lazy property as a variable** (with the `var` keyword), because its **initial value might not be retrieved** until after instance initialization completes. 
	> **Constant properties** must always have a value _before_ initialization completes, and therefore **can’t be declared as lazy**

### Computed Properties
> These **do not store a value** themselves, but **retrieve and possibly set other properties**.
- get(必要) and set
- 每次都會依設定條件去計算，不會真的儲存在記憶體
- 因每次都會重新計算，要注意是不有效能問題

### Property Observers
> Property observers **observe and respond to changes** in a property’s value. Property observers are called every time a property’s value is set, even if the new value is the same as the property’s current value.
> add property observers in the following places:
> 1. Stored properties that you define
> 2. Stored properties that you inherit
> 3. Computed properties that you inherit
- init不會觸發

### Property Wrappers
> A property wrapper adds a **layer of separation** between code that **manages how a property is stored** and the code that **defines a property**. For example, if you have properties that provide thread-safety checks or store their underlying data in a database, you have to write that code on every property. When you use a property wrapper, you write the management code once when you define the wrapper, and then reuse that management code by applying it to multiple properties