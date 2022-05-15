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
//    {
//        didSet {
//        DispatchQueue.main.async {
//            self.FilmsTableView.reloadData()
//        }
//    }}

    override func viewDidLoad() {
        super.viewDidLoad()

        // Do any additional setup after loading the view.

        
    }
    
}
    

extension FilmsViewController: UITableViewDelegate {
    func tableView(_ tableView: UITableView, didSelectRowAt indexPath: IndexPath) {
        
    }
}
extension FilmsViewController: UITableViewDataSource {
    
    func tableView(_ tableView: UITableView, numberOfRowsInSection section: Int) -> Int {
        return listOfFilms.count    }
    
    func tableView(_ tableView: UITableView, cellForRowAt indexPath: IndexPath) -> UITableViewCell {
        let cell = tableView.dequeueReusableCell(withIdentifier: "film", for: indexPath)
        let film = listOfFilms[indexPath.row]
        cell.textLabel?.text = film.film_name
        cell.imageView?.imageFromServerURL(urlString:  film.images.poster.one.medium.film_image, PlaceHolderImage: UIImage.init(named: "placeHolder")!)

        return cell
    }

    

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



