#### iOS App Launch Sequence
- [[Demystifying iOS Layout 心得]]

#### Transition
- ViewController
	- present / dismiss
	![[PresentDismiss.gif]]

- Container View Controller
	- [UINavigationController](https://developer.apple.com/documentation/uikit/uinavigationcontroller)
		- push / pop					
		![[Navigation.gif]]
		
	- [UITabBarController](https://developer.apple.com/documentation/uikit/uitabbarcontroller)
		- viewControllers				
		![[Tab.gif]]
		
	- [UISplitViewController](https://developer.apple.com/documentation/uikit/uisplitviewcontroller)
		- viewControllers		
		![[Split.gif]]

### 實作轉場效果
- ViewController、UITabBarController and UINavigationController
- Step
	1. 建立專案
	2. Main storyboard設定兩個按鈕
		- Tab
		- Navigation 
		![[mainButtons.png]]
	3. 建立Sort與Palette Group
		- 專案資料夾→右鍵→**New Group**→建立Sort Group
			![[CreateGroup.png]]
		![[sortfolder.png]]
		-  同樣方式再建立Palette Group
	4. 將[[Sort App]]與[[調色盤]]專案的ViewController分別放到Group
		![[sortgroup.png]]
		![[palettegroup.png]]		
	5. 將兩個ViewController加入專案中
		![[addFiles.png]]
		![[addsort.png]]
		![[added.png]]
	6. 兩個ViewController的檔名與Class Name更改為SortViewController與PaletteViewController
		![[rename.png]]
	7.  為SortViewController與PaletteViewController建立Interface Builder(xib)
		![[createXib.png]]
		![[nameCreateXib.png]]
		![[Xibs.png]]
	8. 設定Interface Builder
		- 開啟舊專案→Main storyboard→選擇view→cmd + c複製
		![[oldcopyview.png]]
		- 回到新專案→cmd + v貼上
		![[pasteview.png]]
		- 設定File's Owner Class
		![[ownerclass.png]]
		- 設定關聯
		![[startlink.png]]
		![[endlink.png]]			
	9. 實作ViewController
		- 連結程式與Interface Builder
		![[actionLinkXib.png]]
		
		- TabViewController
		```Swift	      
		let tabViewController: UITabBarController = .init()

		let sortVC: SortViewController = .init(nibName: "SortViewController", bundle: nil)

		let paletteVC: PaletteViewController = .init(nibName: "PaletteViewController", bundle: nil)

		sortVC.tabBarItem = .init(tabBarSystemItem: .favorites, tag: 0)

		paletteVC.tabBarItem = .init(tabBarSystemItem: .history, tag: 1)

		tabViewController.viewControllers = [sortVC, paletteVC]

		tabViewController.modalPresentationStyle = .fullScreen

		self.present(tabViewController, animated: true)
		```
		
		- NavigationController
		```Swift
		let sortVC: SortViewController = .init(nibName: "SortViewController", bundle: nil)

		let navController = UINavigationController(rootViewController: sortVC)

		navController.modalPresentationStyle = .fullScreen

		self.present(navController, animated: true)
		```
	10.  設定離開與跳轉功能，參考範例程式

#### Return Value 
- 將資料傳給sub view controller
	- 建構子
	- create instance後直接呼叫instance member
- 怎麼把資料帶回sup view controller
	- delegate
		- [[Protocol]] and [[Extension]]
		- memory problem
			- weak or unowned
	- closure
		- memory problem
			- capture list with weak or unowned
	- segue
		- storyboard ❌
- singleton
	- instance必須為refence type = class
	- global variable - static
	- **only one instance** of a type for the lifetime of the application
	- lazy初始化，無法確保thread safety