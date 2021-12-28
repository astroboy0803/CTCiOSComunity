### Function
> Functions are **self-contained chunks of code** that perform a specific task. You give a function a **name that identifies** what it does, and this name is used to **call** the function to **perform its task** when needed.
- first class function
- keyword: **func**
- parameters就是tuple
- 沒有參數要回傳的話，可以用**Void**表示，也可以不寫，因為預設就是Void
- 設定回傳值使用**->**
- 一行可以省略**return**
- 有回傳值的話
	- 不使用，可以用 **_** 來接，不然會出現warming提示
	- function加上前綴符號**@discardableResult**
- function裡面可以有function
- 可以設定parameter的**default value**
- Internal and external parameter
	- external parameter的概念來自smalltalk→增加可讀性
	- extenal parameter可有可無
	- parameter不使用的話可以加**\_**
- variadic parameters
	- 該參數可傳可不傳且數量不固定	
	- keyword: **...**
	- 參數型態為array
- 傳進來的參數會更動的話，須加上**inout**，呼叫的時候會加上**&**

### Closure
> Closures are **self-contained blocks of functionality** that **can be passed** around and used in your code. 

- 定義
```swift
{ [capture list] (parameters) throws -> return type in
 
}
```

- swift first-class function
	- 可以定義成變數或常數
	- 可以做為參數傳遞
- 沒有回傳值可以用**Void**或**()**表示
- 同function，使用->來設定回傳值
- 同function，一行可以省略**return**
- 沒有參數和回傳值的話，接參數的地方可直接省略
- shorthand方式接參數
	- 在block內容一定要有最後一個參數
		- 一眼可以看出closure接幾個參數
	- $ + 參數的序號(從0開始)
- function和closure是相似的
- Trailing Closures
	- 最後一個參數為closure可以提到外面
	- 當方法只有一個clousre參數,可以省略括號
- Inferring Type From Context
	- 因為這個方法已經定義好closure的型態，故可以推論出參數與回傳的型態，所以可以將型態與參數括號省略
- Closures Are **Reference** Types
- escaping closures
	> A closure is said to _escape_ a function when the c**losure is passed as an argument** to the function, but is **called after the function returns**. When you declare a function that takes a closure as one of its parameters, you can **write `@escaping` before the parameter’s type** to indicate that the closure is allowed to escape
- [[Capture List]]