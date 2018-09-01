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
    /*ちょっとした話題*/
    qInfo(question:"2次元の世界に行けるとしたら、どんなアニメ、本、映画の世界に行きたい?",tag:"ちょっとした話題",answer:"",date:nowTime()),
    qInfo(question:"永遠に生きられるなら何をして過ごす?",tag:"ちょっとした話題",answer:"",date:nowTime()),
    qInfo(question:"あなたが死んだ後、周りの人にどんな人だったと思われたい?",tag:"ちょっとした話題",answer:"",date:nowTime()),
    qInfo(question:"あなたにとって「完璧な日」とはどんな一日?",tag:"ちょっとした話題",answer:"",date:nowTime()),
    qInfo(question:"架空のキャラクターを現実世界に呼ぶなら、誰を呼ぶ?",tag:"ちょっとした話題",answer:"",date:nowTime()),
    qInfo(question:"1円も持っていなかったら、これからどうやって生きる?",tag:"ちょっとした話題",answer:"",date:nowTime()),
    qInfo(question:"好きな人のタイプは?",tag:"ちょっとした話題",answer:"",date:nowTime()),
    qInfo(question:"「都会」と「田舎」どっちに住みたい?",tag:"ちょっとした話題",answer:"",date:nowTime()),
    qInfo(question:"人生で一番辛かったことは?",tag:"ちょっとした話題",answer:"",date:nowTime()),
    qInfo(question:"人生で一番楽しかったことは?",tag:"ちょっとした話題",answer:"",date:nowTime()),
    qInfo(question:"明日死ぬとしたら、今日何する?",tag:"ちょっとした話題",answer:"",date:nowTime()),
    qInfo(question:"もしお金を無限に持っているとしたら何する？",tag:"ちょっとした話題",answer:"",date:nowTime()),
    qInfo(question:"もし総理大臣になったら、何をする?",tag:"ちょっとした話題",answer:"",date:nowTime()),
    qInfo(question:"人生で一番恥ずかしかった経験は?",tag:"ちょっとした話題",answer:"",date:nowTime()),
    qInfo(question:"誰にも言ったことがない秘密について。",tag:"ちょっとした話題",answer:"",date:nowTime()),
    qInfo(question:"もし100歳まで健康に生きるとしたら、何がしたい?",tag:"ちょっとした話題",answer:"",date:nowTime()),
    qInfo(question:"好きな人いる?",tag:"ちょっとした話題",answer:"",date:nowTime()),
    qInfo(question:"過去どんな人と付き合った?",tag:"ちょっとした話題",answer:"",date:nowTime()),
    qInfo(question:"無人島に何か一つ持って行くとしたら何を持って行く?",tag:"ちょっとした話題",answer:"",date:nowTime()),
    qInfo(question:"死ぬ前に訪れたい場所5選",tag:"ちょっとした話題",answer:"",date:nowTime()),
    qInfo(question:"変わった友達の話。",tag:"ちょっとした話題",answer:"",date:nowTime()),
    qInfo(question:"小さいころの話",tag:"ちょっとした話題",answer:"",date:nowTime()),
    qInfo(question:"不思議な体験の話。",tag:"ちょっとした話題",answer:"",date:nowTime()),
    qInfo(question:"動物に生まれ変わるとしたら、何になりたい?",tag:"ちょっとした話題",answer:"",date:nowTime()),
    qInfo(question:"一人だけ生き返らせることができるとしたら誰を生き返らす?",tag:"ちょっとした話題",answer:"",date:nowTime()),
    qInfo(question:"視覚・聴覚・触覚・味覚・嗅覚,どれか一つだけで生きるとしたらどれを選ぶ?",tag:"ちょっとした話題",answer:"",date:nowTime()),
    qInfo(question:"人生で一番影響を受けた本は?",tag:"ちょっとした話題",answer:"",date:nowTime()),
    qInfo(question:"人生最大の失敗は?",tag:"ちょっとした話題",answer:"",date:nowTime()),
    qInfo(question:"超能力を使えるとしたら、どんな能力を使って何をしたい?",tag:"ちょっとした話題",answer:"",date:nowTime()),
    qInfo(question:"タイムトラベルができるなら、過去と未来どっちにいく?",tag:"ちょっとした話題",answer:"",date:nowTime()),
    qInfo(question:"自分自身のことを1つだけ変えられるとしたら、何を変える?",tag:"ちょっとした話題",answer:"",date:nowTime()),
    qInfo(question:"一番大切な子供の頃の記憶は?",tag:"ちょっとした話題",answer:"",date:nowTime()),
    qInfo(question:"どんな死に方をしたい?",tag:"ちょっとした話題",answer:"",date:nowTime()),
    qInfo(question:"「愛」の定義は?",tag:"ちょっとした話題",answer:"",date:nowTime()),
    /*「就活」*/
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
    qInfo(question:"自己PRをしてください。(5分)",tag:"就活",answer:"",date:nowTime()),
    qInfo(question:"自己PRをしてください。(1分)",tag:"就活",answer:"私は、目的を達成するために、考え主体的に行動し努力できる人間です。それを裏付けるエピソードとして主に2つあります。一つ目は器械体操での活動です。ひねり技、大車輪等難度の高い技を習得することを目的に、どうすればできるのかを考え、できる人に積極的に聞き、練習を積み重ねることによって、多くの技を習得してきました。二つ目は研究データの解析を簡略化するプログラムの作成です。研究データの解析を簡略化することを目的に、その方法を模索。独学でプログラミング言語Pythonを勉強し、作りあげた。以上のことから、私は、目的を達成するために、考え主体的に行動し努力できる人間であると考えます。",date:nowTime()),
    /*「英会話」*/
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
    /*「罰ゲーム」*/
    qInfo(question:"ドラえもんのモノマネをする。",tag:"罰ゲーム",answer:"",date:nowTime()),
    qInfo(question:"変顔の写真を撮られる",tag:"罰ゲーム",answer:"",date:nowTime()),
    qInfo(question:"自分の名前を尻文字で",tag:"罰ゲーム",answer:"",date:nowTime()),
    qInfo(question:"好きな人に向かって愛を叫ぶ。",tag:"罰ゲーム",answer:"",date:nowTime()),
    qInfo(question:"腕立て伏せ50回",tag:"罰ゲーム",answer:"",date:nowTime()),
    qInfo(question:"みんなの分のアイスを買ってくる",tag:"罰ゲーム",answer:"",date:nowTime()),
    qInfo(question:"右隣にいる人をお姫様抱っこする。",tag:"罰ゲーム",answer:"",date:nowTime()),
    qInfo(question:"誰も知らない秘密を言う。",tag:"罰ゲーム",answer:"",date:nowTime()),
    /*「面白い話」*/
    qInfo(question:"新幹線で。",tag:"面白い話",answer:"新幹線でふと目が覚めたら、隣の席のおばあさんがテーブルの飲み物置きの少しくぼんだとこに醤油を入れお寿司食べてる…おばあちゃん…",date:nowTime()),
    qInfo(question:"仕事中。",tag:"面白い話",answer:"仕事があまりに暇なので、思わず上司（30代男性）に「今日って僕帰ってもよくないですか？」と言ったら、「側にいてくれるだけでいい」と言われた。彼女かw",date:nowTime()),
    qInfo(question:"壁ドン",tag:"面白い話",answer:"彼女が壁ドンされてみたいと言った。しょうがないから、壁に寄らせて。いざ！壁ドン！「ドンッ!!!……ぶっ！！！」同時に屁が出た。",date:nowTime()),
    /*「今日の晩御飯」*/
    qInfo(question:"ピーマンの肉詰め",tag:"今日の晩御飯",answer:"",date:nowTime()),
    qInfo(question:"カレーライス",tag:"今日の晩御飯",answer:"",date:nowTime()),
    qInfo(question:"オムライス",tag:"今日の晩御飯",answer:"",date:nowTime()),
    qInfo(question:"焼き鳥",tag:"今日の晩御飯",answer:"",date:nowTime()),
    qInfo(question:"寿司",tag:"今日の晩御飯",answer:"",date:nowTime()),
    qInfo(question:"ラーメン",tag:"今日の晩御飯",answer:"",date:nowTime()),
    qInfo(question:"お好み焼き",tag:"今日の晩御飯",answer:"",date:nowTime()),
    qInfo(question:"肉じゃが",tag:"今日の晩御飯",answer:"",date:nowTime()),
    qInfo(question:"さえずる小鳥のソテー",tag:"今日の晩御飯",answer:"",date:nowTime()),
    qInfo(question:"魚",tag:"今日の晩御飯",answer:"",date:nowTime()),
    qInfo(question:"焼肉",tag:"今日の晩御飯",answer:"",date:nowTime()),
    qInfo(question:"イタリアン",tag:"今日の晩御飯",answer:"",date:nowTime())
]









