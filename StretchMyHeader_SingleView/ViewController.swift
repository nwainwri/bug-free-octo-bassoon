//
//  ViewController.swift
//  StretchMyHeader_SingleView
//
//  Created by Nathan Wainwright on 2018-09-11.
//  Copyright © 2018 Nathan Wainwright. All rights reserved.
//
import UIKit

class ViewController: UIViewController, UITableViewDataSource, UITableViewDelegate , UIScrollViewDelegate{
  
  // MARK: vars and properties
  private let kTableHeaderHeight: CGFloat = 224.0
  private let kTableHeaderCutAway: CGFloat = 80.0
  
  var newsTopics = [NewsItem]()
  @IBOutlet weak var mainTableView: UITableView!
  @IBOutlet weak var headerDateLabel: UILabel!
  
  var headerView: UIView!
  var headerMaskLayer: CAShapeLayer!
  
  override func viewDidLoad() {
    super.viewDidLoad()
    // Do any additional setup after loading the view, typically from a nib.
    headerView = mainTableView.tableHeaderView
    mainTableView.tableHeaderView = nil
    
    mainTableView.addSubview(headerView)
    
    mainTableView.contentInset = UIEdgeInsets(top: kTableHeaderHeight, left: 0, bottom: 0, right: 0)
    mainTableView.contentOffset = CGPoint(x: 0, y: -kTableHeaderHeight)
    
    
    mainTableView.dataSource = self
    mainTableView.delegate = self
    mainTableView.estimatedRowHeight = 45
    mainTableView.rowHeight = UITableViewAutomaticDimension
    
    //header masking
    headerMaskLayer = CAShapeLayer()
    headerMaskLayer.fillColor = UIColor.black.cgColor
    headerView.layer.mask = headerMaskLayer
    
    
    let effectiveHeight = kTableHeaderHeight-kTableHeaderCutAway/2
    mainTableView.contentInset = UIEdgeInsets(top: effectiveHeight, left: 0, bottom: 0, right: 0)
    mainTableView.contentOffset = CGPoint(x: 0, y: -effectiveHeight)
    
    //todays date
    let todayDate = Date()
    let formatDate = DateFormatter()
    formatDate.dateFormat = "EEEE, MMM d, yyyy"
    let resultDate = formatDate.string(from: todayDate)
    headerDateLabel.text = resultDate
    
    newsTopics = [
      NewsItem(category: .World, headline: "Climate change protests, divestments meet fossil fuels realities"),
      NewsItem(category: .Europe, headline: "Scotland's 'Yes' leader says independence vote is 'once in a lifetime'"),
      NewsItem(category: .MiddleEast, headline: "Airstrikes boost Islamic State, FBI director warns more hostages possible"),
      NewsItem(category: .Africa, headline: "Nigeria says 70 dead in building collapse; questions S. Africa victim claim"),
      NewsItem(category: .AsiaPacific, headline: "Despite UN ruling, Japan seeks backing for whale hunting"),
      NewsItem(category: .Americas, headline: "Officials: FBI is tracking 100 Americans who fought alongside IS in Syria"),
      NewsItem(category: .World, headline: "South Africa in $40 billion deal for Russian nuclear reactors"),
      NewsItem(category: .Europe, headline: "'One million babies' created by EU student exchanges"),
      ]
    
  }
  
  override func viewDidAppear(_ animated: Bool) {
    updateHeaderView()
  }
  
  override func didReceiveMemoryWarning() {
    super.didReceiveMemoryWarning()
    // Dispose of any resources that can be recreated.
  }
  
  func tableView(_ tableView: UITableView, numberOfRowsInSection section: Int) -> Int {
    return newsTopics.count
  }

  func tableView(_ tableView: UITableView, cellForRowAt indexPath: IndexPath) -> UITableViewCell {
    let item = newsTopics[indexPath.row]
    let cell = mainTableView.dequeueReusableCell(withIdentifier: "stretchyCell", for: indexPath) as! MainViewTableViewCell
    cell.newsItem = item
    return cell //4.
  }
  
  override var prefersStatusBarHidden: Bool {
    return true
  }
  
  // MARK: for header
  func updateHeaderView() {
    let effectiveHeight = kTableHeaderHeight-kTableHeaderCutAway/2
    var headerRect = CGRect(x: 0, y: -effectiveHeight, width: mainTableView.bounds.width, height: kTableHeaderHeight)
    if mainTableView.contentOffset.y < -effectiveHeight {
      headerRect.origin.y = mainTableView.contentOffset.y
      headerRect.size.height = -mainTableView.contentOffset.y + kTableHeaderCutAway/2
    }
    headerView.frame = headerRect
    let path = UIBezierPath()
    path.move(to: CGPoint(x: 0, y: 0))
    path.addLine(to: CGPoint(x: headerRect.width, y: 0))
    path.addLine(to: CGPoint(x: headerRect.width, y: headerRect.height))
    path.addLine(to: CGPoint(x: 0, y: headerRect.height-kTableHeaderCutAway))
    headerMaskLayer?.path = path.cgPath
  }
  
  func scrollViewDidScroll(_ scrollView: UIScrollView) {
    updateHeaderView()
  }
}

