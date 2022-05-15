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
    var method = "filmsNowShwoing"
    override func viewDidLoad() {
        super.viewDidLoad()
        // Do any additional setup after loading the view.
        filmManager.getFilm(for: method){
            [weak self] result in
            switch result {
            case .failure(let error):
                print(error)
            case .success(let films):
                self!.listOfFilms = films
            }
        }
    }
    
    
    override func prepare(for segue: UIStoryboardSegue, sender: Any?) {
        var method = ""
        if segue.identifier == "goToNowShwoing" {
            method = "filmsNowShowing"
        }
        if segue.identifier == "goToComingSoon" {
            method = "filmsComingSoon"
        }
        let VC = segue.destination as! FilmsViewController

        VC.listOfFilms = self.listOfFilms

    }
}

