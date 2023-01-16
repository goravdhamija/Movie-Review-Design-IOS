//
//  Utils.swift
//  Movie Review
//
//  Created by Globeways Technologies on 14/01/23.
//

import Foundation
import UIKit

class Utils: NSObject {
    
    
    static var favoriteMovies:[MovieData]! = [MovieData]()
    
    static var bookamarkedMoviesDict:[Int64:MovieData]! = [Int64:MovieData]()
    
    static func addFavoriteMovie(movieSelected : MovieData) {
        bookamarkedMoviesDict[movieSelected.id!] = movieSelected
         //   favoriteMovies.append(movieSelected)
    }
    
    static func removeFavoriteMovie(movieSelected : MovieData) {
        bookamarkedMoviesDict.removeValue(forKey: movieSelected.id!)
    }
    
    static func persistBookmarkMovies() {
        
        let encoder = JSONEncoder()
        if let encoded = try? encoder.encode(Array(Utils.bookamarkedMoviesDict.values)) {
            if let json = String(data: encoded, encoding: .utf8) {
                
                let filename = getDocumentsDirectory().appendingPathComponent("bookmarks.txt")
            //    print(json)
                do {
                    let fileManager = FileManager.default
                    let documentDirectoryPath = NSSearchPathForDirectoriesInDomains(.documentDirectory, .userDomainMask, true)[0] as NSString
                    let filePath = documentDirectoryPath.appendingPathComponent("bookmarks.txt")
                    if (checkIfFileExist(fileName: "bookmarks.txt")){
                        try fileManager.removeItem(atPath: filePath)
                    }
                    try json.write(to: filename, atomically: true, encoding: String.Encoding.utf8)
                    print("Success Persisting Data")
                } catch {
                    print("Failed Persisting Data")
                    // failed to write file – bad permissions, bad filename, missing permissions, or more likely it can't be converted to the encoding
                }
                
            }

        }
        
    }
    
    
    
    static func readPersistedBookmarkMovies() {
        
        if (checkIfFileExist(fileName: "bookmarks.txt")){
            let filename = getDocumentsDirectory().appendingPathComponent("bookmarks.txt")
            var inString = try! String(contentsOf: filename)
            let dataMovie = inString.data(using: .utf8)
            
            let decoder = JSONDecoder()
            if let decodedMovieData = try? decoder.decode([MovieData].self, from: dataMovie!) {
                
                bookamarkedMoviesDict.removeAll()
                for (index, mvData) in decodedMovieData.enumerated() {
                    
                    Utils.addFavoriteMovie(movieSelected: mvData)
                }
                
                
            }
            
        }
        
    }
    
    
    
   static func loadJson(fromURLString urlString: String,
                          completion: @escaping (Result<Data, Error>) -> Void) {
        if let url = URL(string: urlString) {
            let urlSession = URLSession(configuration: .default).dataTask(with: url) { (data, response, error) in
                if let error = error {
                    completion(.failure(error))
                }
                
                if let data = data {
                    completion(.success(data))
                }
            }
            
            urlSession.resume()
        }
    }
    
    
    
