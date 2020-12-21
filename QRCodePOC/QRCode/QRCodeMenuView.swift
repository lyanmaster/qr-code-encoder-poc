//
//  QRCodeMenuView.swift
//  PlaygroundSimulator
//
//  Created by Lyan Masterson on 17/12/20.
//

import UIKit

protocol QRCodeMenuViewDelegate: AnyObject {
    
    func openEFQRCode()
    
    func openQRCode()
    
    func openQRCoder()
    
}

final class QRCodeMenuView: UIView {
    
    private lazy var efqrQRCodeButton: UIButton = {
        let button = UIButton()
        button.translatesAutoresizingMaskIntoConstraints = false
        button.backgroundColor = UIColor(hex: 0x3364A2)
        button.setTitle("OPEN EFQR QRCode", for: .normal)
        button.setTitleColor(UIColor.white, for: .normal)
        button.titleLabel?.font = UIFont.systemFont(ofSize: 16, weight: .bold)
        button.layer.cornerRadius = 5
        button.layer.borderWidth = 1
        button.layer.borderColor = UIColor.lightGray.cgColor
        return button
    }()
    
    private lazy var qrCodeButton: UIButton = {
        let button = UIButton()
        button.translatesAutoresizingMaskIntoConstraints = false
        button.backgroundColor = UIColor(hex: 0x3364A2)
        button.setTitle("OPEN QRCode", for: .normal)
        button.setTitleColor(UIColor.white, for: .normal)
        button.titleLabel?.font = UIFont.systemFont(ofSize: 16, weight: .bold)
        button.layer.cornerRadius = 5
        button.layer.borderWidth = 1
        button.layer.borderColor = UIColor.lightGray.cgColor
        return button
    }()
    
    private lazy var qrCoderButton: UIButton = {
        let button = UIButton()
        button.translatesAutoresizingMaskIntoConstraints = false
        button.backgroundColor = UIColor(hex: 0x3364A2)
        button.setTitle("OPEN QRCoder", for: .normal)
        button.setTitleColor(UIColor.white, for: .normal)
        button.titleLabel?.font = UIFont.systemFont(ofSize: 16, weight: .bold)
        button.layer.cornerRadius = 5
        button.layer.borderWidth = 1
        button.layer.borderColor = UIColor.lightGray.cgColor
        return button
    }()
    
    private weak var delegate: QRCodeMenuViewDelegate?
    
    init(delegate: QRCodeMenuViewDelegate) {
        self.delegate = delegate
        super.init(frame: .zero)
        
        setup()
    }
    
    required init?(coder: NSCoder) {
        fatalError("init(coder:) has not been implemented")
    }
    
    @objc func openEFQR() {
        self.delegate?.openEFQRCode()
    }
    
    @objc func openQRCode() {
        self.delegate?.openQRCode()
    }
    
    @objc func openQRCoder() {
        self.delegate?.openQRCoder()
    }
    
}

extension QRCodeMenuView: CodeView {
    func setupComponents() {
        addSubview(efqrQRCodeButton)
        addSubview(qrCodeButton)
        addSubview(qrCoderButton)
    }
    
    func setupConstraints() {
        let margins = layoutMarginsGuide
        efqrQRCodeButton.topAnchor.constraint(equalTo: margins.topAnchor).isActive = true
        efqrQRCodeButton.leadingAnchor.constraint(equalTo: margins.leadingAnchor).isActive = true
        efqrQRCodeButton.trailingAnchor.constraint(equalTo: margins.trailingAnchor).isActive = true
        
        qrCodeButton.topAnchor.constraint(equalTo: efqrQRCodeButton.bottomAnchor, constant: 10).isActive = true
        qrCodeButton.leadingAnchor.constraint(equalTo: margins.leadingAnchor).isActive = true
        qrCodeButton.trailingAnchor.constraint(equalTo: margins.trailingAnchor).isActive = true
        
        qrCoderButton.topAnchor.constraint(equalTo: qrCodeButton.bottomAnchor, constant: 10).isActive = true
        qrCoderButton.leadingAnchor.constraint(equalTo: margins.leadingAnchor).isActive = true
        qrCoderButton.trailingAnchor.constraint(equalTo: margins.trailingAnchor).isActive = true
    }
    
    func setupExtraConfiguration() {
        efqrQRCodeButton.addTarget(self, action: #selector(openEFQR), for: .touchUpInside)
        qrCodeButton.addTarget(self, action: #selector(openQRCode), for: .touchUpInside)
        qrCoderButton.addTarget(self, action: #selector(openQRCoder), for: .touchUpInside)
    }
}
