> Access control **restricts access to parts of your code** from code in other **source files** and **modules**. This feature enables you to **hide the implementation details** of your code, and to **specify a preferred interface** through which that code can be accessed and used.
> 
> Swift’s access control model is based on the concept of **modules** and **source files**.
> 
> A **module** is a single unit of code distribution—a **framework** or application that’s built and shipped as a single unit and that **can be imported by another module** with Swift’s **import** keyword.
> 
> A **source file** is a **single Swift source code file within a module** (in effect, a single file within an app or framework). Although it’s common to define individual types in separate source files, a **single source file can contain definitions for multiple types, functions, and so on**.

#### Levels
- 開放程度：
	```
	open > public > internal > fileprivate > private
	```
- open
	- 其它module與source file都能存取
	- 只能使用在class或class member
	- 允許外部subclass與override	
- public
	- 其它module與source file都能存取
	- 任何型態都可以設定
	- 若設定對象為class
		- 同一個module下可以subclass與override
		- 但無法被外部subclass與override
- internal
	- 預設層級
	- 同一個module內的source file都能存取
	- 任何型態都可以設定
	- 若設定對象為class，可以被subclass與override	
- fileprivate
	- 在相同的source file內可以存取
	- 任何型態都可以設定
	- 若設定對象為class，可以被subclass與override
- private
	- 在相同的source file下且相同的宣告範圍內才可以存取
	- 任何型態都可以設定
	- 若設定對象為class，可以被subclass與override，但sonclass必須宣告在superclass內

#### Principle
> No entity can be defined in terms of another entity that has a lower (more restrictive) access level
