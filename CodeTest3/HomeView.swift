//
//  ContentView.swift
//  CodeTest3
//
//  Created by Hein Aung on 27/07/2023.
//

import SwiftUI

struct HomeView: View {
    
    @StateObject var homeViewModel =  HomeViewModel()
    @State var selection = 0
    var titles = ["By Room", "By Rates"]
    
    var body: some View {
        VStack(alignment: .leading) {
            // TopBar
            TopBar()
            // Content
            ScrollView(.vertical, showsIndicators: false) {
                VStack(alignment: .leading, spacing: 12) {
                    TitleText()
                    AddressText()
                    ImageBanner()
                    ButtonRow()
                    Tabs()
                }
            }
            Spacer()
        }
    }
    
    @ViewBuilder
    func TopBar() -> some View {
        HStack {
            Button {
                ///
            } label: {
                Image(systemName: "arrow.backward")
                    .renderingMode(.template)
                    .foregroundColor(Constant.mainTheme)
            }
            Spacer()
            Button {
                ///TODO
            } label: {
                Image("currency")
            }
            
            Button {
                ///TODO
            } label: {
                Image("chatactive")
            }
        }
        .padding()
    }
    
    @ViewBuilder
    func TitleText() -> some View {
        HStack {
            Text("Furama Riverfront, Singapore")
                .withTitleTextFormatting(size: 30)
            Spacer()
            Button {
                ///
            } label: {
                Image(systemName: "chevron.right")
                    .renderingMode(.template)
                    .foregroundColor(Constant.mainTheme)
            }
        }
        .padding(.horizontal)
    }
    
    @ViewBuilder
    func AddressText() -> some View {
        HStack {
            Text("405 Havelock Road, Singapore 169633")
                .withNormalTextFormatting()
            Spacer()
            Button {
                ///TODO
            } label: {
                Image("currentlocation")
            }
        }.padding(.horizontal)
    }
    
    @ViewBuilder
    func ImageBanner() -> some View {
        ZStack {
            
            ScrollView(.horizontal, showsIndicators: false) {
                HStack {
                    ForEach(homeViewModel.images, id: \.self) { image in
                        Image(image)
                            .resizable()
                            .aspectRatio(contentMode: .fill)
                            .frame(height: 150)
                            .clipped()
                    }
                }
            }
            .padding(.bottom)
            
            VStack {
                Spacer()
                HStack {
                    Spacer()
                    Button {
                        ///TODO see all
                    } label: {
                        ZStack {
                            Image("shape1")
                                .opacity(0.9)
                            Text("See All 2/68")
                                .withSmallTextFormatting(color: .white, size: FontSize.badge)
                        }
                    }
                    
                }
                .padding(.horizontal)
            }
            
        }
        
    }
    
    @ViewBuilder
    func ButtonRow() -> some View {
        HStack(spacing: 12){
            ReuseableButton(title: "Amenties", image: "theme")
            ReuseableButton(title: "Facilities", image: "workout")
            ReuseableButton(title: "F&B", image: "fnb")
            ReuseableButton(title: "Kids/Family", image: "kidsfamily")
            ReuseableButton(title: "Wellness", image: "wellness")
        }
        .padding(.horizontal)
    }
    
    @ViewBuilder
    func ReuseableButton(title: String, image: String) -> some View {
        Button {
            ///
        } label: {
            VStack {
                Image(image)
                    .resizable()
                    .aspectRatio(contentMode: .fit)
                    .frame(width: 50, height: 50)
                Text(title)
                    .withSmallTextFormatting()
            }
        }
    }
    
