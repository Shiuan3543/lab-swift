//
//  PageViewController.swift
//  PageView
//
//  Created by KoKang Chu on 2019/7/25.
//  Copyright © 2019 KoKang Chu. All rights reserved.
//

import UIKit

class PageViewController: UIPageViewController, UIPageViewControllerDataSource {

    var list = [UIViewController]()
    
    override func viewDidLayoutSubviews() {
        super.viewDidLayoutSubviews()
        
        for v in view.subviews {
            if v is UIScrollView {
                v.frame = view.bounds
                break
            }
        }
    }

    override func viewDidLoad() {
        super.viewDidLoad()
        // Do any additional setup after loading the view.
        list.append((storyboard?.instantiateViewController(withIdentifier: "vc1"))!)
        list.append((storyboard?.instantiateViewController(withIdentifier: "vc2"))!)
        list.append((storyboard?.instantiateViewController(withIdentifier: "vc3"))!)
            
        setViewControllers([list[0]], direction: .forward, animated: true, completion: nil)
        dataSource = self
    }
        
    func pageViewController(_ pageViewController: UIPageViewController, viewControllerAfter viewController: UIViewController) -> UIViewController? {
        
        if let index = list.firstIndex(of: viewController) {
            if index < list.count - 1  {
                return list[index + 1]
            }
        }
        
        return nil
    }
     
    func pageViewController(_ pageViewController: UIPageViewController, viewControllerBefore viewController: UIViewController) -> UIViewController? {
     
        if let index = list.firstIndex(of: viewController) {
            if index > 0 {
                return list[index - 1]
            }
        }
        
        return nil
    }

    func presentationCount(for pageViewController: UIPageViewController) -> Int {
        return list.count
    }
     
    func presentationIndex(for pageViewController: UIPageViewController) -> Int {
        return 0
    }

    /*
    // MARK: - Navigation

    // In a storyboard-based application, you will often want to do a little preparation before navigation
    override func prepare(for segue: UIStoryboardSegue, sender: Any?) {
        // Get the new view controller using segue.destination.
        // Pass the selected object to the new view controller.
    }
    */

}
