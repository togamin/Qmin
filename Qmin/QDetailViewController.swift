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
    
    @IBOutlet weak var Qtitle: UILabel!
    @IBOutlet weak var Qmemo: UILabel!
    @IBOutlet weak var QuestionField: UITextField!
    @IBOutlet weak var QmemoTextView: UITextView!
    
    var question:String!
    var answer:String!
    var Index:Int!
    
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
        scrollView.addSubview(Qtitle)
        scrollView.addSubview(Qmemo)
        
        // UIScrollViewの大きさをスクリーンの縦方向を２倍にする
        scrollView.contentSize = CGSize(width: screenWidth, height: screenHeight*2)
        
        // ビューに追加
        self.view.addSubview(scrollView)
    }
    
    @IBAction func Qsave(_ sender: UIBarButtonItem) {
        let alert = UIAlertController(title: "質問を上書きしますか？", message:nil, preferredStyle: .alert)
        alert.addAction(UIAlertAction(title: "OK", style: .default, handler: {(action: UIAlertAction!) -> Void in
            print(self.Index); updateQ(Index:self.Index,question:self.QuestionField.text!,tag:nowTag,answer:self.QmemoTextView.text,date:nowTime())
            let alertOK = UIAlertController(title: "上書きしました", message:nil, preferredStyle: .alert)
            alertOK.addAction(UIAlertAction(title: "OK", style: .default, handler: {(action: UIAlertAction!) -> Void in}))
            self.present(alertOK,animated: true,completion: {()->Void in print("表示されたよん")})
        }))
        alert.addAction(UIAlertAction(title: "Cancel", style: .cancel, handler: {action in print("キャンセル")}))
        //その他アラートオプション
        alert.view.layer.cornerRadius = 25 //角丸にする。
        
        present(alert,animated: true,completion: {()->Void in print("表示されたよん")})
    }
    
    

    override func didReceiveMemoryWarning() {
        super.didReceiveMemoryWarning()

    }
}
