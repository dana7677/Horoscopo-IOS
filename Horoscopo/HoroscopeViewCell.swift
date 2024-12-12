//
//  HoroscopeViewCell.swift
//  Horoscopo
//
//  Created by Tardes on 12/12/24.
//

import UIKit

class HoroscopeViewCell: UITableViewCell {

    @IBOutlet weak var HoroscopeImage: UIImageView!
    @IBOutlet weak var TitleHoroscope: UILabel!
    @IBOutlet weak var DatesHoroscope: UILabel!
    
    override func awakeFromNib() {
        super.awakeFromNib()
        // Initialization code
    }

    override func setSelected(_ selected: Bool, animated: Bool) {
        super.setSelected(selected, animated: animated)

        // Configure the view for the selected state
        
       
    }
    
    func render(from horoscope:Horoscope){
        TitleHoroscope.text=horoscope.name
        DatesHoroscope.text=horoscope.dates
        HoroscopeImage.image=horoscope.icon
        
    }
}
