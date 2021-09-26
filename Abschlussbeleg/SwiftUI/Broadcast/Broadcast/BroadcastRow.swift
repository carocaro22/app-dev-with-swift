//
//  BroadcastRow.swift
//  Broadcast
//
//  Created by Med Mohanna on 24.05.21.
//

import SwiftUI


struct BroadcastRow: View {
    
    var broadcast: ProgramItem
    
    var body: some View {
        VStack {
            Image(uiImage: UIImage(data: broadcast.myImage(iconUrlString: broadcast.iconURL!))!)
                .resizable()
                .aspectRatio(contentMode: .fit)
                .scaledToFit()
            Text(broadcast.title!)
                .font(.headline)
                .frame(maxWidth: .infinity, alignment: .leading)
                .padding(3)
            Text(broadcast.subtitle!)
                .font(.subheadline)
                .frame(maxWidth: .infinity, alignment: .leading)
                .padding(3)
            Text(broadcast.description!)
                .font(.body)
                .frame(maxWidth: .infinity, alignment: .leading)
                .padding(3)
            Text(broadcast.details!)
                .font(.body)
                .frame(maxWidth: .infinity, alignment: .leading)
                .padding(3)
            
        }
    }
}

//struct BroadcastRow_Previews: PreviewProvider {
//        static var previews: some View {
//        BroadcastRow()
//            .previewLayout(.sizeThatFits)
//            .padding()
//    }
//}
