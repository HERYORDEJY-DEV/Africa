//
//  BrowseTabGridView.swift
//  Africa
//
//  Created by  OYEBODE YUSUF AYODEJI on 8/10/23.
//

import SwiftUI

struct BrowseTabGridView: View {
	var columns: [GridItem] = [GridItem(.flexible()), GridItem(.flexible())]
	var animalsData: [BrowseTabAnimalModel] = loadModelDataFile("animals.json")

	var body: some View {
		LazyVGrid(columns: columns, spacing: 10) {
			ForEach(0 ..< animalsData.count, id: \.self) { index in
				NavigationLink {
					BrowseAnimalsDetails(animal: animalsData[index])
				} label: {
					BrowseTabGridItemView(animal: animalsData[index])
				}
			}
		}
	}
}

struct BrowseTabGridView_Previews: PreviewProvider {
	static var previews: some View {
		BrowseTabGridView(columns: [GridItem(.flexible()), GridItem(.flexible())])
	}
}
