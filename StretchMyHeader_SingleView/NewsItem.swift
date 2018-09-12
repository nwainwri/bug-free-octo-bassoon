//
//  NewsItem.swift
//  StretchMyHeader_SingleView
//
//  Created by Nathan Wainwright on 2018-09-11.
//  Copyright © 2018 Nathan Wainwright. All rights reserved.
//

import UIKit

class NewsItem: NSObject {
  
// World, Americas, Europe, Middle East, Africa and Asia Pacific.

//  enum Category {
//    case world red
//    case americas blue
//    case europe green
//    case middleEast yellow
//    case africa orange
//    case asiaPacific purple
//  }

  var category:String = ""
  var headline:String = ""
  
  func colour () -> UIColor {
    if self.category == "World" {
      return UIColor.red
    } else if category == "Americas" {
      return UIColor.blue
    } else if category == "Europe" {
      return UIColor.green
    } else if category == "Middle East" {
      return UIColor.yellow
    } else if category == "Africa" {
      return UIColor.orange
    } else if category == "Asia Pacific" {
      return UIColor.purple
    } else {
      return UIColor.gray
    }
  }
}


