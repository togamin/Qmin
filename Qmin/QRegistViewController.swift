//
//  QRegistViewController.swift
//  Qmin
//
//  Created by Togami Yuki on 2018/08/12.
//  Copyright © 2018 Togami Yuki. All rights reserved.
//

import UIKit

class QRegistViewController: UIViewController,UIPickerViewDelegate,UIPickerViewDataSource,UITextFieldDelegate,UIScrollViewDelegate {
    

    @IBOutlet weak var questionField: UITextField!
    @IBOutlet weak var contentView: UIView!
    @IBOutlet weak var scrollView: UIScrollView!
    @IBOutlet weak var myPicker: UIPickerView!
    @IBOutlet weak var textView: UITextView!
    var pickerList:[String]!
    var pickerText:String!
    
    // Screenの高さ
    var screenHeight:CGFloat!
    // Screenの幅
    var screenWidth:CGFloat!

    
    override func viewDidLoad() {
        super.viewDidLoad()
        
        self.scrollView.delegate = self
        self.myPicker.delegate = self
        self.questionField.delegate = self
        self.pickerList = ["英語","就活","動物","ドラマ"]
        self.pickerText = self.pickerList[0]
        
        // 画面サイズ取得
        let screenSize: CGRect = UIScreen.main.bounds
        self.screenWidth = screenSize.width
        self.screenHeight = screenSize.height
        
        // 表示窓のサイズと位置を設定
        scrollView.frame.size = CGSize(width: screenWidth, height: screenHeight)
        
        // UIScrollViewに追加
        self.scrollView.addSubview(self.questionField)
        self.scrollView.addSubview(self.myPicker)
        self.scrollView.addSubview(self.textView)
        
        // UIScrollViewの大きさをスクリーンの縦方向を２倍にする
        scrollView.contentSize = CGSize(width: screenWidth, height: screenHeight + 120)
        
        // スクロールの跳ね返り無し
        //scrollView.bounces = false
        
        // ビューに追加
        self.view.addSubview(scrollView)
        
        
        
        
        
        // 仮のサイズでツールバー生成
        let kbToolBar = UIToolbar(frame: CGRect(x: 0, y: 0, width: 320, height: 40))
        kbToolBar.barStyle = UIBarStyle.default  // スタイルを設定
        kbToolBar.sizeToFit()  // 画面幅に合わせてサイズを変更
        // スペーサー
        let spacer = UIBarButtonItem(barButtonSystemItem: UIBarButtonSystemItem.flexibleSpace, target: self, action: nil)
        // 閉じるボタン
        let commitButton = UIBarButtonItem(barButtonSystemItem: UIBarButtonSystemItem.done, target: self, action:#selector(self.closeKeybord(_:)))
        kbToolBar.items = [spacer, commitButton]
        self.textView.inputAccessoryView = kbToolBar
        self.questionField.inputAccessoryView = kbToolBar
    }
    @objc func closeKeybord(_ sender:Any){
        self.view.endEditing(true)
    }
    /*
    override func viewWillAppear(_ animated: Bool) {
        super.viewWillAppear(animated)
        
        NotificationCenter.default.addObserver(self,selector: #selector(QRegistViewController.keyboardWillShow(_:)),name: NSNotification.Name.UIKeyboardWillShow,object: nil)
        NotificationCenter.default.addObserver(self,selector: #selector(QRegistViewController.keyboardWillHide(_:)) ,name: NSNotification.Name.UIKeyboardWillHide,object: nil)
    }*/
    
    override func viewWillDisappear(_ animated: Bool) {
        super.viewWillDisappear(animated)
        NotificationCenter.default.removeObserver(self,name: .UIKeyboardWillShow,object: self.view.window)
        NotificationCenter.default.removeObserver(self,name: .UIKeyboardDidHide,object: self.view.window)
    }

    //UIPickerViewの列の数
    func numberOfComponents(in pickerView: UIPickerView) -> Int {
        return 1
    }
    
    // UIPickerViewの要素の数
    func pickerView(_ pickerView: UIPickerView, numberOfRowsInComponent component: Int) -> Int {
     return self.pickerList.count
    }
    // UIPickerViewに表示する配列
    func pickerView(_ pickerView: UIPickerView,
                    titleForRow row: Int,
                    forComponent component: Int) -> String? {
        
        return pickerList[row]
    }
    func pickerView(_ pickerView: UIPickerView, didSelectRow row: Int, inComponent component: Int) {
        // 選択時の処理
        self.pickerText = self.pickerList[row]
        print("テスト：",self.pickerText)
    }
    
    //改行ボタンが押された際に呼ばれる.
    func textFieldShouldReturn(_ textField: UITextField) -> Bool {
        self.questionField.resignFirstResponder()
        return true
    }
    /*
    @objc func keyboardWillShow(_ notification: Notification) {
        let info = notification.userInfo!
        let keyboardFrame = (info[UIKeyboardFrameEndUserInfoKey] as! NSValue).cgRectValue
        
        // bottom of textField
        let bottomTextField = textView.frame.origin.y + textView.frame.height
        // top of keyboard
        let topKeyboard = screenHeight - keyboardFrame.size.height
        // 重なり
        let distance = bottomTextField - topKeyboard
        
        if distance >= 0 {
            // scrollViewのコンテツを上へオフセット + 20.0(追加のオフセット)
            self.scrollView.contentOffset.y = distance + 20.0
        }
    }
    
    @objc func keyboardWillHide(_ notification: Notification) {
        self.scrollView.contentOffset.y = 0
    }*/
    
    
    @IBAction func Qregist(_ sender: UIBarButtonItem) {
        
        let alert = UIAlertController(title: "この質問を登録しますか??", message: "", preferredStyle: .alert)
        alert.addAction(UIAlertAction(title: "登録", style: .default, handler: {(action:UIAlertAction!) -> Void in
            
            // 現在日時の取得
            let now = NSDate()
            let dateFormatter = DateFormatter()
            dateFormatter.locale = NSLocale(localeIdentifier: "ja_JP") as Locale?
            dateFormatter.timeStyle = .medium
            dateFormatter.dateStyle = .medium
            var data = dateFormatter.string(from: now as Date)
            
            print("テスト：",self.questionField.text)
            print("テスト：",self.pickerText)
            print("テスト：",self.textView.text)
            print("テスト：",data)
            
            //CoreDataへの登録
            Qmin.Qregist(question:self.questionField.text!,tag:self.pickerText,answer:self.textView.text,date:data)
            
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
