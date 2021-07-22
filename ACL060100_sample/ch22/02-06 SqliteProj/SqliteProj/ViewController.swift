//
//  ViewController.swift
//  SqliteProj
//
//  Created by KoKang Chu on 2019/7/18.
//  Copyright © 2019 KoKang Chu. All rights reserved.
//

import UIKit
import SQLite3

class ViewController: UIViewController {

    @IBOutlet weak var imageView: UIImageView!
    override func viewDidLoad() {
        super.viewDidLoad()
        // Do any additional setup after loading the view.
        
        insert()
        saveImage()
        query()
    }

    func printerr(_ db: OpaquePointer) {
        let errmsg = String(cString: sqlite3_errmsg(db))
        print("prepare error: \(errmsg)")
    }

    func query() {
        let app = UIApplication.shared.delegate as! AppDelegate
        if let db = app.db {
            let tmp = "李大媽".cString(using: .utf8)
            let sql = "SELECT * FROM UserData WHERE cname = ?"
            
            // 用來儲存查詢後的結果
            var statement: OpaquePointer? = nil
            
            if sqlite3_prepare(db, sql, -1, &statement, nil) != SQLITE_OK {
                printerr(db)
            }
            
            // bind 指令要在 prepare 之後
            // 第二個參數1代表SQL Command中的第1個問號
            if sqlite3_bind_text(statement, 1, tmp, -1, nil) != SQLITE_OK {
                printerr(db)
            }
            
            // 利用迴圈取出查詢結果
            while sqlite3_step(statement) == SQLITE_ROW {
                let iid = sqlite3_column_text(statement, 0)
                let cname = sqlite3_column_text(statement, 1)
                
                if iid != nil {
                    let iidS = String(cString: iid!)
                    print("帳號: \(iidS)")
                }
                
                if cname != nil {
                    let cnameS = String(cString: cname!)
                    print("姓名: \(cnameS)")
                }
                
                // 從資料庫中取出圖片
                let length = sqlite3_column_bytes(statement, 2)  // 2代表image欄位
                let bytes = sqlite3_column_blob(statement, 2)
                let imageData = NSData(bytes: bytes, length: Int(length))
                imageView.image = UIImage(data: imageData as Data)
            }
            
            sqlite3_finalize(statement)

        }
    }

    func insert() {
        let app = UIApplication.shared.delegate as! AppDelegate

        if let db = app.db {
            let iid = "a02".cString(using: .utf8)
            let cname = "李大媽".cString(using: .utf8)
            let sql = "INSERT INTO UserData VALUES (?, ?, NULL)"
            
            // 用來儲存查詢後的結果
            var statement: OpaquePointer? = nil
            
            if sqlite3_prepare(db, sql, -1, &statement, nil) != SQLITE_OK {
                printerr(db)
            }
            
            // bind 指令要在 prepare 之後
            // 第二個參數1代表SQL Command中的第1個問號
            if sqlite3_bind_text(statement, 1, iid, -1, nil) != SQLITE_OK {
                printerr(db)
            }
            
            // 第二個參數2代表SQL Command中的第2個問號
            if sqlite3_bind_text(statement, 2, cname, -1, nil) != SQLITE_OK {
                printerr(db)
            }
            
            if sqlite3_step(statement) == SQLITE_DONE {
                print("插入新資料成功")
            } else {
                let errmsg = String(cString: sqlite3_errmsg(db))
                print("bind error: \(errmsg)")
            }
            
            sqlite3_finalize(statement)
        }
    }

    func saveImage() {
        let app = UIApplication.shared.delegate as! AppDelegate

        if let db = app.db {
            // 要存入資料庫中的圖片
            let imageData = UIImage(named: "head.jpg")?.pngData()
            let data = NSData(data:imageData!)
            let sql = "UPDATE UserData SET image = ? WHERE iid = 'a02'"
            var statement: OpaquePointer? = nil
            
            if sqlite3_prepare(db, sql, -1, &statement, nil) != SQLITE_OK {
                printerr(db)
            }
            
            // 將照片存入資料庫
            if sqlite3_bind_blob(statement, 1, data.bytes, Int32(data.length), nil) != SQLITE_OK {
                printerr(db)
            }
            
            if sqlite3_step(statement) == SQLITE_DONE {
                print("執行成功")
            }
            
            sqlite3_finalize(statement)
        }
    }

}

