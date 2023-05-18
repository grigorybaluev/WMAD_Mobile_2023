//
//  ViewController.swift
//  11_Assignment_6_Snacks
//
//  Created by MacBook on 15.05.2023.
//

import UIKit

class ViewController: UIViewController {
  private var navBarOriginX = 0
  private var navBarOriginY = 88
  private var navBarStatus = false
  private var myImageStackView: UIStackView!
//  var imageViews = ["oreos", "pizza_pockets", "pop_tarts", "popsicle", "ramen"].map { img in UIImageView(image: UIImage(named: img)) }
  @IBOutlet weak var plusButton: UIButton!
  @IBOutlet weak var heightConstraint: NSLayoutConstraint!
  @IBOutlet weak var navBarView: UIView!
  @IBOutlet weak var tableView: UITableView!
  private let items = ["Oreos", "Pizza Pockets", "Pop Tarts", "Popsicle", "Ramen"]
  private var selectedItems = [String]()
  
  override func viewDidLoad() {
    super.viewDidLoad()
    // Do any additional setup after loading the view.
    
//    myImageStackView = UIStackView()
//    myImageStackView.frame = CGRect(origin: CGPoint(x: navBarOriginX, y: navBarOriginY), size: CGSize(width: view.frame.width, height: 100))
    let imageView1 = UIImageView(image: UIImage(named: "oreos"))
    let imageView2 = UIImageView(image: UIImage(named: "pizza_pockets"))
    let imageView3 = UIImageView(image: UIImage(named: "pop_tarts"))
    let imageView4 = UIImageView(image: UIImage(named: "popsicle"))
    let imageView5 = UIImageView(image: UIImage(named: "ramen"))
    let imageViews = [imageView1, imageView2, imageView3, imageView4, imageView5]
    myImageStackView = UIStackView(frame: CGRect(x: 0, y: 88, width: view.frame.width, height: 100))
    myImageStackView.axis = .horizontal
    myImageStackView.distribution = .fillEqually
    
    for i in 0..<imageViews.count {
//      imageViews[i].translatesAutoresizingMaskIntoConstraints = false
      imageViews[i].isUserInteractionEnabled = true
      
      // gesture recognizer for the StackView
      let tapGestureRecognizer = UITapGestureRecognizer(target: self, action: #selector(addItem(_:)))
      imageViews[i].addGestureRecognizer(tapGestureRecognizer)
      imageViews[i].tag = i
      myImageStackView.addArrangedSubview(imageViews[i])
    }
    
    myImageStackView.isHidden = true
    myImageStackView.translatesAutoresizingMaskIntoConstraints = false
    
    navBarView.addSubview(myImageStackView)
    myImageStackView.bottomAnchor.constraint(equalTo: navBarView.bottomAnchor).isActive = true
    myImageStackView.leftAnchor.constraint(equalTo: navBarView.leftAnchor).isActive = true
    myImageStackView.widthAnchor.constraint(equalTo: navBarView.widthAnchor).isActive = true
    myImageStackView.heightAnchor.constraint(equalToConstant: 100).isActive = true
    
    tableView.fillerRowHeight = 44
    tableView.dataSource = self
    tableView.delegate = self
    
    let label = UILabel()
    label.frame = CGRect(x: 0, y: 0, width: 200, height: 21)
    label.center = CGPoint(x: 160, y: 285)
    label.textAlignment = .center
    label.text = "Add Snack"
    navBarView.addSubview(label)
    label.translatesAutoresizingMaskIntoConstraints = false
    NSLayoutConstraint.activate([
      label.centerXAnchor.constraint(equalTo: navBarView.centerXAnchor),
      label.centerYAnchor.constraint(equalTo: navBarView.centerYAnchor, constant: -30)
    ])
  }
  
  @objc private func addItem(_ sender: UITapGestureRecognizer) {
    if navBarStatus {
      if let i = sender.view?.tag {
        selectedItems.append(items[i])
        let indexPath = IndexPath(row: selectedItems.count - 1, section: 0)
        tableView.insertRows(at: [indexPath], with: .automatic)
      }
    }
  }
  
  func animateHeight() {
    if !navBarStatus {
      // Change the height of the constraint
      self.heightConstraint.constant = 200
      
      // Animate the changes
      UIView.animate(withDuration: 1, delay: 0, usingSpringWithDamping: 0.3, initialSpringVelocity: 0.5, animations: {
        // Call layoutIfNeeded in the animation block
        self.myImageStackView.isHidden = false
        self.plusButton.transform = CGAffineTransform(rotationAngle: -CGFloat.pi / 4 * 3)
        self.view.layoutIfNeeded()
      }, completion: nil)
    } else {
      self.heightConstraint.constant = CGFloat(navBarOriginY)
      
      // Animate the changes
      UIView.animate(withDuration: 1, delay: 0, usingSpringWithDamping: 0.3, initialSpringVelocity: 0.5, animations: {
        // Call layoutIfNeeded in the animation block
        self.myImageStackView.isHidden = true
        self.plusButton.transform = CGAffineTransform(rotationAngle: CGFloat.pi / 4 * 3)
        self.view.layoutIfNeeded()
      }, completion: nil)
    }
    navBarStatus = !navBarStatus
  }
  
  @IBAction func plusButtonPressed(_ sender: Any) {
    print("plus button pressed")
    
    animateHeight()
  }
  
  
  
  
  
}

    
extension ViewController: UITableViewDataSource, UITableViewDelegate {

  func numberOfSections(in tableView: UITableView) -> Int {
    return 1
  }
  
  func tableView(_ tableView: UITableView, numberOfRowsInSection section: Int) -> Int {
    
    return selectedItems.count
  }
  
  func tableView(_ tableView: UITableView, cellForRowAt indexPath: IndexPath) -> UITableViewCell {
    let cell = tableView.dequeueReusableCell(withIdentifier: "Cell", for: indexPath)
    cell.textLabel?.text = selectedItems[indexPath.row]
    
    return cell
  }
}
