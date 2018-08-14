//
//  coreData.swift
//  Qmin
//
//  Created by Togami Yuki on 2018/08/14.
//  Copyright © 2018 Togami Yuki. All rights reserved.
//

import UIKit
import CoreData

func Qregist(question:String,tag:String,answer:String,date:String){
    //AppDelegateを使う用意をしておく
    let appDelegate:AppDelegate = UIApplication.shared.delegate as! AppDelegate
    //Entityを操作するためのオブジェクトを作成
    let viewContext = appDelegate.persistentContainer.viewContext

    //Articleエンティティオブジェクト作成
    let qInfo = NSEntityDescription.entity(forEntityName: "QInfo", in: viewContext)
    //Articleエンティティに挿入するためのオブジェクトを作成
    let newRecode = NSManagedObject(entity: qInfo!, insertInto: viewContext)
    //値のセット
    newRecode.setValue(question, forKey: "question")
    newRecode.setValue(tag, forKey: "tag")
    newRecode.setValue(answer, forKey: "answer")
    newRecode.setValue(date, forKey: "date")
    do{
        //レコード(行)の即時保存
        try viewContext.save()
        //print("ArticleInfo登録完了")
    }catch{
        print("error")
    }
}

func Qread()->[qInfo]{
    var InfoList:[qInfo] = []
    //AppDelegateを使う用意をしておく
    let appDelegate:AppDelegate = UIApplication.shared.delegate as! AppDelegate
    //Entityを操作するためのオブジェクトを作成
    let viewContext = appDelegate.persistentContainer.viewContext

    let query:NSFetchRequest<QInfo> = QInfo.fetchRequest()
    do{
        //データを一括取得
        let fetchResults = try! viewContext.fetch(query)
        //データの取得
        for result:AnyObject in fetchResults{
            InfoList.append(qInfo(
                question:result.value(forKey:"question")! as! String,
                tag:result.value(forKey:"tag")! as! String,
                answer:result.value(forKey:"answer")! as! String,
                date:result.value(forKey:"date")! as! String
            ))
        }
    }catch{
        print("error:Qread",error)
    }
    return InfoList
}

//データ全削除(ArticleInfo)
func deleteAllQInfo(){
    //AppDelegateを使う用意をしておく
    let appDelegate: AppDelegate = UIApplication.shared.delegate as! AppDelegate
    //Entityを操作するためのオブジェクトを作成
    let viewContext = appDelegate.persistentContainer.viewContext
    //どのエンティティからdataを取得してくるかの設定
    let query:NSFetchRequest<QInfo> = QInfo.fetchRequest()
    do{
        //データを一括取得
        let fetchResults = try! viewContext.fetch(query)
        for result in fetchResults{
            let recode = result as! NSManagedObject
            viewContext.delete(recode)
        }
        //削除した状態を保存
        try viewContext.save()
    }catch{
        print("error")
    }
}
