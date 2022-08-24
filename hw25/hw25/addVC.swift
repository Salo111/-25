//
//  addVC.swift
//  hw25
//
//  Created by salo khizanishvili on 24.08.22.
//

import UIKit

class addVC: UIViewController {
    @IBOutlet var table1: UITableView!
    @IBOutlet weak var secondTxtFld: UITextField!
    var notes = [String]()
    override func viewDidLoad() {
        super.viewDidLoad()
        table1.delegate = self
        table1.dataSource = self
        
    }
    
}

extension addVC: UITableViewDelegate{
    func tableView(_ tableView: UITableView, didSelectRowAt indexPath: IndexPath) {
        tableView.deselectRow(at: indexPath, animated: true)
    }
    
}


extension addVC: UITableViewDataSource{
    func numberOfSections(in tableView: UITableView) -> Int {
        return 1
    }
    func tableView(_ tableView: UITableView, numberOfRowsInSection section: Int) -> Int {
        return notes.count
    }
    func tableView(_ tableView: UITableView, cellForRowAt indexPath: IndexPath) -> UITableViewCell {
        let cell = tableView.dequeueReusableCell(withIdentifier: "cell1", for: indexPath)
        cell.textLabel!.text = notes[indexPath.row]
        return cell
    }
}
