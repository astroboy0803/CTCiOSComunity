|參數|路徑|
|---|---|
|TARGET_NAME|就是target name|
|SRCROOT|程式碼的根目錄。在xcode的環境下，內容等同於$(PROJECT_DIR)|
|SOURCE_ROOT|等同於${PROJECT_DIR}|
|PROJECT_DIR|project的根目錄。常用在指定檔案path相關的設定|
|PROJECT_FILE_PATH|等同於${PROJECT_DIR}/HelloWorld.xcodeproj|
|PRODUCT_NAME|Build Setting區的「Product Name」|
|PRODUCT_NAME:c99extidentifier|一個以Product Name為參考值的參數。會在Productname前面加上底線符號修飾。|
|PRODUCT_BUNDLE_IDENTIFIER|Build Setting區的「Product Bundle Identifier」|
|inherited|在Target setting裡面繼承Project setting同欄位的內容|
|EXECUTABLE_NAME|執行檔名|
|DEVELOPMENT_LANGUAGE|app的預設語言|
|CONTENTS_FOLDER_PATH|一個以Build Setting區的「Product Name」為參考值的參數。會自動加上「.app」做尾修飾|

p.s. 使用上要用/$()還是/${}都可以，另外在Build Phases Run Script也可以使用

Reference
- [Build Setting Reference](https://developer.apple.com/library/archive/documentation/DeveloperTools/Reference/XcodeBuildSettingRef/1-Build_Setting_Reference/build_setting_ref.html#//apple_ref/doc/uid/TP40003931-CH3-SW49)
- [Build settings reference](https://help.apple.com/xcode/mac/8.3/#/itcaec37c2a6)