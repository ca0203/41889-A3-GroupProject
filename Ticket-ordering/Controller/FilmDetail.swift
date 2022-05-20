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
    
    @IBOutlet var titleLabel: UILabel!
    @IBOutlet var trailerButton: UIButton!
    @IBOutlet var filmImage: UIImageView!
    @IBOutlet var filmDescription: UITextView!
    var filmDetails: FilmDetails? {
        didSet {
            configure()
        }
    }
    
    override func viewDidLoad() {
        super.viewDidLoad()
        configure()
    }
    
    func configure() {
        if let filmDetails = filmDetails {
            DispatchQueue.main.async {
                [self] in
                titleLabel.text = filmDetails.film_name
                filmDescription.text = filmDetails.synopsis_long
                filmDescription.isEditable = false
            }
            
        }
    }
    override func prepare(for segue: UIStoryboardSegue, sender: Any?) {
        if segue.identifier == "toTrailer" {
            let VC = segue.destination as! TrailerController
            VC.url = filmDetails?.trailers?.high[0].film_trailer ?? ""
        }
        if segue.identifier == "toPicker" {
            let VC = segue.destination as! DatePickerController
            VC.filmDetails = self.filmDetails
        }
    }
}
