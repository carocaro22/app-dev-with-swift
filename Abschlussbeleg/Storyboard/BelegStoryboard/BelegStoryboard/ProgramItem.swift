//
//  ProgramItem.swift
//  BelegStoryboard
//
//  Created by Med Mohanna on 25.05.21.
//

import Foundation

var savePath: URL?

struct ProgramItem: Codable {
    var title: String?
    var subtitle: String?
    var description: String?
    var details: String?
    var iconURL: String?
    
    
    init(programDictionary program: [String:Any]) {
        
        var date: String
        
        if let uTime = program["uTime"] as? String {
            let unixTime = Double(uTime)!
            let currentDate = Date.init(timeIntervalSince1970: unixTime)
            let dateFormatter = DateFormatter()
            dateFormatter.locale = Locale(identifier: "de_DE")
            dateFormatter.dateFormat = "EEE dd.MM.yyyy hh:mm"
            date = dateFormatter.string(from: currentDate)
            
        }else{
            return
        }
        
        guard let channelName = program["ChannelName"] as? String,
              let title = program["Title"] as? String,
              let runTime = program["RunTime"] as? String else {return}
              
        self.title = "\(String(describing: date)) auf \(channelName): \(String(describing: title)) (\(String(describing: runTime))min)"
        
        
        guard let description = program["Plot"] as? String else {return}
        let replace = description.replacingOccurrences(of: "  ", with: "\n")
        self.description = String(replace)
        
        guard let genre = program["Genre"] as? String,
              let nickname = program["Nickname"] as? String else {return}
        self.details = "IMDb: k.A. \nGenre: \(String(describing: genre)) \nEmpfohlen von: \(String(describing: nickname))"
        
        
        guard let broadcasts = program["Broadcasts"] as? [String:Any] else {return}
        
        if let broadcastTime = broadcasts["Broadcast"] as? [String] {
            self.subtitle = "weitere Sendetermine: " + broadcastTime.joined(separator: ", ")
        }
        else if let broadcastTime = broadcasts["Broadcast"] as? String {
            print(broadcastTime)
            self.subtitle = "weitere Sendetermine: " + broadcastTime
        }

        guard let iconUrlString = program["Icon"] as? String else {return}
        self.iconURL = iconUrlString
        
    }
}
