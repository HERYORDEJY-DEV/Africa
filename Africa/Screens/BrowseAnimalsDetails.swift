//
//  BrowseAnimalsDetails.swift
//  Africa
//
//  Created by  OYEBODE YUSUF AYODEJI on 8/13/23.
//

import MapKit
import SwiftUI

struct TextThatFits: View {
	var body: some View {
		ViewThatFits(in: .horizontal) {
			Text("Very Very long text")
				.frame(minWidth: 300)
			Text("Medium text")
				.frame(minWidth: 100)
			Text("Short")
				.frame(minWidth: 20)
		}
	}
}

struct BrowseAnimalsDetails: View {
	var animal: BrowseTabAnimalModel
	@State private var region: MKCoordinateRegion = .init(center: CLLocationCoordinate2D(latitude: 40.75773, longitude: -73.985708), span: MKCoordinateSpan(latitudeDelta: 60.0, longitudeDelta: 60.0))

	var body: some View {
//		NavigationStack {
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
					.multilineTextAlignment(.center)
					.padding(.bottom, 15)
					.background(
						Color.accentColor
							.frame(height: 6)
							.offset(y: 12)
					)

				Text(animal.headline)
					.foregroundColor(.accentColor)
					.multilineTextAlignment(.leading)

			}.padding(.horizontal)

//				Gallery
			Group {
				HStack {
					Image(systemName: "photo.on.rectangle.angled")
						.foregroundColor(.accentColor)
					Text("Wilderness in Pictures")
						.font(.title3)
						.fontWeight(.bold)
				}.padding()

				ScrollView(.horizontal, showsIndicators: false) {
					HStack(spacing: 15) {
						ForEach(0 ..< animal.gallery.count, id: \.self) { index in
							Image(animal.gallery[index])
								.renderingMode(.original)
								.resizable()
								.scaledToFit()
								.frame(minWidth: 0, maxWidth: 400, minHeight: 0, maxHeight: 220)
								.clipShape(RoundedRectangle(cornerRadius: 8))
						}
					}.padding(.leading)
				}.padding(.vertical)
			}

//				Facts
			Group {
				HStack {
					Image(systemName: "questionmark.circle")
						.foregroundColor(.accentColor)
					Text("Did you know?")
						.font(.title3)
						.fontWeight(.bold)
				}.padding()
				GroupBox {
					TabView {
						ForEach(0 ..< animal.fact.count, id: \.self) { index in
							VStack {
								Text(animal.fact[index])
									.multilineTextAlignment(.center)
							}
						}
					}
					.tabViewStyle(PageTabViewStyle())
					.frame(minHeight: 148, idealHeight: 168, maxHeight: 180)
				}.padding(.horizontal)
			}

//			Description
			Group {
				HStack {
					Image(systemName: "info.circle")
						.foregroundColor(.accentColor)
					Text("All about \(animal.name)")
						.font(.title3)
						.fontWeight(.bold)
				}.padding()
				VStack {
//					Text(animal.description)
				}.padding(.horizontal)
			}

//			Map
			Group {
				HStack {
					Image(systemName: "map")
						.foregroundColor(.accentColor)
					Text("National Parks")
						.font(.title3)
						.fontWeight(.bold)
				}.padding()
				VStack {
					Map(coordinateRegion: $region)
						.overlay(
							HStack {
								Image(systemName: "mappin.circle")
								Text("Locations")
									.foregroundColor(.accentColor)
									.fontWeight(.bold)
							}
							.padding()
							.background(Color(hex: "#00000050"))
							.cornerRadius(8)
							.padding(),
							alignment: .topTrailing
//							.position(x: 0, y: 0)
						)
				}.frame(minWidth: 350, maxWidth: 400, minHeight: 250, maxHeight: 300)
					.cornerRadius(12)
					.padding(.horizontal)
			}

//			Learn More
			Group {
				HStack {
					Image(systemName: "books.vertical")
						.foregroundColor(.accentColor)
					Text("Learn More")
						.font(.title3)
						.fontWeight(.bold)
				}.padding()
				GroupBox {
					Link(destination: URL(string: animal.link)!) {
						HStack {
							HStack {
								Image(systemName: "globe")
								Text("Wikipedia")
							}.foregroundColor(Color.white)
							Spacer()
							HStack {
								Image(systemName: "arrow.up.right.square")
									.foregroundColor(.accentColor)
								Text(animal.name)
									.foregroundColor(.accentColor)
							}
						}
					}
				}.padding(.horizontal)
			}

		}.scrollIndicators(.hidden)
			.navigationDestination(for: Color.self) { color in
				color
			}
			.navigationTitle("Learn about \(animal.name)")
			.navigationBarTitleDisplayMode(.inline)
//		}
	}
}

struct BrowseAnimalsDetails_Previews: PreviewProvider {
	static var previews: some View {
		BrowseAnimalsDetails(animal: loadedAnimalsData[2])
	}
}
