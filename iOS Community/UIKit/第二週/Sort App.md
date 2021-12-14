1. 選擇Main.storyboard並開啟Library
![[截圖 2021-12-10 下午2.25.17.png]]

2. 將元件拖曳到畫面上 
![[Pasted image 20211210142658.png]]

3. Label \* 5、Button \* 2
![[Pasted image 20211210142917.png]]

4. 更新元件內容
- 直接對元件點兩下
![[Pasted image 20211210142932.png]]
- 右側選單(Inspector)
![[截圖 2021-12-10 下午2.30.05.png]]

5. 清空Label內容，並設定按鈕文字
![[Pasted image 20211210143055.png]]

6. 確認目前畫面對應的程式
![[截圖 2021-12-14 下午2.46.52.png]]

7. Interface Builder與程式建立關聯 - 由Interface Builder開始
- 增加編輯畫面
![[截圖 2021-12-10 下午2.16.46.png]]
- 選擇畫面對應的程式
![[Pasted image 20211210143328.png]]
![[Pasted image 20211210143353.png]]
- **IBOutlet**
	- 點選元件並按住control，移到滑鼠到另一個編輯畫面
	![[Pasted image 20211214145551.png]]
	- 放開control和滑鼠，輸入元件變數名稱後按下Connect
	![[Pasted image 20211214145228.png]]
	![[Pasted image 20211214145736.png]]
	![[Pasted image 20211214145825.png]]
- **IBAction**
	- 點選元件並按住control，移到滑鼠到另一個編輯畫面
	![[Pasted image 20211214150126.png]]
	- 放開control和滑鼠，輸入事件名稱變數名稱
	![[Pasted image 20211214150221.png]]
	- event設定Touch Up Inside
	![[Pasted image 20211214150346.png]]
	- 按下Connect
	![[Pasted image 20211214150427.png]]
8. Interface Builder與程式建立關聯 - 由程式開始
- 程式中建立**IBOutlet**與**IBAction**的變數
![[截圖 2021-12-10 下午2.41.18.png]]
- 開啟Interface Builder，在Inspector視窗下建立關聯
![[Pasted image 20211210143956.png]]

9. 實作功能
	- doRandom：產生五個隨機整數
	![[截圖 2021-12-14 下午3.20.08.png]]
	- doSorted：將資料排序
	![[截圖 2021-12-14 下午3.20.21.png]]