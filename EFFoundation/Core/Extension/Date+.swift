//
//  Date+.swift
//  EFFoundation
//
//  Created by EyreFree on 2019/8/14.
//

import Foundation

public extension Date {
    
    func string(format: String = "yyyy-MM-dd HH:mm") -> String {
        let dateFormatter: DateFormatter = DateFormatter()
        dateFormatter.dateFormat = format
        dateFormatter.timeZone = NSTimeZone.local
        dateFormatter.locale = Locale.current
        return dateFormatter.string(from: self)
    }
    
    var readable: String {
        var format = "yyyy-MM-dd HH:mm"
        let currentDate: Date = Date()
        if currentDate.sameSecond(with: self) {
            return "刚刚"
        } else if currentDate.sameMinute(with: self) {
            return "\(currentDate.second - self.second) 秒前"
        } else if currentDate.sameHour(with: self) {
            return "\(currentDate.minute - self.minute) 分钟前"
        } else if currentDate.sameDay(with: self) == true {
            format = "HH:mm"
        } else if currentDate.sameYear(with: self) {
            format = "MM-dd HH:mm"
        }
        return string(format: format)
    }
}

// MARK:- Components
public extension Date {
    
    func component(component: Calendar.Component) -> Int {
        return Calendar.current.component(component, from: self)
    }
    
    var era: Int {
        return component(component: Calendar.Component.era)
    }
    
    var year: Int {
        return component(component: Calendar.Component.year)
    }
    
    var month: Int {
        return component(component: Calendar.Component.month)
    }
    
    var day: Int {
        return component(component: Calendar.Component.day)
    }
    
    var hour: Int {
        return component(component: Calendar.Component.hour)
    }
    
    var minute: Int {
        return component(component: Calendar.Component.minute)
    }
    
    var second: Int {
        return component(component: Calendar.Component.second)
    }
    
    var weekday: Int {
        return component(component: Calendar.Component.weekday)
    }
    
    var weekdayOrdinal: Int {
        return component(component: Calendar.Component.weekdayOrdinal)
    }
    
    var quarter: Int {
        return component(component: Calendar.Component.quarter)
    }
    
    var weekOfMonth: Int {
        return component(component: Calendar.Component.weekOfMonth)
    }
    
    var weekOfYear: Int {
        return component(component: Calendar.Component.weekOfYear)
    }
    
    var yearForWeekOfYear: Int {
        return component(component: Calendar.Component.yearForWeekOfYear)
    }
    
    var nanosecond: Int {
        return component(component: Calendar.Component.nanosecond)
    }
    
    var calendar: Int {
        return component(component: Calendar.Component.calendar)
    }
    
    var timeZone: Int {
        return component(component: Calendar.Component.timeZone)
    }
}

// MARK:- Compare
public extension Date {
    
    func sameEra(with date: Date) -> Bool {
        let calendar = Calendar.current
        return calendar.component(Calendar.Component.era, from: date) == calendar.component(Calendar.Component.era, from: self)
    }
    
    func sameYear(with date: Date) -> Bool {
        let calendar = Calendar.current
        return calendar.component(Calendar.Component.year, from: date) == calendar.component(Calendar.Component.year, from: self)
    }
    
    func sameMonth(with date: Date) -> Bool {
        let calendar = Calendar.current
        return calendar.component(Calendar.Component.month, from: date) == calendar.component(Calendar.Component.month, from: self)
    }
    
    func sameDay(with date: Date) -> Bool {
        let calendar = Calendar.current
        return calendar.component(Calendar.Component.day, from: date) == calendar.component(Calendar.Component.day, from: self)
    }
    
    func sameHour(with date: Date) -> Bool {
        let calendar = Calendar.current
        return calendar.component(Calendar.Component.hour, from: date) == calendar.component(Calendar.Component.hour, from: self)
    }
    
    func sameMinute(with date: Date) -> Bool {
        let calendar = Calendar.current
        return calendar.component(Calendar.Component.minute, from: date) == calendar.component(Calendar.Component.minute, from: self)
    }
    
    func sameSecond(with date: Date) -> Bool {
        let calendar = Calendar.current
        return calendar.component(Calendar.Component.second, from: date) == calendar.component(Calendar.Component.second, from: self)
    }
    
    func sameWeekday(with date: Date) -> Bool {
        let calendar = Calendar.current
        return calendar.component(Calendar.Component.weekday, from: date) == calendar.component(Calendar.Component.weekday, from: self)
    }
    
    func sameWeekdayOrdinal(with date: Date) -> Bool {
        let calendar = Calendar.current
        return calendar.component(Calendar.Component.weekdayOrdinal, from: date) == calendar.component(Calendar.Component.weekdayOrdinal, from: self)
    }
    
