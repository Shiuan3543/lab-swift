//
//  ViewController.swift
//  CustomCell
//
//  Created by KoKang Chu on 2019/7/9.
//  Copyright © 2019 KoKang Chu. All rights reserved.
//

import UIKit

class ViewController: UIViewController, UITableViewDataSource, UITableViewDelegate {
    
    let list: [(title: String, isFavorite: Bool)] = [
        ("爬山", true),
        ("滑雪", false),
        ("打球", true)
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
        let cell = tableView.dequeueReusableCell(withIdentifier: "Cell", for: indexPath) as! MyCell
        cell.label.text = list[indexPath.row].title
        cell.favoriteSwitch.isOn = list[indexPath.row].isFavorite
        return cell
    }
}

