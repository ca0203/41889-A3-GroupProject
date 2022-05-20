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
    @IBOutlet var castLabel: UILabel!
    @IBOutlet var directorLabel: UILabel!
    @IBOutlet var buttons: [UIButton]!
    @IBOutlet var durationLB: UILabel!
    @IBOutlet var genreLB: UILabel!
    @IBOutlet var ratingLB: UILabel!
    @IBOutlet var directorLB: UILabel!

    @IBOutlet var imageFrame: UIView!
    @IBOutlet var buyTicketButton: UIButton!
    @IBOutlet var castLB: UILabel!
    var filmDetails: FilmDetails? {
        didSet {
            configure()
        }
    }

    
    override func viewDidLoad() {
        super.viewDidLoad()
        for button in buttons {
            button.layer.cornerRadius = 5
        }
        imageFrame.layer.cornerRadius = 10
        configure()
        
    }
    
    func configure() {
        if let filmDetails = filmDetails {
            DispatchQueue.main.async {
                [self] in
                titleLabel.text = filmDetails.film_name
                filmDescription.text = filmDetails.synopsis_long
                filmDescription.isEditable = false
                durationLB.text = "Duration: \(filmDetails.duration_mins) mins"
                genreLB.text = "Genre: \(filmDetails.genres[0].genre_name)"
                ratingLB.text = "Rating: \(filmDetails.review_stars) ⭐"
                var casts = ""
                filmDetails.cast.forEach({ cast in
                    casts.append("\(cast.cast_name), ")
                }) 
                castLB.text = "Cast: \(casts)"
                var directors = ""
                filmDetails.directors.forEach({ director in
                    directors.append("\(director.director_name), ")
                })
                directorLB.text = "Directors: \(directors)"
                filmImage.imageFromServerURL(urlString:  filmDetails.images.poster?.one.medium.film_image ?? "https://upload.wikimedia.org/wikipedia/commons/1/14/No_Image_Available.jpg", PlaceHolderImage: UIImage.init(named: "placeHolder")!)
                if filmDetails.show_dates.isEmpty {
                    buyTicketButton.isHidden = true
                }
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
