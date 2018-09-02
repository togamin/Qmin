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
    
    @IBOutlet weak var myView: UIView!
    
    // UIScrollViewインスタンス生成
    var scrollView = UIScrollView()
    // Screenの高さ
    var screenHeight:CGFloat!
    // Screenの幅
    var screenWidth:CGFloat!
    
    var scrollHeight:CGFloat!
    
    @IBOutlet weak var topicLabel: UILabel!
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
        //スクロールViewのながさ
        scrollHeight = 557
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
        self.QLabel.shadowOffset = CGSize(width: 1, height: 1 )
        
        self.myView.layer.cornerRadius = 10
        self.myView.clipsToBounds = true
        
        self.tagPicker.layer.cornerRadius = 10
        
        
        // 画面サイズ取得
        let screenSize: CGRect = UIScreen.main.bounds
        screenWidth = screenSize.width
        screenHeight = screenSize.height
        
        // 表示窓のサイズと位置を設定
        scrollView.frame.size =
            CGSize(width: screenWidth, height: screenHeight)
        scrollView.center = self.view.center
        //画面上UIの位置
        self.myView.frame = CGRect(x:20,y:20,width:screenWidth - 40,height: 230)
        self.QLabel.frame = CGRect(x:0,y:0,width:screenWidth - 40,height: 230)
        self.penguin01.frame = CGRect(x:screenWidth - 140,y:130,width:100,height: 100)
        self.editBtn.frame = CGRect(x:screenWidth - 60,y:255,width:40,height: 35)
        self.tagPicker.frame = CGRect(x:20,y:295,width:screenWidth - 40,height: 110)
        self.topicLabel.frame = CGRect(x:20,y:265,width:screenWidth - 100,height: 20)
        self.QBtn.frame = CGRect(x:screenWidth/2 - 100,y:435,width:200,height: 90)
        
        // UIScrollViewに追加
        scrollView.addSubview(self.myView)
        scrollView.addSubview(self.editBtn)
        scrollView.addSubview(self.tagPicker)
        scrollView.addSubview(self.QBtn)
        scrollView.addSubview(self.topicLabel)

        
        self.myView.addSubview(self.QLabel)
        self.myView.addSubview(self.penguin01)
        
        // UIScrollViewの大きさをスクリーンの縦方向を２倍にする
        scrollView.contentSize = CGSize(width: screenWidth, height:scrollHeight)
        
        // ビューに追加
        self.view.addSubview(scrollView)
        
        
        
        
        
        
//
//        self.myView.frame = CGRect(x:20,y:screenSize.height*0.03,width:screenSize.width - 40,height: screenSize.height*0.4)
//        self.editBtn.frame = CGRect(x:screenSize.width - 60,y:screenSize.height*0.44,width:40,height:screenSize.height*0.06)
//        self.tagPicker.frame = CGRect(x:20,y:screenSize.height*0.51,width:screenSize.width - 40,height:screenSize.height*0.2)
////
////
//        self.allView.addSubview(self.myView)
//        self.allView.addSubview(self.editBtn)
//        self.allView.addSubview(self.tagPicker)
//        //self.allView.addSubview()
//        //self.allView.addSubview()
//        //self.allView.addSubview()
//

        
        
        
        
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
        myDefault.register(defaults: ["tagList" : ["ちょっとした話題","就活","英会話","面白い話","罰ゲーム","今日の晩御飯"]])
        self.tagList = self.myDefault.object(forKey: "tagList") as! [String]
        nowTag = self.tagList[0]
        
        //Editボタン
        self.editBtn.isEnabled = false
    }
    override func viewWillAppear(_ animated: Bool) {
        self.QLabel.text = "Qmin"
        self.editBtn.isEnabled = false
        self.tagList = self.myDefault.object(forKey: "tagList") as! [String]
        self.tagPicker.reloadComponent(0)
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
        
        UIView.transition(with: self.myView, duration: 2.5, options: [.transitionFlipFromLeft], animations: nil, completion: nil)
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
