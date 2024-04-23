//
//  ViewController.swift
//  RealTimePickerExamples
//
//  Created by Admin on 24.04.2022.
//

import UIKit
//import RealTimePyicker


protocol RealTimePickerDelegate: AnyObject {
  func didSelectDateTime(_ date: Date)
}

class RealTimePickerViewController: UIViewController {
  
  weak var delegate: RealTimePickerDelegate?
  
  private var timePicker: RealTimePickerView = {
    let view = RealTimePickerView(format: .h12)
    view.showUnitSeparator = true
    view.rowHeight = 40 // default row height is 60
    view.timeLabelFont = UIFont.systemFont(ofSize: 32, weight: .semibold) // default size
    view.colonLabelFont = UIFont.systemFont(ofSize: 32 * 0.75, weight: .bold) // default size
    view.formatLabelFont = UIFont.systemFont(ofSize: 20, weight: .semibold) // default size
    view.backgroundColor = UIColor.white.withAlphaComponent(0.9)
    view.layer.cornerRadius = 24
    view.showCurrentTime = true
    return view
  }()
  
  override func viewDidLoad() {
    super.viewDidLoad()
    
    view.backgroundColor = .white
    
    view.addSubview(timePicker)
    timePicker.translatesAutoresizingMaskIntoConstraints = false
    timePicker.centerXAnchor.constraint(equalTo: view.centerXAnchor).isActive = true
    timePicker.centerYAnchor.constraint(equalTo: view.centerYAnchor).isActive = true
    timePicker.widthAnchor.constraint(equalTo: view.widthAnchor, multiplier: 0.7).isActive = true
    
    timePicker.onDateTimePicked = { [weak self] date in
      guard let self = self else { return }
      self.delegate?.didSelectDateTime(date)
      self.dismiss(animated: true, completion: nil)
    }
  }
}



///=====
///
///
///
///


class ExampleViewController: UIViewController, RealTimePickerDelegate {
  
  private var titleLabel: UILabel = {
    let label = UILabel()
    label.text = "RealTimePickerView"
    label.font = UIFont.systemFont(ofSize: 24, weight: .bold)
    label.textColor = .black
    return label
  }()
  
  private var bgImageView: UIImageView = {
    let imgView = UIImageView(image: UIImage(named: "main_bg"))
    imgView.contentMode = .scaleAspectFill
    imgView.clipsToBounds = true
    return imgView
  }()
  
  private var selectedLabel: UILabel = {
    let label = UILabel()
    label.font = UIFont.systemFont(ofSize: 24, weight: .semibold)
    label.text = "Select time"
    label.textColor = .white
    label.isUserInteractionEnabled = true
    return label
  }()
  
  //    private lazy var segmentControl: UISegmentedControl = {
  //        let view = UISegmentedControl(items: ["24-hour", "12-hour"])
  //        view.addTarget(self, action: #selector(didSelectSegment(_:)), for: .valueChanged)
  //        view.backgroundColor = .white
  //        view.selectedSegmentIndex = 0
  //        return view
  //    }()
  
  override func viewDidLoad() {
    super.viewDidLoad()
    
    setupViews()
    setupEvents()
    
    
    let g = UITapGestureRecognizer(target: self, action: #selector(tapped))
    selectedLabel.addGestureRecognizer(g)
    
  }
  
  @objc
  func tapped() {
    showTimePicker(selectedLabel)
  }
  
  private func setupViews() {
    view.backgroundColor = UIColor.white
    
    view.addSubview(bgImageView)
    bgImageView.translatesAutoresizingMaskIntoConstraints = false
    bgImageView.topAnchor.constraint(equalTo: view.topAnchor).isActive = true
    bgImageView.leftAnchor.constraint(equalTo: view.leftAnchor).isActive = true
    bgImageView.rightAnchor.constraint(equalTo: view.rightAnchor).isActive = true
    bgImageView.bottomAnchor.constraint(equalTo: view.bottomAnchor).isActive = true
    
    view.addSubview(titleLabel)
    titleLabel.translatesAutoresizingMaskIntoConstraints = false
    titleLabel.centerXAnchor.constraint(equalTo: view.centerXAnchor).isActive = true
    titleLabel.topAnchor.constraint(equalTo: view.safeAreaLayoutGuide.topAnchor, constant: 16).isActive = true
    
    view.addSubview(selectedLabel)
    selectedLabel.translatesAutoresizingMaskIntoConstraints = false
    selectedLabel.centerXAnchor.constraint(equalTo: view.centerXAnchor).isActive = true
    selectedLabel.bottomAnchor.constraint(equalTo: view.bottomAnchor, constant: -44).isActive = true
    //
    //        view.addSubview(segmentControl)
    //        segmentControl.translatesAutoresizingMaskIntoConstraints = false
    //        segmentControl.leftAnchor.constraint(equalTo: view.leftAnchor, constant: 16).isActive = true
    //        segmentControl.rightAnchor.constraint(equalTo: view.rightAnchor, constant: -16).isActive = true
    //        segmentControl.bottomAnchor.constraint(equalTo: selectedLabel.topAnchor, constant: -24).isActive = true
    
  }
  
  private func setupEvents() {
    //        segmentControl.addTarget(self, action: #selector(didSelectSegment(_:)), for: .valueChanged)
  }
  
  //    @objc private func didSelectSegment(_ sender: UISegmentedControl) {
  //        switch sender.selectedSegmentIndex {
  //        case 0:
  //            timePickerViewController?.timePicker.update(timeFormat: .h24)
  //        case 1:
  //            timePickerViewController?.timePicker.update(timeFormat: .h12)
  //        default:
  //            break
  //        }
  //    }
  
  // MARK: - RealTimePickerDelegate
  func didSelectDateTime(_ date: Date) {
    print(date)
    selectedLabel.text = DateFormatter.localizedString(from: date, dateStyle: .none, timeStyle: .short)
  }
  
  // MARK: - Presentation
  private var timePickerViewController: RealTimePickerViewController?
  
  @objc private func showTimePicker(_ sender: UIView) {
    timePickerViewController = RealTimePickerViewController()
    timePickerViewController?.delegate = self
    timePickerViewController?.modalPresentationStyle = .popover
    timePickerViewController?.popoverPresentationController?.sourceView = sender
    timePickerViewController?.popoverPresentationController?.sourceRect = sender.bounds
    timePickerViewController?.popoverPresentationController?.permittedArrowDirections = .any
    
    self.present(timePickerViewController!, animated: true, completion: nil)
  }
}
