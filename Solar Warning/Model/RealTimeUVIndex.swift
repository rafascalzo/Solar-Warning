//
//  RealTimeUVIndex.swift
//  Solar Warning
//
//  Created by rafaeldelegate on 11/16/19.
//  Copyright © 2019 rafaeldelegate. All rights reserved.
//

import Foundation

struct RealTimeUVIndexResponse: Decodable {
    
    var results: RealTimeUVIndex
    
    private enum CodingKeys: String, CodingKey {
        case results = "result"
    }
}

struct RealTimeUVIndex: Decodable {
    /// UV Index (real-time or forecasted depending on dtparameter)
    var uvIndex:Double
    /// UV Index datetime in UTC, yyyy-MM-ddTHH:mm:ss.SSSZ,[ISO-8601]
    var uvTime: String
    /// Max UV Index for the day (at solar noon)
    var uvMax: Double
    /// max UV Index datetime (solar noon) in UTC, yyyy-MM-ddTHH:mm:ss.SSSZ,[ISO-8601]
    var uvMaxTime: String
    /// ozone level in du (Dobson Units) from OMI data or request (if provided),[Double]
    var ozone: Double
    /// Latest OMI ozone update datetime in UTC, yyyy-MM-ddTHH:mm:ss.SSSZ,[ISO-8601]
    var ozoneTime: String
    /// safe exposure time for Fitzpatrick Skin Types
    var safeExposureTime: SafeExposureTime?
    /// (*courtesy of suncalc.js)
    var sunInfo: Sun
    
    private enum CodingKeys: String, CodingKey {
        case uvIndex = "uv"
        case uvTime = "uv_time"
        case uvMax = "uv_max"
        case uvMaxTime = "uv_max_time"
        case ozone = "ozone"
        case ozoneTime = "ozone_time"
        case safeExposureTime = "safe_exposure_time"
        case sunInfo = "sun_info"
    }
}
struct Sun: Decodable {
    
    var sunTimes: SunTimes
    var sunPosition: SunPosition
    
    private enum CodingKeys: String, CodingKey {
        case sunTimes = "sun_times"
        case sunPosition = "sun_position"
    }
}
struct SunTimes: Decodable {
    /// sunrise:sunrise (top edge of the sun appears on the horizon)
    var sunrise: String
    /// sunriseEnd:sunrise ends (bottom edge of the sun touches the horizon) ,[ISO-8601]
    var sunriseEnd: String
    /// goldenHourEnd:morning golden hour (soft light, best time for photography) ends ,[ISO-8601]
    var goldenHourEnd: String
    /// solarNoon:solar noon (sun is in the highest position) ,[ISO-8601]
    var solarNoon: String
    /// goldenHour:evening golden hour starts ,[ISO-8601]
    var goldenHourStart: String
    /// sunsetStart:sunset starts (bottom edge of the sun touches the horizon) ,[ISO-8601]
    var sunsetStart: String
    /// sunset:sunset starts (bottom edge of the sun touches the horizon) ,[ISO-8601]
    var sunset: String
    /// dusk:dusk (evening nautical twilight starts) ,[ISO-8601]
    var dusk: String
    /// nauticalDusk:nautical dusk (evening astronomical twilight starts) ,[ISO-8601]
    var nauticalDusk: String
    /// night:night starts (dark enough for astronomical observations) ,[ISO-8601]
    var nightStart: String
    /// nadir:nadir (darkest moment of the night, sun is in the lowest position) ,[ISO-8601]
    var darkestMomentOfTheNight: String
    /// nightEnd:night ends (morning astronomical twilight starts) ,[ISO-8601]
    var nightEnd: String
    /// nauticalDawn:nautical dawn (morning nautical twilight starts) ,[ISO-8601]
    var nauticalDawn: String
    /// dawn:dawn (morning nautical twilight ends, morning civil twilight starts) ,[ISO-8601]
    var dawn: String
    
    private enum CodingKeys: String, CodingKey {
        case sunrise = "sunrise"
        case sunriseEnd = "sunriseEnd"
        case goldenHourEnd = "goldenHourEnd"
        case solarNoon = "solarNoon"
        case goldenHourStart = "goldenHour"
        case sunsetStart = "sunsetStart"
        case sunset = "sunset"
        case dusk = "dusk"
        case nauticalDusk = "nauticalDusk"
        case nightStart = "night"
        case darkestMomentOfTheNight = "nadir"
        case nightEnd = "nightEnd"
        case nauticalDawn = "nauticalDawn"
        case dawn = "dawn"
    }
}
struct SunPosition: Decodable {
    //azimuth:sun azimuth in radians (direction along the horizon, measured from south to west), e.g. 0 is south and Math.PI * 3/4 is northwest ,[Double]
    var azimuth: Double
    //altitude:sun altitude above the horizon in radians, e.g. 0 at the horizon and PI/2 at the zenith (straight over your head) ,[Double]
    var altitude: Double
    
    private enum CodingKeys: String, CodingKey {
        case azimuth, altitude
    }
}
struct SafeExposureTime: Decodable {
    /// safe exposure time (mins) till burn for Skin Type 1
    var skinType1: Int?
    //safe exposure time (mins) till burn for Skin Type 2,[Number]
    var skinType2: Int?
    //safe exposure time (mins) till burn for Skin Type 3,[Number]
    var skinType3: Int?
    //safe exposure time (mins) till burn for Skin Type 4,[Number]
    var skinType4: Int?
    //safe exposure time (mins) till burn for Skin Type 5,[Number]
    var skinType5: Int?
    //safe exposure time (mins) till burn for Skin Type 6,[Number]
    var skinType6: Int?
    
    private enum CodingKeys: String, CodingKey {
        case skinType1 = "st1"
        case skinType2 = "st2"
        case skinType3 = "st3"
        case skinType4 = "st4"
        case skinType5 = "st5"
        case skinType6 = "st6"
    }
}
