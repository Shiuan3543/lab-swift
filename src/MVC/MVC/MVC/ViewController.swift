//
//  ViewController.swift
//  MVC
//
//  Created by 井民全 on 2021/8/19.
//

import UIKit

class ViewController: UIViewController {
    
    let Holo = hololive_production(group: "hololive", location: "JP", generation: 3, lastname: "Usada", firstname: "Pekora", title: "comedian")
    

    override func viewDidLoad() {
        super.viewDidLoad()
        // Do any additional setup after loading the view.
    }
    
    override func viewDidLayoutSubviews() {
        super.viewDidLayoutSubviews()
        let myView = HoloView(frame: CGRect(x: 0,y: 0,width: 300,height: 300))
        myView.center = view.center
        myView.configure(with: "\(Holo.firstname) wa \(Holo.title)")
        view.addSubview(myView)
    }

    struct hololive_production {
        let group : String
        let location : String
        let generation : Int
        let lastname : String
        let firstname : String
        let title : String
    }
}
