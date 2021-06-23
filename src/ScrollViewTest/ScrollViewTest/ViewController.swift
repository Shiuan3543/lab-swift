//
//  ViewController.swift
//  ScrollViewTest
//
//  Created by imedi on 2021/6/1.
//

import UIKit

class ViewController: UIViewController ,UIScrollViewDelegate{

    @IBOutlet weak var scrollviewtest: UIScrollView!
    @IBOutlet weak var Harapeko: UIImageView!
    override func viewDidLoad() {
        super.viewDidLoad()
        // Do any additional setup after loading the view.
//        Harapeko.image = UIImage(named: "Harapeko")//載入圖片Harapeko
//        let size = Harapeko.image!.size//取得圖片原始大小存入變數size
//        scrollviewtest.contentSize = size//讓scrollview的content大小等於size
        scrollviewtest.minimumZoomScale = 1//最小放大倍率
        scrollviewtest.maximumZoomScale = 5//最大放大倍率
        scrollviewtest.zoomScale = 2//目前倍率
    }
    func viewForZooming(in scrollView:UIScrollView) -> UIView? {
        movetocenter()
        return Harapeko
    }
    func movetocenter() {
        let imageviewsize = Harapeko.frame.size
        let scrollviewsize = scrollviewtest.frame.size
        var wPadding:CGFloat = 0
        var hPadding:CGFloat = 0
        if imageviewsize.width < scrollviewsize.width {
            wPadding = (scrollviewsize.width - imageviewsize.width)/2
        }
        if imageviewsize.height < scrollviewsize.height {
            hPadding = (scrollviewsize.height - imageviewsize.height)/2
        }
        scrollviewtest.contentInset = UIEdgeInsets(top: hPadding,left: wPadding,bottom: hPadding,right: wPadding)
    }
    override func viewDidAppear(_ animated: Bool) {
        super.viewDidAppear(animated)
        movetocenter()
    }
    func scrollViewDidZoom(_ scrollView:UIScrollView) {
        movetocenter()
    }
    override func viewWillLayoutSubviews() {
        movetocenter()
    }
}

