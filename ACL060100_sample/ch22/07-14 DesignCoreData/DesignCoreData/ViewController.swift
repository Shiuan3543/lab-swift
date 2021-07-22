//
//  ViewController.swift
//  DesignCoreData
//
//  Created by 朱克剛 on 2020/8/29.
//

import UIKit
import CoreData

class ViewController: UIViewController {

    let app = UIApplication.shared.delegate as! AppDelegate
    lazy var context = app.persistentContainer.viewContext

    override func viewDidLoad() {
        super.viewDidLoad()
        // 若在模擬器中執行，可顯示資料實際儲存位置
        print(NSPersistentContainer.defaultDirectoryURL())
        
//        insertUserData()
//        queryUserData()
//        queryWithPredicate()
//        storedFetch()
//        storedFetchWithArgument()
//        deleteUserData()
//        insert_oneToMany()
//        query_oneToMany()
//        saveImage()
        loadImage()
    }

    func insertUserData() {
        // 插入第一筆資料
        let u1 = UserData(context: context)
        u1.iid = "A01"
        u1.cname = "王大明"
        
        // 插入第二筆資料
        let u2 = UserData(context: context)
        u2.iid = "A02"
        u2.cname = "李大媽"
        
        // 存檔
        app.saveContext()
    }

    func queryUserData() {
        do {
            let users = try context.fetch(UserData.fetchRequest())
            for user in users as! [UserData] {
                print("\(user.iid!), \(user.cname!)")
            }

        } catch {
            print(error)
        }
    }

    func queryWithPredicate() {
        let fetchRequest: NSFetchRequest<UserData> = UserData.fetchRequest()
        // 搜尋所有姓王的使用者
        let predicate = NSPredicate(format: "cname like '王*'")
        fetchRequest.predicate = predicate
        // 搜尋結果按照 iid 做反向排序
        let sort = NSSortDescriptor(key: "iid", ascending: false)
        fetchRequest.sortDescriptors = [sort]
        
        do {
            let users = try context.fetch(fetchRequest)
            for user in users {
                print("\(user.iid!), \(user.cname!)")
            }
        } catch {
            print(error)
        }
    }

    func storedFetch() {
        let model = app.persistentContainer.managedObjectModel
        let fetchRequest = model.fetchRequestTemplate(forName:
    "Fetch_iid_is_A01")
        do {
            let users = try context.fetch(fetchRequest!)
            for user in users as! [UserData] {
                print("\(user.iid!), \(user.cname!)")
            }
        } catch {
            print(error)
        }
    }

    func storedFetchWithArgument() {
        let model = app.persistentContainer.managedObjectModel
        let fetchRequest = model.fetchRequestFromTemplate(
            withName: "Fetch_by_cname",
            substitutionVariables: ["CNAME": "大"]
        )
        do {
            let users = try context.fetch(fetchRequest!)
            for user in users as! [UserData] {
                print("\(user.iid!), \(user.cname!)")
            }
        } catch {
            print(error)
        }
    }

    func deleteUserData() {
        let coord = app.persistentContainer.persistentStoreCoordinator
        let batch = NSBatchDeleteRequest(fetchRequest: UserData.fetchRequest())
        do {
            try coord.execute(batch, with: context)
            print("資料刪除成功")
        } catch {
            print(error)
        }
    }
    
    func insert_oneToMany() {
        // 新增客戶王小毛
        let user = UserData(context: context)
        user.iid = "A03"
        user.cname = "王小毛"

        // 第一部車
        let car1 = Car(context: context)
        car1.plate = "AA-0001"
        
        // 第二部車
        let car2 = Car(context: context)
        car2.plate = "BB-0001"

        // 王小毛擁有這兩部車
        user.addToOwn(car1)
        user.addToOwn(car2)
        
        app.saveContext()
    }

    func query_oneToMany() {
        let fetchRequest: NSFetchRequest<UserData> = UserData.fetchRequest()
        let predicate = NSPredicate(format: "iid = 'A03'")
        fetchRequest.predicate = predicate
        
        do {
            let users = try context.fetch(fetchRequest)
            for user in users {
                if user.own == nil {
                    print("\(user.cname!) 沒有車")
                } else {
                    print("\(user.cname!) 擁有 \(user.own!.count) 部車")
                    for car in user.own as! Set<Car> {
                        print("車牌是 \(car.plate!)")
                    }
                }
            }
        } catch {
            print(error)
        }
    }

    func saveImage() {
        let image = UIImage(named: "A04.jpeg")
        let user = UserData(context: context)
        user.iid = "A04"
        user.cname = "朱小妹"
        user.image = image?.pngData()
        app.saveContext()
    }

    func loadImage() {
        let fetchRequest: NSFetchRequest<UserData> = UserData.fetchRequest()
        let predicate = NSPredicate(format: "iid = 'A04'")
        fetchRequest.predicate = predicate
        
        do {
            let users = try context.fetch(fetchRequest)
            for user in users {
                if let image = user.image {
                    let imageView = UIImageView()
                    imageView.frame = view.bounds
                    imageView.contentMode = .scaleAspectFill
                    view.addSubview(imageView)
                    imageView.image = UIImage(data: image)
                }
            }
        } catch {
            print(error)
        }
    }
}

