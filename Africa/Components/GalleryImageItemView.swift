//
//  GalleryImageItemView.swift
//  Africa
//
//  Created by  OYEBODE YUSUF AYODEJI on 8/18/23.
//

import SwiftUI

struct GalleryImageItemView: View {
	var animal = loadedAnimalsData[Int.random(in: 0 ... loadedAnimalsData.count - 1)]
	var islarge = true

	var body: some View {
		Image("hero-\(animal.image)")
			.renderingMode(.original)
			.resizable()
			.scaledToFill()
			.frame(width: islarge ? 215 : 115, height: islarge ? 215 : 115, alignment: .center)
			.clipShape(Circle())
			.overlay(
				Circle()
					.stroke(Color.accentColor, lineWidth: islarge ? 15 : 7)
					.cornerRadius(100)
			)
	}
}

struct GalleryImageItemView_Previews: PreviewProvider {
	static var previews: some View {
		GalleryImageItemView()
	}
}
