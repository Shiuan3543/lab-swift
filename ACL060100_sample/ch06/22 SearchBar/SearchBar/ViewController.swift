//
//  ViewController.swift
//  SearchBar
//
//  Created by KoKang Chu on 2019/7/29.
//  Copyright © 2019 KoKang Chu. All rights reserved.
//

import UIKit

class ViewController: UIViewController, UISearchBarDelegate  {

    override func viewDidLoad() {
        super.viewDidLoad()
        // Do any additional setup after loading the view.
    }

    func searchBarBookmarkButtonClicked(_ searchBar: UISearchBar) {
        print("按下書籤按鈕")
    }
    
    func searchBarCancelButtonClicked(_ searchBar: UISearchBar) {
        print("按下取消按鈕")
    }
     
    func searchBar(_ searchBar: UISearchBar, textDidChange searchText: String) {
        print(searchText)
    }

}

