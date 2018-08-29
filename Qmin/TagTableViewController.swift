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
        myDefault.register(defaults: ["tagList" : ["就活","英会話","面白い話","罰ゲーム","今日の晩御飯"]])
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
            if alert.textFields![0].text! != "" {
                //テキストフィールドの中身を配列に入れUserDefautに保存
                self.tagList.append(alert.textFields![0].text!)
                self.tagTableView.reloadData()
                self.myDefault.set(self.tagList, forKey: "tagList")
            
                let alertOK = UIAlertController(title: "追加しました", message:nil, preferredStyle: .alert)
                alertOK.addAction(UIAlertAction(title: "OK", style: .default, handler: {(action: UIAlertAction!) -> Void in}))
                self.present(alertOK,animated: true,completion: {()->Void in print("表示されたよん")})
            }else{
                let alertNO = UIAlertController(title: "タグが記入されていません。", message:nil, preferredStyle: .alert)
                alertNO.addAction(UIAlertAction(title: "OK", style: .default, handler: {(action: UIAlertAction!) -> Void in}))
                self.present(alertNO,animated: true,completion: {()->Void in print("表示されたよん")})
            }
            
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
    
    override func tableView(_ tableView: UITableView, editActionsForRowAt indexPath: IndexPath) -> [UITableViewRowAction]? {
        
        
        let edit: UITableViewRowAction = UITableViewRowAction(style: .normal, title: "編集") { (action, index) -> Void in
            print("編集")
            let alert = UIAlertController(title: "タグ名を編集します。", message:nil, preferredStyle: .alert)
            alert.addAction(UIAlertAction(title: "OK", style: .default, handler: {(action: UIAlertAction!) -> Void in
                //入力されたタグ名をUserDefaultに保存。
                self.tagList = self.myDefault.object(forKey: "tagList") as! [String]
                print("テスト",self.tagList)
                let oldTag = self.tagList[indexPath.row]
                let newTag = alert.textFields![0].text!
                self.tagList[indexPath.row] = newTag
                self.tagTableView.reloadData()
                print("テスト",self.tagList)
                
                // Keyを指定して保存
                self.myDefault.set(self.tagList, forKey: "tagList")
                //CoreDetaのタグを変更して保存。
                updateTag(oldTag:oldTag,newTag:newTag)
            
            }))
            alert.addAction(UIAlertAction(title: "Cancel", style: .cancel, handler: {action in print("キャンセル")}))
            alert.addTextField(configurationHandler: {(addTitleField: UITextField!) -> Void in
                addTitleField.text = self.tagList[indexPath.row]
                addTitleField.placeholder = "タグ名を入力してください"//プレースホルダー
            })
            //その他アラートオプション
            alert.view.layer.cornerRadius = 25 //角丸にする。
            self.present(alert,animated: true,completion: {()->Void in print("表示されたよん")})
            
        }
        let delete: UITableViewRowAction = UITableViewRowAction(style: .normal, title: "削除") { (action, index) -> Void in
            
            let alert = UIAlertController(title: "削除しますか?", message:"このタグの質問が全て削除されますが、よろしいですか?", preferredStyle: .alert)
            alert.addAction(UIAlertAction(title: "OK", style: .default, handler: {(action: UIAlertAction!) -> Void in

                //UserDefaultのタグを削除。
                self.tagList = self.myDefault.object(forKey: "tagList") as! [String]
                print("テスト",self.tagList)
                let oldTag = self.tagList[indexPath.row]
                self.tagList.remove(at: indexPath.row)
                self.myDefault.set(self.tagList, forKey: "tagList")
                self.tagTableView.reloadData()
                //CoreDateからそのタグの情報を削除。
                deleteTag(tag:oldTag)
                
                
                
            }))
            alert.addAction(UIAlertAction(title: "Cancel", style: .cancel, handler: {action in print("キャンセル")}))
            //その他アラートオプション
            alert.view.layer.cornerRadius = 25 //角丸にする。
            self.present(alert,animated: true,completion: {()->Void in print("表示されたよん")})
            print("削除")
        }
        
        edit.backgroundColor = UIColor(red: 0.2, green: 1, blue: 0.2, alpha: 0.8)
        delete.backgroundColor = UIColor(red: 1, green: 0.2, blue: 0.2, alpha: 0.8)
        
        return [edit,delete]
    }
    
    
}
