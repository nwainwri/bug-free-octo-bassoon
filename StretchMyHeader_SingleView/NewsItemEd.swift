//
//  NewsItemEd.swift
//  StretchMyHeader_SingleView
//
//  Created by Nathan Wainwright on 2018-09-11.
//  Copyright © 2018 Nathan Wainwright. All rights reserved.
//

import Foundation
import UIKit

struct NewsItemEd {
  
  enum NewsCategory {
    case World
    case Americas
    case Europe
    case MiddleEast
    case Africa
    case AsiaPacific
    
    func toString() -> String {
      switch self {
      case .World:
        return "World"
      case .Americas:
        return "Americas"
      case .Europe:
        return "Europe"
      case .MiddleEast:
        return "Middle East"
      case .Africa:
        return "Africa"
      case .AsiaPacific:
        return "Asia-Pacific"
      }
    }
    
    func toColor() -> UIColor {
      switch self {
      case .World:
        return UIColor.red
      case .Americas:
        return UIColor.blue
      case .Europe:
        return UIColor.green
      case .MiddleEast:
        return UIColor.yellow
      case .Africa:
        return UIColor.orange
      case .AsiaPacific:
        return UIColor.purple
      }
    }
  }
  
  let category: NewsCategory
  let headline: String
}


