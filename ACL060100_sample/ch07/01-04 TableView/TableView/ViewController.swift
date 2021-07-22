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
    
    override func viewDidAppear(_ animated: Bool) {
        super.viewDidAppear(animated)
        tableView.isEditing = true
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
    
    func tableView(_ tableView: UITableView, didSelectRowAt indexPath: IndexPath) {
        print(list[indexPath.row].1)
    }
    
    /*
    func tableView(_ tableView: UITableView, editingStyleForRowAt indexPath: IndexPath) -> UITableViewCell.EditingStyle {
        return .none
    }
    */
    
    func tableView(_ tableView: UITableView, canMoveRowAt indexPath: IndexPath) -> Bool {
        return true
    }

    func tableView(_ tableView: UITableView, moveRowAt sourceIndexPath: IndexPath, to destinationIndexPath: IndexPath) {
        // 注意這邊寫法
        list.insert(
            list.remove(at: sourceIndexPath.row), at: destinationIndexPath.row
        )
        
        // 迴圈目用來確認畫面與陣列順序一致
        for item in list {
            print("\(item)")
        }
        print("------")

    }
}

