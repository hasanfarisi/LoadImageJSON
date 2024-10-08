//
//  ContentView.swift
//  LoadImageJSON
//
//  Created by mac on 10/3/24.
//

import SwiftUI
import SDWebImageSwiftUI

struct ContentView: View {
    var body: some View {
        NavigationView{
            Home()
                .navigationBarTitle("News")
        }
    }
}

struct Home:View {
    @ObservedObject var news = NewsModels()
    var body: some View {
        List(news.data){i in
            HStack{
                if i.image != ""{
                    WebImage(url: URL(string: i.image))
                        .resizable()
                        .scaledToFill()
                        .frame(width: 120, height: 170)
                        .background(Color.secondary)
                        .cornerRadius(10)
                }else{
                    Image("loader")
                        .resizable()
                        .frame(width: 120, height: 170)
                        .cornerRadius(10)
                }
                
                VStack(alignment: .leading, spacing: 10){
                    Text(i.title).fontWeight(.bold)
                    Text(i.description).font(.caption).lineLimit(4).multilineTextAlignment(.leading)
                }
            }
        }
    }
}

#Preview {
    ContentView()
}
