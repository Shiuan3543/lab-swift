//
//  ViewController.swift
//  MoreButton
//
//  Created by KoKang Chu on 2019/7/10.
//  Copyright © 2019 KoKang Chu. All rights reserved.
//

import UIKit

class ViewController: UIViewController, UITableViewDelegate, UITableViewDataSource {
    
    let list = ["爬山", "滑雪", "打球"]

    override func viewDidLoad() {
        super.viewDidLoad()
        // Do any additional setup after loading the view.
    }

    func numberOfSections(in tableView: UITableView) -> Int {
        return 1
    }

    func tableView(_ tableView: UITableView, numberOfRowsInSection section: Int) -> Int {
        return list.count
    }
    
    func tableView(_ tableView: UITableView, cellForRowAt indexPath: IndexPath) -> UITableViewCell {
        let cell = tableView.dequeueReusableCell(withIdentifier: "Cell", for: indexPath)
        cell.textLabel?.text = list[indexPath.row]
        return cell
    }
    
    // 向左滑動
    func tableView(_ tableView: UITableView, trailingSwipeActionsConfigurationForRowAt indexPath: IndexPath) -> UISwipeActionsConfiguration? {
        
        let go = UIContextualAction(style: .normal, title: "更多") { (action, view, completionHandler) in
            // 按鈕按下去要做的事情寫這
            completionHandler(true)
        }
        go.backgroundColor = .blue
        
        let del = UIContextualAction(style: .destructive, title: "刪除") { (action, view, completionHandler) in
            // 按鈕按下去要做的事情寫這
            completionHandler(true)
        }
        
        let config = UISwipeActionsConfiguration(actions: [go, del])
        config.performsFirstActionWithFullSwipe = false
        return config
    }

    // 向右滑動
    func tableView(_ tableView: UITableView, leadingSwipeActionsConfigurationForRowAt indexPath: IndexPath) -> UISwipeActionsConfiguration? {
        let go = UIContextualAction(style: .normal, title: "儲存") { (action, view, completionHandler) in
            // 按鈕按下去要做的事情寫這
            completionHandler(true)
        }
        
        let config = UISwipeActionsConfiguration(actions: [go])
        config.performsFirstActionWithFullSwipe = false
        return config
    }
}

