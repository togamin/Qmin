//
//  QListTableViewController.swift
//  Qmin
//
//  Created by Togami Yuki on 2018/08/13.
//  Copyright © 2018 Togami Yuki. All rights reserved.
//

import UIKit

class QListTableViewController: UITableViewController {

    var QList:[qInfo]!
    @IBOutlet var QListTableView: UITableView!
    
    override func viewDidLoad() {
        super.viewDidLoad()
        self.QList = Qread()
    }
    
    override func viewWillAppear(_ animated: Bool) {
        self.QList = Qread()
        self.QListTableView.reloadData()
    }

    override func didReceiveMemoryWarning() {
        super.didReceiveMemoryWarning()
        // Dispose of any resources that can be recreated.
    }

    //セルの数
    override func tableView(_ tableView: UITableView, numberOfRowsInSection section: Int) -> Int {

        return self.QList.count
    }

    //セルのインスタンス化
    override func tableView(_ tableView: UITableView, cellForRowAt indexPath: IndexPath) -> UITableViewCell {
        let cell = tableView.dequeueReusableCell(withIdentifier: "QListCell", for: indexPath)

        cell.textLabel?.text = self.QList[indexPath.row].question
        cell.detailTextLabel?.text = self.QList[indexPath.row].tag

        return cell
    }
    
    //セルを横にスライドさせた時に呼ばれる
    override func tableView(_ tableView: UITableView, commit editingStyle: UITableViewCellEditingStyle, forRowAt indexPath: IndexPath) {
        if editingStyle == .delete {
            deleteSelect(Index:indexPath.row)
            self.QList = Qread()
            self.QListTableView.reloadData()
        }
    }
    //セルをタップしたら発動する処理
    override func tableView(_ tableView: UITableView, didSelectRowAt indexPath: IndexPath) {
        performSegue(withIdentifier: "gotoDetail",sender:nil)
    }
    
    //画面遷移時に呼び出される
    override func prepare(for segue:UIStoryboardSegue,sender:Any?){
        print("画面遷移中")
        if let indexPath = self.QListTableView.indexPathForSelectedRow{
            
            let question = self.QList[indexPath.row].question
            let tag = self.QList[indexPath.row].tag
            let answer = self.QList[indexPath.row].answer
            
            //遷移先のViewControllerを格納
            let controller = segue.destination as! QDetailViewController
            
            //遷移先の変数に代入
            controller.QId = indexPath.row
            controller.question = question
            controller.tag = tag
            controller.answer = answer
        }
    }
}
