//
//  ViewController.swift
//  PodInstallationDemo
//
//  Created by Mac on 09/11/22.s
//

import UIKit
import GoogleMaps

class ViewController: UIViewController {
    
    @IBOutlet weak var mapView: GMSMapView!
    let marker = GMSMarker()
    override func viewDidLoad(){
        super.viewDidLoad()
        
        mapView.delegate = self
        mapView.mapType = GMSMapViewType.normal
        initializeMapSttings()
        
        addCameraSettingsOnMap()
        
        addMarkerOnMap(position: CLLocationCoordinate2D(latitude: 18.3663, longitude: 73.7559))
        
        drawPolygon()
        drawPolyLine()
        drawCircle()
}
    func initializeMapSttings(){
        mapView.settings.tiltGestures = true
        mapView.settings.myLocationButton = true
        mapView.settings.rotateGestures = true
        mapView.settings.zoomGestures = true
        mapView.settings.scrollGestures = true
        mapView.isMyLocationEnabled = true
    }
    
    func addCameraSettingsOnMap(){
        let camera = GMSCameraPosition(latitude: 18.3663, longitude: 73.7559, zoom: 4.0)
        mapView.camera = camera
    }
    
    func addMarkerOnMap(position : CLLocationCoordinate2D){
        
        marker.position = position
        marker.title = "Sinhgad Fort"
        marker.snippet = "This is a Fort!"
        marker.map = mapView
        marker.isDraggable = true
        marker.opacity = 0.7
        marker.rotation = 45.0
    }
    
}
extension ViewController : GMSMapViewDelegate{
    /*
    func mapView(_ mapView: GMSMapView, didTapInfoWindowOf marker: GMSMarker) {
        <#code#>
    }
    func mapView(_ mapView: GMSMapView, didLongPressInfoWindowOf marker: GMSMarker) {
        
    }
     
    
    func mapView(_ mapView: GMSMapView, didTapAt coordinate: CLLocationCoordinate2D) {
        <#code#>
    }
     
    func mapView(_ mapView: GMSMapView, didTap marker: GMSMarker) -> Bool {
        true
    }
    func mapView(_ mapView: GMSMapView, didTapAt coordinate: CLLocationCoordinate2D) {
        marker.position = coordinate
        print("\(coordinate)")
    }
     */
    func mapView(_ mapView: GMSMapView, didTapInfoWindowOf marker: GMSMarker) {
        print("Did Tap Marker Info Window Called\(marker.position)")
    }
    func mapView(_ mapView: GMSMapView, didLongPressInfoWindowOf marker: GMSMarker) {
        print("Did Long Press Info Window\(marker.position)")
    }
    
   
    func mapView(_ mapView: GMSMapView, markerInfoWindow marker: GMSMarker) -> UIView? {
        
        // marker.infoWindowAnchor = CGPoint(x: 18.3663, y: 73.7559)
        let view = UIView(frame: CGRect(x: 0, y: 0, width: 200, height: 100))
        
        view.backgroundColor = UIColor.purple
        view.alpha = 0.7
        view.layer.cornerRadius = 4
        
        let label = UILabel(frame: CGRect(x: 10, y: 10, width: 100, height: 30))
        label.text = "Sinhgad"
        label.textColor = .black
        label.textAlignment = .center
        label.backgroundColor = .blue
        label.alpha = 0.7
        
        view.addSubview(label)
    
        /*
        
        let label2 = UILabel(frame: CGRect(x: 10, y: 110, width: view.frame.width-15, height: 80))
        
        label2.text = "Bitcode"
        label2.textAlignment = .left
        label2.textColor = .white
        label2.backgroundColor = .green
        label2.alpha = 0.7
        
        view.addSubview(label2)
         */
        
        return view
        
        
    }
    /*
    
    func mapView(_ mapView: GMSMapView, markerInfoContents marker: GMSMarker) -> UIView? {
        <#code#>
    }
     */

    func mapView(_ mapView: GMSMapView, didBeginDragging marker: GMSMarker) {
        print("Begin Dragging Method Called -- \(marker.position)")
    }
    func mapView(_ mapView: GMSMapView, didDrag marker: GMSMarker) {
        print("Did Drag Method Called -- \(marker.position)")
    }
    func mapView(_ mapView: GMSMapView, didEndDragging marker: GMSMarker) {
        print("Did End Dragging Called -- \(marker.position)")
        
        }
         
    func drawPolygon(){
        let pathForPolygon = GMSMutablePath()
        pathForPolygon.add(CLLocationCoordinate2D(latitude: 22.97, longitude: 78.65))
        pathForPolygon.add(CLLocationCoordinate2D(latitude: 26.84, longitude: 80.94))
        pathForPolygon.add(CLLocationCoordinate2D(latitude: 23.61, longitude: 85.27))
        pathForPolygon.add(CLLocationCoordinate2D(latitude: 21.27, longitude: 81.86))
         
        let rect = GMSPolygon(path: pathForPolygon)
        
        rect.map = mapView
        rect.fillColor = .brown
        rect.strokeColor = .white
        rect.strokeWidth = 3
        rect.zIndex = 10
    }
    
    func drawCircle(){
        
        let circle = GMSCircle(position: CLLocationCoordinate2D(latitude: 18.3663, longitude: 73.7559), radius: 2500)
       // circle.fillColor = .purple
        circle.strokeColor = .white
        circle.strokeWidth = 5
        circle.map = mapView
        circle.zIndex = 1
        circle.fillColor = UIColor(displayP3Red: 0.35, green: 0, blue: 0, alpha: 0.5)
        
        }
    
    
    func drawPolyLine(){
        
        let pathForPolyLine = GMSMutablePath()
        pathForPolyLine.add(CLLocationCoordinate2D(latitude: 19.07, longitude: 72.87))
        pathForPolyLine.add(CLLocationCoordinate2D(latitude: 12.97, longitude: 77.59))
        pathForPolyLine.add(CLLocationCoordinate2D(latitude: 13.08, longitude: 80.27))
        pathForPolyLine.add(CLLocationCoordinate2D(latitude: 17.38, longitude: 78.48))
        pathForPolyLine.add(CLLocationCoordinate2D(latitude: 19.07, longitude: 72.87))
        
        let polyLineRectangle = GMSPolyline(path: pathForPolyLine)
        polyLineRectangle.strokeWidth = 3
        polyLineRectangle.strokeColor = .cyan
        polyLineRectangle.map = mapView
        polyLineRectangle.zIndex = 12
    }
}

