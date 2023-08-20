//
//  BrowseTabView.swift
//  Africa
//
//  Created by  OYEBODE YUSUF AYODEJI on 8/10/23.
//

import SwiftUI

struct BrowseTabView: View {
	@State private var isListDisplay = true
	@State private var currentGridColumn = 2
	@State private var gridLayout = [GridItem(.flexible()), GridItem(.flexible())]
	var coverImages: [BrowseTabCoverImageModel] = loadModelDataFile("covers.json")

	func onSwitchToGrid() {
		var newGridColumn = currentGridColumn
		if !isListDisplay {
//			if currentGridColumn == 3 {
//				newGridColumn = 1
//			} else {
//				newGridColumn = currentGridColumn + 1
//			}
			newGridColumn = currentGridColumn % 3 + 1
			currentGridColumn = newGridColumn
			gridLayout = Array(repeating: .init(.flexible()), count: newGridColumn)
		} else {
			isListDisplay = false
		}
	}

	func onSwitchToListView() {
		isListDisplay = true
		currentGridColumn = 2
		gridLayout = Array(repeating: GridItem(.flexible()), count: 2)
	}

	func doSomething() {
		var iii = ["y"]
		iii = Array(repeating: .init("AA"), count: 3)

		print(iii)
	}

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
					BrowseTabGridView(columns: gridLayout)
				}
			}.scrollIndicators(.hidden)
				.navigationBarTitle("Africa", displayMode: .large)
				.toolbar {
					Image(systemName: "square.fill.text.grid.1x2")
						.onTapGesture {
							onSwitchToListView()
						}
						.foregroundColor(isListDisplay ? Color.accentColor : nil)
					Image(systemName: isListDisplay ? "square.grid.2x2" : currentGridColumn == 2 ? "square.grid.3x3" : currentGridColumn == 3 ? "rectangle.grid.1x2" : "square.grid.2x2")
						.onTapGesture {
//							onSwitchToGrid()
							doSomething()
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
