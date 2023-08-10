//
//  ContentView.swift
//  Africa
//
//  Created by  OYEBODE YUSUF AYODEJI on 8/10/23.
//

import SwiftUI

struct ContentView: View {
    var body: some View {
			TabView {
				BrowseTabView().tabItem {
					Image(systemName: "square.grid.2x2")
					Text("Browse")
				}
				WatchTabView().tabItem {
					Image(systemName: "play.rectangle")
					Text("Watch")
				}
				MapTabView().tabItem {
					Image(systemName: "map")
					Text("Map")
				}
				GalleryTabView().tabItem {
					Image(systemName: "photo")
					Text("Galley")
				}
			}
    }
}

struct ContentView_Previews: PreviewProvider {
    static var previews: some View {
        ContentView()
    }
}
