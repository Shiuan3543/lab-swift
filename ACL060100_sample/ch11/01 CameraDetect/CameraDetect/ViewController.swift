//
//  ViewController.swift
//  CameraDetect
//
//  Created by KoKang Chu on 2019/7/21.
//  Copyright © 2019 KoKang Chu. All rights reserved.
//

import UIKit

class ViewController: UIViewController {

    override func viewDidLoad() {
        super.viewDidLoad()
        // Do any additional setup after loading the view.
        if UIImagePickerController.isSourceTypeAvailable(.camera) {
            print("本裝置具拍照功能")
            
            if UIImagePickerController.isCameraDeviceAvailable(.front) {
                print("有前方鏡頭")
            }
            
            if UIImagePickerController.isCameraDeviceAvailable(.rear) {
                print("有後方鏡頭")
            }
            
            if UIImagePickerController.isFlashAvailable(for: .front) {
                print("有前方閃光燈")
            }
            
            if UIImagePickerController.isFlashAvailable(for: .rear) {
                print("有後方閃光燈")
            }
        }
    }


}

