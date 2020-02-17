//
//  ContentViewModel.swift
//  SwiftUI_QiitaClient
//
//  Created by 伊藤凌也 on 2020/02/15.
//  Copyright © 2020 ry-itto. All rights reserved.
//

import Combine
import Foundation
import QiitaAPIKit

final class ContentViewModel: ObservableObject {
    private var cancellables: [AnyCancellable] = []

    // Input
    @Published var query: String = "" {
        willSet {
            querySubject.send(newValue)
        }
    }
    private let querySubject = PassthroughSubject<String, Error>()

    // Output
    @Published private(set) var articles: ArticleRequest.Response = []
    private let articleSubject = PassthroughSubject<ArticleRequest.Response, Error>()

    init() {
        querySubject
            .flatMap { ArticleRequest(requestQueryItem: .init(query: $0)).publisher }
            .subscribe(articleSubject)
            .store(in: &cancellables)

        articleSubject
            .replaceError(with: [])
            .receive(on: DispatchQueue.main)
            .assign(to: \.articles, on: self)
            .store(in: &cancellables)
    }
}
