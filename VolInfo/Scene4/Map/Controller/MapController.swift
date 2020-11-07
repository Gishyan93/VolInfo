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
        
        mapViewSetup()
        setupArtwork()
    }
    
    
    //
    //MARK: - Functions
    //
    private func mapViewSetup() {
        view.addSubview(mapView)
        mapView.fillSuperview()
        
        mapView.delegate = self
    }
    
    private func setupArtwork() {
        let artwork = Map(title: "Արշակունյաց 8", fobjecttype: "+37494000000", coordinate: CLLocationCoordinate2D(latitude: 40.177497, longitude: 44.512777))
     
        mapView.addAnnotation(artwork)
    }
}

extension MapController: MKMapViewDelegate {
  
    func mapView(_ mapView: MKMapView, viewFor annotation: MKAnnotation) -> MKAnnotationView? {
  
   
        guard let annotation = annotation as? Map else {return nil}
  
   
        let identifier = "artwork"
 
        var view: MKMarkerAnnotationView
 
        if let dequeuedView = mapView.dequeueReusableAnnotationView(withIdentifier: identifier) as? MKMarkerAnnotationView {
   
            dequeuedView.annotation = annotation
   
            view = dequeuedView
  
        } else {
            view = MKMarkerAnnotationView(annotation: annotation,reuseIdentifier: identifier)
            view.canShowCallout = true
            view.calloutOffset = CGPoint(x: -5, y: 5)
            let button = UIButton(type: .detailDisclosure)
            view.rightCalloutAccessoryView = button
        }
        return view
  }
}

extension MKMapView {
  func centerToLocation(location: CLLocation, regionRadius: CLLocationDistance = 1000) {
    let coordinateRegion = MKCoordinateRegion(center: location.coordinate, latitudinalMeters: regionRadius, longitudinalMeters: regionRadius)
    setRegion(coordinateRegion, animated: true)
  }
}

