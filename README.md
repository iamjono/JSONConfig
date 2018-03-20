# JSON Config

A Swift 3 JSON Config reader library. Reads JSON files for server side configuration.

JSON files can be used for maintaining system specific settings such as database names, credentials, api keys, access tokens.
It makes no sense to include these in compiled binaries as they will vary between development, staging and deployment environments, or between distributions.

### Setup

Include the JSON Config dependancy in your project's Package.swift file:

``` swift
 .Package(url: "https://github.com/iamjono/JSONConfig.git", majorVersion: 3)
```

After changing your Package.swift file, remember to rebuild your Xcode project:

```
swift package generate-xcodeproj
```

Open your project, and add a new JSON file, and add the property key-value pairs in the same way as is seen in the example 
[ApplicationConfiguration.json](https://github.com/iamjono/Swifty-pList/blob/master/ApplicationConfiguration.json).

In the "Build Phases" for your target binary, add a "Copy Files" phase if one does not already exist. 
Add your JSON file to the file list, with a destination of "Resources". 
When you build your project within Xcode this JSON file will be copied next to your executable binary.

### Example usage:

``` swift
// perhaps in main.swift
#if os(Linux)
	let FileRoot = "/home/ubuntu/settings/"
#else
	let FileRoot = ""
#endif

// wherever you like
func GetAPIKey() -> String {
	if let config = JSONConfig(name: "\(FileRoot)ApplicationConfiguration.json") {
		//2
		let dict = config.getValues()!
		let apiKey = dict["apikey"] as! String
		if apiKey.characters.count > 0 {
			return apiKey
		} else {
			print("No API Key")
		}
	} else {
		print("Unable to get Configuration")
	}
	return ""
}
```

For Linux usage, use a context switch for location, like:



