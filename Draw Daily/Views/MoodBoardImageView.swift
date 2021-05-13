//
//  MoodboardImageView.swift
//  Draw Daily
//
//  Created by New on 10/05/2021.
//

import Foundation
import SwiftUI
import SDWebImageSwiftUI

// This view (like ImageView, but adjusted for the different format of the moodboard) takes its parent, Image, and enlarges the photo/illustration to the whole page
struct MoodboardImageView: View {
    
    let result: Result
    let topic: String
    
    
    
    var body: some View {
        
        ZStack {
            Color.black
            VStack{
                WebImage(url: URL(string: result.urls.small))
                    .resizable()
                    //.aspectRatio(1, contentMode: .fit)
                Text(result.description ?? "No Description")
                    .padding(15)
                    .foregroundColor(Color.white)
                
            }
            .background(Color.black)
            .navigationTitle(topic)
        }
    }
}
