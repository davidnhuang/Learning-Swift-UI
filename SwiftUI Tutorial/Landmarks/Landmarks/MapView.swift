//
//  MapView.swift
//  Landmarks
//
//  Created by David N. Huang on 9/2/20.
//  Copyright © 2020 David N. Huang. All rights reserved.
//

import SwiftUI
import MapKit

// Must use UIViewRepresentable instead of View for MapKit to work
struct MapView: UIViewRepresentable {
    
    // Step one to conform to UIViewRepresentable - create the makeUIView
    func makeUIView(context: Context) -> MKMapView {
        MKMapView(frame: .zero)
    }
    
    // Step two to update the ui view to changes
    func updateUIView(_ uiView: MKMapView, context: Context) {
        // Set up the MKMapView
        let coordinate = CLLocationCoordinate2D(latitude: 34.011286, longitude: -116.166868)
        let span = MKCoordinateSpan(latitudeDelta: 2.0, longitudeDelta: 2.0)
        let region = MKCoordinateRegion(center: coordinate, span: span)
        uiView.setRegion(region, animated: true)
    }
}

struct MapView_Previews: PreviewProvider {
    static var previews: some View {
        MapView()
    }
}
