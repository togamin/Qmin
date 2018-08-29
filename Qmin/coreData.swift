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

func tagQread(tag:String)->[qInfo]{
    var InfoList:[qInfo] = []
    //AppDelegateを使う用意をしておく
    let appDelegate:AppDelegate = UIApplication.shared.delegate as! AppDelegate
    //Entityを操作するためのオブジェクトを作成
    let viewContext = appDelegate.persistentContainer.viewContext
    
    let query:NSFetchRequest<QInfo> = QInfo.fetchRequest()
    let namePredicte = NSPredicate(format: "tag = %@",tag)
    query.predicate = namePredicte
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

//指定した行のデータの削除
func deleteSelect(Index:Int){
    //AppDelegateを使う用意をしておく
    let appDelegate: AppDelegate = UIApplication.shared.delegate as! AppDelegate
    //Entityを操作するためのオブジェクトを作成
    let viewContext = appDelegate.persistentContainer.viewContext
    //どのエンティティからdataを取得してくるかの設定
    let query:NSFetchRequest<QInfo> = QInfo.fetchRequest()
    do{
        //データを一括取得
        let fetchResults = try! viewContext.fetch(query)
        let deleteInfo = fetchResults[Index]
        viewContext.delete(deleteInfo)
        //削除した状態を保存
        try viewContext.save()
    }catch{
        print("error")
    }
}

//質問の編集
func updateQ(Index:Int,question:String,tag:String,answer:String,date:String){
    //AppDelegateを使う用意をしておく
    let appDelegate: AppDelegate = UIApplication.shared.delegate as! AppDelegate
    //Entityを操作するためのオブジェクトを作成
    let viewContext = appDelegate.persistentContainer.viewContext
    //どのエンティティからdataを取得してくるかの設定
    let query:NSFetchRequest<QInfo> = QInfo.fetchRequest()
    let namePredicte = NSPredicate(format: "tag = %@",tag)
    query.predicate = namePredicte
    do{
        //データを一括取得
        let fetchResults = try! viewContext.fetch(query)
        let updateQInfo = fetchResults[Index]
        updateQInfo.setValue(question,forKey:"question")
        updateQInfo.setValue(tag,forKey:"tag")
        updateQInfo.setValue(answer,forKey:"answer")
        updateQInfo.setValue(date,forKey:"date")
        do{
            try viewContext.save()
        }catch{
            
        }
    }catch{
        print("error")
    }
}


//タグの更新
func updateTag(oldTag:String,newTag:String){
    let appDelegate: AppDelegate = UIApplication.shared.delegate as! AppDelegate
    //Entityを操作するためのオブジェクトを作成
    let viewContext = appDelegate.persistentContainer.viewContext
    //どのエンティティからdataを取得してくるかの設定
    let query:NSFetchRequest<QInfo> = QInfo.fetchRequest()
    let namePredicte = NSPredicate(format: "tag = %@",oldTag)
    query.predicate = namePredicte
    do{
        //データを一括取得
        let fetchResults = try! viewContext.fetch(query)
        for result in fetchResults{
         result.setValue(newTag,forKey:"tag")
        }
        do{
            try viewContext.save()
        }catch{
            
        }
    }catch{
        print("error")
    }
}

//指定したタグのデータの削除
func deleteTag(tag:String){
    //AppDelegateを使う用意をしておく
    let appDelegate: AppDelegate = UIApplication.shared.delegate as! AppDelegate
    //Entityを操作するためのオブジェクトを作成
    let viewContext = appDelegate.persistentContainer.viewContext
    //どのエンティティからdataを取得してくるかの設定
    let query:NSFetchRequest<QInfo> = QInfo.fetchRequest()
    let namePredicte = NSPredicate(format: "tag = %@",tag)
    query.predicate = namePredicte
    do{
        //データを一括取得
        let fetchResults = try! viewContext.fetch(query)
        for result in fetchResults{
            viewContext.delete(result)
        }
        //削除した状態を保存
        try viewContext.save()
    }catch{
        print("error")
    }
}



