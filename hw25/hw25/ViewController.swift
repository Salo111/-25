//
//  ViewController.swift
//  hw25
//
//  Created by salo khizanishvili on 24.08.22.
//

import UIKit

class ViewController: UIViewController {
    @IBOutlet var table: UITableView!
    @IBOutlet weak var txtFld: UITextField!
    var models = [MyReminder(title: "School")]

    override func viewDidLoad() {
        super.viewDidLoad()
        table.delegate = self
        table.dataSource = self
        models.append(MyReminder(title: "\(UserDefaults.standard.textFieldText!)"))
        table.reloadData()
        let manager = FileManager.default
        guard let url = manager.urls(for: .documentDirectory, in: .userDomainMask).first else{
            return
        }
        for i in 0..<models.count{
            let newfolder = url.appendingPathComponent("\(models[i].title)")
        do{
            try manager.createDirectory(at: newfolder, withIntermediateDirectories: true)
        }
            
        catch{
            print(error)
            }
        }
    }
    @IBAction func addButton(){
        if(txtFld.text != ""){
        UserDefaults.standard.textFieldText = txtFld.text
        models.append(MyReminder(title: "\(txtFld.text!)"))
        print("\(models)")
            table.reloadData()
        }
    }


}

extension ViewController: UITableViewDelegate{
    func tableView(_ tableView: UITableView, didSelectRowAt indexPath: IndexPath) {
        tableView.deselectRow(at: indexPath, animated: true)
    }
    
}


extension ViewController: UITableViewDataSource{
    func numberOfSections(in tableView: UITableView) -> Int {
        return 1
    }
    func tableView(_ tableView: UITableView, numberOfRowsInSection section: Int) -> Int {
        return models.count
    }
    func tableView(_ tableView: UITableView, cellForRowAt indexPath: IndexPath) -> UITableViewCell {
        let cell = tableView.dequeueReusableCell(withIdentifier: "cell", for: indexPath)
        cell.textLabel!.text = models[indexPath.row].title
        return cell
    }
}


struct MyReminder {
    let title: String
}


extension UserDefaults {
    
    enum UserDefaultsKeys: String {
        case textFieldText
    }
    
    var textFieldText: String? {
        
        get {
            string(forKey: UserDefaults.UserDefaultsKeys.textFieldText.rawValue)
        }
        
        set {
            set(newValue, forKey: UserDefaults.UserDefaultsKeys.textFieldText.rawValue)
        }
    }

    
}
