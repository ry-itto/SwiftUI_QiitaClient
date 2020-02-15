//
//  ArticleRow.swift
//  SwiftUI_QiitaClient
//
//  Created by 伊藤凌也 on 2020/02/15.
//  Copyright © 2020 ry-itto. All rights reserved.
//

import QiitaAPIKit
import SwiftUI

struct ArticleRow: View {

    let title: String
    let userId: String
    let day: Int
    let likesCount: Int

    var body: some View {
        VStack(alignment: .leading) {
            Text(title)
                .bold()
                .font(.headline)
            HStack {
                Text("by \(userId)")
                Text("\(day) days ago")
                Image(systemName: "hand.thumbsup.fill")
                Text("\(likesCount)")
                Spacer()
            }
            .font(.subheadline)
            .foregroundColor(.gray)
        }
        .padding()
    }

    init(article: Article.Response) {
        self.title = article.title
        self.userId = article.user.id
        self.day = Calendar.current.dateComponents([.day], from: article.createdAt, to: Date()).day ?? 0
        self.likesCount = article.likesCount
    }

    init(title: String, userId: String, day: Int, likesCount: Int) {
        self.title = title
        self.userId = userId
        self.day = day
        self.likesCount = likesCount
    }
}

struct ArticleRow_Previews: PreviewProvider {
    static var previews: some View {
        ArticleRow(title: "Example article", userId: "ry-itto", day: 1, likesCount: 100)
            .previewLayout(.sizeThatFits)
    }
}