    @ViewBuilder
    func Tabs() -> some View {
        Picker(selection: self.$selection, label: Text("")) {
            ForEach(0..<self.titles.count) { index in
                Text(self.titles[index]).tag(index)
            }
        }
        .foregroundColor(Constant.darkGreen)
        .pickerStyle(SegmentedPickerStyle())
        .padding(.horizontal)
        .padding(.top)
        
        if self.titles[self.selection] == "By Room" {
            ForEach(homeViewModel.rooms, id: \.self) { room in
                Tab1Card(room: room)
            }
        } else {
            ForEach(homeViewModel.rooms, id: \.self) { index in
                Tab2Card()
            }
        }
    }
    
    @ViewBuilder
    func Tab1Card(room: Room) -> some View {
        VStack(alignment: .leading) {
            Image(room.image)
                .resizable()
                .aspectRatio(contentMode: .fill)
                .frame(height: 150)
                .clipped()
            HStack {
                VStack(alignment: .leading) {
                    Text(room.title)
                        .withTitleTextFormatting()
                    Text(room.description)
                        .withSmallTextFormatting()
                        .lineLimit(1)
                }
                Spacer()
                Button {
                    ///TODO
                } label: {
                    Text("View Rates")
                        .withNormalTextFormatting(color: Constant.mainTheme)
                        .padding()
                        .background(
                            Rectangle()
                                .stroke(Constant.mainTheme, lineWidth: 1)
                                .background( Rectangle()
                                    .foregroundColor(.white))
                        )
                }
                
            }
            
            HStack(alignment: .bottom, spacing: 0) {
                Text("Aug. Nagtly/ Room From")
                    .withNormalTextFormatting()
                Spacer()
                Text("SGD")
                    .withSmallTextFormatting()
                Text("161.42")
                    .withTitleTextFormatting()
            }
            
            Divider()
        }
        .padding()
    }
    
    @ViewBuilder
    func Tab2Card() -> some View {
        VStack(alignment: .leading) {
            VStack(alignment: .leading) {
                HStack {
                    VStack(alignment: .leading) {
                        Text("YOUR E-VOUCHER RATE")
                            .withNormalTextFormatting()
                        Text("Mobile App Special Voucher")
                            .withTitleTextFormatting()
                    }
                    Spacer()
                    Button {
                        ///
                    } label: {
                        Image(systemName: "chevron.right")
                            .renderingMode(.template)
                            .foregroundColor(Constant.mainTheme)
                    }
                }
                
                HStack {
                    ReuseableButton(title: "Inclusive of", image: "fnb")
                    ReuseableButton(title: "20% off\n In-Room Service", image: "discount")
                    Spacer()
                    Button {
                        ///TODO
                    } label: {
                        Text("View Rates")
                            .withNormalTextFormatting(color: Constant.mainTheme)
                            .padding()
                            .background(
                                Rectangle()
                                    .stroke(Constant.mainTheme, lineWidth: 1)
                                    .background( Rectangle()
                                        .foregroundColor(.white))
                            )
                    }
                }
                
                Divider()
                
                HStack {
                    VStack(alignment: .leading) {
                        Text("Aug. Nagtly/ Room From")
                            .withNormalTextFormatting()
                        Text(Constant.rawText)
                            .withSmallTextFormatting()
                            .lineLimit(1)
                    }
                    Spacer()
                    HStack(alignment: .bottom, spacing: 0) {
                        Text("SGD")
                            .withSmallTextFormatting()
                        Text("161.42")
                            .withTitleTextFormatting()
                    }
                }
            }
            .padding()
            
            Button {
                ///TODO
            } label: {
                Text("MEMBERS DEALS")
                    .padding()
                    .font(Font.system(size: FontSize.title3))
                    .foregroundColor(Constant.primaryTextColor)
                    .frame(maxWidth: .infinity)
                    .background(
                        Rectangle()
                            .foregroundColor(.yellow)
                    )
            }
        }
        .background(
            Rectangle()
                .strokeBorder(style: StrokeStyle(lineWidth: 1, dash: [5]))
        )
        .padding()
    }
    
}

struct ContentView_Previews: PreviewProvider {
    static var previews: some View {
        HomeView()
    }
}
