//
//  AdmissionsController.swift
//  Soldier
//
//  Created by Tigran Gishyan on 10/25/20.
//

import UIKit

class AdmissionsController: BaseListController, UICollectionViewDelegateFlowLayout {

    //
    //MARK: - Properties
    //
    private let cellID = "cellID"
    
    private var admissions = [Admission]()
    //
    //MARK: - Lifecycle methods
    //
    override func viewDidLoad() {
        super.viewDidLoad()
        
            
        admissions.append(.init(address: "Արշակունյաց 40 Արշակունյաց 40 Արշակունյաց 40", contactnumber: "+37494000000"))
        admissions.append(.init(address: "Բզնունյաց 30", contactnumber: "+37494000000"))
        admissions.append(.init(address: "Ադոնցի 18", contactnumber: "+37494000000"))
        admissions.append(.init(address: "Մաշտոցի 7", contactnumber: "+37494000000"))
        setupCollectionView()
    }
    
    //
    //MARK: - Functions
    //
    private func setupCollectionView() {
        collectionView.backgroundColor = .white
        collectionView.register(AdmissionCell.self, forCellWithReuseIdentifier: cellID)
    }


}

//
//MARK: - UICollectionView DataSource DelegateFlowLayout & Delegate
//
extension AdmissionsController {
    //numberOfItemsInSection
    override func collectionView(_ collectionView: UICollectionView, numberOfItemsInSection section: Int) -> Int {
        return admissions.count
    }
    //cellForItemAt
    override func collectionView(_ collectionView: UICollectionView, cellForItemAt indexPath: IndexPath) -> UICollectionViewCell {
        let cell = collectionView.dequeueReusableCell(withReuseIdentifier: cellID, for: indexPath) as! AdmissionCell
        cell.admission = admissions[indexPath.item]
        return cell
    }
    
    //sizeForItemAt
    func collectionView(_ collectionView: UICollectionView, layout collectionViewLayout: UICollectionViewLayout, sizeForItemAt indexPath: IndexPath) -> CGSize {
                
        let dummyCell = AdmissionCell(frame: .init(x: 0, y: 0, width: view.frame.width, height: 1000))

        dummyCell.admission = self.admissions[indexPath.item]
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
        return 10
    }
    
    
    //didSelectItemAt
    override func collectionView(_ collectionView: UICollectionView, didSelectItemAt indexPath: IndexPath) {

        let mapController = MapController()
        
        
        self.navigationController?.pushViewController(mapController, animated: false)
    }
    
}

