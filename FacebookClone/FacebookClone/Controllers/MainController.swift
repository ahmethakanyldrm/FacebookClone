//
//  ViewController.swift
//  FacebookClone
//
//  Created by AHMET HAKAN YILDIRIM on 7.01.2023.
//

import UIKit
import LBTATools

class PostCell: LBTAListCell<String> {
    
    let imageView = UIImageView(backgroundColor: .blue)
    let nameLabel = UILabel(text: "Name Label")
    let dateLabel = UILabel(text: "Friday at 11.11 AM")
    let postTextLabel = UILabel(text: "Here is my post text")
    
   // let imageViewGrid = UIView(backgroundColor: .yellow)
    
    let photosGridController = PhotosGridController()
    
    
    override func setupViews() {
        backgroundColor = .white
        
        stack(
            hstack(
                imageView.withHeight(40).withWidth(40),
                stack(nameLabel,dateLabel),
                spacing: 8
            ).padLeft(12).padRight(12).padTop(12),
              
              postTextLabel,
            photosGridController.view, spacing: 8
        )
    }
}

class StoryHeader: UICollectionReusableView {
    
    let storiesController = StoriesController(scrollDirection: .horizontal)
    
    
    override init(frame: CGRect) {
        super.init(frame: frame)
        backgroundColor = .yellow
        
        stack(storiesController.view)
    }
    
    required init?(coder: NSCoder) {
        fatalError("init(coder:) has not been implemented")
    }
    
}

class StoryPhotoCell: LBTAListCell<String> {
    
    override var item: String!{
        didSet {
            imageView.image = UIImage(named: item)
        }
    }
    
    let imageView = UIImageView(image: nil,contentMode: .scaleAspectFill)
    
    let nameLabel = UILabel(text:"Ahmet",font: .boldSystemFont(ofSize: 15),textColor: .white)
    
    
    override func setupViews() {
        backgroundColor = .red
        imageView.layer.cornerRadius = 10
        stack(imageView)
        setupGradientLayer()
        stack(UIView(),nameLabel).withMargins(.allSides(8))
        
    }
    
    let gradientLayer = CAGradientLayer()
    
    fileprivate func setupGradientLayer(){
        
       
        gradientLayer.colors = [UIColor.clear.cgColor, UIColor.red.cgColor]
        gradientLayer.locations = [0.7,1.5]
        layer.cornerRadius = 10
        clipsToBounds = true 
        layer.addSublayer(gradientLayer)
    }
    
    override func layoutSubviews() {
        super.layoutSubviews()
        
        gradientLayer.frame = bounds
    }
}

class StoriesController: LBTAListController<StoryPhotoCell,String>, UICollectionViewDelegateFlowLayout {
    
    
    
    func collectionView(_ collectionView: UICollectionView, layout collectionViewLayout: UICollectionViewLayout, sizeForItemAt indexPath: IndexPath) -> CGSize {
        
        return .init(width: 100, height: view.frame.height - 24)
    }
    
    func collectionView(_ collectionView: UICollectionView, layout collectionViewLayout: UICollectionViewLayout, insetForSectionAt section: Int) -> UIEdgeInsets {
        return .init(top: 0, left: 12, bottom: 0, right: 12)
        
    }
    
    override func viewDidLoad() {
        super.viewDidLoad()
        self.items = ["ahmet","myImage","pera","ahmet","myImage"]
    }
}

class MainController: LBTAListHeaderController<PostCell, String,StoryHeader>, UICollectionViewDelegateFlowLayout {
    
    

    // MARK: - LifeCycle
    override func viewDidLoad() {
        super.viewDidLoad()
        
        collectionView.backgroundColor = .init(white: 0.9, alpha: 1)
        self.items = ["Hello", "World","1","2"]
        
    }
    
    // MARK: - Functions

    
    func collectionView(_ collectionView: UICollectionView, layout collectionViewLayout: UICollectionViewLayout, referenceSizeForHeaderInSection section: Int) -> CGSize {
        
        return .init(width: 0, height: 200)
    }
    
    func collectionView(_ collectionView: UICollectionView, layout collectionViewLayout: UICollectionViewLayout, insetForSectionAt section: Int) -> UIEdgeInsets {
        
        return .init(top: 12, left: 0, bottom: 0, right: 0)
    }
    
    func collectionView(_ collectionView: UICollectionView, layout collectionViewLayout: UICollectionViewLayout, sizeForItemAt indexPath: IndexPath) -> CGSize {
        
        return .init(width: view.frame.width, height: 250)
    }
}



import SwiftUI
struct MainPreview: PreviewProvider {
    
    static var previews: some View {
        //Text("main preview")
        ContainerView().edgesIgnoringSafeArea(.all)
    }
    
    struct ContainerView: UIViewControllerRepresentable {
        
        func updateUIViewController(_ uiViewController: UIViewControllerType, context: Context) {
            
        }
        
        func makeUIViewController(context: Context) -> some UIViewController {
            return MainController()
        }
    }
    
}

