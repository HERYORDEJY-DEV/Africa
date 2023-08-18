//
//  BrowseTabCoverView.swift
//  Africa
//
//  Created by  OYEBODE YUSUF AYODEJI on 8/10/23.
//

import SwiftUI

struct BrowseTabCoverView: View {
	var image: String
	var body: some View {
		ZStack {
			Image(image)
				.renderingMode(.original)
				.resizable()
				.scaledToFill()
		}.background(Color(hex: "43eed3"))
	}
}

struct BrowseTabCoverView_Previews: PreviewProvider {
	static var previews: some View {
		BrowseTabCoverView(image: "cover-lion")
		.previewLayout(.fixed(width: 400, height: 300))
		
	}
}
