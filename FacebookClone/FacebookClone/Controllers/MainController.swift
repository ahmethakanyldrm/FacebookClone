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

class MainController: LBTAListController<PostCell, String>, UICollectionViewDelegateFlowLayout {

    // MARK: - LifeCycle
    override func viewDidLoad() {
        super.viewDidLoad()
        
        collectionView.backgroundColor = .init(white: 0.9, alpha: 1)
        
        
        self.items = ["Hello", "World","1","2"]
        
    }
    
    func collectionView(_ collectionView: UICollectionView, layout collectionViewLayout: UICollectionViewLayout, sizeForItemAt indexPath: IndexPath) -> CGSize {
        
        return .init(width: view.frame.width, height: 250)
    }
    
    // MARK: - Functions
    
    
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

