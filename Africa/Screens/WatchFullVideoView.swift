//
//  WatchFullVideoView.swift
//  Africa
//
//  Created by  OYEBODE YUSUF AYODEJI on 8/18/23.
//

import SwiftUI

struct WatchFullVideoView: View {
	var video: WatchVideosModel = loadedVideosFile[5]

	var body: some View {
		VStack {
			VideoPlayerView(video: video).overlay(
				VStack {
					Image("logo")
						.renderingMode(.original)
						.resizable()
						.scaledToFit()
						.frame(width: 40, height: 40)
						.padding(6)
				},
				alignment: .topLeading
			)
		}
		.accentColor(.accentColor)
		.navigationTitle(video.name)
		.navigationBarTitleDisplayMode(.inline)
	}
}

struct WatchFullVideoView_Previews: PreviewProvider {
	static var previews: some View {
		WatchFullVideoView()
	}
}
