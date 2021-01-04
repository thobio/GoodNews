//
//  ArticleViewModel.swift
//  GoodNews
//
//  Created by Thobio Joseph on 04/01/21.
//

import Foundation

//MARK:- View Model for ArticleList

struct ArticleListViewModel {
    let articles:[Article]
}

// MARK:- Extension for TableView

extension ArticleListViewModel{
    
    var numberOfSections:Int{
        return 1
    }
    
    func numberOfRowsInSection(_ section:Int)-> Int{
        return self.articles.count
    }
    
    func articleAtIndex(_ index:Int)-> ArticleViewModel {
        let article = self.articles[index]
        return ArticleViewModel(article)
    }
    
}
//MARK:- View Model for Article

struct ArticleViewModel {
    private let article:Article
}

extension ArticleViewModel{
    init(_ article:Article) {
        self.article = article
    }
}

extension ArticleViewModel {
    var title:String {
        return self.article.title
    }
    var description:String {
        return self.article.description
    }
}
