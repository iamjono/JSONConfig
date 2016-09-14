//
//  JSONConfig.swift
//
//  Created by Jonathan Guthrie on 2016-09-14.
//
//

import Foundation
import PerfectLib

public struct JSONConfig {

	public enum ConfigError: Error {
		case FileNotWritten
		case FileDoesNotExist
	}

	let name:String

	public init?(name:String) {

		self.name = name

		let thisFile = File(name)
		if thisFile.exists == false {
			print("Settings file does not exist")
		}
	}

	public func getValues() -> NSDictionary?{
		let thisFile = File(name)
		do {
			try thisFile.open(.read, permissions: .readUser)
			defer { thisFile.close() }
			let txt = try thisFile.readString()
			let dict = try txt.jsonDecode() as! NSDictionary
			return dict
		} catch {
			print(error)
			return .none
		}
	}
	// TODO
//	public func addValues(dictionary:NSDictionary) throws {
//		let thisFile = File(name)
//
//		if thisFile.exists {
//			if !dictionary.write(toFile: thisFile.realPath, atomically: false) {
//				print("File not written successfully")
//				throw ConfigError.FileNotWritten
//			}
//		} else {
//			throw ConfigError.FileDoesNotExist
//		}
//	}
}
