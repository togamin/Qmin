//
//  commonItem.swift
//  Qmin
//
//  Created by Togami Yuki on 2018/08/12.
//  Copyright © 2018 Togami Yuki. All rights reserved.
//

import UIKit

//テストデータ
var QList:[String] = ["出身地は??","年収は??","好きな食べ物は??","好きな人は??","好きな動物は??"]
var Qcomment:[String] = ["a","i","u","e","o"]
var Qcategory:[String] = ["英語","就活","英語","英語","就活"]


//CoreDataから質問情報を格納するための構造体
//構造体のメリット

struct  qInfo{
    var question:String!
    var tag:String!
    var answer:String!
    var date:String!
    init(question:String,tag:String,answer:String,date:String){
        self.question = question
        self.tag = tag
        self.answer = answer
        self.date = date
    }
}

//現在時刻を取り出す
func nowTime()->String{
    let now = NSDate()
    let dateFormatter = DateFormatter()
    dateFormatter.locale = NSLocale(localeIdentifier: "ja_JP") as Locale?
    dateFormatter.timeStyle = .medium
    dateFormatter.dateStyle = .medium
    let data = dateFormatter.string(from: now as Date)
return data
}

//質問のデフォルト
var Qdefault:[qInfo]! = [
    qInfo(question:"頑張ったことは何ですか？",tag:"就活",answer:"器械体操です.より難度の高い技を習得することを目標に頑張りました。",date:nowTime()),
    qInfo(question:"強みは何ですか?",tag:"就活",answer:"筋力です。器械体操を10年ほど続けていたので、筋力には自身があります。",date:nowTime()),
    qInfo(question:"尊敬する人は誰ですか?",tag:"就活",answer:"ニコラ・テスラです。自分の発送、アイデアを実現するために、頑張っていた点を尊敬しています。また、その天才さに惹かれています。",date:nowTime()),
    qInfo(question:"有名人のモノマネをする。",tag:"罰ゲーム",answer:"",date:nowTime())
]









