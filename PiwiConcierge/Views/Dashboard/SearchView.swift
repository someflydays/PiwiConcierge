//
//  SearchView.swift
//  PiwiConcierge
//
//  Created by Derek Martin on 5/20/24.
//

import SwiftUI
import Speech

struct SearchView: View {
    @State private var searchText = ""
    @State private var isRecording = false
    @State private var recognizedText = ""
    
    private let speechRecognizer = SFSpeechRecognizer()
    private let audioEngine = AVAudioEngine()
    private let request = SFSpeechAudioBufferRecognitionRequest()
    
    var body: some View {
        VStack {
            TextField("Search...", text: $searchText)
                .textFieldStyle(RoundedBorderTextFieldStyle())
                .padding()
            
            Button(action: {
                self.isRecording.toggle()
                if self.isRecording {
                    self.startRecording()
                } else {
                    self.stopRecording()
                }
            }) {
                Text(isRecording ? "Stop Recording" : "Start Recording")
                    .font(.title2)
                    .padding()
                    .background(Color.blue)
                    .foregroundColor(.white)
                    .cornerRadius(10)
            }
            
            Text(recognizedText)
                .padding()
        }
        .onAppear {
            self.requestSpeechAuthorization()
        }
    }
    
    private func startRecording() {
        guard let speechRecognizer = speechRecognizer, speechRecognizer.isAvailable else { return }
        
        let recordingFormat = audioEngine.inputNode.outputFormat(forBus: 0)
        audioEngine.inputNode.installTap(onBus: 0, bufferSize: 1024, format: recordingFormat) { buffer, _ in
            self.request.append(buffer)
        }
        
        audioEngine.prepare()
        do {
            try audioEngine.start()
        } catch {
            return print(error)
        }
        
        speechRecognizer.recognitionTask(with: request) { result, error in
            guard let result = result else {
                if let error = error {
                    print("Recognition error: \(error)")
                }
                return
            }
            self.recognizedText = result.bestTranscription.formattedString
            self.searchText = self.recognizedText
        }
    }
    
    private func stopRecording() {
        audioEngine.stop()
        audioEngine.inputNode.removeTap(onBus: 0)
        request.endAudio()
    }
    
    private func requestSpeechAuthorization() {
        SFSpeechRecognizer.requestAuthorization { authStatus in
            switch authStatus {
            case .authorized:
                print("Speech recognition authorized")
            case .denied, .restricted, .notDetermined:
                print("Speech recognition not authorized")
            @unknown default:
                fatalError()
            }
        }
    }
}
