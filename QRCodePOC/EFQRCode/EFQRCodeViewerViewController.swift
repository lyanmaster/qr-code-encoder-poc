//
//  EFQRCodeViewerViewController.swift
//  QRCodePOC
//
//  Created by Lyan Miguel on 22/12/20.
//

import UIKit
import EFQRCode

class EFQRCodeViewerViewController: UIViewController {
    private lazy var qrCodeOnlyTextView: UIImageView = {
        let imageView = UIImageView()
        imageView.translatesAutoresizingMaskIntoConstraints = false
        return imageView
    }()
    private lazy var qrCodeWithImageView: UIImageView = {
        let imageView = UIImageView()
        imageView.translatesAutoresizingMaskIntoConstraints = false
        return imageView
    }()
    
    private lazy var scrollView: UIScrollView = {
        let scrollview = UIScrollView(frame: .zero)
        scrollview.translatesAutoresizingMaskIntoConstraints = false
        return scrollview
    }()
    
    private lazy var contentView: UIView = {
        let view = UIView(frame: .zero)
        view.translatesAutoresizingMaskIntoConstraints = false
        return view
    }()
    
    override func viewDidLoad() {
        self.view.backgroundColor = .white
        title = "QRCode"
        setup()
    }
    
    override func viewWillAppear(_ animated: Bool) {
        if let image = EFQRCode.generate(content: "TESTE") {
            qrCodeOnlyTextView.image = UIImage(cgImage: image)
        } else {
            print("failed to create image")
        }
        
        if let image = EFQRCode.generate(content: "TESTE", watermark: UIImage(named: "truck")?.cgImage) {
            qrCodeWithImageView.image = UIImage(cgImage: image)
        } else {
            print("failed to create image")
        }
    }
}

extension EFQRCodeViewerViewController: CodeView {
    
    func setupComponents() {
        self.view.addSubview(scrollView)
        scrollView.addSubview(contentView)
        
        contentView.addSubview(qrCodeOnlyTextView)
        contentView.addSubview(qrCodeWithImageView)
    }
    
    func setupConstraints() {
        let contentViewHeightConstraint = contentView.heightAnchor.constraint(equalTo: scrollView.heightAnchor)
        contentViewHeightConstraint.priority = .defaultLow
        
        scrollView.topAnchor.constraint(equalTo: self.view.safeAreaLayoutGuide.topAnchor).isActive = true
        scrollView.bottomAnchor.constraint(equalTo: self.view.safeAreaLayoutGuide.bottomAnchor).isActive = true
        scrollView.widthAnchor.constraint(equalTo: self.view.widthAnchor).isActive = true
        scrollView.centerXAnchor.constraint(equalTo: self.view.centerXAnchor).isActive = true
        
        contentView.topAnchor.constraint(equalTo: scrollView.topAnchor).isActive = true
        contentView.bottomAnchor.constraint(equalTo: scrollView.bottomAnchor).isActive = true
        contentView.widthAnchor.constraint(equalTo: scrollView.widthAnchor).isActive = true
        contentView.centerXAnchor.constraint(equalTo: scrollView.centerXAnchor).isActive = true
        
        qrCodeOnlyTextView.topAnchor.constraint(equalTo: contentView.topAnchor, constant: 10).isActive = true
        qrCodeOnlyTextView.leadingAnchor.constraint(equalTo: contentView.leadingAnchor, constant: 10).isActive = true
        qrCodeOnlyTextView.trailingAnchor.constraint(equalTo: contentView.trailingAnchor, constant: -10).isActive = true

        qrCodeWithImageView.topAnchor.constraint(equalTo: qrCodeOnlyTextView.bottomAnchor, constant: 10).isActive = true
        qrCodeWithImageView.leadingAnchor.constraint(equalTo: contentView.leadingAnchor, constant: 10).isActive = true
        qrCodeWithImageView.trailingAnchor.constraint(equalTo: contentView.trailingAnchor, constant: -10).isActive = true
        qrCodeWithImageView.bottomAnchor.constraint(equalTo: contentView.bottomAnchor, constant: -10).isActive = true
        
    }
    
    func setupExtraConfiguration() {
        return
    }
}
