//
//  MainView.swift
//  Solar Warning
//
//  Created by Rafael VSM on 09/02/20.
//  Copyright © 2020 rafaeldelegate. All rights reserved.
//

import UIKit
private let sunReuseIdCell = "SunInfoCell"
class MainView: UIViewController, MainViewViewProtocol {
    
    // MARK: - Properties
    var presenter: MainViewPresenterProtocol?
    var sunInfo: Sun!
    var safeExposureTime: SafeExposureTime!
    var labelNames = ["Sunrise","sunset"]
    
    var circularProgressBar: CAShapeLayer = {
        let radius:CGFloat = 50
        let startAngle:CGFloat = 0
        let endAngle:CGFloat = 2 * CGFloat.pi
        let circularPath = UIBezierPath(arcCenter: .zero, radius: radius , startAngle: startAngle, endAngle: endAngle, clockwise: true)
        let layer = CAShapeLayer()
        layer.path = circularPath.cgPath
        layer.strokeColor = UIColor.outlineStrokeColor.cgColor
        layer.lineWidth = 5
        layer.fillColor = UIColor.clear.cgColor
        layer.strokeEnd = 0
        layer.lineCap = CAShapeLayerLineCap.round
        layer.transform = CATransform3DMakeRotation(-CGFloat.pi/2, 0, 0, 1)
        return layer
    }()
    
    var trackLayer: CAShapeLayer = {
        let radius:CGFloat = 50
        let startAngle:CGFloat = 0
        let endAngle:CGFloat = 2 * CGFloat.pi
        let circularPath = UIBezierPath(arcCenter: .zero, radius: radius , startAngle: startAngle, endAngle: endAngle, clockwise: true)
        let layer = CAShapeLayer()
        layer.path = circularPath.cgPath
        layer.strokeColor = UIColor.trackStrokeColor.cgColor
        layer.lineWidth = 5
        layer.fillColor = UIColor.white.cgColor
        
        layer.lineCap = CAShapeLayerLineCap.round
        return layer
    }()
    
    var headerView: UIView = {
        let view = UIView()
        view.backgroundColor = .gray
        view.translatesAutoresizingMaskIntoConstraints = false
        return view
    }()
    
    lazy var collectionViewSunInfo: UICollectionView = {
        let layout = UICollectionViewFlowLayout()
        layout.minimumLineSpacing = 10
        let cv = UICollectionView(frame: .zero, collectionViewLayout: layout)
        cv.translatesAutoresizingMaskIntoConstraints = false
        cv.backgroundColor = .blue
        cv.delegate = self
        cv.dataSource = self
        return cv
    }()
    
    var arrangedSubViews = [UIView]()
    
    lazy var stackView: UIStackView = {
        let sv = UIStackView(arrangedSubviews: self.arrangedSubViews)
        sv.backgroundColor = .yellow
        sv.spacing = 2
        sv.axis = .vertical
        sv.contentMode = .center
        sv.distribution = .equalCentering
        sv.alignment = .leading
        sv.translatesAutoresizingMaskIntoConstraints = false
        sv.backgroundColor = .red
        return sv
    }()
    
    var body: UIView = {
        let view = UIView()
        view.backgroundColor = .blue
        view.translatesAutoresizingMaskIntoConstraints = false
        return view
    }()
    
    override func viewDidLoad() {
        super.viewDidLoad()
        navigationController?.isNavigationBarHidden = true
        collectionViewSunInfo.register(SunCollectionViewCell.self, forCellWithReuseIdentifier: sunReuseIdCell)
        render()
        
//        OpenUVAPI.UVIndex.requestAllData { (data, error) in
//            if error != nil {
//                print(error!)
//            } else {
//                print(data)
//                self.updateContent(data?.results.sunInfo, data?.results.safeExposureTime)
//            }
//        }
    }
    
    func render() {
        view.backgroundColor = .backgroudColor
        let views =  labelNames.map({ (word) -> UILabel in
            let label = UILabel()
            label.text = word
            label.backgroundColor = .cyan
            return label
        })
        arrangedSubViews = views
        view.addSubview(headerView)
        collectionViewSunInfo.backgroundColor = .red
        headerView.addSubview(collectionViewSunInfo)
        headerView.addSubview(stackView)
        view.addSubview(body)
        
        NSLayoutConstraint.activate([
            headerView.topAnchor.constraint(equalTo: view.safeAreaLayoutGuide.topAnchor),
            headerView.leadingAnchor.constraint(equalTo: view.safeAreaLayoutGuide.leadingAnchor),
            headerView.trailingAnchor.constraint(equalTo: view.safeAreaLayoutGuide.trailingAnchor),
            headerView.heightAnchor.constraint(equalTo: view.heightAnchor, multiplier: 0.5),
            
            collectionViewSunInfo.bottomAnchor.constraint(equalTo: headerView.bottomAnchor),
            collectionViewSunInfo.trailingAnchor.constraint(equalTo: headerView.trailingAnchor, constant: -16),
            collectionViewSunInfo.widthAnchor.constraint(equalTo: headerView.widthAnchor, multiplier: 0.5),
            collectionViewSunInfo.heightAnchor.constraint(equalToConstant: 230),
            
            stackView.bottomAnchor.constraint(equalTo: headerView.bottomAnchor),
            stackView.leadingAnchor.constraint(equalTo: headerView.leadingAnchor, constant: 16),
            stackView.widthAnchor.constraint(equalTo: headerView.widthAnchor, multiplier: 0.5),
            stackView.heightAnchor.constraint(equalToConstant: 230),
            
            body.topAnchor.constraint(equalTo: headerView.bottomAnchor),
            body.leadingAnchor.constraint(equalTo: view.safeAreaLayoutGuide.leadingAnchor),
            body.trailingAnchor.constraint(equalTo: view.safeAreaLayoutGuide.trailingAnchor),
            body.bottomAnchor.constraint(equalTo: view.safeAreaLayoutGuide.bottomAnchor)
        ])
        
        trackLayer.position = CGPoint(x: (3/4)*(view.frame.width), y: 100)
        headerView.layer.addSublayer(trackLayer)
        circularProgressBar.position =  CGPoint(x: (3/4)*(view.frame.width), y: 100)
        headerView.layer.addSublayer(circularProgressBar)
        circularProgressBar.strokeStart = 0
        circularProgressBar.strokeEnd = 0.2
        setupCurrentTime()
    }
    
