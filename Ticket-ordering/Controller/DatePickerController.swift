//
//  DatePickerController.swift
//  Ticket-ordering
//
//  Created by KEFAN CHEN on 19/5/2022.
//

import Foundation
import UIKit
import SwiftUI
class DatePickerController: UIViewController, UIPickerViewDelegate, UIPickerViewDataSource
{
    @IBOutlet var goButton: UIButton!
    @IBOutlet var confrimButton: UIButton!
    @IBOutlet var pickerView: UIPickerView!
    @IBOutlet var datePicker: UIDatePicker!
    var filmManager = FilmRequest()
    var filmDetails: FilmDetails!
    var selectedTime: String!
    var selectedDate: String!
    var filmShowingTime: FilmShowingTime?
    var filmBookingLink: FilmBookingLink!
    var url: String!
    @IBOutlet var buttonStyles: [UIButton]!
    var dataSourse:[String] = ["Please Select Time"] {
            didSet {
                DispatchQueue.main.async {
                    self.pickerView.reloadAllComponents()
                }
            }
        }
    
    override func viewDidLoad() {
        super.viewDidLoad()
        for buttonStyle in buttonStyles {
            buttonStyle.layer.cornerRadius = 5
        }
        pickerView.dataSource = self
        pickerView.delegate = self
        let maxDateString = filmDetails.show_dates.last?.date ?? ""
        let minDateString = filmDetails.show_dates.first?.date ?? ""
        let dateFormatter = DateFormatter()
        dateFormatter.dateFormat = "yyyy-MM-dd"
        let maxDate = dateFormatter.date(from: maxDateString)
        let minDate = dateFormatter.date(from: minDateString)
        datePicker.maximumDate = maxDate
        datePicker.minimumDate = minDate
        
       
        selectedDate = dateFormatter.string(from: datePicker.date)
    }
    
    func numberOfComponents(in pickerView: UIPickerView) -> Int {
        return 1
    }
    
    func pickerView(_ pickerView: UIPickerView, numberOfRowsInComponent component: Int) -> Int {
        return dataSourse.count
    }
    func pickerView(_ pickerView: UIPickerView, titleForRow row: Int, forComponent component: Int) -> String? {
        return dataSourse[row]
    }
    func pickerView(_ pickerView: UIPickerView, didSelectRow row: Int, inComponent component: Int) {
        selectedTime = dataSourse[row]
        goButton.isEnabled = false
        if selectedTime == "Please Select Time" {
            confrimButton.isEnabled = false
        } else {
            confrimButton.isEnabled = true
        }
        
        
        
        
    }
    @IBAction func handleConfirm(_ sender: Any) {
        guard let cinemaId = filmShowingTime?.cinemas[0].cinema_id else { return }
        let filmId = filmDetails.film_id
        
        self.filmManager.getFilmBookingLink(for: filmId, for: cinemaId, for: selectedDate, for: selectedTime){
            [weak self] result in
            switch result {
            case .failure(let error):
                print(error)
            case .success(let url):
                self?.url = url.url
            }
        }
        goButton.isEnabled = true
    }
    
    @IBAction func getSelectedDate(_ sender: Any) {
        let dateFormatter = DateFormatter()
        dateFormatter.dateFormat = "yyyy-MM-dd"
        selectedDate = dateFormatter.string(from: datePicker.date)
        filmManager.getFilmShowingTime(for: filmDetails.film_id, for: selectedDate){
            [weak self] result in
            switch result {
            case .failure(let error):
                print(error)
            case .success(let times):
                self?.filmShowingTime = times
                self?.dataSourse.removeAll()
                self?.dataSourse.append("Please Select Time")
                times.cinemas[0].showings.Standard.times.forEach { time in
                    self?.dataSourse.append(time.start_time)
                }
            }
        }
        confrimButton.isEnabled = false
    }
 
    
    @IBAction func handleGoToWeb(_ sender: Any) {
        
        if let url = URL(string: self.url) {
            UIApplication.shared.open(url)
        }
        
    }
    
    
}
