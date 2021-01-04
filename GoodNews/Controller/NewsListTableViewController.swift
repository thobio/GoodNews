//
//  NewsListTableViewController.swift
//  GoodNews
//
//  Created by Thobio Joseph on 04/01/21.
//

import UIKit


class NewsListTableViewController: UITableViewController {
    
    private var articleListVM:ArticleListViewModel!
    
    override func viewDidLoad() {
        super.viewDidLoad()
        setUp()
    }
    private func setUp(){
        navigationController?.navigationBar.prefersLargeTitles = true
        let url = URL(string: "http://newsapi.org/v2/top-headlines?sources=techcrunch&apiKey=801371d5f210447a80bc387b28938fb7")!
        WebServices().getArticles(url: url) { articles in
            
            guard let articleList = articles else{return}
            
            self.articleListVM = ArticleListViewModel(articles: articleList)
            
            DispatchQueue.main.async {
                self.tableView.reloadData()
            }
            
        }
    }
    override func numberOfSections(in tableView: UITableView) -> Int {
        return self.articleListVM == nil ? 0 :self.articleListVM.numberOfSections
    }
    override func tableView(_ tableView: UITableView, numberOfRowsInSection section: Int) -> Int {
        return self.articleListVM.numberOfRowsInSection(1)
    }
    override func tableView(_ tableView: UITableView, cellForRowAt indexPath: IndexPath) -> UITableViewCell {
        
        guard let cell = tableView.dequeueReusableCell(withIdentifier: "ArticleTableViewCell", for: indexPath) as? ArticleTableViewCell else{
            fatalError("ArticleTableViewCell not found")
        }
        
        let articleVM = self.articleListVM.articleAtIndex(indexPath.row)
        
        cell.titleLabel.text = articleVM.title
        cell.descriptionLabel.text = articleVM.description
        
        return cell
    }
}
