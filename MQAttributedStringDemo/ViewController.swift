//
//  ViewController.swift
//  MQAttributedStringDemo
//
//  Created by 120v on 2018/2/28.
//  Copyright © 2018年 MQ. All rights reserved.
//

import UIKit

class ViewController: UIViewController {

    override func viewDidLoad() {
        super.viewDidLoad()
        
        userAttributStr()
    }
    
    func userAttributStr() {
        let textView = UITextView(frame: CGRect(x: 20, y: 100, width: 335, height: 300))
        view.addSubview(textView)
        textView.backgroundColor = UIColor.brown
        textView.isEditable = false
        
        let  label = UILabel(frame: CGRect(x: 20, y: 410, width: 335, height: 250))
        label.backgroundColor = UIColor.lightGray
        label.numberOfLines = 0
        view.addSubview(label)
        
        let str = "我的字体更别的不同哦,我的颜色是红色,我加了背景色,我加了下划线,我的字距变大了,哈哈我有阴影了,点我啊 带你进入苹果官网"
        let attributeString = NSMutableAttributedString(string: str)
        
        /// 字体
        attributeString.addAttribute(NSAttributedStringKey.font, value: UIFont.systemFont(ofSize: 20), range: NSMakeRange(0, 10))
        attributeString.addAttribute(NSAttributedStringKey.font, value: UIFont(name: "Times New Roman", size: 24)!, range: NSMakeRange(0, 10))
        
        /// 字体颜色
        attributeString.addAttribute(NSAttributedStringKey.foregroundColor, value: UIColor.red, range: NSMakeRange(11, 7))
        
        /// 背景色
        attributeString.addAttribute(NSAttributedStringKey.backgroundColor, value: UIColor.green, range: NSMakeRange(19, 6))
        
        /// 下划线 (value值越大，下划线越粗)
        attributeString.addAttribute(NSAttributedStringKey.underlineStyle, value: 5, range: NSMakeRange(26, 6))
        
        /// 下划线颜色 (需在有下划线的字的设置)
        attributeString.addAttribute(NSAttributedStringKey.underlineColor, value: UIColor.orange, range: NSMakeRange(26, 5))
        
        /// 字距 (value的值越大，字距越大)
        attributeString.addAttribute(NSAttributedStringKey.kern, value:10, range: NSMakeRange(33, 7))
        
        /// 阴影
        let shadow = NSShadow()
        shadow.shadowColor = UIColor.black //阴影颜色
        shadow.shadowBlurRadius = 2.0 //模糊度
        shadow.shadowOffset = CGSize.init(width: 4, height: 4)  //阴影偏移
        attributeString.addAttribute(NSAttributedStringKey.shadow, value:shadow, range: NSMakeRange(41, 7))
        
        /// 添加链接
        attributeString.addAttribute(NSAttributedStringKey.link, value: NSURL(string: "http://www.apple.com")!, range: NSMakeRange(49, 12))
        
        // 行距
        let paragraphStyle = NSMutableParagraphStyle()
        paragraphStyle.lineSpacing = 30
        attributeString.addAttribute(NSAttributedStringKey.paragraphStyle, value: paragraphStyle, range: NSMakeRange(0, 61))
        
        /// html
        let htmlText = "我是<font color=\"blue\">html</font>。<br>An apple is <font color=\"red\">red</font>.我的字体更别的不同哦,我的颜色是红色,我加了背景色,我加了下划线,我的字距变大了,哈哈我有阴影了,点我啊 带你进入苹果官网"
        do{
            let attrStr = try NSAttributedString(data: htmlText.data(using: String.Encoding.unicode, allowLossyConversion: true)!, options: [NSAttributedString.DocumentReadingOptionKey.documentType:NSAttributedString.DocumentType.html], documentAttributes: nil)
            
            label.attributedText = attrStr
        }catch let error as NSError {
            print(error.localizedDescription)
        }
        
        textView.attributedText = attributeString
        
    }

    override func didReceiveMemoryWarning() {
        super.didReceiveMemoryWarning()
        // Dispose of any resources that can be recreated.
    }


}

