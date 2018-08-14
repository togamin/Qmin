//
//  QDetailViewController.swift
//  Qmin
//
//  Created by Togami Yuki on 2018/08/14.
//  Copyright © 2018 Togami Yuki. All rights reserved.
//

import UIKit

class QDetailViewController: UIViewController {

    var question:String!
    var tag:String!
    var answer:String!
    @IBOutlet weak var QDetailField: UITextField!
    @IBOutlet weak var QDetailView: UITextView!
    @IBOutlet weak var scrollView: UIScrollView!
    // Screenの高さ
    var screenHeight:CGFloat!
    // Screenの幅
    var screenWidth:CGFloat!
    
    
    override func viewDidLoad() {
        super.viewDidLoad()
        
        self.QDetailField.text = self.question
        self.QDetailView.text = self.answer
        
        // 画面サイズ取得
        let screenSize: CGRect = UIScreen.main.bounds
        self.screenWidth = screenSize.width
        self.screenHeight = screenSize.height
        
        // 表示窓のサイズと位置を設定
        self.scrollView.frame.size = CGSize(width: screenWidth, height: screenHeight)
        
        // UIScrollViewに追加
        self.scrollView.addSubview(self.QDetailField)
        self.scrollView.addSubview(self.QDetailView)
        
        // UIScrollViewの大きさをスクリーンの縦方向を２倍にする
        scrollView.contentSize = CGSize(width: screenWidth, height: screenHeight + 120)
        
        // ビューに追加
        self.view.addSubview(scrollView)
        
    }
    
    
    
    
    
    override func didReceiveMemoryWarning() {
        super.didReceiveMemoryWarning()
        // Dispose of any resources that can be recreated.
    }
}
