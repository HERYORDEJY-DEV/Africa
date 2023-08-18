//
//  MapAnnotationModel.swift
//  Africa
//
//  Created by  OYEBODE YUSUF AYODEJI on 8/18/23.
//

import SwiftUI

struct MapAnnotationView: View {
	var location: LocationModel = loadedLocationFile[5]

	@State private var animation = 0.0

	var body: some View {
		ZStack { 
			Circle()
				.fill(Color.accentColor)
				.frame(width: 45, height: 45)

			Circle()
				.stroke(Color.accentColor)
				.frame(width: 40, height: 40)
				.scaleEffect(1 + CGFloat(animation))
				.opacity(1-animation)

			Image(location.image)
				.renderingMode(.original)
				.resizable()
				.scaledToFit()
				.frame(width: 40, height: 40, alignment: .center)
				.clipShape(Circle())
		}.onAppear {
			withAnimation(Animation.easeOut(duration: 2.5).repeatForever(autoreverses: false)) {
				animation = 1
			}
		}
	}
}

struct MapAnnotationModel_Previews: PreviewProvider {
	static var previews: some View {
		MapAnnotationView()
	}
}
