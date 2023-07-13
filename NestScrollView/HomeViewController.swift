//
//  HomeViewController.swift
//  NestScrollView
//
//  Created by apple on 2023/7/12.
//

import UIKit

class HomeViewController: UIViewController {
    
    lazy var mainScroll: UIScrollView = {
        let scrollView = UIScrollView()
        scrollView.backgroundColor = .darkGray
        return scrollView
    }()
    
    lazy var tableView: UITableView = {
        let table = UITableView(frame: CGRect.zero, style: .plain)
        return table
    }()

    override func viewDidLayoutSubviews() {
        super.viewDidLayoutSubviews()
        self.mainScroll.frame = self.view.bounds
    }

    override func viewDidLoad() {
        super.viewDidLoad()
        // Do any additional setup after loading the view.
        self.navigationItem.title = "scrollview"
        self.view.backgroundColor = UIColor.white
        
        self.view.addSubview(self.mainScroll)
        self.mainScroll.addSubview(self.tableView)
    }
}

