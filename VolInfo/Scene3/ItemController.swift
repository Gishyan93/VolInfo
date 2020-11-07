//
//  ItemController.swift
//  Volinfo
//
//  Created by Tigran Gishyan on 10/25/20.
//

import UIKit

class ItemController: BaseListController, UICollectionViewDelegateFlowLayout {
    //
    //MARK: - Properties
    //
    private let cellID = "cellID"
    var item = [Item]()
    //
    //MARK: - Lifecycle methods
    //
    override func viewDidLoad() {
        super.viewDidLoad()
           
        createFakeRepository()
        setupCollectionView()
    }
    
    //
    //MARK: - Functions
    //
    fileprivate func createFakeRepository() {
        item.append(.init(addeddate: "2020-05-06", itemname: "Ատամի խոզանակ", itempriority: "high", itemcount: 1000))
        item.append(.init(addeddate: "2020-06-07", itemname: "Ատամի մածուկ", itempriority: "low", itemcount: 500))
        item.append(.init(addeddate: "2020-06-07", itemname: "Անձեռոցիկներ", itempriority: "low", itemcount: 600))
    }
    private func setupCollectionView() {
        collectionView.backgroundColor = .white
        collectionView.register(ItemCell.self, forCellWithReuseIdentifier: cellID)
    }
}
//
//MARK: - Protocol confirmations
//
extension ItemController {
    //numberOfItemsInSection
    override func collectionView(_ collectionView: UICollectionView, numberOfItemsInSection section: Int) -> Int {
        return item.count
    }
    //cellForItemAt
    override func collectionView(_ collectionView: UICollectionView, cellForItemAt indexPath: IndexPath) -> UICollectionViewCell {
        let cell = collectionView.dequeueReusableCell(withReuseIdentifier: cellID, for: indexPath) as! ItemCell
        cell.item = item[indexPath.item]
        return cell
    }
    
    //sizeForItemAt
    func collectionView(_ collectionView: UICollectionView, layout collectionViewLayout: UICollectionViewLayout, sizeForItemAt indexPath: IndexPath) -> CGSize {
                
        let dummyCell = ItemCell(frame: .init(x: 0, y: 0, width: view.frame.width, height: 1000))

        dummyCell.item = self.item[indexPath.item]
        dummyCell.layoutIfNeeded()

        let estimatedSize = dummyCell.systemLayoutSizeFitting(.init(width: view.frame.width, height: 1000))
        
        return .init(width: view.frame.width, height: estimatedSize.height)
    }
    
    //insetForSectionAt
    func collectionView(_ collectionView: UICollectionView, layout collectionViewLayout: UICollectionViewLayout, insetForSectionAt section: Int) -> UIEdgeInsets {
        return .init(top: 16, left: 0, bottom: 16, right: 0)
    }
    
    //minimumLineSpacingForSectionAt
    func collectionView(_ collectionView: UICollectionView, layout collectionViewLayout: UICollectionViewLayout, minimumLineSpacingForSectionAt section: Int) -> CGFloat {
        return 0
    }
}

