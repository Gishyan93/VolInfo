//
//  ViewController.swift
//  Volinfo
//
//  Created by Tigran Gishyan on 10/24/20.
//

import UIKit

class GroupController: BaseListController, UICollectionViewDelegateFlowLayout {

    //
    //MARK: - Properties
    //
    private let cellID = "cellID"
    private var group = [Group]()
    //
    //MARK: - Lifecycle methods
    //
    override func viewDidLoad() {
        super.viewDidLoad()
        
            
        group.append(.init(groupimg: "", groupname: "Դեղորայք", groupcount: "10"))
        group.append(.init(groupimg: "", groupname: "Հիգիենայի պարագաներ", groupcount: "20"))
        group.append(.init(groupimg: "", groupname: "Ուտելիք", groupcount: "30"))
        group.append(.init(groupimg: "", groupname: "Այլ", groupcount: "20"))
        setupCollectionView()
    }
    
    //
    //MARK: - Functions
    //
    private func setupCollectionView() {
        collectionView.backgroundColor = .white
        collectionView.register(GroupCell.self, forCellWithReuseIdentifier: cellID)
    }


}

//
//MARK: - UICollectionView DataSource DelegateFlowLayout & Delegate
//
extension GroupController {
    //numberOfItemsInSection
    override func collectionView(_ collectionView: UICollectionView, numberOfItemsInSection section: Int) -> Int {
        return group.count
    }
    //cellForItemAt
    override func collectionView(_ collectionView: UICollectionView, cellForItemAt indexPath: IndexPath) -> UICollectionViewCell {
        let cell = collectionView.dequeueReusableCell(withReuseIdentifier: cellID, for: indexPath) as! GroupCell
        cell.group = group[indexPath.item]
        return cell
    }
    
    //sizeForItemAt
    func collectionView(_ collectionView: UICollectionView, layout collectionViewLayout: UICollectionViewLayout, sizeForItemAt indexPath: IndexPath) -> CGSize {
                
//        let dummyCell = HomeCell(frame: .init(x: 0, y: 0, width: view.frame.width, height: 1000))
//
//        dummyCell.fObject = self.filteredFobjects[indexPath.item]
//        dummyCell.layoutIfNeeded()
//
//        let estimatedSize = dummyCell.systemLayoutSizeFitting(.init(width: view.frame.width, height: 1000))
        
        return .init(width: view.frame.width-16, height: 100)
    }
    
    //insetForSectionAt
    func collectionView(_ collectionView: UICollectionView, layout collectionViewLayout: UICollectionViewLayout, insetForSectionAt section: Int) -> UIEdgeInsets {
        return .init(top: 16, left: 0, bottom: 16, right: 0)
    }
    
    //minimumLineSpacingForSectionAt
//    func collectionView(_ collectionView: UICollectionView, layout collectionViewLayout: UICollectionViewLayout, minimumLineSpacingForSectionAt section: Int) -> CGFloat {
//        return 10
//    }
    
    
    //didSelectItemAt
    override func collectionView(_ collectionView: UICollectionView, didSelectItemAt indexPath: IndexPath) {
            
        let itemController = ItemController()
        
        
        self.navigationController?.pushViewController(itemController, animated: false)
        
        //admissionController.navigationItem.hidesBackButton = true
        
    }
    
}

