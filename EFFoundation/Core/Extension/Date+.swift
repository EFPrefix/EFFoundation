//
//  Date+.swift
//  EFFoundation
//
//  Created by EyreFree on 2019/8/14.
//

import Foundation

public extension Date {
    
    func string(dateFormat: String = "yyyy-MM-dd HH:mm", timeZone: TimeZone = NSTimeZone.local, locale: Locale = Locale.current) -> String {
        let dateFormatter: DateFormatter = DateFormatter()
        dateFormatter.dateFormat = dateFormat
        dateFormatter.timeZone = timeZone
        dateFormatter.locale = locale
        return dateFormatter.string(from: self)
    }
    
    var brief: String {
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
        return string(dateFormat: format)
    }
    
    var readable: String {
        let dateNow: Date = Date()
        let dateMargin: TimeInterval = dateNow.timeIntervalSince1970 - self.timeIntervalSince1970
        
        if dateNow == self || dateMargin < 0 {
            return "刚刚"
        } else if dateMargin < TimeInterval.minute(1) {
            let count: Int = (dateMargin / TimeInterval.second(1).double).int
            return "\(count) 秒前"
        } else if dateMargin < TimeInterval.hour(1) {
            let count: Int = (dateMargin / TimeInterval.minute(1).double).int
            return "\(count) 分钟前"
        } else if dateMargin < TimeInterval.day(1) {
            let count: Int = (dateMargin / TimeInterval.hour(1).double).int
            return "\(count) 小时前"
        } else if dateMargin < TimeInterval.week(1) {
            let count: Int = (dateMargin / TimeInterval.day(1).double).int
            return "\(count) 天前"
        } else if self.sameMonth(with: dateNow) {
            let count: Int = (dateMargin / TimeInterval.week(1).double).int
            return "\(count) 周前"
        } else if self.sameYear(with: dateNow) {
            let count: Int = (dateMargin / TimeInterval.day(30).double).int
            return "\(count) 个月前"
        }
        return self.string()
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
        return sameEra(with: date) && calendar.component(Calendar.Component.year, from: date) == calendar.component(Calendar.Component.year, from: self)
    }
    
    func sameQuarter(with date: Date) -> Bool {
        let calendar = Calendar.current
        return sameYear(with: date) && calendar.component(Calendar.Component.quarter, from: date) == calendar.component(Calendar.Component.quarter, from: self)
    }
    
    func sameMonth(with date: Date) -> Bool {
        let calendar = Calendar.current
        return sameYear(with: date) && calendar.component(Calendar.Component.month, from: date) == calendar.component(Calendar.Component.month, from: self)
    }
    
    func sameWeek(with date: Date) -> Bool {
        let calendar = Calendar.current
        return sameMonth(with: date) && calendar.component(Calendar.Component.weekOfMonth, from: date) == calendar.component(Calendar.Component.weekOfMonth, from: self)
    }
    
    func sameDay(with date: Date) -> Bool {
        let calendar = Calendar.current
        return sameMonth(with: date) && calendar.component(Calendar.Component.day, from: date) == calendar.component(Calendar.Component.day, from: self)
    }
    
    func sameHour(with date: Date) -> Bool {
        let calendar = Calendar.current
        return sameDay(with: date) && calendar.component(Calendar.Component.hour, from: date) == calendar.component(Calendar.Component.hour, from: self)
    }
    
    func sameMinute(with date: Date) -> Bool {
        let calendar = Calendar.current
        return sameHour(with: date) && calendar.component(Calendar.Component.minute, from: date) == calendar.component(Calendar.Component.minute, from: self)
    }
    
    func sameSecond(with date: Date) -> Bool {
        let calendar = Calendar.current
        return sameMinute(with: date) && calendar.component(Calendar.Component.second, from: date) == calendar.component(Calendar.Component.second, from: self)
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
    
    var isThisQuarter: Bool {
        return isThisHour && sameQuarter(with: Date())
    }
    
    var isThisMonth: Bool {
        return isThisYear && sameMonth(with: Date())
    }
    
    var isThisWeek: Bool {
        return isThisMonth && sameWeek(with: Date())
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
