//
//  BrowseTabListItemView.swift
//  Africa
//
//  Created by  OYEBODE YUSUF AYODEJI on 8/10/23.
//

var animalsData: [BrowseTabAnimalModel] = loadModelDataFile("animals.json")

import SwiftUI

struct BrowseTabListItemView: View {
	var animal: BrowseTabAnimalModel

	var body: some View {
		NavigationLink {
			BrowseAnimalsDetails(animal: animal)
		} label: {
			HStack {
				Image("hero-\(animal.image)")
					.renderingMode(.original)
					.resizable()
					.scaledToFill()
					.frame(width: 100, height: 100)
					.clipShape(
						RoundedRectangle(cornerRadius: 12)
					)
//						.clipped()
//						.cornerRadius(12)
				VStack(alignment: .leading, spacing: 8) {
					Text(animal.name)
						.fontWeight(.heavy)
						.font(.title2)
						.foregroundColor(.accentColor)

					Text(animal.headline)
						.lineLimit(2)
						.font(.headline)
						.multilineTextAlignment(.leading)
						.foregroundColor(Color.primary)
						.padding(.trailing, 8)
				}
			}
		}
	}
}

struct BrowseTabListItemView_Previews: PreviewProvider {
	static var previews: some View {
		BrowseTabListItemView(animal: loadedAnimalsData[4])
			.previewLayout(.sizeThatFits)
	}
}
