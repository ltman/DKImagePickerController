//
//  DKAssetGroupDetailImageCell.swift
//  DKImagePickerController
//
//  Created by ZhangAo on 07/12/2016.
//  Copyright © 2016 ZhangAo. All rights reserved.
//

import UIKit

@objcMembers
public class DKAssetGroupDetailImageCell: DKAssetGroupDetailBaseCell {
    
    public class override func cellReuseIdentifier() -> String {
        return "DKImageAssetIdentifier"
    }
    
    override init(frame: CGRect) {
        super.init(frame: frame)
        
        self.thumbnailImageView.frame = CGRect(x: 6, y: 6, width: self.bounds.width - 12, height: self.bounds.height - 12)
        self.thumbnailImageView.autoresizingMask = [.flexibleWidth, .flexibleHeight]
        self.contentView.addSubview(self.thumbnailImageView)
        
        self.checkView.frame = self.bounds
        self.checkView.autoresizingMask = [.flexibleWidth, .flexibleHeight]
        self.checkView.checkImageView.tintColor = nil
        self.checkView.checkLabel.font = UIFont.boldSystemFont(ofSize: 9)
        self.checkView.checkLabel.textColor = UIColor.white
        self.contentView.addSubview(self.checkView)
        self.contentView.accessibilityIdentifier = "DKImageAssetAccessibilityIdentifier"
        self.contentView.isAccessibilityElement = true
        
        self.thumbnailImageView.layer.cornerRadius = 12
    }
    
    required init?(coder aDecoder: NSCoder) {
        fatalError("init(coder:) has not been implemented")
    }
    
    open class DKImageCheckView: UIView {
        
        internal lazy var checkImageView: UIView = {
            let view = UIView()
            view.layer.backgroundColor = UIColor.gray.cgColor
            view.layer.cornerRadius = 8
            view.alpha = 0.6
            
            return view
        }()

        internal lazy var checkLabel: UILabel = {
            let label = UILabel()
            label.textAlignment = .center
            
            label.layer.backgroundColor = UIColor(red: 74/255, green: 105/255, blue: 255/255, alpha: 1).cgColor
            label.layer.borderColor = UIColor.white.cgColor
            label.layer.borderWidth = 2
            label.layer.cornerRadius = 8
            
            return label
        }()
        
        override init(frame: CGRect) {
            super.init(frame: frame)
            self.addSubview(self.checkImageView)
            self.addSubview(self.checkLabel)
        }
        
        required public init?(coder aDecoder: NSCoder) {
            fatalError("init(coder:) has not been implemented")
        }
        
        override open func layoutSubviews() {
            super.layoutSubviews()
            self.checkImageView.frame = CGRect(x: self.bounds.width - 29, y: self.bounds.height - 31, width: 16, height: 16)
            self.checkLabel.frame = CGRect(x: self.bounds.width - 29, y: self.bounds.height - 31, width: 16, height: 16)
        }
        
    } /* DKImageCheckView */
    
    override public var thumbnailImage: UIImage? {
        didSet {
            self.thumbnailImageView.image = self.thumbnailImage
        }
    }
    override public var selectedIndex: Int {
        didSet {
            self.checkView.checkLabel.text =  "\(self.selectedIndex + 1)"
        }
    }
    
    internal lazy var _thumbnailImageView: UIImageView = {
        let thumbnailImageView = UIImageView()
        thumbnailImageView.contentMode = .scaleAspectFill
        thumbnailImageView.clipsToBounds = true
        
        return thumbnailImageView
    }()
    
    override public var thumbnailImageView: UIImageView {
        get {
            return _thumbnailImageView
        }
    }
    
    public let checkView = DKImageCheckView()
    
    override public var isSelected: Bool {
        didSet {
            self.checkView.checkLabel.isHidden = !super.isSelected
        }
    }
    
} /* DKAssetGroupDetailCell */