    func sameQuarter(with date: Date) -> Bool {
        let calendar = Calendar.current
        return calendar.component(Calendar.Component.quarter, from: date) == calendar.component(Calendar.Component.quarter, from: self)
    }
    
    func sameWeekOfMonth(with date: Date) -> Bool {
        let calendar = Calendar.current
        return calendar.component(Calendar.Component.weekOfMonth, from: date) == calendar.component(Calendar.Component.weekOfMonth, from: self)
    }
    
    func sameWeekOfYear(with date: Date) -> Bool {
        let calendar = Calendar.current
        return calendar.component(Calendar.Component.weekOfYear, from: date) == calendar.component(Calendar.Component.weekOfYear, from: self)
    }
    
    func sameYearForWeekOfYear(with date: Date) -> Bool {
        let calendar = Calendar.current
        return calendar.component(Calendar.Component.yearForWeekOfYear, from: date) == calendar.component(Calendar.Component.yearForWeekOfYear, from: self)
    }
    
    func sameNanosecond(with date: Date) -> Bool {
        let calendar = Calendar.current
        return calendar.component(Calendar.Component.nanosecond, from: date) == calendar.component(Calendar.Component.nanosecond, from: self)
    }
    
    var isThisEra: Bool {
        return sameEra(with: Date())
    }
    
    var isThisYear: Bool {
        return isThisEra && sameYear(with: Date())
    }
    
    var isThisMonth: Bool {
        return isThisYear && sameMonth(with: Date())
    }
    
    var isThisDay: Bool {
        return isThisMonth && sameDay(with: Date())
    }
    
    var isThisHour: Bool {
        return isThisDay && sameHour(with: Date())
    }
    
    var isThisMinute: Bool {
        return isThisHour && sameMinute(with: Date())
    }
    
    var isThisSecond: Bool {
        return isThisMinute && sameSecond(with: Date())
    }
    
    var isThisQuarter: Bool {
        return isThisHour && sameQuarter(with: Date())
    }
    
    var isThisNanosecond: Bool {
        return isThisSecond && sameNanosecond(with: Date())
    }
}

// MARK:- Change
public extension Date {
    
    func add(year: Int = 0, month: Int = 0, day: Int = 0, week: Int = 0, hour: Int = 0, minute: Int = 0, second: Int = 0, nanosecond: Int = 0) -> Date {
        let calendar = Calendar.current
        var date = self
        date = calendar.date(byAdding: Calendar.Component.year, value: year, to: date) ?? date
        date = calendar.date(byAdding: Calendar.Component.month, value: month, to: date) ?? date
        date = calendar.date(byAdding: Calendar.Component.weekOfYear, value: week, to: date) ?? date
        date = calendar.date(byAdding: Calendar.Component.day, value: day, to: date) ?? date
        date = calendar.date(byAdding: Calendar.Component.hour, value: hour, to: date) ?? date
        date = calendar.date(byAdding: Calendar.Component.minute, value: minute, to: date) ?? date
        date = calendar.date(byAdding: Calendar.Component.second, value: second, to: date) ?? date
        date = calendar.date(byAdding: Calendar.Component.nanosecond, value: nanosecond, to: date) ?? date
        return date
    }
    
    func before(nYear: Int) -> Date {
        return add(year: -nYear)
    }
    
    func after(nYear: Int) -> Date {
        return add(year: nYear)
    }
    
    func before(nMonth: Int) -> Date {
        return add(month: -nMonth)
    }
    
    func after(nMonth: Int) -> Date {
        return add(month: nMonth)
    }
    
    func before(nWeek: Int) -> Date {
        return addingTimeInterval(-(nWeek * 604800).double)
    }
    
    func after(nWeek: Int) -> Date {
        return addingTimeInterval((nWeek * 604800).double)
    }
    
    func before(nDay: Int) -> Date {
        return addingTimeInterval(-(nDay * 86400).double)
    }
    
    func after(nDay: Int) -> Date {
        return addingTimeInterval((nDay * 86400).double)
    }
    
    func before(nHour: Int) -> Date {
        return addingTimeInterval(-(nHour * 3600).double)
    }
    
    func after(nHour: Int) -> Date {
        return addingTimeInterval((nHour * 3600).double)
    }
    
    func before(nMinute: Int) -> Date {
        return addingTimeInterval(-(nMinute * 60).double)
    }
    
    func after(nMinute: Int) -> Date {
        return addingTimeInterval((nMinute * 60).double)
    }
    
    func before(nSecond: Int) -> Date {
        return addingTimeInterval(-(nSecond * 1).double)
    }
    
    func after(nSecond: Int) -> Date {
        return addingTimeInterval((nSecond * 1).double)
    }
    
    func before(nNanosecond: Int) -> Date {
        return add(nanosecond: -nNanosecond)
    }
    
    func after(nNanosecond: Int) -> Date {
        return add(nanosecond: nNanosecond)
    }
}
