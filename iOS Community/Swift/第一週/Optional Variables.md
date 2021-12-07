Swift非常強調且重視**safety feature**，所以變數從宣告時就必須明確告知是否可以為nil(其它程式語言可能會叫做null)
- non-optional variables：不可設定為nil，否則會出錯
- optional variables：可以為nil的變數，在宣告和存取與一般有所不同

### Optional Variables Declaring
- ?(問號)
- !(驚嘆號)：宣告時為nil，但確定在使用當下一定有值
- 不用特別指定，預設就給nil值

### Optional Variables Unwrapped
- 強制存取
	- 使用 **?** 宣告：使用!(驚嘆號)強制unwrapped
	- 使用 **!** 宣告： 同一般變數操作，不用unwrapped
	- 只要變數為nil就會crash(閃退)
- Optional chaining
	- 使用變數前加問號，若變數為nil就直接離開，不往執行	
- Optional binding
	- if let(or var)：不為nil才會進入{}
	- guard let(or var)：為nil才會進入{}