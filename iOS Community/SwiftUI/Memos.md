SwiftUI 3.0，增加很多新功能，在使用上可能要考慮版本
- 支援Markdown
- 

#### View Style
some View都有為自己的View提供設定style的modifier，像是Label的labelStyle，或是TextField的textFieldStyle，可以將**客制化的樣式集中在some style**，最後再使用some style modifier來設定就會生效。缺點就是**無法通用**，舉例來說就是客制化的LabelStyle無法用在TextField上。

#### View Modifier
可以達成View Style的目的，集中處理客制化樣式，更強大的是能夠通用，也就是建立後任何view都可以使用