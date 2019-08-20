//
//  Date+.swift
//  EFFoundation
//
//  Created by EyreFree on 2019/8/14.
//

import UIKit

public extension Date {

    var isToday: Bool {
        return Calendar.current.isDateInToday(self)
    }

    var isThisYear: Bool {
        let calendar = Calendar.current
        let nowCmps: DateComponents = calendar.dateComponents([Calendar.Component.year], from: Date())
        let selfCmps: DateComponents = calendar.dateComponents([Calendar.Component.year], from: self)
        return nowCmps.year == selfCmps.year
    }

    func before(nHour: Int) -> Date {
        return self.addingTimeInterval(-(nHour * 3600).double)
    }

    func after(nHour: Int) -> Date {
        return self.addingTimeInterval((nHour * 3600).double)
    }

    func before(nDay: Int) -> Date {
        return self.addingTimeInterval(-(nDay * 86400).double)
    }

    func after(nDay: Int) -> Date {
        return self.addingTimeInterval((nDay * 86400).double)
    }

    func before(nWeek: Int) -> Date {
        return self.addingTimeInterval(-(nWeek * 604800).double)
    }

    func after(nWeek: Int) -> Date {
        return self.addingTimeInterval((nWeek * 604800).double)
    }

    func toString(format: String = "yyyy-MM-dd HH:mm") -> String {
        let dateFormatter: DateFormatter = DateFormatter()
        dateFormatter.dateFormat = format
        dateFormatter.timeZone = NSTimeZone.local
        return dateFormatter.string(from: self)
    }
}
