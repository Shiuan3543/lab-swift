//
//  ViewController.swift
//  Transformable
//
//  Created by KoKang Chu on 2019/7/19.
//  Copyright © 2019 KoKang Chu. All rights reserved.
//

import UIKit
import CoreData

class ViewController: UIViewController {
    let app = UIApplication.shared.delegate as! AppDelegate
    lazy var context = app.persistentContainer.viewContext
    @IBOutlet var imageView: UIImageView!
    @IBOutlet var label: UILabel!
    
    override func viewDidLoad() {
        super.viewDidLoad()
        // Do any additional setup after loading the view.
        saveData()
        loadData()
    }

    func saveData() {
        let photo = [Photo()]
        photo[0].image = UIImage(named: "A04.jpeg")
        photo[0].title = "可愛的小狗"

        let entity = Entity(context: context)
        entity.photoObject = photo as NSObject
        
        app.saveContext()

    }
    
    func loadData() {
        do {
            let first_tuple = try context.fetch(Entity.fetchRequest()).first as! Entity
            for photo in first_tuple.photoObject as! [Photo] {
                imageView.image = photo.image
                label.text = photo.title
            }
        } catch {
            print(error)
        }
    }
}

