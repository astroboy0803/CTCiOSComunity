### Function
> Functions are **self-contained chunks of code** that perform a specific task. You give a function a **name that identifies** what it does, and this name is used to **call** the function to **perform its task** when needed.
- first class function
- keyword: **func**
- parameters就是tuple
- 可以設定parameter的default value
- 沒有參數要回傳的話，可以用**Void**表示，也可以不寫，因為預設就是Void
- 設定回傳值使用**->**
- 一行可以省略**return**
- 有回傳值的話
	- 不使用，可以用 **_** 來接，不然會出現warming提示
	- function加上前綴符號**@discardableResult**
- function裡面可以有function
- external parameter names可有可無
- 內外部parameter不使用的話可以加**_**
- 不定長度的parameter
	- 只能在最後一個參數
	- keyword: **...**
- 傳進來的參數會更動的話，須加上**inout**，呼叫的時候會加上**&**

### Closure
> Closures are **self-contained blocks of functionality** that **can be passed** around and used in your code. 
- swift first-class function
	- 可以定義成變數或常數
	- 可以做為參數傳遞
- 沒有回傳值可以用**Void**或**()**表示
- 同function，使用->來設定回傳值
- 沒有參數和回傳值的話，接參數的地方可直接省略
- shorthand方式接參數
	- 在block內容一定要有最後一個參數，這樣才知道closure接幾個參數
	- $ + 參數的序號(從0開始)
- 同function，一行可以省略**return**
- function和closure是相似的
	- first class function
- Trailing Closures
	- 最後一個參數為closure可以提到外面
	- 當方法只有一個clousre參數,可以省略括號
- Inferring Type From Context
- Closures Are Reference Types
- @escaping
- Capture List