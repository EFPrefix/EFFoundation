//
//  UITableView+.swift
//  EFFoundation
//
//  Created by EyreFree on 2019/8/22.
//

#if os(iOS)
import UIKit

// Already in UIView+.swift
// extension UITableView: EFFoundationCompatible { }
public extension EFFoundationWrapper where Base == UITableView {

    var currentSection: Int {
        if let indexPath = base.indexPathsForVisibleRows?.first {
            return indexPath.section
        }
        return 0
    }

    var currentRow: Int {
        if let indexPath = base.indexPathsForVisibleRows?.first {
            return indexPath.row
        }
        return 0
    }

    func reloadSectionsWithoutAnimation(indexSet: IndexSet) {
        DispatchQueue.main.async { [weak base] in
            guard let base = base else { return }
            UIView.performWithoutAnimation { [weak base] in
                guard let base = base else { return }
                base.reloadSections(indexSet, with: .none)
            }
        }
    }

    func reloadRowsWithoutAnimation(indexPathArray: [IndexPath]) {
        DispatchQueue.main.async { [weak base] in
            guard let base = base else { return }
            UIView.performWithoutAnimation { [weak base] in
                guard let base = base else { return }
                base.reloadRows(at: indexPathArray, with: .none)
            }
        }
    }
}
#endif
