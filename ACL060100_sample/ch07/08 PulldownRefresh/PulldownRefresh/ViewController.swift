//
//  ViewController.swift
//  PulldownRefresh
//
//  Created by KoKang Chu on 2019/7/9.
//  Copyright © 2019 KoKang Chu. All rights reserved.
//

import UIKit

class ViewController: UIViewController, UITableViewDelegate, UITableViewDataSource {

    @IBOutlet weak var tableView: UITableView!
    var list: [String] = []
    
    @objc func handleRefresh() {
        let formatter = DateFormatter()
        formatter.dateFormat = "hh:mm:ss"
        let time = formatter.string(from: Date())
        list.append(time)
        
        // 停止下拉後的動畫特效並復原表格位置
        tableView.refreshControl?.endRefreshing()
        // 要表格重新載入資料
        tableView.reloadData()
    }
    
    override func viewDidLoad() {
        super.viewDidLoad()
        // Do any additional setup after loading the view.
        tableView.refreshControl = UIRefreshControl()
        tableView.refreshControl?.addTarget(
            self,
            action: #selector(handleRefresh),
            for: .valueChanged)
    }
    
    override func viewDidAppear(_ animated: Bool) {
        super.viewDidAppear(animated)
        tableView.refreshControl?.attributedTitle = NSAttributedString(string: "更新中...")
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

}

