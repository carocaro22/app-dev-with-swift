//
//  ModelData.swift
//  Broadcast
//
//  Created by Med Mohanna on 24.05.21.
//

import UIKit



class downloadProgram: ObservableObject {
    
    var programArray:[Any]? = nil
    var url: String = ""
    @Published var programItems = Array<ProgramItem>()
    
    init(programURL:String?) {
        if let programURL = programURL {
            url = programURL
        }
    }
    
    func loadProgram() -> Void {
        let downloadTask = URLSession.shared.downloadTask(with: URL.init(string: url)!) { (location, response, error) in
            if let data = try? Data.init(contentsOf: location!) {
                if let programDictionary = try? JSONSerialization.jsonObject(with: data, options: JSONSerialization.ReadingOptions.allowFragments) as? [String:Any] {
                    if let forecast = programDictionary["events"] as? [String:Any] {
                        self.programArray = forecast["knftv"] as? [Any]
                    }
                }
                if self.programArray != nil {
                    for program in self.programArray! {
                        let item = ProgramItem.init(programDictionary: program as! [String:Any])
                        DispatchQueue.main.async {
                            self.programItems.append(item)
                        }
                    }
                }
            }
        }
        downloadTask.resume()
    }
}
