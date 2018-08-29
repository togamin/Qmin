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
    @IBOutlet weak var SaveBtn: UIButton!
    
    var question:String!
    var answer:String!
    var Index:Int!
    
    override func viewDidLoad() {
        super.viewDidLoad()

        //ボタン
        self.SaveBtn.setTitleColor(UIColor(red: 1, green: 1, blue: 1, alpha: 0.9), for: .normal)//タップ前の状態
        self.SaveBtn.setTitleColor(UIColor(red: 1, green: 1, blue: 1, alpha: 0.9), for: .highlighted)//タップした状態の色
        self.SaveBtn.backgroundColor = UIColor(red: 0, green: 0.02, blue: 0.06, alpha: 0.8)//背景色
        self.SaveBtn.layer.cornerRadius = 10//角丸
        
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
        
        //画面上UIの位置
        self.Qtitle.frame = CGRect(x:20,y:20,width:screenWidth - 40,height: 30)
        self.Qtitle.textAlignment = NSTextAlignment.left
        self.QuestionField.frame = CGRect(x:20,y:55,width:screenWidth - 40,height: 30)
        self.Qmemo.frame = CGRect(x:20,y:105,width:screenWidth - 40,height: 30)
        self.Qmemo.textAlignment = NSTextAlignment.left
        self.QmemoTextView.frame = CGRect(x:20,y:140,width:screenWidth - 40,height: 300)
        self.QmemoTextView.layer.cornerRadius = 10
        self.SaveBtn.frame = CGRect(x:screenSize.width/2 - 100,y:460,width:200,height: 60)
        
        // UIScrollViewに追加
        scrollView.addSubview(QuestionField)
        scrollView.addSubview(QmemoTextView)
        scrollView.addSubview(Qtitle)
        scrollView.addSubview(Qmemo)
        scrollView.addSubview(SaveBtn)
        
        // UIScrollViewの大きさをスクリーンの縦方向を２倍にする
        scrollView.contentSize = CGSize(width: screenWidth, height: screenHeight*1.5)
        
        // ビューに追加
        self.view.addSubview(scrollView)
    }
    
    @IBAction func QSaveBtn(_ sender: UIButton) {
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
    
    
    @IBAction func Qshare(_ sender: UIBarButtonItem) {
        let controller = UIActivityViewController(activityItems: [self.QuestionField.text,self.QmemoTextView.text], applicationActivities:nil)
        
        //iPadでエラーが出ないようにする
        controller.popoverPresentationController?.sourceView = self.view
        
        self.present(controller, animated: true,completion:nil)
    }
    
    

    override func didReceiveMemoryWarning() {
        super.didReceiveMemoryWarning()

    }
}
