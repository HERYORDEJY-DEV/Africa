//
//  BrowseAnimalDetailsView.swift
//  Africa
//
//  Created by  OYEBODE YUSUF AYODEJI on 8/10/23.
//

import SwiftUI

struct BrowseAnimalDetailsView: View {
	var animal: BrowseTabAnimalModel
	
	var body: some View {
		NavigationStack {
			ScrollView {
				//				NavigationLink("Red", value: Color.red)
				//				NavigationLink("Green", value: Color.green)
				//				NavigationLink("Blue", value: Color.blue)
				
				Image("hero-\(animal.image)")
					.renderingMode(.original)
					.resizable()
					.scaledToFill()
					.frame(minWidth: 0, maxWidth: .infinity, minHeight: 0, maxHeight: 300)
				
				VStack {
					Text(animal.name)
						.font(.largeTitle)
						.fontWeight(.heavy)
						.textCase(.uppercase)
						.underline().padding(.bottom, 15)
					
					Text(animal.headline)
						.foregroundColor(.accentColor)
						.multilineTextAlignment(.leading)
					
				}.padding(.horizontal)
				
				HStack {
					Image(systemName: "photo.on.rectangle.angled")
						.foregroundColor(.accentColor)
					Text("Wilderness in Pictures")
						.font(.title3)
						.fontWeight(.bold)
				}.padding()
				
				ScrollView(.horizontal, showsIndicators: false) {
					HStack(spacing: 20) {
						ForEach(0 ..< animal.gallery.count, id: \.self) { index in
							Image(animal.gallery[index])
								.renderingMode(.original)
								.resizable()
								.scaledToFit()
								.frame(minWidth: 0, maxWidth: 510, minHeight: 0, maxHeight: 215)
								.clipShape(RoundedRectangle(cornerRadius: 8))
						}
					}.padding(.leading)
				}.padding(.vertical)
			}
			.navigationDestination(for: Color.self) { color in
				color
			}
			.navigationTitle("Learn about \(animal.name)")
			.navigationBarTitleDisplayMode(.inline)
		}
	}
}

struct BrowseAnimalDetailsView_Previews: PreviewProvider {
	static var previews: some View {
		BrowseAnimalDetailsView(animal: loadedAnimalsData[2])
	}
}
