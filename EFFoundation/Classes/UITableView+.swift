//
//  UITableView+.swift
//  EFFoundation
//
//  Created by EyreFree on 2019/8/22.
//

import UIKit

extension UITableView {

    var currentSection: Int {
        if let indexPath = self.indexPathsForVisibleRows?.first {
            return indexPath.section
        }
        return 0
    }

    var currentRow: Int {
        if let indexPath = self.indexPathsForVisibleRows?.first {
            return indexPath.row
        }
        return 0
    }

    func reloadSectionsWithoutAnimation(indexSet: IndexSet) {
        DispatchQueue.main.async { [weak self] in
            guard let self = self else { return }
            UIView.performWithoutAnimation { [weak self] in
                guard let self = self else { return }
                self.reloadSections(indexSet, with: .none)
            }
        }
    }

    func reloadRowsWithoutAnimation(indexPathArray: [IndexPath]) {
        DispatchQueue.main.async { [weak self] in
            guard let self = self else { return }
            UIView.performWithoutAnimation { [weak self] in
                guard let self = self else { return }
                self.reloadRows(at: indexPathArray, with: .none)
            }
        }
    }
}
