//
//  BrowseTabAnimalModel.swift
//  Africa
//
//  Created by  OYEBODE YUSUF AYODEJI on 8/10/23.
//

import Foundation

struct BrowseTabAnimalModel: Codable, Identifiable {
	var id: String
	var name: String
	var headline: String
	var description: String
	var link: String
	var image: String
	var gallery: [String]
	var fact: [String]
}

var loadedAnimalsData: [BrowseTabAnimalModel] = loadModelDataFile("animals.json")
