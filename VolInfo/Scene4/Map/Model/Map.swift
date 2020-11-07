//
//  Artwork.swift
//  Soldier
//
//  Created by Tigran Gishyan on 10/25/20.
//

import Foundation
import MapKit


class Map: NSObject, MKAnnotation {
  let title: String?
  //let fobjectname: String?
  let fobjecttype: String?
  let coordinate: CLLocationCoordinate2D

  init(title: String?, fobjecttype: String?, coordinate: CLLocationCoordinate2D) {
    self.title = title
    //self.fobjectname = fobjectname
    self.fobjecttype = fobjecttype
    self.coordinate = coordinate
    
    super.init()
  }
  
  var subtitle: String? {
    return fobjecttype
  }
}


