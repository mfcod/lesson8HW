import UIKit
import SnapKit

class ViewController: UIViewController {
    
    ///Jump To Definition (Детали реализации ,как написанно внутри )
    override func viewDidLoad() {
        super.viewDidLoad()
        
        view.backgroundColor = UIColor(red: 52/255, green: 116/255, blue: 180/255, alpha: 1)
        /*
         В цветовой модели RGB каждый компонент (красный, зеленый и синий) обычно представлен целым числом в диапазоне от 0 до 255. Однако при создании UIColor в iOS, используя параметры red, green и blue, значения должны быть в диапазоне от 0 до 1.
         
         Таким образом, чтобы преобразовать значения RGB из диапазона 0-255 в диапазон 0-1, каждое значение делится на 255. Например, 52/255 представляет красный компонент цвета. Эта нормализация гарантирует, что значения цвета находятся в ожидаемом диапазоне при создании UIColor.
         ///Деление на 255 нормализует RGB значения (0-255) до диапазона (0-1) для установки цвета фона в iOS.
         ///Диапазон (0-1) нужен для соответствия формату UIColor.
         */
        
        let gesture = UITapGestureRecognizer(target: self, action: #selector(tapViewScreen))
        view.addGestureRecognizer(gesture)
    }
    
    @objc private func tapViewScreen(sender: UITapGestureRecognizer) {
        guard let currentView = sender.view else { //проверяем что есть нажатие
            return
        }
        
        for _ in 0...2 { ///Этот цикл выполняется три раза (0, 1, 2), что означает, что будет создано три квадрата при каждом нажатии.
            createSquare(in: currentView)
        }
    }
    //MARK: - Создание Квадрата (Цикл-вверху)
    private func createSquare(in parentView: UIView) {
        let square = UIView()
        parentView.addSubview(square)
        let maxEdge = min(parentView.frame.width, parentView.frame.height) / 2 ///Половина мин. размера.
        
        square.snp.makeConstraints{ make in
        let randomSize = CGFloat.random(in: 1...maxEdge) ///Случайный размер.
        let topStep = CGFloat.random(in:1...parentView.frame.height - randomSize) ///Случайное вертикальное смещение.
        let leftStep = CGFloat.random(in: 1...parentView.frame.width - randomSize)///Случайное горизонтальное смещение.
            
            make.leading.equalToSuperview().offset(leftStep)
            make.top.equalToSuperview().offset(topStep)
            make.height.width.equalTo(randomSize)
            
            square.layer.borderWidth = 1
            square.layer.borderColor = UIColor.black.cgColor
        }
        
        square.backgroundColor = getRandomColor()///Устанавливаем цвет фона для квадрата, используя метод getRandomColor.
        
        let gesture = UITapGestureRecognizer(target: self, action: #selector(tapViewScreen))
        square.addGestureRecognizer(gesture)
    }
    
    private func getRandomColor() -> UIColor {
        let red: CGFloat = CGFloat(drand48())
        let green: CGFloat = CGFloat(drand48())
        let blue: CGFloat = CGFloat(drand48())
        
        return UIColor(red: red, green: green, blue: blue, alpha: 1.0)
    }
}

#Preview {
    ViewController()
}
