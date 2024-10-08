//
//  NewsModels.swift
//  LoadImageJSON
//
//  Created by mac on 10/3/24.
//

import Foundation
import Combine
import SwiftyJSON

class NewsModels: ObservableObject {
    @Published var data: [News] = []
    init() {
        let url = "https://newsapi.org/v2/top-headlines?country=us&category=science&apiKey=f348084109d24d00b6107310cbc03e7c"
        
        let session = URLSession(configuration: .default)
        session.dataTask(with: URL(string: url)!) { (data, _, err) in
            if err != nil {
                print((err?.localizedDescription)!)
                return
            }
            let json = try! JSON(data:data!)
            let items = json["articles"].array!
            for i in items {
                let title = i["title"].stringValue
                let description = i["description"].stringValue
                let imageUrl = i["urlToImage"].stringValue
                
                DispatchQueue.main.async {
                    self.data.append(News(title: title, description: description, image: imageUrl))
                }
            }
        }.resume()
    }
}
