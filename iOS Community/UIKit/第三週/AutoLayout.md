iOS一開始畫面是透過元件Frame來做排版，也就是設定元件的大小與起始座標來決定元件在畫面上的位置。這種方式實現畫面轉向或適應不同大小等功能時，需要很多的計算。

為避免效能被這些計算拖垮，Apple推出了**AutoLayout**，有點像是iOS的RWD，透過設定讓app在不同裝置不同方向下能符合開發者設定的格式，開發者不用自行計算位置，只要將各元件的對應位置、大小等設定好，iOS底層就會根據這些設定計算出各元件的位置。

#### Interface Builder(IB)
- xib： 1對1
- storyboard：1對多
- [Auto Layout 入門教學](https://www.appcoda.com.tw/introduction-auto-layout/)
- 練習： 以上週實作的Sort App做練習
	- Label
		- 高50
		- 寬均分裝置螢幕寬
		- 距離上方20
		- 彼此水平對齊
	![[labels.gif]]
	
	- Button
		- 寬120
		- 高80 
		- 兩個間距為20
		- 垂直軸對齊
			- 「亂數」按鈕的右側
			- 「排序」按鈕的左側
		- 水平對齊機器
		![[buttons.gif]]
	- 完成圖
	![[result.png]]
	
#### Programmatically
- [純程式碼 Auto Layout 與概要教學](https://denkeni.medium.com/純程式碼-auto-layout-與概要教學-一-6077dd73dd3f)