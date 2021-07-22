//
//  ViewController.swift
//  CoreDataCloudKit
//
//  Created by KoKang Chu on 2019/7/22.
//  Copyright © 2019 KoKang Chu. All rights reserved.
//

import UIKit

class ViewController: UIViewController {
    let app = UIApplication.shared.delegate as! AppDelegate
    lazy var context = app.persistentContainer.viewContext
    @IBOutlet weak var textField: UITextField!
    
    override func viewDidLoad() {
        super.viewDidLoad()
        // Do any additional setup after loading the view.
    }

    @IBAction func insertData(_ sender: Any) {
        let entity = Entity(context: context)
        entity.cname = textField.text
        app.saveContext()
        
        print("\(textField.text!) 儲存完畢")
        textField.text = ""
    }
    
    @IBAction func queryData(_ sender: Any) {
        do {
            let datas = try context.fetch(Entity.fetchRequest())
            for d in datas as! [Entity] {
                print("\(d.cname ?? "")")
            }
    
        } catch {
            print(error)
        }
    }
}

