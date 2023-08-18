////
////  ModelData.swift
////  Africa
////
////  Created by  OYEBODE YUSUF AYODEJI on 8/10/23.
////
//
 import Foundation
//
func loadModelDataFile<T: Codable>(_ filename: String) -> T {
	let data: Data

	guard let file = Bundle.main.url(forResource: filename, withExtension: nil)
	else {
		fatalError("Couldn't find \(filename) in main bundle.")
	}

	do {
		data = try Data(contentsOf: file)
	} catch {
		fatalError("Couldn't load \(filename) from main bundle:\n\(error)")
	}

	do {
		let decoder = JSONDecoder()
		return try decoder.decode(T.self, from: data) 
	} catch {
		fatalError("Couldn't parse \(filename) as \(T.self):\n\(error)")
	}
}

//
// enum FileLoaderJson {
//	static func readLocalFile(_ filename: String) -> Data? {
//		guard let file = Bundle.main.path(forResource: filename, ofType: "json")
//		else {
//			fatalError("Unable to locate file \"\(filename)\" in main bundle.")
//		}
//
//		do {
//			return try String(contentsOfFile: file).data(using: .utf8)
//		} catch {
//			fatalError("Unable to load \"\(filename)\" from main bundle:\n\(error)")
//		}
//	}
// }
