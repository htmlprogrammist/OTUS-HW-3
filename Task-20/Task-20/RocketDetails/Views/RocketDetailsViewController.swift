//
//  RocketDetailsViewController.swift
//  Task-20
//
//  Created by Егор Бадмаев on 19.12.2022.
//  
//

import UIKit

final class RocketDetailsViewController: UIViewController {
    
    // MARK: - Private Properties
    
    private let presenter: RocketDetailsViewOutput
    var rocket: Rocket!
    
    private lazy var scrollView: UIScrollView = {
        let scrollView = UIScrollView()
        scrollView.showsVerticalScrollIndicator = false
        scrollView.contentInsetAdjustmentBehavior = .never
        scrollView.bounces = false
        scrollView.translatesAutoresizingMaskIntoConstraints = false
        return scrollView
    }()
    
    private lazy var topView: UIView = {
        let view = UIView()
        view.translatesAutoresizingMaskIntoConstraints = false
        return view
    }()
    lazy var imageView: UIImageView = {
        let imageView = UIImageView()
        imageView.contentMode = .scaleAspectFill
        imageView.layer.masksToBounds = true
        imageView.translatesAutoresizingMaskIntoConstraints = false
        return imageView
    }()
    private lazy var gradientLayer: CAGradientLayer = {
        let layer = CAGradientLayer()
        layer.colors = [UIColor.clear.cgColor, UIColor.black.withAlphaComponent(0.7).cgColor]
        layer.locations = [0.5, 1]
        layer.startPoint = CGPoint(x: 0, y: 0)
        layer.endPoint = CGPoint(x: 0, y: 1)
        return layer
    }()
    lazy var titleLabel: UILabel = {
        let label = UILabel()
        label.textColor = .white
        label.font = UIFont.systemFont(ofSize: 48, weight: .bold)
        label.translatesAutoresizingMaskIntoConstraints = false
        return label
    }()
    
    private lazy var contentView: UIView = {
        let view = UIView()
        view.alpha = 0
        view.translatesAutoresizingMaskIntoConstraints = false
        return view
    }()
    
    private lazy var enginesView: OverviewView = {
        let labels = ["Type", "Layout", "Version", "Amount", "Propellant 1", "Propellant 2"]
        let suffixes = ["", "", "", "", "", ""]
        let overview = OverviewView(titleText: "Engines", labels: labels, data: [], suffixes: suffixes)
        return overview
    }()
    private lazy var firstStageView: OverviewView = {
        let labels = ["Reusable", "Engines amount", "Fuel amount", "Burning time", "Thrust (sea level)", "Thrust (vacuum)"]
        let suffixes = ["", "", " tons", " seconds", " kN", " kN"]
        let overview = OverviewView(titleText: "First stage", labels: labels, data: [], suffixes: suffixes)
        return overview
    }()
    private lazy var secondStageView: OverviewView = {
        let labels = ["Reusable", "Engines amount", "Fuel amount", "Burning time", "Thrust"]
        let suffixes = ["", "", " tons", " seconds", " kN"]
        let overview = OverviewView(titleText: "Second stage", labels: labels, data: [], suffixes: suffixes)
        return overview
    }()
    
    private lazy var materialsLabel = UILabel(text: "Materials", size: 24, weight: .bold)
    private lazy var footer: UIView = {
        let view = UIView()
        view.translatesAutoresizingMaskIntoConstraints = false
        return view
    }()
    
    // MARK: - Init
    
    init(presenter: RocketDetailsViewOutput) {
        self.presenter = presenter
        
        super.init(nibName: nil, bundle: nil)
    }
    
    required init?(coder aDecoder: NSCoder) {
        fatalError("init(coder:) has not been implemented")
    }
    
    // MARK: - Life Cycle
    
    override func viewDidLoad() {
        super.viewDidLoad()
        
        view.backgroundColor = .systemBackground
        
        setupView()
        setConstraints()
        presenter.viewDidLoad()
    }
    
    override func viewDidAppear(_ animated: Bool) {
        super.viewDidAppear(animated)
        
        UIView.transition(with: contentView, duration: 0.4, options: [.transitionFlipFromTop, .curveEaseOut], animations: { [self] in
            contentView.alpha = 1
        }, completion: nil)
    }
    
    override func viewDidLayoutSubviews() {
        super.viewDidLayoutSubviews()
        
        gradientLayer.frame = imageView.layer.bounds
        fillInData()
    }
    
    override func viewWillDisappear(_ animated: Bool) {
        super.viewWillDisappear(animated)
        
        UIView.transition(with: contentView, duration: 0.15, options: [.transitionFlipFromTop, .curveEaseOut], animations: { [self] in
            contentView.alpha = 0
        }, completion: nil)
    }
    
