**Main** file是每個app的進入點，Xcode在建立objc專案時，會自動幫忙產生，但因為main程式碼制式且一般根本不會去異動，因此在swift專案就改用annotation方式註記在appdelegate檔案，待程式執行時自動生成

![[ObjcMain.png]]
<center>圖一 objc專案</center>

![[swiftMain.png]]
<center>圖二 swift專案 @main by Xcode 12</center>

![[swiftApplicationMain.png]]
<center>圖三 swift專案 @UIApplicationMain by Xcode 11</center>

#### Swift專案自行定義main
1. 移除appdelegate的annotation

![[removeAnnotation.png]]

2. 建立main檔
![[createMain.png]]

3. 呼叫**UIApplicationMain**並帶入參數
	1. 系統或user帶入參數
	2. 系統或user實際傳入參數
	3. UIApplication或subclass的名稱(字串)，nil的話會預帶UIApplication
	4. Appdelegate或subclass的名稱(字串)

![[maincode.png]]