iOS的記憶體管理策略為Reference Counting，記錄物被目前被參考的次數，當次數為0即可回收該記憶體。

#### Reference Counting 
- MRC(Manual Reference Counting)
	- objc
	- 由開發者自己決定物件的參考次數
		- retain = +1
		- release = -1
- ARC(Automatic Reference Counting)
	- swift or objc
	- 系統會自行判斷物件的參考次數

#### Memory Problem
- memory leak : 物件已不在使用但無法回收
	- (Strong) Retain Cycle
	- 不斷的吃掉記憶體，進而觸發memory warning，甚至閃退
- dangling pointer : 使用的物件已被回收
	- 0x8badf00d = **ate bad food**

#### Memory Leak & Resolve
Swift是使用ARC來做記憶體管理，所以在宣告物件時，必須依據使用情景來設定是擁有或參考狀態
- 擁有
	- **strong**，預設值
	- RC值會+1
	- 當兩個strong物件彼此擁有對方就會產生**Strong Retain Cycle**，解決方式只要把cycle中的某個**關係從擁有改為參考**即可
- 參考
	- RC值不會改變
	- **weak**
		- 參考的對象可以為nil
	- **unowned**
		- 參考的對象不可為nil