    private func fillInData() {
        imageView.loadImage(for: rocket.flickrImages?.first ?? "")
        titleLabel.text = rocket.name
        
        enginesView.data = [rocket.engines?.type, rocket.engines?.layout, rocket.engines?.version, "\(String(describing: rocket.engines?.number))", rocket.engines?.propellant1, rocket.engines?.propellant2]
        var formattedTrueFalse = (rocket.firstStage?.reusable ?? false) ? "Yes": "No"
        firstStageView.data = [formattedTrueFalse, "\(String(describing: rocket.firstStage?.engines))", "\(String(describing: rocket.firstStage?.fuelAmountTons))", "\(String(describing: rocket.firstStage?.burnTimeSEC))", "\(String(describing: rocket.firstStage?.thrustSeaLevel?.kN))", "\(String(describing: rocket.firstStage?.thrustVacuum?.kN))"]
        
        formattedTrueFalse = (rocket.secondStage?.reusable ?? false) ? "Yes": "No"
        secondStageView.data = [formattedTrueFalse, "\(String(describing: rocket.secondStage?.engines))", "\(String(describing: rocket.secondStage?.fuelAmountTons))", "\(String(describing: rocket.secondStage?.burnTimeSEC))", "\(String(describing: rocket.secondStage?.thrust?.kN))"]
    }
    
    private func setupView() {
        view.addSubview(scrollView)
        
        scrollView.addSubview(topView)
        scrollView.contentInset = UIEdgeInsets(top: 0, left: 0, bottom: 20, right: 0)
        
        topView.addSubview(imageView)
        imageView.layer.addSublayer(gradientLayer)
        topView.addSubview(titleLabel)
        
        showDetails()
    }
    
    private func setConstraints() {
        NSLayoutConstraint.activate([
            scrollView.leadingAnchor.constraint(equalTo: view.leadingAnchor),
            scrollView.trailingAnchor.constraint(equalTo: view.trailingAnchor),
            scrollView.topAnchor.constraint(equalTo: view.topAnchor),
            scrollView.bottomAnchor.constraint(equalTo: view.bottomAnchor),
            
            topView.topAnchor.constraint(equalTo: scrollView.topAnchor),
            topView.leadingAnchor.constraint(equalTo: scrollView.leadingAnchor),
            topView.trailingAnchor.constraint(equalTo: scrollView.trailingAnchor),
            topView.bottomAnchor.constraint(equalTo: contentView.topAnchor),
            topView.widthAnchor.constraint(equalTo: view.widthAnchor),
            
            imageView.leadingAnchor.constraint(equalTo: topView.leadingAnchor),
            imageView.trailingAnchor.constraint(equalTo: topView.trailingAnchor),
            imageView.topAnchor.constraint(equalTo: topView.topAnchor),
            imageView.heightAnchor.constraint(equalTo: imageView.widthAnchor, multiplier: 383/414),
            
            titleLabel.leadingAnchor.constraint(equalTo: topView.leadingAnchor, constant: 20),
            titleLabel.trailingAnchor.constraint(equalTo: topView.trailingAnchor, constant: -10),
            titleLabel.bottomAnchor.constraint(equalTo: imageView.bottomAnchor, constant: -20),
        ])
    }
    
    private func showDetails() {
        scrollView.addSubview(contentView)
        
        [enginesView, firstStageView, secondStageView].forEach {
            contentView.addSubview($0)
            $0.translatesAutoresizingMaskIntoConstraints = false
        }
        
        NSLayoutConstraint.activate([
            contentView.topAnchor.constraint(equalTo: imageView.bottomAnchor),
            contentView.leadingAnchor.constraint(equalTo: scrollView.leadingAnchor),
            contentView.trailingAnchor.constraint(equalTo: scrollView.trailingAnchor),
            contentView.bottomAnchor.constraint(equalTo: scrollView.bottomAnchor),
            contentView.widthAnchor.constraint(equalTo: view.widthAnchor),
            
            enginesView.topAnchor.constraint(equalTo: contentView.topAnchor, constant: 30),
            enginesView.leadingAnchor.constraint(equalTo: contentView.leadingAnchor, constant: 20),
            enginesView.trailingAnchor.constraint(equalTo: contentView.trailingAnchor, constant: -20),
            
            firstStageView.leadingAnchor.constraint(equalTo: contentView.leadingAnchor, constant: 20),
            firstStageView.topAnchor.constraint(equalTo: enginesView.mainStackView.bottomAnchor, constant: 30),
            firstStageView.trailingAnchor.constraint(equalTo: contentView.trailingAnchor, constant: -20),
            
            secondStageView.leadingAnchor.constraint(equalTo: contentView.leadingAnchor, constant: 20),
            secondStageView.topAnchor.constraint(equalTo: firstStageView.mainStackView.bottomAnchor, constant: 30),
            secondStageView.trailingAnchor.constraint(equalTo: contentView.trailingAnchor, constant: -20)
        ])
        
        contentView.addSubview(footer)
        NSLayoutConstraint.activate([
            footer.topAnchor.constraint(equalTo: secondStageView.mainStackView.bottomAnchor),
            footer.bottomAnchor.constraint(equalTo: contentView.bottomAnchor),
            footer.heightAnchor.constraint(equalToConstant: 20)
        ])
    }
}

extension RocketDetailsViewController: RocketDetailsViewInput {
    func showData(data: Rocket) {
        rocket = data
    }
}
