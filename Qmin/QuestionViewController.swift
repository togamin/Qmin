//
//  QuestionViewController.swift
//  Qmin
//
//  Created by Togami Yuki on 2018/08/13.
//  Copyright © 2018 Togami Yuki. All rights reserved.
//

import UIKit

class QuestionViewController: UIViewController {
    
    var QList:[qInfo]!
    
    override func viewDidLoad() {
        super.viewDidLoad()

        self.QList = Qread()
        print(self.QList)
        //deleteAllQInfo()
        //CoreDateに何も入っていないときに、デフォルトで質問集を入れる。
        
        if self.QList.count == 0{
            for data in Qdefault{
                Qregist(question:data.question,tag:data.tag,answer:data.answer,date:data.date)
            }
        }
        
    }

    override func didReceiveMemoryWarning() {
        super.didReceiveMemoryWarning()
    }

}
