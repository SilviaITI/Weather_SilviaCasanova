//
//  MonumentsView.swift
//  WeatherApp
//
//  Created by Silvia Casanova Martinez on 19/10/24.
//

import SwiftUI
import MapKit

struct MonumentsView: View {
    @State private var region = MKCoordinateRegion(
        center: CLLocationCoordinate2D(latitude: 37.7749, longitude: -122.4194),
        span: MKCoordinateSpan(latitudeDelta: 0.05, longitudeDelta: 0.05)
    )

    var body: some View {
        VStack{
           
                Map(coordinateRegion: $region)
                    .edgesIgnoringSafeArea(.all)
                    .frame(width: 300, height: 200)
            
        }
    }
}

#Preview {
    MonumentsView()
}
