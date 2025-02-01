# Audio Modulator
The Audio Modulator package provides an easy way to play and modulate audio files in Flutter applications. It supports changing the pitch and speed of the audio playback, making it suitable for various use cases such as voice modulation, sound effects, and more. The package is designed to work seamlessly across multiple platforms, ensuring a consistent experience for all users.
The pitch of the audio can range between -2400 to 2400 and the speed can range between 0.5 to 2.0.

## Installation

Add the following dependency to your `pubspec.yaml` file:

```yaml
dependencies:
  audio_modulator: ^1.0.0
```

### Example
```dart
final audioModulator = AudioModulator();

//PLAY AUDIO
audioModulator.playAudio(
    path: path,
    pitch: 1200,
    speed: 1
);

//STOP AUDIO
audioModulator.stopAudio();
```
### Connect with Me

- **LinkedIn:** [Linkedin](https://www.linkedin.com/in/pratik-b-aa253980/)
- **GitHub:** [GitHub](https://github.com/pratikbaid3)

### About Me

Hi, I'm Pratik Baid, a passionate developer with experience in frontend and mobile app development. Always eager to explore new technologies and build innovative solutions.

Feel free to connect and collaborate!
