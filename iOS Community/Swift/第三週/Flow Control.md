### if and if...else
條件判斷，觀念上跟其它程式語言一樣，寫法上因為有Swift有optional及enum with associate type而有其它不同的變化

### guard statement
與if相同都用來做條件判斷，不同在於**條件判斷不成立**時才會執行條件句內的程式，且結束離開時執行return或throw error，表程式已中止不會往下走。

### switch statement
概念與其它程式語言相同，但使用上有些差異
- case不會fall through，不用寫break
- case內容不可為空，如不做事就要加上break
- 需列出所有case，否則就要使用default
- **fallthrough**可以讓case達到fall through

### Loop
- #### for-in
	- ❌ the standard C-based for loop
	- 👌 **for...in**
	- retrieve each item in a **range**, **collection**, or **sequence**
	
	```
	for let(default)/var variable in collection/range {  
	  block of code 
	}
	```

- #### while
	- while
	```
	while condition {  
	  block of code 
	} 
	```
	- repeat...while
	```
	repeat { 
	  block of code 
	} while condition 
	```
	
### where with conditional statement
- 增加條件，過濾掉不符合的資料
- 可讀性
- function、class、structure and enumeration宣告也可以使用

### case with conditional statement
- 過濾或解析tuple或enum型態