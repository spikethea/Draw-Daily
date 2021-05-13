//
//  TipsView.swift
//  Draw Daily
//
//  Created by New on 01/05/2021.
//

import Foundation
import SwiftUI



struct TipsView: View {
    
    
    // Customising the appearance of the Navigation Bar
    init() {
            UINavigationBar.appearance().backgroundColor = UIColor(red: 115 / 255, green: 93 / 255, blue: 120 / 255, alpha: 1)

            //Use this if NavigationBarTitle is with Large Font
            UINavigationBar.appearance().largeTitleTextAttributes = [.font : UIFont(name: "Georgia-Bold", size: 20)!]
        
        UINavigationBar.appearance().largeTitleTextAttributes = [.foregroundColor : UIColor.white]
    }
    
    let tips = Bundle.main.tipdecode("tips.json")
    
    @EnvironmentObject var settings: AppSettings
    
    var body: some View {
        NavigationView {
            List {
                HStack {
                    Spacer()
                    NavigationLink(destination: TipView(tip: tips[settings.tip])) {
                        Text("Tip of the Day: \(tips[settings.tip].typename)")
                    }
                    .padding(10)
                    Spacer()
                }.background(Color.newPrimaryColor)

                                    
                ForEach(tips, id: \.id, content: { tip in
                    NavigationLink(destination: TipView(tip: tips[tip.id])) {
                        Text(tip.typename)
                    }
                    .listRowBackground(Color.BackgroundColor)
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
