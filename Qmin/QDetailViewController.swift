//
//  QDetailViewController.swift
//  Qmin
//
//  Created by Togami Yuki on 2018/08/26.
//  Copyright © 2018 Togami Yuki. All rights reserved.
//

import UIKit

class QDetailViewController: UIViewController {

    // UIScrollViewインスタンス生成
    var scrollView = UIScrollView()
    // Screenの高さ
    var screenHeight:CGFloat!
    // Screenの幅
    var screenWidth:CGFloat!
    
    @IBOutlet weak var QuestionField: UITextField!
    @IBOutlet weak var QmemoTextView: UITextView!
    
    var question:String!
    var answer:String!
    
    override func viewDidLoad() {
        super.viewDidLoad()

        self.QuestionField.text = question
        self.QmemoTextView.text = answer
        
        // 画面サイズ取得
        let screenSize: CGRect = UIScreen.main.bounds
        screenWidth = screenSize.width
        screenHeight = screenSize.height
        
        // 表示窓のサイズと位置を設定
        scrollView.frame.size =
            CGSize(width: screenWidth, height: screenHeight)
        scrollView.center = self.view.center
        
        // UIScrollViewに追加
        scrollView.addSubview(QuestionField)
        scrollView.addSubview(QmemoTextView)
        
        // UIScrollViewの大きさをスクリーンの縦方向を２倍にする
        scrollView.contentSize = CGSize(width: screenWidth, height: screenHeight*2)
        
        // ビューに追加
        self.view.addSubview(scrollView)

    }

    override func didReceiveMemoryWarning() {
        super.didReceiveMemoryWarning()

    }
}
