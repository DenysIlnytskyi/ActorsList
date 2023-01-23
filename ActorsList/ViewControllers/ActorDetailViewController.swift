//
//  ActorDetailViewController.swift
//  44444
//
//  Created by Денис Ільницький on 20/01/2023.
//

import UIKit

class ActorDetailViewController: UIViewController {
    
    @IBOutlet weak var imageView: UIImageView!
    
    @IBOutlet weak var actorNameLabel: UILabel!
    @IBOutlet weak var actorGenderLabel: UILabel!
    @IBOutlet weak var actorDobLabel: UILabel!
    @IBOutlet weak var actorHeightLabel: UILabel!
    @IBOutlet weak var actorCountryLabel: UILabel!
    @IBOutlet weak var actorSpouseLabel: UILabel!
    @IBOutlet weak var actorChildrenLabel: UILabel!
    @IBOutlet weak var actorWikiLabel: UILabel!
    @IBOutlet weak var actorDescriptionLabel: UILabel!
    
    var networkManager: NetworkManager!
    var actor: Actor!
    
    override func viewDidLoad() {
        super.viewDidLoad()
        fetchImage()
        configureItems()
        settingDetailInformation()
    }
    
    private func settingDetailInformation() {
        actorNameLabel.text = "Name: \(actor.name)"
        actorGenderLabel.text = "Gender: \(actor.gender)"
        actorDobLabel.text = "Dob: \(actor.dob)"
        actorHeightLabel.text = "Height: \(actor.height)"
        actorCountryLabel.text = "Country: \(actor.country)"
        actorSpouseLabel.text = "Spouse: \(actor.spouse)"
        actorChildrenLabel.text = "Children: \(actor.children)"
        actorWikiLabel.text = "Wiki: \(actor.wiki)"
        actorDescriptionLabel.text = "Description: \(actor.description)"
    }
    
    private func fetchImage() {
            guard let url = URL(string: actor.image) else  { return }
            
            URLSession.shared.dataTask(with: url) { data, response, error in
                guard let data = data, let response = response else {
                    print(error?.localizedDescription ?? "no error description")
                    return
                }
                print(response)
                
                guard let image = UIImage(data: data) else { return }
                
                DispatchQueue.main.async {
                    self.imageView.image = image
                }
            }.resume()
        }
    
    
    private func configureItems() {
        self.navigationItem.rightBarButtonItem = UIBarButtonItem(title: "Change BG", style: .done, target: self, action: #selector(changeBG))
    }
    
    @objc func changeBG() {
        view.backgroundColor = UIColor(red: CGFloat.random(in: 0...1), green: CGFloat.random(in: 0...1), blue: CGFloat.random(in: 0...1), alpha: CGFloat.random(in: 0...1))
    }
    }

