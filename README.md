# Video Trimmer

A Windows batch script that trims a video clip using FFmpeg.

## What it does

- Trims a video using a start and end time
- Prompts for the start and end times when launched with only a video path
- Also accepts the start and end times as command-line arguments
- Saves the trimmed file next to the source video using a `_trimmed.mp4` name

## Requirements

- Windows
- FFmpeg installed and available on your PATH

## Install and uninstall

To install TrimVid, run `install.bat` from this folder. It adds this folder to your current user's PATH and adds a **Trim Video** entry to the context menu for MP4 files. Restart any open Command Prompt or PowerShell windows before using the `trim` command. The context-menu entry opens a Command Prompt and prompts for the start and end times.

To remove the integration, run `uninstall.bat` from this folder. It removes the MP4 context-menu entry and this folder from your current user's PATH. It does not delete the TrimVid files or uninstall FFmpeg.

## Quick usage

After installation, run `trim` with the video filename. If the video is in a different folder, provide its full path:

```bat
trim "file.mp4"
trim "C:\Videos\file.mp4"
```

The script prompts for the trim range:

```text
Start time: 00:00:10
End time: 00:00:20
```

You can skip the prompts by supplying both times after the filename:

```bat
trim "file.mp4" 00:00:10 00:00:20
```

Times can use `HH:MM:SS`, `MM:SS`, or seconds (for example, `75` means 75 seconds). For a video-file context-menu entry, pass the selected file as the only argument.

## Notes

- FFmpeg must be installed and visible in your system PATH.
- The script uses `-c copy` for a fast trim without re-encoding.
- If the output file already exists, FFmpeg will overwrite it.
- The output is saved beside the source video as `file_trimmed.mp4`.
