## 安裝

在專案目錄下，打上:
```bash
pod install
```
接著直接在Xcode即可執行。

## 結構

此專案此用的結構是MVVM-C，整個結構的實作參考的如下網址
[請點我](https://medium.com/sudo-by-icalia-labs/ios-architecture-mvvm-c-introduction-1-6-815204248518)
大致的結構說明如下：
```
FerqoIOS
|--- Extension                      # 此資料作為原生類型的擴充，例如對UIView的功能擴充
|--- Resources                      # 此為圖片的擺放的位置
|--- Model                          # 資料的類型，用於第三方的API資料回來的格式或者資料庫的資料類型
|--- Service                        # 用來撰寫API邏輯的位置
|--- Scenes                         # 畫面層
|    |--- AppCoordinator.swift      # 最上層 router設定
|    |--- Coordinator               # router的Base，用於讓AppCoordinator繼承
|    |--- LaunchScreen.storybord    # 沒用到
|       |--- Intro                # 繼Splash畫面後的頁面，為開場簡介的部分
|           |--- Intro.sotryboard # 畫面
|           |--- IntroCoordinator.swift  # 有關此畫面的router跳轉至別的screen的設定
|           |--- viewControllers  # 此畫面的邏輯
|           |--- viewModel        # 此畫面會用到的資料
       |--------------------------# 後面的每個頁面的邏輯都是由上述四個部分組成|
```

## 畫面的呈現方式
有些比較複雜的畫面，則是使用SnapKit去實作，這樣一些常用的component可以不必重寫，而且可以最大限度地利用和兼顧維護。
有些比較簡單的畫面則是使用storyboard去實作。

## Note
關於Signing的部分，原先是使用工程師的個人帳號，並未使用公司的Itune connect，所以要請後續的工程師
使用公司的帳號，重新申請。

