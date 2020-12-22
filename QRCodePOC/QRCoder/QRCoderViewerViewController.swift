//
//  QRCoderViewerViewController.swift
//  QRCodePOC
//
//  Created by Lyan Miguel on 22/12/20.
//

import QRCoder
import UIKit

class QRCoderViewerViewController: UIViewController {
    private lazy var qrCodeMediumCorrectionView: UIImageView = {
        let imageView = UIImageView()
        imageView.translatesAutoresizingMaskIntoConstraints = false
        return imageView
    }()
    private lazy var qrCodeQuartileCorrectionView: UIImageView  = {
        let imageView = UIImageView()
        imageView.translatesAutoresizingMaskIntoConstraints = false
        return imageView
    }()
    private lazy var qrCodeLowCorrectionView: UIImageView = {
        let imageView = UIImageView()
        imageView.translatesAutoresizingMaskIntoConstraints = false
        return imageView
    }()
    private lazy var qrCodeHighCorrectionView: UIImageView = {
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
    
    let generator = QRCodeGenerator()
    
    override func viewDidLoad() {
        self.view.backgroundColor = .white
        title = "QRCode"
        setup()
    }
    
    override func viewWillAppear(_ animated: Bool) {
        generator.correctionLevel = .L
        qrCodeLowCorrectionView.image = generator.createImage(value: "LOW ERROR CORRECTION",
                                                              size: CGSize(width: 200, height: 200),
                                                              encoding: .utf8)
        generator.correctionLevel = .M
        qrCodeMediumCorrectionView.image = generator.createImage(value: "MEDIUM ERROR CORRECTION",
                                                                  size: CGSize(width: 200, height: 200),
                                                                  encoding: .utf8)
        
        generator.correctionLevel = .H
        qrCodeHighCorrectionView.image = generator.createImage(value: "HIGH ERROR CORRECTION",
                                                               size: CGSize(width: 200, height: 200),
                                                               encoding: .utf8)
        
        generator.correctionLevel = .Q
        qrCodeQuartileCorrectionView.image = generator.createImage(value: "QUARTILE ERROR CORRECTION",
                                                                   size: CGSize(width: 200, height: 200),
                                                                   encoding: .utf8)
    }
}

extension QRCoderViewerViewController: CodeView {
    
    func setupComponents() {
        self.view.addSubview(scrollView)
        scrollView.addSubview(contentView)
        
        contentView.addSubview(qrCodeLowCorrectionView)
        contentView.addSubview(qrCodeMediumCorrectionView)
        contentView.addSubview(qrCodeHighCorrectionView)
        contentView.addSubview(qrCodeQuartileCorrectionView)
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
        
        qrCodeLowCorrectionView.topAnchor.constraint(equalTo: contentView.topAnchor, constant: 10).isActive = true
        qrCodeLowCorrectionView.leadingAnchor.constraint(equalTo: contentView.leadingAnchor, constant: 10).isActive = true
        qrCodeLowCorrectionView.trailingAnchor.constraint(equalTo: contentView.trailingAnchor, constant: -10).isActive = true
        
        qrCodeMediumCorrectionView.topAnchor.constraint(equalTo: qrCodeLowCorrectionView.bottomAnchor, constant: 10).isActive = true
        qrCodeMediumCorrectionView.leadingAnchor.constraint(equalTo: contentView.leadingAnchor, constant: 10).isActive = true
        qrCodeMediumCorrectionView.trailingAnchor.constraint(equalTo: contentView.trailingAnchor, constant: -10).isActive = true
        
        qrCodeHighCorrectionView.topAnchor.constraint(equalTo: qrCodeMediumCorrectionView.bottomAnchor, constant: 10).isActive = true
        qrCodeHighCorrectionView.leadingAnchor.constraint(equalTo: contentView.leadingAnchor, constant: 10).isActive = true
        qrCodeHighCorrectionView.trailingAnchor.constraint(equalTo: contentView.trailingAnchor, constant: -10).isActive = true
        
        qrCodeQuartileCorrectionView.topAnchor.constraint(equalTo: qrCodeHighCorrectionView.bottomAnchor, constant: 10).isActive = true
        qrCodeQuartileCorrectionView.leadingAnchor.constraint(equalTo: contentView.leadingAnchor, constant: 10).isActive = true
        qrCodeQuartileCorrectionView.trailingAnchor.constraint(equalTo: contentView.trailingAnchor, constant: -10).isActive = true
        qrCodeQuartileCorrectionView.bottomAnchor.constraint(equalTo: contentView.bottomAnchor, constant: -10).isActive = true
        
    }
    
    func setupExtraConfiguration() {
        return
    }
}
