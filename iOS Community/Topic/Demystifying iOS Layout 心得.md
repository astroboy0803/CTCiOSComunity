原文: [Demystifying iOS Layout](http://tech.gc.com/demystifying-ios-layout/)
中譯: [(簡)揭秘 iOS 布局 - 掘金](https://juejin.im/post/5a951c655188257a804abf94)

範例[下載](./LearningObjects/UIViewLayoutCycle.zip)

### iOS App Launch Sequence

當使用者點選app icon到開啟app畫面的流程
![[Attachments/Demystifying iOS Layout 心得/MainEventLoop.jpg]]
[圖一 Main event loop](https://developer.apple.com/library/content/documentation/General/Conceptual/Devpedia-CocoaApp/MainEventLoop.html)

從程式面來看
![[Attachments/Demystifying iOS Layout 心得/LaunchSequence.png]]
[圖二 Revisiting the App Launch Sequence on iOS – Ole Begemann](https://oleb.net/blog/2012/02/app-launch-sequence-ios-revisited/)

- App Main：[[Demystifying iOS Layout 心得]]
- RunLoop
  - 由系統自行建立與管理，開發人員只能透過api來使用
  - 讓GUI程式更有效率的持續進行不中止
  - 所有事件都會進到RunLoop中排隊，再逐筆將待辦工作取出並執行
  - **Responder Chain**：iOS接受到事件後，會一層一層的往下傳遞，直到有對應的元件處理後才停止	 

![[Attachments/Demystifying iOS Layout 心得/ResponderChain.png]][圖三 Responder · KKBOX iOS/Mac OS X 基本開發教材](https://zonble.gitbooks.io/kkbox-ios-dev/responder/)

![[AppleDevelpoerResponserChain.png]]
[圖四 Cocoa Application Competencies for iOS](https://developer.apple.com/library/archive/documentation/General/Conceptual/Devpedia-CocoaApp/Responder.html)
	
   > **Note**
   > - 無用的view會拉長Responder Chain，導致效能不佳
   > - 想了解RunLoop運作，可參閱[深入理解RunLoop /| Garan no dou](https://blog.ibireme.com/2015/05/18/runloop/)

### Update Cycle
- Main RunLoop完成事件作業後至畫面產生的時間
- 更新畫面上view的layout、display與constraints
- iOS裝置為60fps -> 執行時間約1/60秒
- 當view有發生改變時，系統會先標記該view需要重新渲染，並在下一個update cycle完成渲染
- view的更新並不是即時生效
![[Attachments/Demystifying iOS Layout 心得/UpdateCycle.png]]
[圖五 原文](http://tech.gc.com/demystifying-ios-layout/)

### Auto Layout Cycle
![[Attachments/Demystifying iOS Layout 心得/AutoLayoutCycle.svg]]
[圖六 UIView Auto Layout life cycle](https://www.vadimbulavin.com/view-auto-layout-life-cycle/)

- Update
  - Constraints
  - top-down
  - 依設定的Constraints產生對應的view
- Layout
  - Frames -> size與position
  - bottom-up
  - layout engine計算view與subview的frame
- Render
  - 顯示階段
  - 重新繪制view

### UIView Layout
  - size與position
  - layoutSubviews
    - 更新view與subview的size與position
    - 因為要重新計算有subview，所以成本非常高
    - 只能override不可以直接invoke
    - Auto Trigger
      - Resizing a view
      - Adding a subview
      - User scrolling a UIScrollView (layoutSubviews is called on the UIScrollView and its superview)
      - User rotating their device
      - Updating a view’s constraints
  - setNeedsLayout 
    - 用來觸發layoutSubviews的方法之一
    - 最節省資源
    - 標記要更新的view後就立即return
    - 當下不會呼叫layoutSubviews更新layout
    - 下一個update cycle才更新
    - 使用者不會感受到卡遁狀況
  - layoutIfNeeded
    - 另一個用來觸發layoutSubviews的方法
    - 如果view的layout有異動時，會立即觸發layoutSubviews更新layout；
    - 如果view的layout沒有改變，則不會觸發layoutSubviews，即使同一個RunLoop內呼叫多次，只要view的layout沒有更新就不會觸發
    - 除非是程式中需要取得即時的layout資訊，否則優先使用setNeedsLayout來觸發layoutSubviews

## UIView Display
  - UIView的屬性但不包含size與position，像是
    - color
    - text
    - image
    - Core Graphics
  - 系統自動偵測或是由開發人員觸發更新
  - draw
    - 更新view的畫面，但不包含subview
    - 與layoutSubviews相同，只能override不可以直接invoke
  - setNeedsDisplay
    - 同setNeedsLayout
    - 設定更新flag後立即return
    - 下一個update cycle才更新
    - 一般都由系統自動偵測而觸發更新
    - 若是某個非UI元件資料更動需重新繪制view，可以透過setNeedsDisplay讓view更新
    
    ``` swift
    class MyView: UIView {
    var numberOfPoints = 0 {
        didSet {
            setNeedsDisplay()
        }
    }

    override func draw(_ rect: CGRect) {
        switch numberOfPoints {
        case 0:
            return
        case 1:
            drawPoint(rect)
        case 2:
            drawLine(rect)
        case 3:
            drawTriangle(rect)
        case 4:
            drawRectangle(rect)
        case 5:
            drawPentagon(rect)
        default:
            drawEllipse(rect)
        }
    }
	```
  - Dispaly沒有立即更新的方法(如layoutIfNeeded)
    - 異動值會立即生效
    - 但還是會等到下一個週期才更新
    ![[Attachments/Demystifying iOS Layout 心得/DrawDisplay.png]]

### UIView Constraints
  - static Constraints
    - interface builder
    - view's initializer 
    - viewDidLoad
  - updateConstraint
    - 動態改變Constraints
    - 與layoutSubviews和draw一樣，只能override不可以直接invoke
    - 實作要更新的updateConstraint
    - Auto Trigger
      - activating 或 dedeactivating Constraints
      - 更新Constraints的priority或constant value
      - 移除subviews
  - setNeedsUpdateConstraints
    - 同setNeedsDisplay與setNeedsLayout
    - 設定更新flag後立即return
    - 下一個update cycle才更新
  - updateConstraintsIfNeeded
    - 同layoutIfNeeded
    - 檢查更新Constraints的flag，如有要異動就會立即觸發updateConstraints
  - invalidateIntrinsicContentSize
    - 有些view會有intrinsicContentSize屬性
    - 會依據內容得到view的size
    - 讓原本intrinsicContentSize失效
    - 下一個update cycle重新計算intrinsicContentSize
    
### 綜合說明

|Method purposes|Layout|Display|Constraints|
|---|---|---|---|
|Implement updates (override, don’t call explicitly)|layoutSubviews|draw|updateConstraints|
|Explicitly mark view as needing update on next update cycle|setNeedsLayout|setNeedsDisplay|setNeedsUpdateConstraints invalidateIntrinsicContentSize|
|Update immediately if view is marked as “dirty”|layoutIfNeeded| - |updateConstraintsIfNeeded|
|Actions that implicitly cause views to be updated|addSubview Resizing a view setFrame that changes a view’s bounds (not just a translation) User scrolls a UIScrollView User rotates device|Changes in a view’s bounds|Activate/deactivate constraints Change constraint’s value or priority Remove view from view hierarchy|

![[Attachments/Demystifying iOS Layout 心得/Flow.png]]
