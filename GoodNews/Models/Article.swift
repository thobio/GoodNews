//
//  Article.swift
//  GoodNews
//
//  Created by Thobio Joseph on 04/01/21.
//

import Foundation

struct ArticleList:Decodable {
    let articles :[Article]
}
struct Article: Decodable {
    let title:String
    let description:String
}
