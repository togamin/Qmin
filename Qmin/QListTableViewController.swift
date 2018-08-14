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


    override func tableView(_ tableView: UITableView, numberOfRowsInSection section: Int) -> Int {

        return self.QList.count
    }

    
    override func tableView(_ tableView: UITableView, cellForRowAt indexPath: IndexPath) -> UITableViewCell {
        let cell = tableView.dequeueReusableCell(withIdentifier: "QListCell", for: indexPath)

        cell.textLabel?.text = self.QList[indexPath.row].question
        cell.detailTextLabel?.text = self.QList[indexPath.row].tag

        return cell
    }
}
