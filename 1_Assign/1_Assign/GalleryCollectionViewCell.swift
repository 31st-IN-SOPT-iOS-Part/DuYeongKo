//
//  GalleryCollectionViewCell.swift
//  1_Assign
//
//  Created by 고두영 on 2022/11/04.
//

import UIKit

import SnapKit
import SwiftyColor
import Then

class GalleryCollectionViewCell: UICollectionViewCell {
    
    static let identifier = "GalleryCollectionViewCell"
    
    private let galleryContainerView = UIView()
    private let galleryImageView = UIImageView()
    
    override init(frame: CGRect) {
        super.init(frame: frame)
        layout()
    }
    
    required init?(coder: NSCoder) {
        fatalError("init(coder:) has not been implemented")
    }
}

extension GalleryCollectionViewCell {
    private func layout() {
        backgroundColor = .clear
        
        [galleryContainerView].forEach {
            contentView.addSubview($0)
        }
        
        galleryContainerView.addSubview(galleryImageView)
        galleryContainerView.snp.makeConstraints {
            $0.top.leading.trailing.height.equalToSuperview()
        }
        
        galleryImageView.snp.makeConstraints {
            $0.edges.equalToSuperview()
        }
        
    }
    
    func dataBind(model: GalleryModel) {
        galleryImageView.image = UIImage(named: model.GalleryImage)
    }
}
