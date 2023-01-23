//
//  ActorsListViewController.swift
//  44444
//
//  Created by Денис Ільницький on 20/01/2023.
//

import UIKit

class ActorsListViewController: UITableViewController {
    
    private var actorsList: ActorsList?
    private var actors: [Actor] = []
       
    override func viewDidLoad() {
        super.viewDidLoad()
        
        fetchData(from: Link.restAddress.rawValue)
        
        tableView.rowHeight = 150
    }
    
    // MARK: - Table view data source
    
    override func tableView(_ tableView: UITableView, numberOfRowsInSection section: Int) -> Int {
        actors.count
    }

    override func tableView(_ tableView: UITableView, cellForRowAt indexPath: IndexPath) -> UITableViewCell {
        let cell = tableView.dequeueReusableCell(withIdentifier: "showCell", for: indexPath) as! ActorCell

        let actor = actors[indexPath.row]
        cell.configure(with: actor)

        return cell
    }
    
    private func fetchData(from url: String?) {
        NetworkManager.shared.fetchData(from: url) { actors in
            self.actorsList = actors
            self.actors.append(contentsOf: actors.actors)
            self.tableView.reloadData()
        }
    }
    
    
    // MARK: - Navigation
    override func prepare(for segue: UIStoryboardSegue, sender: Any?) {
        if let indexPath = tableView.indexPathForSelectedRow {
            let actorDetailVC = segue.destination as! ActorDetailViewController 
            actorDetailVC.actor = actors[indexPath.row]
        }
    }
}
