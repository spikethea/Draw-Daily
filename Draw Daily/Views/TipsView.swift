//
//  TipsView.swift
//  Draw Daily
//
//  Created by New on 01/05/2021.
//

import Foundation
import SwiftUI



struct TipsView: View {
    
    let tips = Bundle.main.tipdecode("tips.json")
    
    var body: some View {
        NavigationView {
            List {
                HStack {
                    Spacer()
                    NavigationLink(destination: TipView(tip: tips[0])) {
                        Text("Tip of the Day: \(tips[0].typename)")
                    }
                    .padding(10)
                    Spacer()
                }.background(Color.newPrimaryColor)

                                    
                ForEach(tips, id: \.id, content: { tip in
                    NavigationLink(destination: TipView(tip: tips[tip.id])) {
                        Text(tip.typename)
                    }
                    .listRowBackground(Color.purple)
                    .cornerRadius(10)
                })
            }.navigationBarTitle("Tips")
            
            .foregroundColor(.white)
        }
        
        
    }
}

struct TipsView_Previews: PreviewProvider {
    static var previews: some View {
        TipsView()
    }
}
