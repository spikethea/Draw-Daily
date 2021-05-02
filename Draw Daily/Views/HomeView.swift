//
//  Home.swift
//  Draw Daily
//
//  Created by New on 06/04/2021.
//

import SwiftUI
import UIKit
import SDWebImageSwiftUI

struct HomeView: View {
    
    @EnvironmentObject var searchObjectController: SearchObjectController
    
    
    
    var body: some View {
        
                    
        NavigationView {
                
                VStack {
                    HStack {
                        Text("todays topic: \(searchObjectController.searchText)")
                            .fontWeight(.bold)
                            .padding(6)
                            .foregroundColor(Color.purple)
                    Spacer()
                    NavigationLink(destination: CameraView()
                    ) {
                        
                        Label("Snap", systemImage: "camera")
                            .foregroundColor(Color.purple)
                            .padding(20)
                            
                    }
                    }.border(Color.purple, width: 2)
                    .padding(5)
                    .frame(maxWidth: .infinity)
                    
                    Text("Difficult: Intermediate")
                    if searchObjectController.results.indices.contains(0) {
                    NavigationLink(destination: GenerateView()) {
                        
                            WebImage(url: URL(string: searchObjectController.results[0].urls.small))
                                .resizable()
                                .scaledToFill()
                                    .frame(height: 100, alignment: .center)
                                    .clipped()
                                .cornerRadius(10)
                                .overlay(ImageOverlay(), alignment: .topLeading)
                    }.onAppear() {
                        searchObjectController.search()
                    }
                }
                        
                    
                    Spacer()
                }.navigationBarTitle("DrawDaily")
        }
    }
}

struct ImageOverlay: View {
    var body: some View {
        ZStack {
            Text("Topic For Today...")
                .font(.callout)
                .fontWeight(.bold)
                .padding(6)
                .foregroundColor(.white)
        }.background(Color.black)
        .opacity(0.8)
        .padding(6)
    }
}

struct HomeView_Previews: PreviewProvider {
    static var previews: some View {
        HomeView()
    }
}

