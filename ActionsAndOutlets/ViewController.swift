
import UIKit

class ViewController: UIViewController {
    struct Slide {
        var message: String
        var author: String
    }
    var slides: [Slide] = []
    var currentIndex: Int = 0
    
    @IBOutlet weak var descriptionArea: UITextView!
    @IBOutlet weak var authorLabel: UILabel!
    @IBOutlet var previousButton: UIView!
    @IBOutlet var nextButton: UIView!
    @IBOutlet weak var totalNumberOfSlidesLabel: UILabel!
    @IBOutlet weak var currentSlideIndexLabel: UILabel!
    
    @IBAction func next(_ sender: Any) {
        if currentIndex + 1 < slides.count {
            currentIndex = currentIndex + 1
            updateLabels(slideIndex: currentIndex)
        }
    }
    
    @IBAction func previous(_ sender: Any) {
        if currentIndex - 1 >= 0 {
            currentIndex = currentIndex - 1
            updateLabels(slideIndex: currentIndex)
        }
    }
    
    func updateLabels(slideIndex: Int) {
        //adjust index to offset 0 array index
        currentSlideIndexLabel.text = String(currentIndex + 1)
        descriptionArea.text = slides[currentIndex].message
        authorLabel.text = slides[currentIndex].author
    }
    
    override func viewDidLoad() {
        super.viewDidLoad()
        
        let slideOne = Slide(message:
            """
            Welcome to my first slide!
            There are many things I wish to say but don't know how!
            """,
                            author: "John")
        
        
        let slideTwo = Slide(message: "Running out of inspiration now...:", author: "Bob")
        let slideThree = Slide(message: "This is another attempt...", author: "Bob")
        
        slides.append(slideOne)
        slides.append(slideTwo)
        slides.append(slideThree)
        
        totalNumberOfSlidesLabel.text = String(slides.count)
        updateLabels(slideIndex: 0)
    }

}

