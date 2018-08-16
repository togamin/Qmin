//
//  ManyViewControllers.swift
//  Qmin
//
//  Created by Togami Yuki on 2018/08/16.
//  Copyright © 2018 Togami Yuki. All rights reserved.
//

import UIKit

var NowViewNum:Int!

class ManyViewControllers: UIViewController {

    //登録しているWebサイトのURLの数のViewControllerが格納
    var viewControllers:[UIViewController]?
    var List:[String]! = ["就活","英語","面白い話","罰ゲーム"]
    
    override func viewDidLoad() {
        super.viewDidLoad()

        initPageMenu()
        
    }
    
    func initPageMenu() {
        //複数のViewControllerを用意
        viewControllers = getViewControllers()
        
        //メニューバーのレイアウト
        let option = getPageMenuOption()
        
        //PageMenuViewインスタンス作成
        let pageMenu = PageMenuView(
            viewControllers: viewControllers!,
            option: option)
        
        //デリゲート
        pageMenu.delegate = self
        
        //まだよくわからない
        pageMenu.autoresizingMask = [.flexibleWidth, .flexibleHeight]
        
        //viewにpageMenuを追加する.
        view.addSubview(pageMenu)
    }
    
    override func didReceiveMemoryWarning() {
        super.didReceiveMemoryWarning()
        // Dispose of any resources that can be recreated.
    }
}

extension ManyViewControllers: PageMenuViewDelegate{
    
    func willMoveToPage(_ pageMenu: PageMenuView, from viewController: UIViewController, index currentViewControllerIndex: Int){
        print(currentViewControllerIndex)
    }
    
    func didMoveToPage(_ pageMenu: PageMenuView, to viewController: UIViewController, index currentViewControllerIndex: Int) {
        print(currentViewControllerIndex)
        NowViewNum = currentViewControllerIndex
    }
}

extension ManyViewControllers {
    //listの要素数の数だけViewControllerを作成
    func getViewControllers() -> [QListTableViewController] {
        
        //ストーリーボード取得
        let storyboard = UIStoryboard(name: "Main", bundle: nil)
        var viewControllers = [QListTableViewController]()
        
        for info in self.List{
            //ViewControllerのtitleを代入
            let ViewController = storyboard.instantiateViewController(withIdentifier: "QListTableViewController")
            ViewController.title = info
            
            viewControllers.append(ViewController as! QListTableViewController)
        }
        return viewControllers
    }
    //ページメニューのオプション
    func getPageMenuOption() -> PageMenuOption {
        
        //ページメニューのサイズとポジション
        var option = PageMenuOption(frame:
            CGRect(x: 0, y: 63,
                   width: view.frame.size.width,
                   height: view.frame.size.height - 20))
        
        //メニューの高さ
        option.menuItemHeight = 34
        
        //メニューのサイズ
        option.menuTitleFont = .boldSystemFont(ofSize: 16)
        
        //メニュータイトルの色(未選択時)
        option.menuTitleColorNormal = .lightGray
        
        //メニュータイトルの色(選択時)
        option.menuTitleColorSelected = .white
        
        //メニューの背景色(未選択時)
        option.menuItemBackgroundColorNormal = UIColor(red: 0, green: 0.02, blue: 0.06, alpha: 0.61)
        
        //メニューの背景色
        option.menuItemBackgroundColorSelected = UIColor(red: 0, green: 0.02, blue: 0.06, alpha: 0.61)
        
        //アンダーラインの色
        option.menuIndicatorColor = UIColor(red: 0.5, green: 0.8, blue: 1.0, alpha: 0.8)
        return option
    }
}

