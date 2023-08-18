//
//  LocationsModel.swift
//  Africa
//
//  Created by  OYEBODE YUSUF AYODEJI on 8/18/23.
//

import Foundation
import MapKit

struct LocationModel: Codable, Identifiable {
	var id: String
	var name: String
	var image: String
	var latitude: Double
	var longitude: Double

//	Computed Property
	var location: CLLocationCoordinate2D {
		CLLocationCoordinate2D(latitude: latitude, longitude: longitude)
	}
}

let loadedLocationFile: [LocationModel] = loadModelDataFile("locations.json")
