//
//  QRegistViewController.swift
//  Qmin
//
//  Created by Togami Yuki on 2018/08/12.
//  Copyright © 2018 Togami Yuki. All rights reserved.
//

import UIKit

class QRegistViewController: UIViewController,UIPickerViewDelegate,UIPickerViewDataSource,UITextFieldDelegate,UIScrollViewDelegate {
    
    let myDefault = UserDefaults.standard
    @IBOutlet weak var questionField: UITextField!
    @IBOutlet weak var contentView: UIView!
    @IBOutlet weak var scrollView: UIScrollView!
    @IBOutlet weak var myPicker: UIPickerView!
    @IBOutlet weak var textView: UITextView!
    var tagList:[String]!
    var pickerText:String!//登録時のpickerの値を入れる用.
    
    // Screenの高さ
    var screenHeight:CGFloat!
    // Screenの幅
    var screenWidth:CGFloat!

    
    override func viewDidLoad() {
        super.viewDidLoad()
        
        self.scrollView.delegate = self
        self.myPicker.delegate = self
        self.questionField.delegate = self
        
        //初期値の設定。何も入っていない場合は
        self.myDefault.register(defaults: ["tagList" : ["英語","就活","面白い話"]])
        self.tagList = self.myDefault.object(forKey: "tagList") as! [String]
        
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
            
            let alert2 = UIAlertController(title: "登録しました。", message: "", preferredStyle: .alert)
            alert2.addAction(UIAlertAction(title: "OK", style: .default, handler: {(action:UIAlertAction!) -> Void in}))
            self.present(alert2,animated: true,completion: {()->Void in print("表示されたよん")})
            
        }))
        alert.addAction(UIAlertAction(title: "Cancel", style: .cancel, handler: {action in print("キャンセル")}))
        
        //その他アラートオプション
        alert.view.layer.cornerRadius = 25 //角丸にする。
        
        present(alert,animated: true,completion: {()->Void in print("表示されたよん")})
    }
    
    @IBAction func addTag(_ sender: UIButton) {
        let alert = UIAlertController(title: "タグの追加", message: "新しいタグを入力してください", preferredStyle: .alert)
        alert.addAction(UIAlertAction(title: "登録", style: .default, handler: {(action: UIAlertAction!) -> Void in
            
            self.tagList.append(alert.textFields![0].text!)
            // UserDefaultにデータを書き込む
            self.myDefault.set(self.tagList, forKey: "tagList")
            self.myPicker.reloadAllComponents()
            
        }))
        alert.addAction(UIAlertAction(title: "Cancel", style: .cancel, handler: {action in print("キャンセル")}))
        // テキストフィールドを追加
        alert.addTextField(configurationHandler: {(addTitleField: UITextField!) -> Void in
            addTitleField.placeholder = "新しいタグを入力してください。"//プレースホルダー
        })
        //その他アラートオプション
        alert.view.layer.cornerRadius = 25 //角丸にする。
        present(alert,animated: true,completion: {()->Void in print("表示されたよん")})//completionは動作完了時に発動。
        
    }
    
    override func didReceiveMemoryWarning() {
        super.didReceiveMemoryWarning()
    }
}
