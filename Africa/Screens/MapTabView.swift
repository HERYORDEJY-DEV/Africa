//
//  MapTabView.swift
//  Africa
//
//  Created by  OYEBODE YUSUF AYODEJI on 8/10/23.
//

import MapKit
import SwiftUI

struct CoordinateReader: View {
	var longitude: Double = 0.000
	var latitude: Double = 0.000

	var body: some View {
		VStack {
			HStack {
				Image("compass")
					.renderingMode(.original)
					.resizable()
					.scaledToFit()
					.frame(width: 70, height: 70)
					.padding(.trailing, 10)

				VStack {
					HStack {
						Text("Longitude")
						Spacer()
						Text("\(longitude)")
							.foregroundColor(.accentColor)
					}
					Divider()
					HStack {
						Text("Latitude")
						Spacer()
						Text("\(latitude)")
							.foregroundColor(.accentColor)
					}
				}
			}
		}
		.padding()
		.background(
			Color.black
				.cornerRadius(10)
				.opacity(0.6)
		)
	}
}

struct MapTabView: View {
	@State var locations = loadedLocationFile

	@State private var region = MKCoordinateRegion(
		center: CLLocationCoordinate2D(
			latitude: 6.600286,
			longitude: 16.4377599
		),
		span: MKCoordinateSpan(
			latitudeDelta: 70,
			longitudeDelta: 70
		)
	)
	@State private var userTrackingMode: MapUserTrackingMode = .follow

	var body: some View {
		VStack {
			Map(coordinateRegion: $region, interactionModes: MapInteractionModes.all,
			    showsUserLocation: true,
			    userTrackingMode: $userTrackingMode, annotationItems: locations)
			{ location in
				MapAnnotation(coordinate: location.location) {
					MapAnnotationView(location: location)
				}
			}
			Button("zoom") {
				withAnimation {
					region.span = MKCoordinateSpan(
						latitudeDelta: 100,
						longitudeDelta: 100
					)
				}
			}
		}.overlay(
			CoordinateReader(longitude: region.center.longitude,
			                 latitude: region.center.latitude)
				.padding(),
			alignment: .top
		)
	}
}

struct MapTabView_Previews: PreviewProvider {
	static var previews: some View {
		MapTabView()
	}
}
