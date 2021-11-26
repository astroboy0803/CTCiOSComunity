# Playground

1. 開啟Xcode
![[Pasted image 20211116134921.png]]

2. 上方選單列
![[CreatePlayground.png]]

3. Blank iOS and Next
![[Pasted image 20211116140348.png]]

4. Naming and Create
![[Pasted image 20211116140638.png]]

5. Playground and Xcode Area
![[PlaygroundArea.png]]
![[XcodeAreas.png]] 

6. Playground檔案結構
	-  Sources：存放Swift檔案
	![[Pasted image 20211116145208.png]]
	![[Pasted image 20211116145229.png]]
	-  Resources：存放圖檔或其它資源檔
	![[Pasted image 20211116145018.png]]

7. Navigator → File → 右鍵 → New Playground Page
![[Pasted image 20211116142453.png]]
![[Pasted image 20211116150052.png]]

### PlaygroundSupport
- liveView：shows the result of running the code that’s on the current page
```swift
PlaygroundPage.current.liveView = some view
```
- needsIndefiniteExecution：that indicates whether indefinite execution is enabled
```swift
PlaygroundPage.current.needsIndefiniteExecution = true
```