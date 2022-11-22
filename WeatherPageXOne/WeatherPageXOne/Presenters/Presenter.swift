//
//  Presenter.swift
//  WeatherPageXOne
//
//  Created by Kyzu on 21.11.22.
//

import Foundation



final class Presenter {
    weak private var viewInputDelegate: ViewInputDelegate?
    var testData: JSONResponse? = JSONManager.shared.fetchingInformation(for: "TestTaskJSON")
    
    func setViewInputDelegate(viewInputDelegate: ViewInputDelegate) {
        self.viewInputDelegate = viewInputDelegate
    }
    
    private func loadData() {
        guard let data = testData else { return }
        self.viewInputDelegate?.setupData(testData: data)
    }
}

extension Presenter: ViewOutputDelegate {
    func getData() {
        self.loadData()
    }
}
