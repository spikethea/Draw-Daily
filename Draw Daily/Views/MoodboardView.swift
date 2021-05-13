//
//  MoodboardView.swift
//  Draw Daily
//
//  Created by New on 06/04/2021.
//

import SwiftUI
import UIKit
import SDWebImageSwiftUI

struct MoodboardView: View {
    
    @EnvironmentObject var settings: AppSettings
    @EnvironmentObject var searchObjectController: SearchObjectController
    
    var body: some View {
        VStack {
        
//        let columns = [
//            GridItem(.adaptive(minimum: 80)),
//            GridItem(.adaptive(minimum: 80))
//        ]
            if (settings.started) {
                Text("Mood Board: \(searchObjectController.searchText)")
                    .fontWeight(.bold)
                    .padding(6)
                List {
                    ForEach(searchObjectController.results, id: \.id, content: { result in
                        

                        NavigationLink(destination: MoodboardImageView(result: result, topic: searchObjectController.searchText)) {
                                WebImage(url: URL(string: result.urls.small) )
                                    .resizable()
                                    .frame(height:300)
                                    
                        }
                                
                                
                            })
                    
                    }.onAppear() {
                        searchObjectController.search()
                    }
            } else {
                Text("Choose a Topic on the Home Page to get started")
                    .fontWeight(.bold)
                    .padding(6)
            }
        
        
                
                
        }.navigationBarTitle("MoodBoard")
        
    }
            
        
}


struct MoodboardView_Previews: PreviewProvider {
    static var previews: some View {
        MoodboardView()
    }
}
