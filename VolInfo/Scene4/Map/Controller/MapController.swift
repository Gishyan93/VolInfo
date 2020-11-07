//
//  MapController.swift
//  Soldier
//
//  Created by Tigran Gishyan on 10/25/20.
//

import UIKit
import MapKit

class MapController: UIViewController {
    //
    //MARK: - Properties
    //
    override var preferredStatusBarStyle: UIStatusBarStyle {
        return .lightContent
    }
    //40.177497, 44.512777
    private let initialLocation = CLLocation(latitude: 40.177497, longitude: 44.512777)
    //
    //MARK: - Closures
    //
    private lazy var mapView: MKMapView = {
      let mapView = MKMapView()
      mapView.centerToLocation(location: initialLocation)
      return mapView
    }()
    //
    // MARK: - Lifecycle Methods
    //
    override func viewDidLoad() {
        super.viewDidLoad()
        
        view.addSubview(mapView)
        mapView.fillSuperview()
        
        mapView.delegate = self
        setupArtwork()
    }
    
    
    //
    //MARK: - Functions
    //
    private func setupArtwork() {
        //40.177497, 44.512777
        let artwork = Map(title: "Արշակունյաց 8", fobjecttype: "+37494000000", coordinate: CLLocationCoordinate2D(latitude: 40.177497, longitude: 44.512777))
      
      mapView.addAnnotation(artwork)
    }
}

extension MapController: MKMapViewDelegate {
  // 1
  func mapView(_ mapView: MKMapView, viewFor annotation: MKAnnotation) -> MKAnnotationView? {
  // 2
  guard let annotation = annotation as? Map else {return nil}
  // 3
  let identifier = "artwork"
  var view: MKMarkerAnnotationView
  // 4
  if let dequeuedView = mapView.dequeueReusableAnnotationView(withIdentifier: identifier) as? MKMarkerAnnotationView {
    dequeuedView.annotation = annotation
    view = dequeuedView
  } else {
    // 5
    view = MKMarkerAnnotationView(annotation: annotation,reuseIdentifier: identifier)
    view.canShowCallout = true
    view.calloutOffset = CGPoint(x: -5, y: 5)
    let button = UIButton(type: .detailDisclosure)
    //button.addTarget(self, action: #selector(handleDisclosure), for: .touchUpInside)
    view.rightCalloutAccessoryView = button
  
  }
    return view

  }
  
  func mapView(_ mapView: MKMapView, annotationView view: MKAnnotationView, calloutAccessoryControlTapped control: UIControl) {
    
    
    //let testController = Test2Controller()
    //self.navigationController?.pushViewController(testController, animated: false)

  }
  
}

extension MKMapView {
  func centerToLocation(location: CLLocation, regionRadius: CLLocationDistance = 1000) {
    let coordinateRegion = MKCoordinateRegion(center: location.coordinate, latitudinalMeters: regionRadius, longitudinalMeters: regionRadius)
    setRegion(coordinateRegion, animated: true)
  }
}

