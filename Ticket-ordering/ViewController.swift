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
        let q = DispatchQueue(label: "swiftlee.serial.queue")
        let VC = UIStoryboard(name: "Main", bundle: .main).instantiateViewController(withIdentifier: "FilmsViewController") as! FilmsViewController
        
        let method = "filmsNowShowing"
        q.async {
            self.filmManager.getFilm(for: method){
                [weak self] result in
                switch result {
                case .failure(let error):
                    print(error)
                case .success(let films):
                    self?.listOfFilms = films
                }
            }
        }
        q.async {
            if self.listOfFilms.count < 1 {
                print("error")
            }
            VC.listOfFilms = self.listOfFilms
            DispatchQueue.main.async{
                self.navigationController?.pushViewController(VC, animated: true)
            }
                
            }
            
        }
}

