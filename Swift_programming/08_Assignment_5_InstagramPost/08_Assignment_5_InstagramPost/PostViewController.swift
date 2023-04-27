import UIKit

class PostViewController: UIViewController {
  
  override func viewDidLoad() {
    super.viewDidLoad()
    view.backgroundColor = .white
    
    let mainStackView = UIStackView()
    mainStackView.translatesAutoresizingMaskIntoConstraints = false
    view.addSubview(mainStackView)
    
    mainStackView.axis = .vertical
    mainStackView.distribution = .equalSpacing
    mainStackView.spacing = 10
    mainStackView.alignment = .fill
    mainStackView.backgroundColor = .red
    
    mainStackView.leadingAnchor.constraint(equalTo: view.safeAreaLayoutGuide.leadingAnchor, constant: 8).isActive = true
    mainStackView.trailingAnchor.constraint(equalTo: view.safeAreaLayoutGuide.trailingAnchor, constant: -8).isActive = true
    mainStackView.topAnchor.constraint(equalTo: view.topAnchor, constant: 8).isActive = true
    
    let topIconsStackView = UIStackView()
    topIconsStackView.translatesAutoresizingMaskIntoConstraints = false
    topIconsStackView.axis = .horizontal
    topIconsStackView.alignment = .fill
    topIconsStackView.distribution = .fillEqually
    topIconsStackView.backgroundColor = .green
    
    let butt1 = UIButton()
    butt1.translatesAutoresizingMaskIntoConstraints = false
    butt1.setImage(UIImage(named: "bookmark_filled"), for: .normal)
    topIconsStackView.addArrangedSubview(butt1)
    let butt2 = UIButton()
    butt2.translatesAutoresizingMaskIntoConstraints = false
    butt2.setImage(UIImage(named: "bookmark_filled"), for: .normal)
    topIconsStackView.addArrangedSubview(butt2)
    topIconsStackView.addArrangedSubview(UIButton())
    topIconsStackView.addArrangedSubview(UIButton())
    topIconsStackView.addArrangedSubview(UIButton())
    let butt3 = UIButton()
    butt3.translatesAutoresizingMaskIntoConstraints = false
    butt3.setImage(UIImage(named: "bookmark_filled"), for: .normal)
    topIconsStackView.addArrangedSubview(butt3)
    
    mainStackView.addArrangedSubview(topIconsStackView)
    
    let manImage = UIImageView(image: UIImage(named: "open_mac"))
    mainStackView.addArrangedSubview(manImage)
    manImage.heightAnchor.constraint(equalToConstant: 300).isActive = true
    
    
    
//    manImage.heightAnchor.constraint(equalToConstant: mainStackView.frame.width).isActive = true
//    topIconsStackView.widthAnchor.constraint(equalTo: mainStackView.widthAnchor).isActive = true
    
//    let topIconsStackView = UIStackView()
//    topIconsStackView.translatesAutoresizingMaskIntoConstraints = false
//    topIconsStackView.axis = .horizontal
//    topIconsStackView.backgroundColor = .green
//    mainStackView.addArrangedSubview(topIconsStackView)
  }
}
