//
//  MainViewController.swift
//  PlaygroundSimulator
//
//  Created by Lyan Masterson on 11/11/20.
//

import UIKit

class MainViewController: UIViewController {
    
    override func viewDidLoad() {
        super.viewDidLoad()
        title = "Playground"
    }
    
    override func viewDidAppear(_ animated: Bool) {
        navigationController?.pushViewController(QRCodeMenuViewController(), animated: true)
    }
    
}
