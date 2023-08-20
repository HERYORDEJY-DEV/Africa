//
//  GalleryTabView.swift
//  Africa
//
//  Created by  OYEBODE YUSUF AYODEJI on 8/10/23.
//

import SwiftUI

struct GalleryTabView: View {
	var animals = loadedAnimalsData
	@State private var slideValue = 2.0
	@State private var selected: BrowseTabAnimalModel = loadedAnimalsData[0]

	@State private var columns: [GridItem] = Array(repeating: GridItem(.flexible()), count: Int(2.0))

	let hapticImpact = UIImpactFeedbackGenerator(style: .medium)

	func gridSwitch() {
		columns = Array(repeating: .init(.flexible()), count: Int(slideValue))
	}

	var body: some View {
		ScrollView {
			VStack {
				GalleryImageItemView(animal: self.selected, islarge: true)
			}
			Slider(value: self.$slideValue, in: 2 ... 4, step: 1) { didChange in
				print("Did change: \(didChange)")
			}
			.onChange(of: slideValue) { newValue in
//				print("The new value is \(newValue)")
				columns = Array(repeating: GridItem(.flexible()), count: Int(newValue))
			}
			.padding()

			LazyVGrid(columns: columns, alignment: .center, spacing: 10) {
				ForEach(0 ..< self.animals.count, id: \.self) { index in
					let anim = self.animals[index]
					GalleryImageItemView(animal: anim, islarge: false)
						.onTapGesture {
							selected = anim
							hapticImpact.impactOccurred()
						}
				}
			}
		}
	}
}

struct GalleryTabView_Previews: PreviewProvider {
	static var previews: some View {
		GalleryTabView()
	}
}
