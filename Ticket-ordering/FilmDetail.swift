//
//  FilmDetail.swift
//  Ticket-ordering
//
//  Created by KEFAN CHEN on 18/5/2022.
//

import Foundation
//
//  ViewController.swift
//  Ticket-ordering
//
//  Created by Gongming Shi on 2022/5/8.
//
import AVKit
import UIKit
import AVFoundation





class FilmsDetailController: UIViewController
{
    

    @IBOutlet var textArea: UITextView!
    @IBOutlet var titleLabel: UILabel!
    var filmDetails: FilmDetails!
    
    
    override func viewDidLoad() {
        if filmDetails != nil {
            super.viewDidLoad()
            titleLabel.text = filmDetails.film_name
            textArea.text = filmDetails.synopsis_long
        }

        
    }
    override func prepare(for segue: UIStoryboardSegue, sender: Any?) {
        if segue.identifier == "toTrailer" {
            let VC = segue.destination as! TrailerController
            VC.url = filmDetails.trailers.high[0].film_trailer
        }
    }
    

}
