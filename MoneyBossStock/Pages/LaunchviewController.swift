//
//  LaunchPage.swift
//  BlackSreenVideo
//
//  Created by yihuang on 2022/11/23.
//

import Foundation
import UIKit

class LaunchViewController: BaseViewController {
    
    override func viewDidLoad() {
        super.viewDidLoad()
        self.view.backgroundColor = .black
    }
    
    override func viewDidAppear(_ animated: Bool) {
        super.viewDidAppear(animated)
        self.prepareData(complete: { [weak self] in
            self?.toVC()
        })
    }
    
    func prepareData(complete: (()->())?) {
        complete?()
    }
    
    func toVC() {
        DispatchQueue.main.async {
            let vc = UINavigationController(rootViewController: FeverViewController())
            UIApplication.shared.windows.first?.rootViewController = vc
            UIApplication.shared.windows.first?.makeKeyAndVisible()
            
        }
    }
    
}
