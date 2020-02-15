//
//  ContentView.swift
//  SwiftUI_QiitaClient
//
//  Created by 伊藤凌也 on 2020/02/12.
//  Copyright © 2020 ry-itto. All rights reserved.
//

import SwiftUI

struct ContentView: View {
    @ObservedObject var viewModel: ContentViewModel

    var body: some View {
        VStack {
            HStack {
                Image(systemName: "magnifyingglass")
                TextField("Query", text: $viewModel.query)
            }
            .padding()
            Divider()
            List(viewModel.articles) { article in
                ArticleRow(article: article)
            }
        }
    }
}

struct ContentView_Previews: PreviewProvider {
    static var previews: some View {
        ContentView(viewModel: .init())
    }
}
