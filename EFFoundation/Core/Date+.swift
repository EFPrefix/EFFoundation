//
//  Date+.swift
//  EFFoundation
//
//  Created by EyreFree on 2019/8/14.
//

import Foundation

public extension Date {

    var isToday: Bool {
        return Calendar.current.isDateInToday(self)
    }

    var isThisWeek: Bool {
        return sameWeek(with: Date())
    }

    var isThisMonth: Bool {
        return sameMonth(with: Date())
    }

    var isThisYear: Bool {
        return sameYear(with: Date())
    }
    
    func sameYear(with date: Date) -> Bool {
        let calendar = Calendar.current
        let nowCmps: DateComponents = calendar.dateComponents([Calendar.Component.year], from: date)
        let selfCmps: DateComponents = calendar.dateComponents([Calendar.Component.year], from: self)
        return nowCmps.year == selfCmps.year
    }
    
    func sameMonth(with date: Date) -> Bool {
        guard sameYear(with: date) else { return false }
        let calendar = Calendar.current
        let nowCmps: DateComponents = calendar.dateComponents([Calendar.Component.month], from: date)
        let selfCmps: DateComponents = calendar.dateComponents([Calendar.Component.month], from: self)
        return nowCmps.month == selfCmps.month
    }
    
    func sameWeek(with date: Date) -> Bool {
        guard sameYear(with: date) else { return false }
        let calendar = Calendar.current
        let nowCmps: DateComponents = calendar.dateComponents([Calendar.Component.weekOfYear], from: date)
        let selfCmps: DateComponents = calendar.dateComponents([Calendar.Component.weekOfYear], from: self)
        return nowCmps.weekOfYear == selfCmps.weekOfYear
    }
    
    func sameDay(with date: Date) -> Bool {
        guard sameMonth(with: date) else { return false }
        let calendar = Calendar.current
        let nowCmps: DateComponents = calendar.dateComponents([Calendar.Component.day], from: date)
        let selfCmps: DateComponents = calendar.dateComponents([Calendar.Component.day], from: self)
        return nowCmps.day == selfCmps.day
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
    
    func readable() -> String {
        let dateFormatter = DateFormatter()
        dateFormatter.locale = Locale.current
        
        if Date().sameDay(with: self) == true {
            dateFormatter.dateFormat = "HH:mm"
            return dateFormatter.string(from: self).uppercased()
        } else {
            dateFormatter.dateFormat = "yyyy-MM-dd HH:mm"
            return dateFormatter.string(from: self).uppercased()
        }
    }
}
