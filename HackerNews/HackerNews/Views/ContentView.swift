//
//  ContentView.swift
//  HackerNews
//
//  Created by Igor on 29.06.2020.
//  Copyright © 2020 GsomGsom. All rights reserved.
//

import SwiftUI

struct ContentView: View {

    @ObservedObject var networkManager = NetworkManager()

    var body: some View {
        NavigationView {
            List(networkManager.posts) { post in
                NavigationLink(destination: DetailView(url: post.url)) {
                    HStack {
                        Text("\(post.points)")
                            .frame(width: 45)
                        Text("\(post.title)")
                    }
                }
            }
            .navigationBarTitle(Text("H4XOR NEWS"))
        }
        .onAppear {
            self.networkManager.fetchData()
        }
    }
}

struct ContentView_Previews: PreviewProvider {
    static var previews: some View {
        ContentView()
    }
}
