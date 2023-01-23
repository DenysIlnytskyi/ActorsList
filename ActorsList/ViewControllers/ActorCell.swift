//
//  ActorImageCell.swift
//  44444
//
//  Created by Денис Ільницький on 22/01/2023.
//

import UIKit

class ActorCell: UITableViewCell {
    
    @IBOutlet weak var actorImageView: UIImageView!
    @IBOutlet weak var actorNameLabel: UILabel!
    @IBOutlet weak var actorDescriptionLabel: UILabel!
    
    func configure(with actor: Actor) {
        actorNameLabel.text = actor.name
        actorDescriptionLabel.text = actor.description
        DispatchQueue.global().async {
            guard let url = URL(string: actor.image) else { return }
            guard let imageData = try? Data(contentsOf: url) else { return }
            DispatchQueue.main.async {
                self.actorImageView.image = UIImage(data: imageData)
            }
        }
    }
}
