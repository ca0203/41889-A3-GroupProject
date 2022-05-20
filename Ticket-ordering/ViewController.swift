//
//  ViewController.swift
//  Ticket-ordering
//
//  Created by 陈雨欣 on 2022/5/8.
//
import UIKit

class ViewController: UIViewController {
    var filmManager = FilmRequest()
    var listOfFilms = [FilmInfo]()
    
    //test
    var filmDetails: FilmDetails!
    
    //test
    var method = "filmsNowShwoing"
    @IBOutlet var testButton: UIButton!
    override func viewDidLoad() {
        super.viewDidLoad()
        // Do any additional setup after loading the view.

        
//
//        filmManager.getFilmDetail(for: 111) {
//            [weak self] result in
//            switch result {
//            case .failure(let error):
//                print(error)
//            case .success(let data):
//                self?.filmDetails = data
//            }
//
//        }
    }
    override func prepare(for segue: UIStoryboardSegue, sender: Any?) {
       
        var method = ""
        if segue.identifier == "goToNowShwoing" {
            method = "filmsNowShowing"
        }
        if segue.identifier == "goToComingSoon" {
            method = "filmsComingSoon"
        }
        let VC = segue.destination as? FilmsViewController
            self.filmManager.getFilm(for: method){
                [weak VC] result in
                switch result {
                case .failure(let error):
                    print(error)
                case .success(let films):
                    VC?.listOfFilms = films
                }
            }
    }

    @IBAction func handleTest(_ sender: Any) {
        let time = "13:00"
        
        let dateFormatter = DateFormatter()
        dateFormatter.dateFormat = "HH%3Amm"
        let _time = dateFormatter.date(from: time)
        print(_time)
    }
}

