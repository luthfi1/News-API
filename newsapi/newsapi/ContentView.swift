//
//  ContentView.swift
//  newsapi
//
//  Created by muhammad luthfi farizqi on 05/02/21.
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

struct ContentView_Previews: PreviewProvider {
    static var previews: some View {
        ContentView()
    }
}

struct Home: View{
    
    @ObservedObject var Books = NewsApi()
    var body: some View{
        List(Books.data){i in
            HStack{
                if i.image != ""{
                    WebImage(url: URL(string: i.image)!)
                        
                        .resizable()
                        .scaledToFit()
                        .frame(width:120,height:70)
                        .background(Image("s2").resizable()
                                        .aspectRatio(contentMode: .fill).frame(width: 60, height: 30))
                        .cornerRadius(10)
                }else{
                    Image("s2").resizable().frame(width: 120, height: 170).cornerRadius(10)
                }
                VStack(alignment: .leading, spacing: 10){
                    Text(i.title).fontWeight(.bold)
                    Text(i.description).font(.caption).lineLimit(4).multilineTextAlignment(.leading)
                }
            }
        }
    }    
}
