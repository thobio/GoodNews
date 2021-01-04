//
//  WebServices.swift
//  GoodNews
//
//  Created by Thobio Joseph on 04/01/21.
//

import Foundation

class WebServices {
    func getArticles(url:URL,completion:@escaping([Article]?)->()){
        URLSession.shared.dataTask(with: url){ data,response,error in
            if let error = error {
                print(error.localizedDescription)
                completion(nil)
            }else if let data = data{
                let articleList = try? JSONDecoder().decode(ArticleList.self, from: data)
                print(articleList?.articles ?? 0)
                guard let articleLists = articleList else {
                    return
                }
                completion(articleLists.articles)
            }
        }.resume()
    }
}
