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
    //「就活」
    qInfo(question:"頑張ったことは何ですか？",tag:"就活",answer:"器械体操です.より難度の高い技を習得することを目標に頑張りました。",date:nowTime()),
    qInfo(question:"強みは何ですか?",tag:"就活",answer:"筋力です。器械体操を10年ほど続けていたので、筋力には自身があります。",date:nowTime()),
    qInfo(question:"尊敬する人は誰ですか?",tag:"就活",answer:"ニコラ・テスラです。自分の発想、アイデアを実現するために、頑張っていた点を尊敬しています。また、その天才さに惹かれています。",date:nowTime()),
    qInfo(question:"志望動機はなんですか?",tag:"就活",answer:"直感です。初めて出会った時からこの会社しかないと思っていました。",date:nowTime()),
    qInfo(question:"会社選びの軸を教えてください。",tag:"就活",answer:"",date:nowTime()),
    qInfo(question:"あなたを色に例えると何ですか?",tag:"就活",answer:"",date:nowTime()),
    qInfo(question:"あなたを動物に例えると何ですか?",tag:"就活",answer:"",date:nowTime()),
    qInfo(question:"将来の夢はなんですか?",tag:"就活",answer:"",date:nowTime()),
    qInfo(question:"3年後にどういう状態になって痛いですか?",tag:"就活",answer:"",date:nowTime()),
    qInfo(question:"周りの人からどのように言われますか?",tag:"就活",answer:"",date:nowTime()),
    qInfo(question:"どれぐらい給料欲しい ?",tag:"就活",answer:"",date:nowTime()),
    qInfo(question:"どのようにして弊社に貢献できると考えている?",tag:"就活",answer:"",date:nowTime()),
    qInfo(question:"どのようにしてストレスを発散させていますか?",tag:"就活",answer:"",date:nowTime()),
    
    
    
    //「英会話」
    qInfo(question:"What is your dream ?",tag:"英会話",answer:"My dream is to be Doraemon.",date:nowTime()),
    qInfo(question:"Do you have a girlfriend/boyfriend ?",tag:"英会話",answer:"",date:nowTime()),
    qInfo(question:"What is your favorite food ?",tag:"英会話",answer:"",date:nowTime()),
    qInfo(question:"Where do you most want to go ?",tag:"英会話",answer:"Describe your ideal vacation.",date:nowTime()),
    qInfo(question:"How do you celebrate New Year's Day ?",tag:"英会話",answer:"",date:nowTime()),
    qInfo(question:"What do you want to do for your next birthday ?",tag:"英会話",answer:"",date:nowTime()),
    qInfo(question:"Why do people need to make friends ?",tag:"英会話",answer:"",date:nowTime()),
    qInfo(question:"How did you meet your best friend ?",tag:"英会話",answer:"",date:nowTime()),
    qInfo(question:"What are your hobbies ?",tag:"英会話",answer:"",date:nowTime()),
    qInfo(question:"Are you satisfied with your job ?",tag:"英会話",answer:"",date:nowTime()),
    qInfo(question:"Do you think men are stronger than women ?",tag:"英会話",answer:"",date:nowTime()),
    qInfo(question:"What do you do when you're under stress ?",tag:"英会話",answer:"",date:nowTime()),
    qInfo(question:"What good habits do you have ?",tag:"英会話",answer:"",date:nowTime()),
    qInfo(question:"How does money make you happy ?",tag:"英会話",answer:"",date:nowTime()),
    qInfo(question:"How much money do you want to make ?",tag:"英会話",answer:"",date:nowTime()),
    qInfo(question:"How do you teach your children how to spend money ?",tag:"英会話",answer:"",date:nowTime()),
    qInfo(question:"Do you think money can buy love ?",tag:"英会話",answer:"",date:nowTime()),
    qInfo(question:"What invention is most needed at the moment ?",tag:"英会話",answer:"",date:nowTime()),
    qInfo(question:"How many children do you want to have ?",tag:"英会話",answer:"",date:nowTime()),
    qInfo(question:"What program do you usually watch on TV ?",tag:"英会話",answer:"",date:nowTime()),
    qInfo(question:"Do you think watching TV is educational ?",tag:"英会話",answer:"",date:nowTime()),
    qInfo(question:"What kind of books do you read ?",tag:"英会話",answer:"",date:nowTime()),
    qInfo(question:"What are your favorite sports ?",tag:"英会話",answer:"",date:nowTime()),
    qInfo(question:"Do you think college degree is a must ?",tag:"英会話",answer:"",date:nowTime()),
    qInfo(question:"Who was your favorite teacher when you were in school ?",tag:"英会話",answer:"",date:nowTime()),
    qInfo(question:"What is your favorit subject in school ?",tag:"英会話",answer:"",date:nowTime()),
    qInfo(question:"What cause people to commit crimes ?",tag:"英会話",answer:"",date:nowTime()),
    qInfo(question:"Talk about the differences between making a phone call and writing letter ?",tag:"英会話",answer:"",date:nowTime()),
    qInfo(question:"What kind of information do you get from the internet ?",tag:"英会話",answer:"",date:nowTime()),
    qInfo(question:"What does your name mean? ?",tag:"英会話",answer:"",date:nowTime()),
    qInfo(question:"What is your major? ?",tag:"英会話",answer:"",date:nowTime()),
    qInfo(question:"How’d you end up in your line of work? ?",tag:"英会話",answer:"",date:nowTime()),
    qInfo(question:"When do you want to marry ?",tag:"英会話",answer:"",date:nowTime()),
    qInfo(question:"What are you doing for Christmas ?",tag:"英会話",answer:"",date:nowTime()),
    qInfo(question:"Out of all the places you have traveled to, which do you recommend ?",tag:"英会話",answer:"",date:nowTime()),
    qInfo(question:"If you are going to die tomorrow, what will you do today? ?",tag:"英会話",answer:"",date:nowTime()),
    qInfo(question:"What do you do if you can do anything ?",tag:"英会話",answer:"",date:nowTime()),
    qInfo(question:"If you have a time machine, when do you want to go ? Why ?",tag:"英会話",answer:"",date:nowTime()),
    qInfo(question:"What have you ever regretted the most? ?",tag:"英会話",answer:"",date:nowTime()),
    qInfo(question:"What is the most important thing for you ?",tag:"英会話",answer:"",date:nowTime()),
    
    //「罰ゲーム」
    qInfo(question:"ドラえもんのモノマネをする。",tag:"罰ゲーム",answer:"",date:nowTime()),
    qInfo(question:"変顔の写真を撮られる",tag:"罰ゲーム",answer:"",date:nowTime()),
    qInfo(question:"自分の名前を尻文字で",tag:"罰ゲーム",answer:"",date:nowTime()),
    qInfo(question:"好きな人に向かって愛を叫ぶ。",tag:"罰ゲーム",answer:"",date:nowTime()),
    qInfo(question:"腕立て伏せ50回",tag:"罰ゲーム",answer:"",date:nowTime()),
    qInfo(question:"みんなの分のアイスを買ってくる",tag:"罰ゲーム",answer:"",date:nowTime()),
    //「面白い話」
    
    
    
    
    //「今日の晩御飯」
    qInfo(question:"ピーマンの肉詰め",tag:"今日の晩御飯",answer:"",date:nowTime()),
    qInfo(question:"カレーライス",tag:"今日の晩御飯",answer:"",date:nowTime()),
    qInfo(question:"オムライス",tag:"今日の晩御飯",answer:"",date:nowTime()),
    qInfo(question:"焼き鳥",tag:"今日の晩御飯",answer:"",date:nowTime()),
    qInfo(question:"寿司",tag:"今日の晩御飯",answer:"",date:nowTime()),
    qInfo(question:"ラーメン",tag:"今日の晩御飯",answer:"",date:nowTime())
]









