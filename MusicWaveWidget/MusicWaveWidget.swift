//
//  MusicWaveWidget.swift
//  MusicWaveWidget
//
//  Created by Saravjeet Singh on 2023-04-08.
//

import WidgetKit
import SwiftUI
import AVKit
import Intents

struct Provider: IntentTimelineProvider {
    func placeholder(in context: Context) -> SimpleEntry {
        SimpleEntry(date: Date(), configuration: ConfigurationIntent())
    }

    func getSnapshot(for configuration: ConfigurationIntent, in context: Context, completion: @escaping (SimpleEntry) -> ()) {
        let entry = SimpleEntry(date: Date(), configuration: configuration)
        completion(entry)
    }

    func getTimeline(for configuration: ConfigurationIntent, in context: Context, completion: @escaping (Timeline<Entry>) -> ()) {
        var entries: [SimpleEntry] = []

        // Generate a timeline consisting of five entries an hour apart, starting from the current date.
        let currentDate = Date()
        for hourOffset in 0 ..< 5 {
            let entryDate = Calendar.current.date(byAdding: .hour, value: hourOffset, to: currentDate)!
            let entry = SimpleEntry(date: entryDate, configuration: configuration)
            entries.append(entry)
        }

        let timeline = Timeline(entries: entries, policy: .atEnd)
        completion(timeline)
    }
}

struct SimpleEntry: TimelineEntry {
    let date: Date
    let configuration: ConfigurationIntent
}



struct MeditationStruct : Identifiable {
    let id  = UUID()
    let title : String
    let image : String
    
    
    static let data = MeditationStruct(title: "1 minute relaxing Meditation", image: "med_1_1")
    
}



struct MusicWaveWidgetEntryView : View {
    var entry: Provider.Entry
    var meditation = MeditationStruct.data
    
    var body: some View {
        VStack{
            Text(entry.date, style: .time)
            
            
            ZStack{
                // MARK: Bakcground Image
                Image(meditation.image)
                    .resizable()
                    .scaledToFill()
                    .frame(width:UIScreen.main.bounds.width)
                
                
                VStack(spacing:32){
                    
                    //MARK: Title
                    Text(meditation.title)
                        .font(.title)
                        .foregroundColor(.white)
                    
                    
                    
                    //MARK: playback control
                    
                    HStack{
                        
                        
                        //MARK: play button
                        Button{
                            
                            
                        }label: {
                            // audioManger.isPlaying ? "pause.circle.fill" : "play.circle.fill"
                            Image(systemName: "play.circle.fill")
                                .font(.system(size: 44))
                        }
                        
                    
                    }
                }
                
            } // z stack end
            
        }
    }
}

@main
struct MusicWaveWidget: Widget {
    let kind: String = "MusicWaveWidget"

    var body: some WidgetConfiguration {
        IntentConfiguration(kind: kind, intent: ConfigurationIntent.self, provider: Provider()) { entry in
            MusicWaveWidgetEntryView(entry: entry)
        }
        .configurationDisplayName("Music Widget")
        .description("Play random music from app.")
    }
}

struct MusicWaveWidget_Previews: PreviewProvider {
    static var previews: some View {
        MusicWaveWidgetEntryView(entry: SimpleEntry(date: Date(), configuration: ConfigurationIntent()))
            .previewContext(WidgetPreviewContext(family: .systemSmall))
    }
}



