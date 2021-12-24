> _Error handling_ is the process of responding to and recovering from error conditions in your program. Swift provides first-class support for throwing, catching, propagating, and manipulating recoverable errors at runtime.
- create error: comform **Error Protocol**
	- throw/throws
- do-catch: 針對error做處理
	- catch不指定error型別，表全部錯誤都會進去，且有預設變數**error**
- method會拋錯的話，呼叫前面要加上
	- try：表開發者要自行處理，用do-catch
	- try?：不管有沒有錯，程式繼續往下走
	- try!：有錯就crash

P.S.
- **\_** ：在swift代表沒有用到
- typealias：別名，為某個結構、型態設定名稱