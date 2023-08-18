//
//  VideoPlayerView.swift
//  Africa
//
//  Created by  OYEBODE YUSUF AYODEJI on 8/18/23.
//

import AVKit
import SwiftUI

struct VideoPlayerView: View {
	var video: WatchVideosModel = loadedVideosFile[3]

	var body: some View {
		VideoPlayer(player: autoPlayVideo(fileName: video.id, fileExtension: "mp4"))
	}
}

struct VideoPlayerView_Previews: PreviewProvider {
	static var previews: some View {
		VideoPlayerView()
	}
}
