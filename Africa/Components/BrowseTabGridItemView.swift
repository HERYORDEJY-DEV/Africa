//
//  BrowseTabGridItemView.swift
//  Africa
//
//  Created by  OYEBODE YUSUF AYODEJI on 8/10/23.
//

import SwiftUI

struct BrowseTabGridItemView: View {
	var animal: BrowseTabAnimalModel?
	var body: some View {
		VStack {
			Image("hero-\(animal?.image ?? "lion")")
				.renderingMode(.original)
				.resizable()
				.scaledToFill()
				.frame(minWidth: 0, maxWidth: .infinity, minHeight: 50).cornerRadius(12)
				.clipped()
		}
	}
}

struct BrowseTabGridItemView_Previews: PreviewProvider {
	static var previews: some View {
		BrowseTabGridItemView()
	}
}