    func setupCurrentTime() {
        let date = Date()
        let dateString = Date.getStringDate(from: date, withFormat: .yearMothDayTHourMinutesSeconds)
        print("DATADEAGORA: \(dateString)")
        let components = dateString.components(separatedBy: "T")
        let hourComponents = components[1].components(separatedBy: ":")
        let hour = hourComponents[0]
        let minutes = hourComponents[1]
        print("hour ",hour, "Minutes ",minutes)
        let factor = Float(hour)! / 24.0
        let factor2 = Float(minutes)! / 60.0 * 1.0 / 24
        
        print(factor, factor2)
        circularProgressBar.strokeEnd = CGFloat(factor) + CGFloat(factor2)
        print(components[1]," ayhuuu horA")
        
    }
    
    func updateContent(_ sunInfo: Sun?, _ safeExposureTime: SafeExposureTime?) {
        self.sunInfo =  sunInfo
        self.safeExposureTime = safeExposureTime
        updateView()
    }
    
    func updateView() {
        let sunrise = sunInfo.sunTimes.sunrise
        //        let sunriseDate = Date.dateFrom(customString: sunrise, with: .ISO8601)
        //        let sunriseHour = Date.getHour(from: sunriseDate, withFormat: .hourAndMinutes)
        
        let darkest = sunInfo.sunTimes.darkestMomentOfTheNight
        //        let darkestDate = Date.dateFrom(customString: darkest, with: .ISO8601)
        //        let darkestHour = Date.getHour(from: darkestDate, withFormat: .hourAndMinutes)
        
        print("dfdsf",sunrise, darkest)
        let sunriseFragment = sunrise.components(separatedBy: "T")
        let fragmentSunriseDay = sunriseFragment[0]
        let fragmentSunriseHour = sunriseFragment[1]
        let fragmentSH = fragmentSunriseHour.components(separatedBy: ".")
        let sunriseHour = fragmentSH[0]
        
        let darkestFragment = darkest.components(separatedBy: "T")
        let fragmentDarkestDay = darkestFragment[0]
        let fragmentDarkestHour = darkestFragment[1]
        let fragmentDH = fragmentDarkestHour.components(separatedBy: ".")
        let darkestHour = fragmentDH[0]
        print(fragmentSunriseDay," hour ",fragmentSunriseHour)
        labelNames = ["sunrise \(sunriseHour)", "darkest \(darkestHour)"]
        
        for i in 0..<stackView.subviews.count {
            let label =  stackView.subviews[i] as! UILabel
            label.text = labelNames[i]
        }
        //        let formatter = DateFormatter()
        //        formatter.dateFormat = "yyyy/MM/dd HH:mm"
        //        let someDateTime = formatter.date(from: "2019/11/17 00:00")
        //        print(someDateTime!)
        //
        //        let remaining = someDateTime!.distance(to: sunriseDate)
        //        print(remaining)
        
        //        let numb = CGFloat(remaining)
        //        print("hours \(numb/3600)")
    }
}

extension MainView: UICollectionViewDelegate, UICollectionViewDataSource, UICollectionViewDelegateFlowLayout {
    
    func collectionView(_ collectionView: UICollectionView, numberOfItemsInSection section: Int) -> Int {
        return 4
    }
    
    func collectionView(_ collectionView: UICollectionView, cellForItemAt indexPath: IndexPath) -> UICollectionViewCell {
        let cell = collectionView.dequeueReusableCell(withReuseIdentifier: sunReuseIdCell, for: indexPath) as! SunCollectionViewCell
        cell.view.backgroundColor = .green
        let values: [CGFloat] = [100,120,40,50,60,70]
        cell.label.text = ["sun info1","sun2","sun3","sun4"].randomElement()!
        cell.viewHeightAnchor.constant = values.randomElement()!
        return cell
    }
    
    func collectionView(_ collectionView: UICollectionView, layout collectionViewLayout: UICollectionViewLayout, sizeForItemAt indexPath: IndexPath) -> CGSize {
        return CGSize(width: (headerView.frame.width / 4) - 60, height: collectionView.frame.height)
    }
    
}
