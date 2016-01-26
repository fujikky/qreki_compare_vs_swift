#!/usr/bin/swift

import Foundation

let yearForWeekOfYearOffset = 2637

let arguments = NSProcessInfo.processInfo().arguments
let appName = (arguments[0] as NSString).lastPathComponent
let dateString = arguments[1].componentsSeparatedByString("=")[1]
//print("App: \(appName)")
//print("Date: \(dateString)")

let gregorianCalendar = NSCalendar(calendarIdentifier: NSCalendarIdentifierGregorian)!
let inDateFormatter = NSDateFormatter()
inDateFormatter.dateFormat = "yyyy-MM-dd"
inDateFormatter.calendar = gregorianCalendar
inDateFormatter.locale = NSLocale(localeIdentifier: "en_US_POSIX")
guard let date = inDateFormatter.dateFromString(dateString) else {
    exit(EXIT_FAILURE)
}

let chineseCalendar = NSCalendar(calendarIdentifier: NSCalendarIdentifierChinese)!

let outDateFormatter = NSDateFormatter()
outDateFormatter.dateFormat = "uuuu-MM-dd"
outDateFormatter.calendar = chineseCalendar
outDateFormatter.locale = NSLocale(localeIdentifier: "en_US_POSIX")
var outDateString = outDateFormatter.stringFromDate(date)

// 年の変換
let range = Range<String.Index>(start: outDateString.startIndex, end: outDateString.startIndex.advancedBy(4))
guard let year = Int(outDateString.substringWithRange(range)) else {
    exit(EXIT_FAILURE)
}
outDateString.replaceRange(range, with: String(year - yearForWeekOfYearOffset))

// 閏月の変換
if let bisRange = outDateString.rangeOfString("bis") {
    outDateString.removeRange(bisRange)
    outDateString.appendContentsOf(" L")
}

print("\(outDateString)")



