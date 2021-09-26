//
//  BroadcastRowTemplate.swift
//  Broadcast
//
//  Created by Med Mohanna on 06.06.21.
//

import SwiftUI

struct BroadcastRowTemplate: View {
    var body: some View {
        VStack {
            Image("papillon")
                .resizable()
                .aspectRatio(contentMode: .fit)
                .scaledToFit()
            Text("So., 06.06.2021 22:15 auf arte HD: Papillon (140 min)")
                .font(.headline)
                .frame(maxWidth: .infinity, alignment: .leading)
                .padding(3)
            Text("weitere Sendetermine: 06.06.2021 20:15")
                .font(.subheadline)
                .frame(maxWidth: .infinity, alignment: .leading)
                .padding(3)
            Text("(US) 1973 \n Wegen Mordes an einem Zuhälter wird Henri Charrière alias Papillon zu lebenslanger Zwangsarbeit in der Strafkolonie Französisch-Guyana verurteilt. Henri trotzt den grauenhaften Umständen und schmiedet zusammen mit dem Mithäftling Dega einen gewagten Fluchtplan. Doch der erste Fluchversuch schlägt fehl und führt für Henri zu einem halben Jahr Dunkelhaft. Doch er und seine Fluchtpartner wollen nicht aufgeben und organiseren erneut ein Boot.")
                .font(.body)
                .frame(maxWidth: .infinity, alignment: .leading)
                .padding(3)
            Text("IMDb: k.A. \n Genre: Krimi / Thriller \n Empfohlen von: PvD")
                .font(.body)
                .frame(maxWidth: .infinity, alignment: .leading)
                .padding(3)
            
        }

    }
}

struct BroadcastRowTemplate_Previews: PreviewProvider {
    static var previews: some View {
        BroadcastRowTemplate()
            .previewLayout(.sizeThatFits)
            .padding()
    }
}
