//
//  TagTableViewController.swift
//  Qmin
//
//  Created by Togami Yuki on 2018/08/26.
//  Copyright © 2018 Togami Yuki. All rights reserved.
//

import UIKit

class TagTableViewController: UITableViewController {

    let myDefault = UserDefaults.standard
    var tagList:[String]!
    @IBOutlet var tagTableView: UITableView!
    
    override func viewDidLoad() {
        super.viewDidLoad()
        myDefault.register(defaults: ["tagList" : ["就活","英語","面白い話","罰ゲーム"]])
        self.tagList = self.myDefault.object(forKey: "tagList") as! [String]

        
    }

    override func didReceiveMemoryWarning() {
        super.didReceiveMemoryWarning()
    }

    override func tableView(_ tableView: UITableView, numberOfRowsInSection section: Int) -> Int {
        return self.tagList.count
    }

    override func tableView(_ tableView: UITableView, cellForRowAt indexPath: IndexPath) -> UITableViewCell {
        let cell = tableView.dequeueReusableCell(withIdentifier: "tagCell", for: indexPath)

        cell.textLabel?.text = self.tagList[indexPath.row]

        return cell
    }
    //セルをタップしたら発動する処理
    override func tableView(_ tableView: UITableView, didSelectRowAt indexPath: IndexPath) {
        performSegue(withIdentifier:"goToQ",sender:nil)
    }
    //画面遷移時に呼び出される
    override func prepare(for segue:UIStoryboardSegue,sender:Any?){
        print("画面遷移中")
        if let indexPath = self.tagTableView.indexPathForSelectedRow{
            let tag = self.tagList[indexPath.row]
            //遷移先のViewControllerを格納
            let controller = segue.destination as! QListTableViewController
            
            //遷移先の変数に代入
            controller.title = tag
            controller.tag = tag
        }
    }
    
    
    
    @IBAction func addTag(_ sender: UIBarButtonItem) {
        let alert = UIAlertController(title: "追加するタグを記入してください", message:nil, preferredStyle: .alert)
        
        alert.addAction(UIAlertAction(title: "登録", style: .default, handler: {(action: UIAlertAction!) -> Void in
            
            //テキストフィールドの中身を配列に入れUserDefautに保存
            self.tagList.append(alert.textFields![0].text!)
            self.tagTableView.reloadData()
            self.myDefault.set(self.tagList, forKey: "tagList")
            
            let alertOK = UIAlertController(title: "追加しました", message:nil, preferredStyle: .alert)
            alertOK.addAction(UIAlertAction(title: "OK", style: .default, handler: {(action: UIAlertAction!) -> Void in}))
            self.present(alertOK,animated: true,completion: {()->Void in print("表示されたよん")})
            
        }))
        alert.addAction(UIAlertAction(title: "Cancel", style: .cancel, handler: {action in print("キャンセル")}))
        // テキストフィールドを追加
        alert.addTextField(configurationHandler: {(addTitleField: UITextField!) -> Void in
            addTitleField.placeholder = "タグを入力してください。"//プレースホルダー
        })
        //その他アラートオプション
        alert.view.layer.cornerRadius = 25 //角丸にする。
        
        present(alert,animated: true,completion: {()->Void in print("表示されたよん")})
    }
    
    
}
