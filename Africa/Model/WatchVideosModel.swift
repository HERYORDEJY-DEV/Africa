//
//  WatchVideosModel.swift
//  Africa
//
//  Created by  OYEBODE YUSUF AYODEJI on 8/16/23.
//

import Foundation

struct WatchVideosModel: Codable, Identifiable {
	var id: String
	var name: String
	var headline: String

	var thumbnail: String {
		"video-\(id)"
	}
}

var loadedVideosFile: [WatchVideosModel] = loadModelDataFile("videos.json")
