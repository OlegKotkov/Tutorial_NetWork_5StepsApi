/*
 Описание по шагам
 
 1) Получение  API
 API берем с сайта picsum.photos Регистрация не нужна
 https://picsum.photos/200/300
 2) Создание  URL
 3) Инициализаця сессии
 4) Сздать запрос DataTask
 5) Обработать полученные данные
 6) Подгоняем размер  ImageView под размер фото(делаем его динамичным)
 */
import UIKit

class ViewController: UIViewController {
    //6) Подгоняем размер  ImageView под размер фото(делаем его динамичным)
    var imageWidht = ""
    var imageHeight = ""

    @IBOutlet weak var imageView: UIImageView!
    
    @IBAction func getButton(_ sender: Any) {
        //Описание по шагам
        
        //1) Получение  API
        //API берем с сайта picsum.photos Регистрация не нужна
        //https://picsum.photos/200/300
        //
        let API = "https://picsum.photos/"
        /*
         6) Подгоняем размер  ImageView под размер фото(делаем его динамичным)
         */
        + imageWidht + "/" + imageHeight
        //2) Создание  URL
        guard let apiURL = URL(string: API) else {
            fatalError("some error")
        }
        //3) Инициализаця сессии
        let session = URLSession(configuration: .default)
        //4) Сздать запрос DataTask
        let task = session.dataTask(with: apiURL) {(data, response,error) in
            //5) Обработать полученные данные
            guard let data = data, error == nil else {
                return}
            DispatchQueue.main.async {
                //data = .jpeg
                self.imageView.image = UIImage(data: data)
            }
        }
       
      //Запустить запрос
        task.resume()
    }
    
    override func viewDidLoad() {
        super.viewDidLoad()
        //6) Подгоняем размер  ImageView под размер фото(делаем его динамичным)
        let widht = imageView.bounds.width
        self.imageWidht = String(format: "%.0f", Double(widht))
        let height = imageView.bounds.height
        self.imageHeight = String(format: "%.0f", Double(height))
    }


}

