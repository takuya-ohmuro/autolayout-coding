//
//  PageCell.swift
//  AutoLayout5
//
//  Created by takuyaOhmuro on 2018/05/16.
//  Copyright © 2018年 takuyaOhmuro. All rights reserved.
//

import UIKit

class PageCell: UICollectionViewCell {
    override init(frame: CGRect) {
        super.init(frame: frame)
        
        setupLayout()
    
    }
    var page:Page? {
        didSet {
            guard let unwrappedPage = page else { return }
                imageView.image = UIImage(named:unwrappedPage.imageName )
            
            let attribute = NSMutableAttributedString(string:unwrappedPage.headerString , attributes: [NSAttributedStringKey.font:UIFont.boldSystemFont(ofSize: 18)])
            attribute.append(NSMutableAttributedString(string: "\n\n\n\(unwrappedPage.bodyString)", attributes: [NSAttributedStringKey.font:UIFont.systemFont(ofSize: 13),NSAttributedStringKey.foregroundColor:UIColor.lightGray]))
            descriptionTextView.attributedText = attribute
            descriptionTextView.textAlignment = .center
        }
    }
    private let imageView:UIImageView = {
        let imageView = UIImageView(image: #imageLiteral(resourceName: "bear_first"))
        imageView.translatesAutoresizingMaskIntoConstraints = false
        return imageView
    }()
    private let descriptionTextView : UITextView = {
        let textView = UITextView()
        let attribute = NSMutableAttributedString(string: "Join us aaa a a a a a a  aa  a ", attributes: [NSAttributedStringKey.font:UIFont.boldSystemFont(ofSize: 18)])
        attribute.append(NSMutableAttributedString(string: "\n\n\nkonnnnn nnn a  aaaaa aa  aka akkk  akkk akka akka k", attributes: [NSAttributedStringKey.font:UIFont.systemFont(ofSize: 13),NSAttributedStringKey.foregroundColor:UIColor.lightGray]))
        textView.attributedText = attribute
        textView.textAlignment = .center
        textView.translatesAutoresizingMaskIntoConstraints = false
        textView.isEditable = false
        textView.isScrollEnabled = false
        return textView
    }()

    
    private func setupLayout() {
        let topImageView = UIView()
        topImageView.translatesAutoresizingMaskIntoConstraints = false
        
        addSubview(topImageView)
        topImageView.addSubview(imageView)
        addSubview(descriptionTextView)
        NSLayoutConstraint.activate([
            topImageView.topAnchor.constraint(equalTo: topAnchor),
            topImageView.leadingAnchor.constraint(equalTo: leadingAnchor),
            topImageView.trailingAnchor.constraint(equalTo:trailingAnchor),
            topImageView.heightAnchor.constraint(equalTo: heightAnchor, multiplier: 0.5),
            imageView.centerXAnchor.constraint(equalTo: topImageView.centerXAnchor),
            imageView.centerYAnchor.constraint(equalTo: topImageView.centerYAnchor),
            imageView.heightAnchor.constraint(equalTo: topImageView.heightAnchor, multiplier: 0.5),
            imageView.widthAnchor.constraint(equalTo: imageView.heightAnchor),
            descriptionTextView.topAnchor.constraint(equalTo: topImageView.bottomAnchor,constant:10),
            descriptionTextView.leadingAnchor.constraint(equalTo: leadingAnchor, constant: 24),
            descriptionTextView.trailingAnchor.constraint(equalTo: trailingAnchor, constant: -24),
            descriptionTextView.bottomAnchor.constraint(equalTo: bottomAnchor)
            ])
    }
    
    
    required init?(coder aDecoder: NSCoder) {
        fatalError("init(coder:) has not been implemented")
    }
}
