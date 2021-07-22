//
//  ViewController.swift
//  TableView
//
//  Created by 朱克剛 on 2020/8/16.
//

import UIKit

class ViewController: UIViewController, UITableViewDataSource, UITableViewDelegate {

    @IBOutlet weak var tableView: UITableView!
    
    var list = [
        ("sunrise", "爬山", "適合天氣涼爽時的運動"),
        ("snow", "滑雪", "適合冬天的運動"),
        ("bicycle", "單車", "較悠閒的運動")
    ]
    
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
        cell.imageView?.image = UIImage(systemName: list[indexPath.row].0)
        cell.textLabel?.text = list[indexPath.row].1
        cell.detailTextLabel?.text = list[indexPath.row].2
        return cell
    }

    func tableView(_ tableView: UITableView, commit editingStyle: UITableViewCell.EditingStyle, forRowAt indexPath: IndexPath) {
        // 清除陣列中的資料
        list.remove(at: indexPath.row)
        
        // 刪除儲存格
        tableView.deleteRows(at: [indexPath], with: .automatic)
    }
    
    func tableView(_ tableView: UITableView, titleForDeleteConfirmationButtonForRowAt indexPath: IndexPath) -> String? {
        return "刪除此筆資料"
    }
}

