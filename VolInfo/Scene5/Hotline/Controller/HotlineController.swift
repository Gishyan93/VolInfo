//
//  HotLineController.swift
//  Volinfo
//
//  Created by Tigran Gishyan on 10/25/20.
//

import UIKit

class HotLineController: BaseListController, UICollectionViewDelegateFlowLayout {
    //
    //MARK: - Properties
    //
    private let cellID = "cellID"
    private let headerID = "headerID"
    
    private var hotline = [HotLine(purpose: "Զինծառայողների մասին ինֆորմացիա, հանգանակություններ կատարելու կարգը, կամավորագրում, հոգեբանական աջակցություն և այլն", contactnumber: "8501"), HotLine(purpose: "Զինծառայողների մասին ինֆորմացիա, հանգանակություններ կատարելու կարգը, կամավորագրում, հոգեբանական աջակցություն և այլն", contactnumber: "8503")]
    //
    //MARK: - Lifecycle methods
    //
    override func viewDidLoad() {
        super.viewDidLoad()
        
        setupCollectionView()
    }
    //
    //MARK: - Functions
    //
    private func setupCollectionView() {
        collectionView.backgroundColor = .white
        collectionView.register(HotLineCell.self, forCellWithReuseIdentifier: cellID)
        collectionView.register(HotLineHeader.self, forSupplementaryViewOfKind: UICollectionView.elementKindSectionHeader, withReuseIdentifier: headerID)
    }
}
//
//MARK: - Protocol confirmations
//
extension HotLineController {
    //numberOfItemsInSection
    override func collectionView(_ collectionView: UICollectionView, numberOfItemsInSection section: Int) -> Int {
        return hotline.count
    }
    //cellForItemAt
    override func collectionView(_ collectionView: UICollectionView, cellForItemAt indexPath: IndexPath) -> UICollectionViewCell {
        let cell = collectionView.dequeueReusableCell(withReuseIdentifier: cellID, for: indexPath) as! HotLineCell
        cell.hotline = hotline[indexPath.item]
        return cell
    }
    
    //sizeForItemAt
    func collectionView(_ collectionView: UICollectionView, layout collectionViewLayout: UICollectionViewLayout, sizeForItemAt indexPath: IndexPath) -> CGSize {
                
        let dummyCell = HotLineCell(frame: .init(x: 0, y: 0, width: view.frame.width, height: 1000))

        dummyCell.hotline = hotline[indexPath.item]
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
    
    
    override func collectionView(_ collectionView: UICollectionView, viewForSupplementaryElementOfKind kind: String, at indexPath: IndexPath) -> UICollectionReusableView {
            
        guard let headerView = collectionView.dequeueReusableSupplementaryView(ofKind: UICollectionView.elementKindSectionHeader, withReuseIdentifier: headerID, for: indexPath) as? HotLineHeader else {fatalError("Dequeued unregistered reusable view")}
            
        return headerView
    }
    
    func collectionView(_ collectionView: UICollectionView, layout collectionViewLayout: UICollectionViewLayout, referenceSizeForHeaderInSection section: Int) -> CGSize {
        return .init(width: view.frame.width, height: 200)
    }
    
    //didSelectItemAt
    override func collectionView(_ collectionView: UICollectionView, didSelectItemAt indexPath: IndexPath) {

        guard let phone = hotline[indexPath.item].contactnumber else {return}
        guard let number = URL(string: "tel://" + "\(phone)") else { return }
        UIApplication.shared.open(number)
        UIApplication.shared.open(number, options: [:], completionHandler: nil)
        
    }
    
}
