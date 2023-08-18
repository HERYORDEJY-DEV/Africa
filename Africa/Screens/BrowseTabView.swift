//
//  BrowseTabView.swift
//  Africa
//
//  Created by  OYEBODE YUSUF AYODEJI on 8/10/23.
//

import SwiftUI

struct BrowseTabView: View {
	@State private var isListDisplay = true
	var coverImages: [BrowseTabCoverImageModel] = loadModelDataFile("covers.json")

	var body: some View {
		NavigationView {
			ScrollView {
				if isListDisplay {
					Divider().overlay(Color(hex: "#FFFFFF", alpha: 0.5))
					TabView {
						ForEach(0 ..< coverImages.count, id: \.self) { index in
							let image = coverImages[index].name
							BrowseTabCoverView(image: image)
						}
					}.frame(height: 300)
//						.listRowInsets(EdgeInsets(top: 0, leading: 0, bottom: 0, trailing: 0))
						.tabViewStyle(PageTabViewStyle())

					Spacer(minLength: 20)

					BrowseTabListView()
				} else {
					BrowseTabGridView()
				}
			}.scrollIndicators(.hidden)
				.navigationBarTitle("Africa", displayMode: .large)
				.toolbar {
					Image(systemName: "list.bullet")
						.onTapGesture {
							isListDisplay = true
						}
						.foregroundColor(isListDisplay ? Color.accentColor : nil)
					Image(systemName: "square.grid.2x2")
						.onTapGesture {
							isListDisplay = false
						}
						.foregroundColor(!isListDisplay ? Color.accentColor : nil)
				}
		}
	}
}

struct BrowseTabView_Previews: PreviewProvider {
	static var previews: some View {
		BrowseTabView()
	}
}
