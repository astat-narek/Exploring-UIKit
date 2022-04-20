//
//  Constants.swift
//  Mafia
//
//  Created by Narek Danielyan on 17.04.2022.
//

import Foundation
import UIKit


enum Constants {
    enum Colors {
        static var red: UIColor {
            UIColor(red: 0.675, green: 0.192, blue: 0.165, alpha: 1)
        }
        static var black: UIColor {
            UIColor.black
            
        }
        static var gray: UIColor {
            UIColor(red: 0.753, green: 0.78, blue: 0.78, alpha: 1)
        }
        static var yellow: UIColor {
            UIColor(red: 0.988, green: 0.925, blue: 0.416, alpha: 1)
            
        }
        static var purple: UIColor {
            UIColor(red: 0.153, green: 0.094, blue: 0.388, alpha: 1)
        }
        static var light: UIColor {
            .white
        }
    }
    
    
    enum Fonts {
        static var header: UIFont {
            UIFont(name: "Copperplate", size: 30) ?? UIFont.preferredFont(forTextStyle: .title1).withSize(30)
        }
        static var button: UIFont {
            UIFont(name: "Copperplate", size: 30) ?? UIFont.preferredFont(forTextStyle: .title1).withSize(30)
        }
        static var cardHeader: UIFont {
            UIFont(name: "Copperplate", size: 35) ?? UIFont.preferredFont(forTextStyle: .title1).withSize(35)
        }
        static var body: UIFont {
            UIFont(name: "Copperplate", size: 20) ?? UIFont.preferredFont(forTextStyle: .title1).withSize(20)
        }
    }
    
    enum Image {
        static let mafiosi = UIImage(named: "mafiosi")
        static let villager = UIImage(named: "villager")
        static let sheriff = UIImage(named: "sheriff")
        static let don = UIImage(named: "don")
    }
}

