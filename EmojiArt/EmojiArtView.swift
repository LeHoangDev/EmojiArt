//
//  EmojiArtView.swift
//  EmojiArt
//
//  Created by Manh Hoang Le on 01.10.19.
//  Copyright © 2019 Manh Hoang Le. All rights reserved.
//

import UIKit


class EmojiArtView: UIView, UIDropInteractionDelegate {

    override init(frame: CGRect) {
        super.init(frame: frame)
        setup()
    }
    
    required init?(coder aDecoder: NSCoder) {
        super.init(coder: aDecoder)
        setup()
    }
    
    private func setup(){
            addInteraction(UIDropInteraction(delegate: self))
    }
    
    // MARK: - UIDropInteractionDelegate
    
    func dropInteraction(_ interaction: UIDropInteraction, canHandle session: UIDropSession) -> Bool {
        return session.canLoadObjects(ofClass: NSAttributedString.self)
    }
    
    
    func dropInteraction(_ interaction: UIDropInteraction, sessionDidUpdate session: UIDropSession) -> UIDropProposal {
        return (UIDropProposal(operation: .copy))
    }
    
    func dropInteraction(_ interaction: UIDropInteraction, performDrop session: UIDropSession) {
        session.loadObjects(ofClass: NSAttributedString.self) { providers in
            let dropPoint = session.location(in: self)
            for attributedString in providers as? [NSAttributedString] ?? []{
                self.addLabel(width: attributedString, centeredAt: dropPoint)
            }
        }
    }
    
    private func addLabel(width attributedString: NSAttributedString, centeredAt point: CGPoint){
        let label = UILabel()
        
        label.backgroundColor = .clear
        label.attributedText = attributedString
        label.sizeToFit()
        label.center = point
        addEmojiArtGestureRecognizers(to: label)
        addSubview(label)
    }
    
     
    // MARK: - Drawing the Background
    
    var backgroundImage: UIImage? {
        didSet{
            //You can use this method or the setNeedsDisplay(_:) to notify the system that your view’s contents need to be redrawn.
            setNeedsDisplay()
        }
    }
    
    override func draw(_ rect: CGRect) {
        backgroundImage?.draw(in:bounds)
    }
    

}
