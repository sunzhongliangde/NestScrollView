//
//  HomeViewController.swift
//  NestScrollView
//
//  Created by apple on 2023/7/12.
//

import UIKit

class HomeViewController: UIViewController, UITableViewDelegate, UITableViewDataSource {
    
    lazy var mainScroll: MainScrollView = {
        let scrollView = MainScrollView()
        scrollView.bounces = false
        scrollView.backgroundColor = .darkGray
        scrollView.contentInsetAdjustmentBehavior = .never
        return scrollView
    }()
    // banner image
    var bannerImage = UIImageView()
    // 子tableView
    lazy var tableView: UITableView = {
        let table = UITableView(frame: CGRect.zero, style: .plain)
        return table
    }()
    // 定义banner height
    let bannerHeight = 200.0

    override func viewDidLayoutSubviews() {
        super.viewDidLayoutSubviews()
        // scrollview
        self.mainScroll.frame = self.view.bounds
        self.mainScroll.contentSize = CGSize(width: self.view.bounds.size.width,
                                             height: self.view.bounds.size.height+bannerHeight)
        
        // banner image
        bannerImage.frame = CGRect(x: 0, y: 0, width: self.view.bounds.size.width, height: bannerHeight)
        // 子scrollView
        tableView.frame = CGRect(x: 0,
                                     y: bannerImage.frame.origin.y+bannerImage.frame.size.height,
                                     width: self.view.bounds.size.width,
                                     height: self.view.bounds.size.height)
    }
    
    override func viewDidLoad() {
        super.viewDidLoad()
        // Do any additional setup after loading the view.
        self.navigationItem.title = "scrollview"
        self.view.backgroundColor = UIColor.white
        
        self.view.addSubview(self.mainScroll)
        self.mainScroll.addSubview(self.tableView)
        
        bannerImage = UIImageView.init(image: UIImage(named: "banner_image"))
        bannerImage.contentMode = .scaleAspectFill
        self.mainScroll.addSubview(bannerImage)
        
        self.mainScroll.addSubview(self.tableView)
        self.tableView.delegate = self
        self.tableView.dataSource = self
        
    }
    
    func tableView(_ tableView: UITableView, numberOfRowsInSection section: Int) -> Int {
        return 100
    }
    
    func tableView(_ tableView: UITableView, cellForRowAt indexPath: IndexPath) -> UITableViewCell {
        var cell = tableView.dequeueReusableCell(withIdentifier: "tableview")
        if cell == nil {
            cell = UITableViewCell(style: .default, reuseIdentifier: "tableview")
        }
        cell?.textLabel?.text = "\(indexPath.row+1)"
        return cell!
    }
    
}

