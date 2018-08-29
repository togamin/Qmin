//
//  QListTableViewController.swift
//  Qmin
//
//  Created by Togami Yuki on 2018/08/26.
//  Copyright © 2018 Togami Yuki. All rights reserved.
//

import UIKit

class QListTableViewController: UITableViewController {

    var QList:[qInfo]!
    var tag:String!
    @IBOutlet var QListTableView: UITableView!
    
    override func viewDidLoad() {
        super.viewDidLoad()
        self.QList = tagQread(tag: tag)

    }
    override func viewWillAppear(_ animated: Bool) {
        nowTag = self.tag
        self.QList = tagQread(tag: tag)
        self.QListTableView.reloadData()
    }

    override func didReceiveMemoryWarning() {
        super.didReceiveMemoryWarning()

    }

    override func tableView(_ tableView: UITableView, numberOfRowsInSection section: Int) -> Int {

        return self.QList.count
    }

    
    override func tableView(_ tableView: UITableView, cellForRowAt indexPath: IndexPath) -> UITableViewCell {
        let cell = tableView.dequeueReusableCell(withIdentifier: "Qcell", for: indexPath)
        cell.textLabel?.text = self.QList[indexPath.row].question

        return cell
    }
    
    
    //セルをタップしたら発動する処理
    override func tableView(_ tableView: UITableView, didSelectRowAt indexPath: IndexPath) {
        performSegue(withIdentifier:"goToDetail",sender:nil)
    }
    //画面遷移時に呼び出される
    override func prepare(for segue:UIStoryboardSegue,sender:Any?){
        print("画面遷移中")
        if let indexPath = self.QListTableView.indexPathForSelectedRow{
            let question = self.QList[indexPath.row].question
            let answer = self.QList[indexPath.row].answer
            
            //遷移先のViewControllerを格納
            let controller = segue.destination as! QDetailViewController
            
            //遷移先の変数に代入
            controller.question = question
            controller.answer = answer
            controller.Index = indexPath.row
        }
    }
    override func tableView(_ tableView: UITableView, editActionsForRowAt indexPath: IndexPath) -> [UITableViewRowAction]? {
        let delete: UITableViewRowAction = UITableViewRowAction(style: .normal, title: "削除") { (action, index) -> Void in
            let alert = UIAlertController(title: "削除しますか?", message:nil, preferredStyle: .alert)
            alert.addAction(UIAlertAction(title: "OK", style: .default, handler: {(action: UIAlertAction!) -> Void in
                deleteQ(tag:self.tag,Index: indexPath.row)
                self.QList = tagQread(tag: self.tag)
                self.QListTableView.reloadData()
            }))
            alert.addAction(UIAlertAction(title: "Cancel", style: .cancel, handler: {action in print("キャンセル")}))
            //その他アラートオプション
            alert.view.layer.cornerRadius = 25 //角丸にする。
            self.present(alert,animated: true,completion: {()->Void in print("表示されたよん")})
            
        }
        delete.backgroundColor = UIColor(red: 1, green: 0.2, blue: 0.2, alpha: 0.8)
        return [delete]
    }
    
    
    
}
