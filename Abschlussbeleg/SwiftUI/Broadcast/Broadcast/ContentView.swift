//
//  ContentView.swift
//  Broadcast
//
//  Created by Med Mohanna on 24.05.21.
//

import SwiftUI

struct ContentView: View {
    
    @ObservedObject var programDownloader: downloadProgram
    
    init() {
        
    let programURL = "https://www.staff.hs-mittweida.de/~rthomane/grdl_iphone/knftv/broadcasts.php"
        programDownloader = downloadProgram(programURL: programURL)
        programDownloader.loadProgram()
    }
    
    
    
    var body: some View {
        
        VStack {
            Text("Kodinerds freeTV Announcement Service")
                .font(.title2)
                .frame(maxWidth: .infinity, alignment: .leading)
        
        
            List(){
                ForEach(self.programDownloader.programItems){ item in
                    BroadcastRow(broadcast: item)
                        .listRowInsets(.init())
                        .padding(.bottom, 5)
                }
            }
        }
    }
}

struct ContentView_Previews: PreviewProvider {
    static var previews: some View {
        ContentView()
    }
}
