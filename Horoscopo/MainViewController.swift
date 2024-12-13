//
//  ViewController.swift
//  Horoscopo
//
//  Created by Tardes on 12/12/24.
//

import UIKit

class MainViewController: UIViewController, UITableViewDataSource, UISearchBarDelegate {
    
    
    @IBOutlet weak var tableView: UITableView!
    
    
    var isSearched = false
    var searchTextToFind = ""
    
    
    let horoscopeList:[Horoscope]=Horoscope.getAll()
    
    override func viewDidLoad() {
        super.viewDidLoad()
        // Do any additional setup after loading the view.
        // Setup SearchBar
        let search = UISearchController(searchResultsController: nil)
        //search.delegate = self
        search.searchBar.delegate = self
        self.navigationItem.searchController = search
        
        
        tableView.dataSource=self
    }
    
    func searchBar(_ searchBar: UISearchBar, textDidChange searchText:String) {
        searchTextToFind = searchText
        isSearched = true
        tableView.reloadData()
    }
    
    func searchBarCancelButtonClicked(_ searchBar: UISearchBar) {
        isSearched = false
        tableView.reloadData()
    }
    
    //Get Count
    func tableView(_ tableView: UITableView, numberOfRowsInSection section: Int) -> Int {
        
        if isSearched == true {
            
            return Horoscope.getFiltered(searchTextToFind).count
        }
        
        return Horoscope.getAll().count
       
    }
    
    func tableView(_ tableView: UITableView, cellForRowAt indexPath: IndexPath) -> UITableViewCell {
     
        let cell = tableView.dequeueReusableCell(withIdentifier:"cell",for:indexPath) as! HoroscopeViewCell
        
        //let destination = EditViewController()
        //self.present(destination, animated: true, completion: nil)
        if isSearched == true {
            let horoscopeChange = Horoscope.getFiltered(searchTextToFind)
            let horoscope = horoscopeChange[indexPath.row]
            cell.render(from: horoscope)
        }
        else {
            let horoscope = horoscopeList[indexPath.row]
            cell.render(from: horoscope)
        }
        
        return cell
        
    }
    override func prepare(for segue: UIStoryboardSegue, sender: Any?) {
        if(segue.identifier == "horocopeToDetails"){
            let detailViewController = segue.destination as! SecondViewController
            let indexPath = tableView.indexPathForSelectedRow!
            let horoscope = horoscopeList[indexPath.row]
            tableView.deselectRow(at: indexPath, animated: true)
            detailViewController.horoscope = horoscope
        }
    }

}
