//
//  VideoPlayerHelper.swift
//  Africa
//
//  Created by  OYEBODE YUSUF AYODEJI on 8/18/23.
//

import AVKit
import Foundation

var avPlayer: AVPlayer?

func autoPlayVideo(fileName: String, fileExtension: String) -> AVPlayer {
	if Bundle.main.url(forResource: fileName, withExtension: fileExtension) != nil {
		avPlayer = AVPlayer(url: Bundle.main.url(forResource: fileName, withExtension: fileExtension)!)

		avPlayer?.play()
	}

	return avPlayer!
}
