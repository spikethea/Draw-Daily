//
//  ImageView.swift
//  Draw Daily
//
//  Created by New on 10/05/2021.
//

import Foundation
import SwiftUI

// This view takes its parent, Image, and enlarges the photo/illustration to the whole page
struct ImageView: View {
    
    let image: Data?
    let name: String
    let date: String
    
    var body: some View {
        
        ZStack {
            Color.black
            VStack{
                Text(date)
                    .foregroundColor(Color.white)
                Image(uiImage: UIImage(data: image!)!)
                    .resizable()
                    .aspectRatio(1, contentMode: .fit)
                Text(name)
                    .padding(15)
                    .foregroundColor(Color.white)
                
            }
            .background(Color.black)
            .navigationTitle(name)
        }
        
        
    }
}
