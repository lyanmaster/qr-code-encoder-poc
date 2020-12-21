//
//  QRCodeViewerViewController.swift
//  PlaygroundSimulator
//
//  Created by Lyan Masterson on 17/12/20.
//

import UIKit
import QRCode

class QRCodeViewerViewController: UIViewController {
    
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
    
    override func viewDidLoad() {
        self.view.backgroundColor = .white
        title = "QRCode"
        setup()
    }
    
    override func viewWillAppear(_ animated: Bool) {
        qrCodeLowCorrectionView.image = {
            var qrCode = QRCode("LOW ERROR CORRECTION QRCODE")!
            qrCode.size = CGSize(width: 200, height: 200)
            qrCode.color = CIColor(rgba: "8e44ad")
            qrCode.errorCorrection = .Low
            return qrCode.image
        }()
        
        qrCodeMediumCorrectionView.image = {
            var qrCode = QRCode("MEDIUM ERROR CORRECTION WITH MEDIUM STRING QRCODE")!
            qrCode.size = CGSize(width: 200, height: 200)
            qrCode.color = CIColor(rgba: "fff")
            qrCode.backgroundColor = CIColor(rgba: "e74c3c")
            qrCode.errorCorrection = .Medium
            return qrCode.image
        }()
        
        qrCodeHighCorrectionView.image = {
            var qrCode = QRCode("HIGH ERROR CORRECTION WITH A HUGE AND LONG LONG STRING FOR A QRCODE TO BE READEN")!
            qrCode.size = CGSize(width: 200, height: 200)
            qrCode.errorCorrection = .High
            return qrCode.image
        }()
        
        qrCodeQuartileCorrectionView.image = {
            var qrCode = QRCode("QUARTILE ERROR CORRECTION QRCODE")!
            qrCode.size = CGSize(width: 200, height: 200)
            qrCode.color = CIColor(rgba: "16a085")
            qrCode.backgroundColor = CIColor(rgba: "000")
            qrCode.errorCorrection = .Quartile
            return qrCode.image
        }()
    }
}

extension QRCodeViewerViewController: CodeView {
    
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
