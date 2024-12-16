//
//  SecondViewController.swift
//  Horoscopo
//
//  Created by Tardes on 13/12/24.
//

import SwiftUI
import UIKit
import Translation

class SecondViewController: UIViewController {
    
    var horoscope: Horoscope? = nil
    var typeSearchToPut:TypeSearch = .daily

    @IBOutlet weak var btnMonthly: UIBarButtonItem!
    @IBOutlet weak var btnWeekly: UIBarButtonItem!
    @IBOutlet weak var btnDaily: UIBarButtonItem!
    @IBOutlet weak var txtDates: UILabel!
    @IBOutlet weak var imageView: UIImageView!
  
    @IBOutlet weak var HoroscopeOfDaydescript: UITextView!
    override func viewDidLoad() {
        
        navigationItem.title = horoscope?.name
        imageView.image = horoscope?.icon
        txtDates.text = horoscope?.dates
        
        getMyHoroscopeSearch(btnDaily)
        super.viewDidLoad()

        // Do any additional setup after loading the view.
    }
    
    //MARK: Call to internet
    
    func getHoroscopeLuck() {
            Task {
                do {
                    
                    let luck = try await Horoscope.getHoroscopeLuck(horoscopeId: horoscope!.id, search: typeSearchToPut)
                    
                    HoroscopeOfDaydescript.text = luck
                    
                } catch {
                    print(error)
                }
            }
        }
    
    //MARK: SearchTypeHoroscope

    @IBAction func getMyHoroscopeSearch(_ sender: UIBarButtonItem) {
        switch sender.tag {
        case 0:
            btnWeekly.tintColor = UIColor.blue
            btnMonthly.tintColor = UIColor.blue
            sender.tintColor = UIColor.black
            typeSearchToPut = .daily
            getHoroscopeLuck()
           
        case 1:
            btnDaily.tintColor = UIColor.blue
            btnMonthly.tintColor = UIColor.blue
            sender.tintColor = UIColor.black
            typeSearchToPut = .weekly
            getHoroscopeLuck()
            
        case 2:
            btnWeekly.tintColor = UIColor.blue
            btnDaily.tintColor = UIColor.blue
            sender.tintColor = UIColor.black
            typeSearchToPut = .monthly
            getHoroscopeLuck()

        default:
            typeSearchToPut = .daily
            getHoroscopeLuck()
        }
    }
    
}
