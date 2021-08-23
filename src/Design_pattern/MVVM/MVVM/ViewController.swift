//
//  ViewController.swift
//  MVVM
//
//  Created by 井民全 on 2021/8/20.
//

import UIKit

class ViewController: UIViewController, UITableViewDataSource, UITableViewDelegate{
    func tableView(_ tableView: UITableView, numberOfRowsInSection section: Int) -> Int {
        return holoData.count
    }
    
    func tableView(_ tableView: UITableView, cellForRowAt indexPath: IndexPath) -> UITableViewCell {
        let cell = tableView.dequeueReusableCell(withIdentifier: HoloTableViewCell.cellIdentifier, for: indexPath) as! HoloTableViewCell
        let model = holoData[indexPath.row]
        //let viewModel = CellViewModel(lastname: model.lastname, firstname: model.firstname, title: model.title)
        cell.configure(with: CellViewModel(lastname: model.lastname, firstname: model.firstname, title: model.title))
        //cell.textLabel?.text = "\(viewModel.title) : \(viewModel.lastname) \(viewModel.firstname)"//holoData[indexPath.row].title
        return cell
    }
    
    func tableView(_ tableView: UITableView, didSelectRowAt indexPath: IndexPath) {
        tableView.deselectRow(at: indexPath, animated: true)
    }
    
    var holoData = [
        hololive_production(group: "Hololive Fantasy", location: "JP", generation: 3, lastname: "Usada", firstname: "Pekora", title: "comedian"),
        hololive_production(group: "Hololive Fantasy", location: "JP", generation: 3, lastname: "Uruha", firstname: "Rushia", title: "board"),
        hololive_production(group: "Hololive Fantasy", location: "JP", generation: 3, lastname: "Houshou", firstname: "Marine", title: "Hornyyyy"),
        hololive_production(group: "Hololive Fantasy", location: "JP", generation: 3, lastname: "Shirogane", firstname: "Noel", title: "Knight-cup"),
        hololive_production(group: "Hololive Fantasy", location: "JP", generation: 3, lastname: "Shiranui", firstname: "Flare", title: "Flare")
    ]
    
    @IBOutlet var tableView: UITableView!

    override func viewDidLoad() {
        super.viewDidLoad()
        tableView.register(HoloTableViewCell.nib(), forCellReuseIdentifier: HoloTableViewCell.cellIdentifier)
        tableView.delegate = self
        tableView.dataSource = self
    }
    
    struct hololive_production {
        let group : String
        let location : String
        let generation : Int
        let lastname : String
        let firstname : String
        let title : String
    }
}

struct CellViewModel {
    let lastname : String
    let firstname : String
    let title : String
}
