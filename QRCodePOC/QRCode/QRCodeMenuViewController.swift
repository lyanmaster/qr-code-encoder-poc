//
//  QRCodeMenuViewController.swift
//  PlaygroundSimulator
//
//  Created by Lyan Masterson on 17/12/20.
//

import UIKit

class QRCodeMenuViewController: UIViewController {
    
    override func loadView() {
        self.view = QRCodeMenuView(delegate: self)
    }
    
    override func viewDidLoad() {
        view.backgroundColor = .white
        title = "QRCodeMenu"
    }
}

extension QRCodeMenuViewController: QRCodeMenuViewDelegate {
    func openEFQRCode() {
        return
    }
    
    func openQRCode() {
        present(QRCodeViewerViewController(), animated: true, completion: nil)
    }
    
    func openQRCoder() {
        return
    }
}
