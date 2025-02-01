import Flutter
import UIKit
import Foundation
import AVFoundation


public class AudioModulatorPlugin: NSObject, FlutterPlugin, ExampleHostApi{
    private var audioEngine = AVAudioEngine()
    private var pitchControl = AVAudioUnitTimePitch()
    private var speedControl = AVAudioUnitVarispeed()
    private var isPlaying = false
    private var errorMessage: String? = nil

    public static func register(with registrar: FlutterPluginRegistrar) {
    let instance = AudioModulatorPlugin()
        ExampleHostApiSetup.setUp(binaryMessenger: registrar.messenger(), api: instance)
    }

    public func playAudio(_ path: String, pitch: Int64, speed: Int64) throws  {
        pitchControl.pitch = Float(pitch)
        speedControl.rate = Float(speed)
        configureAudioEngine(localURL:path)
    }

    public func stopAudio() throws {
        stop()
    }

    private func configureAudioEngine(localURL:String) {
        do {
            try AVAudioSession.sharedInstance().setCategory(.playback, mode: .default, options: [])
            try AVAudioSession.sharedInstance().setActive(true)
        } catch {
            errorMessage = "Failed to configure audio session: \(error.localizedDescription)"
        }
        
        audioEngine.attach(pitchControl)
        audioEngine.attach(speedControl)
        do {
            guard let url = URL(string: localURL) else {
                throw NSError(domain: "Invalid URL", code: 0, userInfo: nil)
            }
            try play(url)
            isPlaying = true
        } catch {
            self.errorMessage = error.localizedDescription
        }
    }

    private func stop() {
        audioEngine.stop()
        audioEngine.reset()
        isPlaying = false
    }

    private func play(_ url: URL) throws {
        do {
            let file = try AVAudioFile(forReading: url)
            // Create the audio player
            let audioPlayer = AVAudioPlayerNode()
            // Attach the player to the engine
            audioEngine.attach(audioPlayer)
            // Connect the components
            audioEngine.connect(audioPlayer, to: speedControl, format: nil)
            audioEngine.connect(speedControl, to: pitchControl, format: nil)
            audioEngine.connect(pitchControl, to: audioEngine.mainMixerNode, format: nil)
            
            // Schedule the file
            audioPlayer.scheduleFile(file, at: nil)
            // Start the engine and play
            try audioEngine.start()
            audioPlayer.play()
            print("Audio is now playing.")
        } catch {
            print("ERROR: \(error.localizedDescription)")
            throw error
        }
    }
}
