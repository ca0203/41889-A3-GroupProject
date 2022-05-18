//
//  ViewController.swift
//  Ticket-ordering
//
//  Created by Gongming Shi on 2022/5/8.
//
import UIKit

class FilmsViewController: UIViewController {
    
    @IBOutlet var FilmsTableView: UITableView!
    var listOfFilms = [FilmInfo]()
    var index = 0
    var filmManager = FilmRequest()

    override func viewDidLoad() {
        super.viewDidLoad()

    }
    override func prepare(for segue: UIStoryboardSegue, sender: Any?)  {
        if segue.identifier == "toFilmDetail"{
            let VC = segue.destination as! FilmsDetailController
            let id = listOfFilms[index].film_id
            var filmDetails: FilmDetails!
            
                filmManager.getFilmDetail(for: id) {
                    [weak self] result in
                    switch result {
                    case .failure(let error):
                        print(error)
                    case .success(let data):
                        filmDetails = data
                    }
            VC.filmDetails = filmDetails
            }
        }
    }
}
    

extension FilmsViewController: UITableViewDelegate {
    func tableView(_ tableView: UITableView, didSelectRowAt indexPath: IndexPath) {
        index = indexPath.row
    }
}
extension FilmsViewController: UITableViewDataSource {
    
    func tableView(_ tableView: UITableView, numberOfRowsInSection section: Int) -> Int {
        return listOfFilms.count    }
    
    func tableView(_ tableView: UITableView, cellForRowAt indexPath: IndexPath) -> UITableViewCell {
        let cell = tableView.dequeueReusableCell(withIdentifier: "film", for: indexPath) as! FilmCell
        
        let film = listOfFilms[indexPath.row]
        cell.filmLabel.text = film.film_name
        cell.filmImage.imageFromServerURL(urlString:  film.images.poster.one.medium.film_image, PlaceHolderImage: UIImage.init(named: "placeHolder")!)

        return cell
    }
}


class FilmCell: UITableViewCell {
    @IBOutlet var filmImage: UIImageView!
    @IBOutlet var filmLabel: UILabel!
}

extension UIImageView {

 public func imageFromServerURL(urlString: String, PlaceHolderImage:UIImage) {

        if self.image == nil{
              self.image = PlaceHolderImage
        }

        URLSession.shared.dataTask(with: NSURL(string: urlString)! as URL, completionHandler: { (data, response, error) -> Void in

            if error != nil {
                print(error ?? "No Error")
                return
            }
            DispatchQueue.main.async(execute: { () -> Void in
                let image = UIImage(data: data!)
                self.image = image
                
            })

        }).resume()
    }}



