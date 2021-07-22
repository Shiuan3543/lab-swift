//
//  ViewController.swift
//  TakePicture
//
//  Created by KoKang Chu on 2019/7/21.
//  Copyright © 2019 KoKang Chu. All rights reserved.
//

import UIKit

class ViewController: UIViewController, UINavigationControllerDelegate, UIImagePickerControllerDelegate
 {

    override func viewDidLoad() {
        super.viewDidLoad()
        // Do any additional setup after loading the view.
    }

    override func touchesBegan(_ touches: Set<UITouch>, with event: UIEvent?) {
        guard UIImagePickerController.isSourceTypeAvailable(.camera) else {
            print("本裝置無相機")
            return
        }
        
        let imagePicker = UIImagePickerController()
        // 設定相片來源為相機
        imagePicker.sourceType = .camera
        imagePicker.delegate = self
        
        // 開啟拍照介面
        show(imagePicker, sender: self)
    }
    
    func imagePickerController(_ picker: UIImagePickerController, didFinishPickingMediaWithInfo info: [UIImagePickerController.InfoKey : Any]) {
        // 取得拍下來的照片
        let image = info[.originalImage] as! UIImage
        // 將相片存檔
        UIImageWriteToSavedPhotosAlbum(image, nil, nil, nil)
        dismiss(animated: true, completion: nil)

    }
}

