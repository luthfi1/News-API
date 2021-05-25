//
//  NewsApi.swift
//  newsapi
//
//  Created by muhammad luthfi farizqi on 05/02/21.
//

//pengirim = ObservableObject
//penerima = ObservedObject

import Foundation
import Combine
import SwiftyJSON


class NewsApi: ObservableObject {
    @Published var data = [News]()
    
    init() {
        let url = "https://newsapi.org/v2/top-headlines?country=id&category=science&apiKey=afefeed8dea54a7d9bdf3263c0f3cb01"
        
        let session = URLSession(configuration: .default)
        
        session.dataTask(with: URL(string: url)!){ (data , _ , err)in
            if err != nil{
                print((err?.localizedDescription)!)
                return
            }
            let json = try! JSON(data: data!)
            let items = json["articles"].array!
            
            for i in items{
                let  title = i ["title"].stringValue
                let  description = i ["description"].stringValue
                let  imurl = i ["urlToImage"].stringValue
                
                DispatchQueue.main.async{  //(asyncrhonus : data nya berjalan di belakang aplikasi = background thread ,ui thread)
                    self.data.append(News(title: title, image: imurl, description: description))
                }
            }
        }.resume()
    }
}
