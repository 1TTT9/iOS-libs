Practice Example of Swift language
========

=======
## ■ Update 2016/03/01

- d3view  
1) a simple demo for interaction bw UIComponent and WebComponent by using UIWebView and Javascript and graph drawn by D3.js  
2) here I used node(.js) as web server and [set NSAppTransportSecurity as arbitary](http://stackoverflow.com/questions/31254725/transport-security-has-blocked-a-cleartext-http) to work around cleartext HTTP problem on iOS.  
3) event handle bw UIComponent and Javascript can be implemented by re-defining its communication protocol.  
4) on IOS >~8.0, btter use [WKWebView](http://liuyanwei.jumppo.com/2015/10/17/ios-webView.html) instead of UIView.  
5) used 3rd-party customized button via Cocoapods.
6) DEMO  
<p align="center">
  <img src="https://dl.dropboxusercontent.com/u/23983489/d3view.png" />
</p>


## ■ Update 2016/02/27

- auto-update tables  
1) added custom control for UIImageView, keywords [IBInspectable, IBDesignable](http://nshipster.com/ibinspectable-ibdesignable/)  
2) met [failed to update auto layout status](http://stackoverflow.com/questions/27374330/ibdesignable-error-ib-designables-failed-to-update-auto-layout-status-interf)  
3) added tap-event on uitableview  
4) added class for UIColor(hex)  
5) added custom presentation view (GGPopupMenuViewController)  
6) DEMO  
<p align="center">
  ![Alt text](https://dl.dropboxusercontent.com/u/23983489/output_automove2.gif "Optional title")
</p>


- Update 2016/02/26  
1) demo on update UITableViews automatically and periodically  
2) you can also tap any cell of the tableViews to pause/run the update on them.  


## ■ Update 2016/02/05

- editable tag list  
1) An simple example of configurable tag edit package using UITextview and UICollectionView  
2) DEMO  
<p align="center">
  <img src="https://dl.dropboxusercontent.com/u/23983489/editable_tag_view.png" />
</p>


## ■ Update 2015/04/26

- Jump game  
1) A practice of gaming using swift and spritekit  
2) Take it a look: [video](https://www.facebook.com/video.php?v=10205210667690096&l=1158552520302726446)


- Reference  
1) [Apple.com](https://developer.apple.com/library/prerelease/ios/documentation/Swift/Conceptual/Swift_Programming_Language/zzSummaryOfTheGrammar.html)  
2) [gitbook.io](http://numbbbbb.gitbooks.io/-the-swift-programming-language-/index.html)