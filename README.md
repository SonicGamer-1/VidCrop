# Video Trimmer

A Windows batch script that trims a video clip using FFmpeg.

## What it does

- Trims a video using a start and end time
- Accepts a video path, start time, and end time from the command line
- Prompts for start and end times when launched with only a video path
- Saves the trimmed file next to the source video using a `_trimmed.mp4` name

## Requirements

- Windows
- FFmpeg installed and available on your PATH

## Quick usage

Run the batch file with just the video filename:

```bat
trim.bat "file.mp4"
```

The script prompts you to enter the times:

```text
Start time: 00:00:10
End time: 00:00:20
```

You can also pass the start and end times directly:

```bat
trim.bat "file.mp4" 00:00:10 00:00:20
```

Times can be in `HH:MM:SS`, `MM:SS`, or seconds. For example:

```bat
trim.bat "input.mp4" 75 150
```

For a video-file context-menu entry, pass the selected file as the only argument. Use `cmd.exe /k` so the console stays open while you enter the times and can read the result. Set the registry command to:

```text
cmd.exe /k ""C:\path\to\trim.bat" "%1""
```

The script accepts times in any of these forms:

- `HH:MM:SS` such as `00:01:15`
- `MM:SS` such as `1:15`
- seconds such as `75`

## Notes

- FFmpeg must be installed and visible in your system PATH.
- The script uses `-c copy` for a fast trim without re-encoding.
- If the output file already exists, FFmpeg will overwrite it.
