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

	public func getValues() -> Dictionary<String, Any>?{
		let thisFile = File(name)
		do {
			try thisFile.open(.read, permissions: .readUser)
			defer { thisFile.close() }
			let txt = try thisFile.readString()
			let dict = try txt.jsonDecode() as! Dictionary<String, Any>
			return dict
		} catch {
			print(error)
			return .none
		}
	}
}
