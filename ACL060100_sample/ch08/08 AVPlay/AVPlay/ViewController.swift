//
//  ViewController.swift
//  AVPlay
//
//  Created by 朱克剛 on 2020/10/26.
//

import UIKit
import AVKit

class ViewController: UIViewController {

    override func viewDidLoad() {
        super.viewDidLoad()
        // Do any additional setup after loading the view.
    }

    override func prepare(for segue: UIStoryboardSegue, sender: Any?) {
        if let url = Bundle.main.url(forResource: "demo", withExtension: "mov") {
            let vc = segue.destination as! AVPlayerViewController
            vc.player = AVPlayer(url: url)
        }
    }
}

