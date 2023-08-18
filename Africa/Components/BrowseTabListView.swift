//
//  BrowseTabListView.swift
//  Africa
//
//  Created by  OYEBODE YUSUF AYODEJI on 8/10/23.
//

import SwiftUI

struct BrowseTabListView: View {
	var animalsData: [BrowseTabAnimalModel] = loadModelDataFile("animals.json")

	var body: some View {
//		VStack {

		ForEach(0 ..< animalsData.count, id: \.self) { index in
			VStack {
				if index != 0 {
					Divider().overlay(Color(hex: "#AAA"))
				} else {
					EmptyView()
				}
				BrowseTabListItemView(animal: animalsData[index])
			}
		}

//		}
	}
}

struct BrowseTabListView_Previews: PreviewProvider {
	static var previews: some View {
		BrowseTabListView()
	}
}
