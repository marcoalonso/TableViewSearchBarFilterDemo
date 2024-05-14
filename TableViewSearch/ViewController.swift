//
//  ViewController.swift
//  TableViewSearch
//
//  Created by Marco Alonso on 13/05/24.
//

import UIKit

class ViewController: UIViewController, UITableViewDataSource, UITableViewDelegate {
 
    
    @IBOutlet weak var ciudadesTableView: UITableView!
    @IBOutlet weak var searchBar: UISearchBar!
    
    var ciudades = ["Morelia","Uruapan","Guadalajara","Zamora","CDMX","Leon","Guanajuato","San Luis", "Jiquilpan","Durango","Monterrey","Veracruz"]
    
    var ciudadesFiltradas = [String]()
    
    var hayCiudadesEncontradas = true
    
    override func viewDidLoad() {
        super.viewDidLoad()
        
        ciudadesTableView.dataSource = self
        ciudadesTableView.delegate = self
        searchBar.delegate = self
        
        ciudadesFiltradas = ciudades
        ciudadesTableView.register(UINib(nibName: "CeldaNoEncontradaCell", bundle: nil), forCellReuseIdentifier: "CeldaNoEncontradaCell")
    }

    //    MARK: - TableView
    func tableView(_ tableView: UITableView, numberOfRowsInSection section: Int) -> Int {
        if !hayCiudadesEncontradas && section == 1 {
            return 1
        }
        return ciudadesFiltradas.count
    }

    func tableView(_ tableView: UITableView, cellForRowAt indexPath: IndexPath) -> UITableViewCell {
        if ciudadesFiltradas.isEmpty {
            let cell = tableView.dequeueReusableCell(withIdentifier: "CeldaNoEncontradaCell", for: indexPath) as! CeldaNoEncontradaCell
            // Configura la celda personalizada aquí
            return cell
        } else {
            let cell = ciudadesTableView.dequeueReusableCell(withIdentifier: "cell", for: indexPath)
            cell.textLabel?.text = ciudadesFiltradas[indexPath.row]
            return cell
        }
        
    }
    
    func numberOfSections(in tableView: UITableView) -> Int {
        return hayCiudadesEncontradas ? 1 : 2
    }

    
    func tableView(_ tableView: UITableView, titleForHeaderInSection section: Int) -> String? {
        if !hayCiudadesEncontradas && section == 1 {
            return "Ciudad no encontrada"
        }
        return nil
    }
}

extension ViewController: UISearchBarDelegate {
    func searchBar(_ searchBar: UISearchBar, textDidChange searchText: String) {
        ciudadesFiltradas = searchText.isEmpty ? ciudades : ciudades.filter({ (ciudad) -> Bool in
            return ciudad.range(of: searchText, options: .caseInsensitive) != nil
        })
        hayCiudadesEncontradas = !ciudadesFiltradas.isEmpty
        ciudadesTableView.reloadData()
    }

    func searchBarCancelButtonClicked(_ searchBar: UISearchBar) {
        searchBar.text = ""
        ciudadesFiltradas = ciudades
        ciudadesTableView.reloadData()
    }
}

