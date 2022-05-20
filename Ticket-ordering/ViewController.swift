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
    var num = 1
    var method = "filmsNowShwoing"
   
    @IBOutlet var Buttons: [UIButton]!
    @IBOutlet weak var imageView: UIImageView!
    @IBOutlet weak var imageView2: UIImageView!
    override func viewDidLoad() {
        super.viewDidLoad()
        for button in Buttons {
            button.layer.cornerRadius = 5
        }
    }
    
    
    @IBAction func last(_ sender: Any) { num = num - 1
        if num == -2{
            num = 1
        }
        if num == 1{
            imageView.image = UIImage(named:"1")
        }
       if num == 0{
            imageView.image = UIImage(named:"2")
        }
        if num == -1{
            imageView.image = UIImage(named:"3")
        }
    }
    @IBAction func next(_ sender: Any) {
        num = num + 1
               if num == 4{
                   num = 1
               }
               if num == 1{
                   imageView.image = UIImage(named:"1")
               }
              if num == 2{
                   imageView.image = UIImage(named:"2")
               }
               if num == 3{
                   imageView.image = UIImage(named:"3")
               }
    }
    
    
    @IBAction func last1(_ sender: Any) {
        num = num - 1
               if num == -2{
                   num = 1
               }
               if num == 1{
                   imageView2.image = UIImage(named:"4")
               }
              if num == 0{
                   imageView2.image = UIImage(named:"5")
               }
               if num == -1{
                   imageView2.image = UIImage(named:"6")
               }
    }
    
    @IBAction func next1(_ sender: Any) {
        num = num + 1
               if num == 4{
                   num = 1
               }
               if num == 1{
                   imageView2.image = UIImage(named:"4")
               }
               if num == 2{
                   imageView2.image = UIImage(named:"5")
               }
               if num == 3{
                   imageView2.image = UIImage(named:"6")
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

}

