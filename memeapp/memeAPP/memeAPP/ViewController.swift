//
//  ViewController.swift
//  memeAPP
//
//  Created by Calvin Chang on 2021/1/15.
//

import UIKit

class ViewController: UIViewController, UIImagePickerControllerDelegate & UINavigationControllerDelegate {

    
    @IBOutlet weak var imageView: UIImageView!
    func imagePickerController(_ picker: UIImagePickerController, didFinishPickingMediaWithInfo info: [UIImagePickerController.InfoKey : Any]) {
        
        //imageView.image = info[.originalImage] as? UIImage
        imageView.image = info[.originalImage] as? UIImage

        dismiss(animated: true, completion: nil)
        
        drawImagesAndText(imageView)
    }
    
    
    override func viewDidLoad() {
        super.viewDidLoad()
       
        // Do any additional setup after loading the view.
    }


    @IBAction func selectPhoto(_ sender: Any) {
        
        
            if UIImagePickerController.isSourceTypeAvailable(.camera){
                let controller = UIImagePickerController()
                //controller.sourceType = .photoLibrary
                controller.sourceType = .camera
                controller.delegate = self
                controller.mediaTypes = ["public.image"]
                /*
                present(controller, animated: true, completion: {
                    print("use camera")
                    
                })
                */
                
                present(controller, animated: true) {
                    
                }
                
                
            }
        
        
        
    }
    
    func drawImagesAndText(_ imageView: UIImageView){
        //https://www.hackingwithswift.com/read/27/6/images-and-text
        //https://itisjoe.gitbooks.io/swiftgo/content/uikit/uiimageview.html
        //https://medium.com/彼得潘的-swift-ios-app-開發問題解答集/ios-sdk-的-frame-bounds-c54a4bfd9603
        
        
        
        print("imageview width is \(imageView.frame.size.width) , height is \(imageView.frame.size.height)")
        // 1
        let renderer = UIGraphicsImageRenderer(size: CGSize(width: 512, height: 512))
        //let renderer = UIGraphicsImageRenderer(size: CGSize(width: imageView.frame.size.width , height: imageView.frame.size.height))
            let img = renderer.image { ctx in
                // 2
                let paragraphStyle = NSMutableParagraphStyle()
                paragraphStyle.alignment = .center

                // 3
                let attrs: [NSAttributedString.Key: Any] = [
                    .font: UIFont.systemFont(ofSize: 12),
                    .paragraphStyle: paragraphStyle
                ]

                // 4
                let string = "The best-laid schemes o' mice an' men gang aft agley"
                let attributedString = NSAttributedString(string: string, attributes: attrs)

                // 5
                //attributedString.draw(with: CGRect(x: 32, y: 32, width: 448, height: 448), options: .usesLineFragmentOrigin, context: nil)
                attributedString.draw(with: CGRect(x: 0, y: 0, width: 400, height: 50), options: .usesLineFragmentOrigin, context: nil)
                // 5
                //let mouse = UIImage(named: "mouse")
                let mouse = imageView.image
                //mouse!.draw(at: CGPoint(x: 300, y: 150))
                //mouse!.draw(at: CGPoint(x: 0, y: 100))
                mouse!.draw(in: CGRect(x: 0, y: 40, width: 550, height: 650))
            }

            // 6
            imageView.image = img    }
    
}


