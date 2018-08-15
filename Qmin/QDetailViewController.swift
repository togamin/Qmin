//
//  QDetailViewController.swift
//  Qmin
//
//  Created by Togami Yuki on 2018/08/14.
//  Copyright © 2018 Togami Yuki. All rights reserved.
//

import UIKit

class QDetailViewController: UIViewController,UIPickerViewDelegate,UIPickerViewDataSource {
    
    

    let myDefault = UserDefaults.standard
    var question:String!
    var tag:String!
    var answer:String!
    var QId:Int!
    @IBOutlet weak var QDetailField: UITextField!
    @IBOutlet weak var QDetailView: UITextView!
    @IBOutlet weak var scrollView: UIScrollView!
    @IBOutlet weak var myPicker: UIPickerView!
    var tagList:[String]!
    var pickerText:String!//登録時のpickerの値を入れる用.
    
    // Screenの高さ
    var screenHeight:CGFloat!
    // Screenの幅
    var screenWidth:CGFloat!
    
    
    override func viewDidLoad() {
        super.viewDidLoad()
        
        self.myPicker.delegate = self
        
        self.QDetailField.text = self.question
        self.QDetailView.text = self.answer
        
        //初期値の設定。何も入っていない場合は
        self.myDefault.register(defaults: ["tagList" : ["英語","就活","面白い話"]])
        self.tagList = self.myDefault.object(forKey: "tagList") as! [String]
        
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
    func numberOfComponents(in pickerView: UIPickerView) -> Int {
        return 1
    }
    
    // UIPickerViewの要素の数
    func pickerView(_ pickerView: UIPickerView, numberOfRowsInComponent component: Int) -> Int {
        return self.tagList.count
    }
    // UIPickerViewに表示する配列
    func pickerView(_ pickerView: UIPickerView,
                    titleForRow row: Int,
                    forComponent component: Int) -> String? {
        
        return tagList[row]
    }
    func pickerView(_ pickerView: UIPickerView, didSelectRow row: Int, inComponent component: Int) {
        // 選択時の処理
        self.pickerText = self.tagList[row]
        print("テスト：",self.pickerText)
    }
    
    @IBAction func editSave(_ sender: UIBarButtonItem) {
        //アラートの表示
        let alert = UIAlertController(title: "上書きしますか?", message: "", preferredStyle: .alert)
        alert.addAction(UIAlertAction(title: "YES", style: .default, handler: {(action: UIAlertAction!) -> Void in
            
            //上書きするためのデータ取得
            self.question = self.QDetailField.text
            self.tag = self.pickerText
            self.answer = self.QDetailView.text
            //日時取得
            let now = NSDate()
            let dateFormatter = DateFormatter()
            dateFormatter.locale = NSLocale(localeIdentifier: "ja_JP") as Locale?
            dateFormatter.timeStyle = .medium
            dateFormatter.dateStyle = .medium
            var data = dateFormatter.string(from: now as Date)
            //CoreDateからデータの呼び出しと上書き。
            updateQ(Index:self.QId,question:self.question,tag:self.tag,answer:self.answer,date:data)
            //上書き完了のアラート
            let alert2 = UIAlertController(title: "上書きしました", message: "", preferredStyle: .alert)
            alert2.addAction(UIAlertAction(title: "OK", style: .default, handler: {(action: UIAlertAction!) -> Void in}))
            self.present(alert2,animated: true,completion: {()->Void in print("表示されたよん")})
            
        }))
        alert.addAction(UIAlertAction(title: "NO", style: .cancel, handler: {action in print("キャンセル")}))
        //その他アラートオプション
        alert.view.layer.cornerRadius = 25 //角丸にする。
        present(alert,animated: true,completion: {()->Void in print("表示されたよん")})
    }
    
    
    
    
    override func didReceiveMemoryWarning() {
        super.didReceiveMemoryWarning()
        // Dispose of any resources that can be recreated.
    }
}
