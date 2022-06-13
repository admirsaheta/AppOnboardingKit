# AOKit - An easier onBoarding experience

AOKit provides an onboarding flow that is simple and easy to implement

## Requirements

* iOS 13 or newer
* XCode 13 or newer
* Swift 5 or newer

## Installation

You can use this package in two ways, it comes down to personal preference:

* Using Swift Package Manager
* Manual Installation ( Build the framework // Embed XCode Project )

## Swift Package Manager

To start using AOKit in your XCode project add it trough SPM of the XCode menu, or add it directly as a value in dependencies of your ```Package.swift```:

```
dependencies: [

.package(url: "https://github.com/admirsaheta/AppOnboardingKit")

]

```

## Manually

If you prefer not using SwiftPM you can integrate it manually into your project.


## Usage

Quick start

```swift

import UIKit
import AppOnboardingKit

class ViewController: UIViewController {
  
  private var onboardingKit: AppOnboardingKit?

  override func viewDidLoad() {
    super.viewDidLoad()
    DispatchQueue.main.async {
      self.onboardingKit = AppOnBoardingKit(
        slides: [
          .init(image: UIImage(named: "imSlide1")!,
                title: "Title for slide 1"),
          .init(image: UIImage(named: "imSlide2")!,
                title: "Title for slide 2"),
          .init(image: UIImage(named: "imSlide3")!,
                title: "Title for slide 3"),
          .init(image: UIImage(named: "imSlide4")!,
                title: "Title for slide 4"),
          .init(image: UIImage(named: "imSlide5")!,
                title: "Title for slide 5")
        ],
        tintColor: UIColor(red: 220/255, green: 20/255, blue: 60/255, alpha: 1.0),
        themeFont: UIFont(name: "American Typewriter Bold", size: 28) ?? .systemFont(ofSize: 28, weight: .bold))
      self.onboardingKit?.delegate = self
      self.onboardingKit?.launchOnboarding(rootVC: self)
    }
  }
}

extension ViewController: AppOnboardingKitDelegate {
  func nextButtonDidTap(atIndex index: Int) {
    print("next button is tapped at index: \(index)")
  }
  
  func getStartedButtonDidTap() {
    onboardingKit?.dismissOnboarding()
    onboardingKit = nil
    transit(viewController: MainViewController())
  }
  
  private func transit(viewController: UIViewController) {
    let foregroundScenes = UIApplication.shared.connectedScenes.filter({
      $0.activationState == .foregroundActive
    })
    
    let window = foregroundScenes
      .map({ $0 as? UIWindowScene })
      .compactMap({ $0 })
      .first?
      .windows
      .filter({ $0.isKeyWindow })
      .first
    
    guard let uWindow = window else { return }
    uWindow.rootViewController = viewController
    
    UIView.transition(
      with: uWindow,
      duration: 0.3,
      options: [.transitionCrossDissolve],
      animations: nil,
      completion: nil)
  }
}

class MainViewController: UIViewController {
  
  override func viewDidLoad() {
    super.viewDidLoad()
    let label = UILabel()
    label.text = "Main View Controller"
    view.addSubview(label)
    label.snp.makeConstraints { make in
      make.center.equalTo(view)
    }
    view.backgroundColor = .gray
  }
  
}


```





