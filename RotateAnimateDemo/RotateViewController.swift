//
//  RotateViewController.swift
//  RotateAnimateDemo
//
//  Created by Andy on 2021/5/27.
//

import UIKit

class RotateViewController: UIViewController {

    @IBOutlet weak var myImageView: UIImageView!
    
    override func viewDidLoad() {
        super.viewDidLoad()
    }
    
    override func viewWillAppear(_ animated: Bool) {
        super.viewWillAppear(animated)
        (UIApplication.shared.delegate as! AppDelegate).restrictRotation = .all
    }
    
    override func viewWillTransition(to size: CGSize, with coordinator: UIViewControllerTransitionCoordinator) {
        super.viewWillTransition(to: size, with: coordinator)
//        UIView.setAnimationsEnabled(false)

        coordinator.animate(alongsideTransition: { _ in
            if UIDevice.current.orientation.isLandscape {
                self.tabBarController?.tabBar.isHidden = true
                self.tabBarController?.tabBar.layer.zPosition = -1
            } else {
                self.tabBarController?.tabBar.isHidden = false
                self.tabBarController?.tabBar.layer.zPosition = 0
            }
            self.view.alpha = 0
            self.view.transform = CGAffineTransform(scaleX: 1, y: 1/UIScreen.main.bounds.size.height)
        }, completion: {_ in
//            UIView.setAnimationsEnabled(true)

            UIView.animate(withDuration: 0.1) {
                self.view.transform = CGAffineTransform(scaleX: 1/UIScreen.main.bounds.size.width, y: 1/UIScreen.main.bounds.size.height)
            } completion: { _ in
                UIView.animate(withDuration: 0.2) {
                    self.view.alpha = 1
                    self.view.transform = CGAffineTransform(scaleX: 1, y: 1/UIScreen.main.bounds.size.height)
                } completion: { _ in
                    UIView.animate(withDuration: 0.2) {
                        self.myImageView.alpha = 1
                        self.view.transform = CGAffineTransform(scaleX: 1, y: 1)
                    } completion: { _ in
                        
                    }
                }
            }
        })

        
            
        
//        [UIView animateWithDuration:0.3f animations:^{
//
//            window.transform = CGAffineTransformMakeScale(1.0, 1/[UIScreen mainScreen].bounds.size.height);
//        } completion:^(BOOL finished) {
//
//            [UIView animateWithDuration:0.5f animations:^{
//                window.transform = CGAffineTransformMakeScale(1/[UIScreen mainScreen].bounds.size.width, 1/[UIScreen mainScreen].bounds.size.height);
//            } completion:^(BOOL finished) {
//                exit(1);
//            }];
//        }];
    }

}
