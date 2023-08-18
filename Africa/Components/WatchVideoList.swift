//
//  WatchVideoList.swift
//  Africa
//
//  Created by  OYEBODE YUSUF AYODEJI on 8/16/23.
//

import SwiftUI

struct WatchVideoList: View {
	@State var videos: [WatchVideosModel] = loadModelDataFile("videos.json")

	let hapticsImpact = UIImpactFeedbackGenerator(style: .medium)

	var body: some View {
		List(0 ..< videos.count, id: \.self) { index in

			let video = videos[index]

			NavigationLink(destination: WatchFullVideoView(video: video)) {
				HStack {
					Image(video.thumbnail)
						.renderingMode(.original)
						.resizable()
						.scaledToFit()
						.frame(width: 100)
						.cornerRadius(8)
						.overlay {
							Image(systemName: "play.circle")
								.renderingMode(.original)
								.resizable()
								.scaledToFit()
								.frame(width: 30, height: 30)
						}

					VStack(alignment: .leading, spacing: 8) {
						Text(video.name)
							.font(.title2)
							.fontWeight(.heavy)
							.foregroundColor(.accentColor)
						Text(video.headline).font(.subheadline)
					}
				}
			}
		}.padding(.vertical, 8)
			.listStyle(InsetGroupedListStyle())
			.navigationBarTitle(Text("Videos")
				.foregroundColor(.accentColor))
//		.navigationBarItems(trailing: Image(systemName: "arrow.triangle.2.circlepath")
//			.foregroundColor(.accentColor))
			.navigationBarTitleDisplayMode(.inline)
			.toolbar {
				ToolbarItem(placement: .navigationBarTrailing) {
					Button {
						videos.shuffle()
						hapticsImpact.impactOccurred()
					} label: {
						Image(systemName: "arrow.triangle.2.circlepath")
							.foregroundColor(.accentColor)
					}
				}
			}
	}
//		List([1]) { _ in
}

struct WatchVideoList_Previews: PreviewProvider {
	static var previews: some View {
		WatchVideoList()
	}
}
