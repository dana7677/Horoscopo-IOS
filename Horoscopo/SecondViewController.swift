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

    @IBOutlet weak var txtDates: UILabel!
    @IBOutlet weak var imageView: UIImageView!
    @IBOutlet weak var HoroscopeOfDaydescript: UILabel!
    override func viewDidLoad() {
        
        navigationItem.title = horoscope?.name
        imageView.image = horoscope?.icon
        txtDates.text = horoscope?.dates
        
        getHoroscopeLuck()
        super.viewDidLoad()

        // Do any additional setup after loading the view.
    }
    func getHoroscopeLuck() {
            Task {
                do {
                    let luck = try await Horoscope.getHoroscopeLuck(horoscopeId: horoscope!.id)
                    
                    HoroscopeOfDaydescript.text = luck
                    
                } catch {
                    print(error)
                }
            }
        }

}