  static func parse(jsonData: Data) -> [MovieData] {
        var decodedData:[MovieData]! = [MovieData]()
        do {
            decodedData = try JSONDecoder().decode([MovieData].self, from: jsonData)
          
        } catch {
            print("decode error")
        }
        return decodedData
        
    }
    
    
    public static func insertDisplayableImageInImageView(remoteURLString: String! ,toFolder: String!, atImageView: UIImageView! , defaultIOSImage:String!){
        
        var documentsDirectoryURL:URL = FileManager.default.urls(for: .documentDirectory, in: .userDomainMask)[0]
        var reelsDirectoryURL:URL = documentsDirectoryURL.appendingPathComponent(toFolder)
        var reelsDirectoryPath:String = reelsDirectoryURL.path
        var fileManager = FileManager.default
        
        do {
            try fileManager.createDirectory(atPath: reelsDirectoryPath, withIntermediateDirectories: true, attributes: nil)
        } catch {
            print(error)
        }
        
        if remoteURLString != nil && URL(string : remoteURLString) != nil
        {
            
            var remoteURL:URL = URL(string : remoteURLString)!
            var localFileURL:URL = reelsDirectoryURL.appendingPathComponent(remoteURL.lastPathComponent)
            var localFilePath:String = localFileURL.path
            
            if fileManager.fileExists(atPath: localFilePath)
            {
                do {
                    atImageView.image = UIImage(data: try Data(contentsOf: localFileURL))
                }catch{
                    print(error)
                }
                
            } else {
                
                
                DispatchQueue.global().async {
                    do{
                        let data = try Data(contentsOf: remoteURL)
                        try data.write(to: localFileURL)
                        DispatchQueue.main.sync{
                            atImageView.image = UIImage(data: data)
                        }
                        
                    } catch {
                        print("Unable to Write Data to Disk (\(error))")
                        
                    }
                    
                }
                
                
                
            }
            
        }
        else
        {
            let proImageWt = UIImage.SymbolConfiguration(weight: .light)
            let profileImageDefault = UIImage(systemName: defaultIOSImage, withConfiguration: proImageWt)
            atImageView.tintColor = .lightGray
            atImageView.image = profileImageDefault
        }
        
        
        
        
    }
    
    
    static func convertDateFormatAString(stringDate:String) -> String{
        let formatter: DateFormatter = DateFormatter()
        formatter.dateFormat = "yyyy-MM-dd"
        let dateTime: Date = formatter.date(from: stringDate)!
        
        let formatter2: DateFormatter = DateFormatter()
        formatter2.dateFormat = "dd.MM.yyyy"
        let str = formatter2.string(from: dateTime)
        return str
    }
    
    static func checkIfFileExist(fileName: String) -> Bool {
        let path = NSSearchPathForDirectoriesInDomains(.documentDirectory, .userDomainMask, true)[0] as String
        let url = NSURL(fileURLWithPath: path)
        if let pathComponent = url.appendingPathComponent(fileName) {
            let filePath = pathComponent.path
            let fileManager = FileManager.default
            if fileManager.fileExists(atPath: filePath) {
                print("FILE AVAILABLE")
                return true
            } else {
                print("FILE NOT AVAILABLE")
                return false
            }
        } else {
            
            print("FILE PATH NOT AVAILABLE")
            return false
        }
        
    }
    static func getDocumentsDirectory() -> URL {
        let paths = FileManager.default.urls(for: .documentDirectory, in: .userDomainMask)
        return paths[0]
    }
    
    
}



//10000.asString(style: .positional)  // 2:46:40
//10000.asString(style: .abbreviated) // 2h 46m 40s
//10000.asString(style: .short)       // 2 hr, 46 min, 40 sec
//10000.asString(style: .full)        // 2 hours, 46 minutes, 40 seconds
//10000.asString(style: .spellOut)    // two hours, forty-six minutes, forty seconds
//10000.asString(style: .brief)       // 2hr 46min 40sec


extension Double {
  func asDurationString(style: DateComponentsFormatter.UnitsStyle) -> String {
    let formatter = DateComponentsFormatter()
    formatter.allowedUnits = [.hour, .minute, .second, .nanosecond]
    formatter.unitsStyle = style
    return formatter.string(from: self) ?? ""
  }
}

extension UIApplication {

    class func getTopViewController(base: UIViewController? = UIApplication.shared.keyWindow?.rootViewController) -> UIViewController? {

        if let nav = base as? UINavigationController {
            return getTopViewController(base: nav.visibleViewController)

        } else if let tab = base as? UITabBarController, let selected = tab.selectedViewController {
            return getTopViewController(base: selected)

        } else if let presented = base?.presentedViewController {
            return getTopViewController(base: presented)
        }
        return base
    }
}


class MyTapGesture: UITapGestureRecognizer {
    var selectedIndex = Int()
    var selectedIndexValue = String()
    var selectedObject : Any!
}


extension UISearchBar {

    // Due to searchTextField property who available iOS 13 only, extend this property for iOS 13 previous version compatibility
    var compatibleSearchTextField: UITextField {
        guard #available(iOS 13.0, *) else { return legacySearchField }
        return self.searchTextField
    }

    private var legacySearchField: UITextField {
        if let textField = self.subviews.first?.subviews.last as? UITextField {
            // Xcode 11 previous environment
            return textField
        } else if let textField = self.value(forKey: "searchField") as? UITextField {
            // Xcode 11 run in iOS 13 previous devices
            return textField
        } else {
            // exception condition or error handler in here
            return UITextField()
        }
    }
}
