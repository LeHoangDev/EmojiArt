//
//  EmojiArtView.swift
//  EmojiArt
//
//  Created by Manh Hoang Le on 01.10.19.
//  Copyright © 2019 Manh Hoang Le. All rights reserved.
//

import UIKit

class EmojiArtView: UIView {

    
    var backgroundImage: UIImage? {
        didSet{
            setNeedsDisplay()
        }
    }
    
    override func draw(_ rect: CGRect) {
        backgroundImage?.draw(in:bounds)
    }
    

}
