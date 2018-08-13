//
//  commonItem.swift
//  Qmin
//
//  Created by Togami Yuki on 2018/08/12.
//  Copyright © 2018 Togami Yuki. All rights reserved.
//

import UIKit

//CoreDataから質問情報を格納するための構造体
//構造体のメリット

struct  QInfo{
    var question:String!
    var tag:String!
    var answer:String!
    init(question:String,tag:String,answer:String){
        self.question = question
        self.tag = tag
        self.answer = answer
    }
}

