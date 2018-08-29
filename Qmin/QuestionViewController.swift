//
//  QuestionViewController.swift
//  Qmin
//
//  Created by Togami Yuki on 2018/08/13.
//  Copyright © 2018 Togami Yuki. All rights reserved.
//

import UIKit

var nowTag:String!

class QuestionViewController: UIViewController,UIPickerViewDelegate, UIPickerViewDataSource {
    
    let myDefault = UserDefaults.standard
    var QList:[qInfo]!
    var tagList:[String]!
    var Qget:qInfo!
    var random:UInt32!
    @IBOutlet weak var tagPicker: UIPickerView!
    @IBOutlet weak var QLabel: UILabel!
    @IBOutlet weak var editBtn: UIButton!
    @IBOutlet weak var QBtn: CustomButton!
    @IBOutlet weak var penguin01: UIImageView!
    var preSelectedLb:UILabel!

    override func viewDidLoad() {
        super.viewDidLoad()
        
        //View
        self.view.backgroundColor = UIColor(red: 1, green: 1, blue: 1, alpha: 0.8)
        //ボタン
        self.QBtn.setTitleColor(UIColor(red: 1, green: 1, blue: 1, alpha: 0.9), for: .normal)//タップ前の状態
        self.QBtn.setTitleColor(UIColor(red: 1, green: 1, blue: 1, alpha: 0.9), for: .highlighted)//タップした状態の色
        self.QBtn.backgroundColor = UIColor(red: 0, green: 0.02, blue: 0.06, alpha: 0.8)//背景色
        self.QBtn.layer.cornerRadius = 10//角丸
        //ラベル
        self.QLabel.backgroundColor = UIColor(red: 1, green: 1, blue: 1, alpha: 0.9)
        self.QLabel.textColor = UIColor(red: 0, green: 0.02, blue: 0.06, alpha: 0.9)
        self.QLabel.layer.cornerRadius = 10
        self.QLabel.clipsToBounds = true
        
        self.tagPicker.layer.cornerRadius = 10
        
        //self.penguin01.image = UIImage(named: "penguin01.png")
        

        self.tagPicker.delegate = self
        self.tagPicker.dataSource = self
        
        //CoreDateに要素があるかないかを確認するだけなら、動作速度はより早くなる。
        self.QList = Qread()
        //print(self.QList)
        //deleteAllQInfo()
        //CoreDateに何も入っていないときに、デフォルトで質問集を入れる。
        if self.QList.count == 0{
            for data in Qdefault{
                Qregist(question:data.question,tag:data.tag,answer:data.answer,date:data.date)
            }
        }
        myDefault.register(defaults: ["tagList" : ["就活","英会話","面白い話","罰ゲーム","今日の晩御飯"]])
        self.tagList = self.myDefault.object(forKey: "tagList") as! [String]
        nowTag = self.tagList[0]
        
        //Editボタン
        self.editBtn.isEnabled = false
    }
    override func viewWillAppear(_ animated: Bool) {
        self.QLabel.text = "Qmin"
        self.editBtn.isEnabled = false
    }
    
    //ボタンを押すと質問がランダムに表示される。
    @IBAction func Qmin(_ sender: UIButton) {
        self.QList = tagQread(tag:nowTag)
        if self.QList.count == 0{
           self.QList = [qInfo(question:"質問が登録されていません。",tag:"",answer:"",date:"")]
            self.editBtn.isEnabled = false
        }else{
            self.editBtn.isEnabled = true
        }
        self.random = arc4random_uniform(UInt32(self.QList.count))
        self.Qget = self.QList[Int(self.random)]
        print(self.random)
        self.QLabel.text = self.Qget.question
    }
    
    @IBAction func editQ(_ sender: UIButton) {
        
        performSegue(withIdentifier: "editQ",sender: nil)
    }
    // Segue 準備
    override func prepare(for segue: UIStoryboardSegue, sender: Any?) {
        if (segue.identifier == "editQ") {
            let QDetail: QDetailViewController = (segue.destination as? QDetailViewController)!
            
            QDetail.question = self.Qget.question
            QDetail.answer = self.Qget.answer
            QDetail.Index = Int(self.random)
            print(self.random)
        }
    }
    
    
    // UIPickerViewの列の数
    func numberOfComponents(in pickerView: UIPickerView) -> Int {
        return 1
    }
    // UIPickerViewの行数、要素の全数
    func pickerView(_ pickerView: UIPickerView,
                    numberOfRowsInComponent component: Int) -> Int {
        return self.tagList.count
    }
    // UIPickerViewに表示する配列
    func pickerView(_ pickerView: UIPickerView,
                    titleForRow row: Int,
                    forComponent component: Int) -> String? {
        
        return self.tagList[row]
    }
    
    // UIPickerViewのRowが選択された時の挙動
    func pickerView(_ pickerView: UIPickerView,
                    didSelectRow row: Int,
                    inComponent component: Int) {
        nowTag = self.tagList[row]
        print(self.tagList[row])
    }

    
    override func didReceiveMemoryWarning() {
        super.didReceiveMemoryWarning()
    }

}
