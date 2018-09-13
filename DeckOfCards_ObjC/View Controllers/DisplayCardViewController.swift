//
//  DisplayCardViewController.swift
//  DeckOfCards_ObjC
//
//  Created by Kamil Wrobel on 9/12/18.
//  Copyright © 2018 Kamil Wrobel. All rights reserved.
//

import UIKit

class DisplayCardViewController: UIViewController {
    
    
    @IBOutlet weak var cardImageView: UIImageView!
    @IBOutlet weak var cardNameLabel: UILabel!
    
    var card : KWECard?{
        didSet{
            updateViews()
        }
    }

    override func viewDidLoad() {
        super.viewDidLoad()

        
    }
    
    
    func updateViews(){
        guard let card = card else {return}
        guard let value = card.value,
            let suit = card.suit else {return}
        DispatchQueue.main.async {
            self.cardNameLabel.text = "\(value) of \(suit)"
        }
        KWECardController.fetchImage(fromURl: card.image, completion: { (imageData) in
            guard let image = imageData else {return}
            DispatchQueue.main.async {
                self.cardImageView.image = UIImage(data: image)
            }
        })
        
        
    }


    @IBAction func drawACard(_ sender: Any) {

        KWECardController.fetchCard { (cardData) in
            guard let card = cardData else {return}
            self.card = card
            
           
        }
        
        
    }
    
}
