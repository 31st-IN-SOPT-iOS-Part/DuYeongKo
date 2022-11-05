//
//  PhotoCollectionViewController.swift
//  1_Assign
//
//  Created by 고두영 on 2022/11/04.
//

import UIKit
import SnapKit
import SwiftyColor
import Then

class GalleryCollectionViewController: UIViewController {
    
    let closeImgView = UIImageView()
    
    let recentLabel:UILabel = {
        let label = UILabel()
        label.text = "최근 항목"
        label.font = .systemFont(ofSize: 16, weight: .regular)
        return label
    }()
    
    let sendLabel:UILabel = {
        let label = UILabel()
        label.text = "전송"
        label.font = .systemFont(ofSize: 14, weight: .regular)
        return label
    }()

    private lazy var GalleryCollectionView: UICollectionView = {
        let layout = UICollectionViewFlowLayout()
        layout.scrollDirection = .vertical
        
        let collectionView = UICollectionView(frame: .zero, collectionViewLayout: layout)
        collectionView.backgroundColor = .clear
        collectionView.translatesAutoresizingMaskIntoConstraints = false
        collectionView.isScrollEnabled = true
        collectionView.showsVerticalScrollIndicator = false
        collectionView.delegate = self
        collectionView.dataSource = self
        return collectionView
    }()
    
    var galleryList: [GalleryModel] = [
        GalleryModel(GalleryImage: "Frame 17"),
        GalleryModel(GalleryImage: "galleryImage1"),
        GalleryModel(GalleryImage: "galleryImage2"),
        GalleryModel(GalleryImage: "galleryImage3"),
        GalleryModel(GalleryImage: "galleryImage4"),
        GalleryModel(GalleryImage: "galleryImage5"),
        GalleryModel(GalleryImage: "galleryImage6"),
        GalleryModel(GalleryImage: "galleryImage7"),
        GalleryModel(GalleryImage: "galleryImage8"),
        GalleryModel(GalleryImage: "galleryImage9"),
        GalleryModel(GalleryImage: "galleryImage10"),
        GalleryModel(GalleryImage: "galleryImage11"),
        GalleryModel(GalleryImage: "galleryImage12"),
        GalleryModel(GalleryImage: "galleryImage13"),
        GalleryModel(GalleryImage: "galleryImage14"),
        GalleryModel(GalleryImage: "galleryImage15"),
        GalleryModel(GalleryImage: "galleryImage16"),
        GalleryModel(GalleryImage: "galleryImage17"),
        GalleryModel(GalleryImage: "galleryImage18"),
        GalleryModel(GalleryImage: "galleryImage19"),
        GalleryModel(GalleryImage: "galleryImage20"),
        GalleryModel(GalleryImage: "galleryImage21"),
        GalleryModel(GalleryImage: "galleryImage22"),
        GalleryModel(GalleryImage: "galleryImage23")
    ]
    
    final let kGalleryInset: UIEdgeInsets = UIEdgeInsets(top: 0, left: 0, bottom: 0, right: 0) // 컬렉션뷰 전체에서 패딩 느낌
    final let kGalleryLineSpacing: CGFloat = 7 // 셀끼리의 상하간격
    final let kGalleryInterItemSpacing: CGFloat = 9 // 셀끼리의 좌우간격
    final let kCellHeight: CGFloat = 119 // 셀 하나의 높이
    
    override func viewDidLoad() {
        super.viewDidLoad()
        self.view.backgroundColor = .white
        configImageView()
        register()
        layout()

    }
}

extension GalleryCollectionViewController {
    private func layout() {
        view.backgroundColor = .white
        
        view.addSubview(closeImgView)
        closeImgView.snp.makeConstraints {
            $0.top.equalTo(self.view.safeAreaLayoutGuide).offset(7)
            $0.leading.equalTo(self.view.safeAreaLayoutGuide).offset(12)
            $0.width.equalTo(24)
            $0.height.equalTo(24)
        }
        
        view.addSubview(recentLabel)
        recentLabel.snp.makeConstraints {
            $0.top.equalTo(self.view.safeAreaLayoutGuide).offset(11)
            $0.leading.equalTo(self.closeImgView.snp.trailing).offset(124)
        }
        
        view.addSubview(sendLabel)
        sendLabel.snp.makeConstraints {
            $0.top.equalTo(self.recentLabel.snp.top)
            $0.leading.equalTo(self.recentLabel.snp.trailing).offset(125)
        }
        
        view.addSubview(GalleryCollectionView)
        GalleryCollectionView.snp.makeConstraints {
            $0.top.equalTo(self.view.safeAreaLayoutGuide).offset(38)
            $0.leading.trailing.equalTo(self.view.safeAreaLayoutGuide)
            $0.bottom.equalToSuperview()
            $0.height.equalTo(calculateCellHeight())
        }
    }
    
    private func calculateCellHeight() -> CGFloat {
        let count = CGFloat(galleryList.count)
        let heightCount = count / 2 + count.truncatingRemainder(dividingBy: 2)
        return heightCount * kCellHeight + (heightCount - 1) * kGalleryLineSpacing + kGalleryInset.top + kGalleryInset.bottom
    }
    
    private func configImageView(){
        closeImgView.image = UIImage(named: "iconClose")
    }
    
    private func register() {
        GalleryCollectionView.register(GalleryCollectionViewCell.self, forCellWithReuseIdentifier: GalleryCollectionViewCell.identifier)
    }
}

extension GalleryCollectionViewController: UICollectionViewDelegateFlowLayout {
    func collectionView(_ collectionView: UICollectionView, layout collectionViewLayout: UICollectionViewLayout, sizeForItemAt indexPath: IndexPath) -> CGSize {
        let screenWidth = UIScreen.main.bounds.width
//        let doubleCellWidth = screenWidth - kGalleryInset.left - kGalleryInset.right - kGalleryInterItemSpacing
        let cellItemForRow: CGFloat = 3
        let minimunSpacing: CGFloat = 9
        let width = (screenWidth - (cellItemForRow - 1) * minimunSpacing) / cellItemForRow
//        return CGSize(width: doubleCellWidth / 3 - 1, height: 119)
        return CGSize(width: width, height: 119)
    }
    
    func collectionView(_ collectionView: UICollectionView, layout collectionViewLayout: UICollectionViewLayout, minimumLineSpacingForSectionAt section: Int) -> CGFloat {
        return kGalleryLineSpacing
    }
    
    func collectionView(_ collectionView: UICollectionView, layout collectionViewLayout: UICollectionViewLayout, minimumInteritemSpacingForSectionAt section: Int) -> CGFloat {
        return kGalleryInterItemSpacing
    }
    
    func collectionView(_ collectionView: UICollectionView, layout collectionViewLayout: UICollectionViewLayout, insetForSectionAt section: Int) -> UIEdgeInsets {
        return kGalleryInset
    }
}

extension GalleryCollectionViewController: UICollectionViewDataSource {
    func collectionView(_ collectionView: UICollectionView, numberOfItemsInSection section: Int) -> Int {
        return galleryList.count
    }
    
    func collectionView(_ collectionView: UICollectionView, cellForItemAt indexPath: IndexPath) -> UICollectionViewCell {
        guard let GalleryCell = collectionView.dequeueReusableCell(withReuseIdentifier: GalleryCollectionViewCell.identifier, for: indexPath)
                as? GalleryCollectionViewCell else { return UICollectionViewCell() }
        GalleryCell.dataBind(model: galleryList[indexPath.item])
        return GalleryCell
    }
}
