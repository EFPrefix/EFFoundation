//
//  Date+.swift
//  EFFoundation
//
//  Created by EyreFree on 2019/8/14.
//

import Foundation

extension Date: EFFoundationCompatible { }
public extension EFFoundationWrapper where Base == Date {

    var isToday: Bool {
        return Calendar.current.isDateInToday(base)
    }

    var isThisWeek: Bool {
        guard isThisYear else { return false }
        let calendar = Calendar.current
        let nowCmps: DateComponents = calendar.dateComponents([Calendar.Component.weekOfYear], from: Date())
        let selfCmps: DateComponents = calendar.dateComponents([Calendar.Component.weekOfYear], from: base)
        return nowCmps.weekOfYear == selfCmps.weekOfYear
    }

    var isThisMonth: Bool {
        guard isThisYear else { return false }
        let calendar = Calendar.current
        let nowCmps: DateComponents = calendar.dateComponents([Calendar.Component.month], from: Date())
        let selfCmps: DateComponents = calendar.dateComponents([Calendar.Component.month], from: base)
        return nowCmps.month == selfCmps.month
    }

    var isThisYear: Bool {
        let calendar = Calendar.current
        let nowCmps: DateComponents = calendar.dateComponents([Calendar.Component.year], from: Date())
        let selfCmps: DateComponents = calendar.dateComponents([Calendar.Component.year], from: base)
        return nowCmps.year == selfCmps.year
    }

    func before(nHour: Int) -> Date {
        return base.addingTimeInterval(-(nHour * 3600).ef.double)
    }

    func after(nHour: Int) -> Date {
        return base.addingTimeInterval((nHour * 3600).ef.double)
    }

    func before(nDay: Int) -> Date {
        return base.addingTimeInterval(-(nDay * 86400).ef.double)
    }

    func after(nDay: Int) -> Date {
        return base.addingTimeInterval((nDay * 86400).ef.double)
    }

    func before(nWeek: Int) -> Date {
        return base.addingTimeInterval(-(nWeek * 604800).ef.double)
    }

    func after(nWeek: Int) -> Date {
        return base.addingTimeInterval((nWeek * 604800).ef.double)
    }

    func toString(format: String = "yyyy-MM-dd HH:mm") -> String {
        let dateFormatter: DateFormatter = DateFormatter()
        dateFormatter.dateFormat = format
        dateFormatter.timeZone = NSTimeZone.local
        return dateFormatter.string(from: base)
    }
}
