
# EPUB Checker Static — Path A (Auto-save next to EPUB)

This is your original static, browser-only app, updated to **auto-save** the report next to the selected EPUB by using the **File System Access API**.

## How it works
- Click **Choose EPUB folder** once and select the directory that contains your EPUB(s). The browser remembers permission (Chromium, HTTPS/localhost). \[Refs: MDN File System API; Chrome capabilities\]
- Select an `.epub` and click **Run Check**.
- The app finds that EPUB **inside the chosen folder** and writes `<epub_basename>_image_check.txt` next to it—no download step.

## Requirements
- Chromium-based browser (Chrome, Edge, Brave). \[Refs: Chrome Capabilities doc\]
- Served over **HTTPS** or **`http://localhost`** (File System Access API requires a secure context). \[Refs: MDN File System API\]

## Deploy (same as your original)
```bash
# Build
docker build -t epub-checker-static-path-a .

# Run
docker run -d --name epub-checker -p 80:80 epub-checker-static-path-a
# Open: http://<server-ip>/  (use HTTPS for saving to local folders)
```

## Notes
- The recursive directory scan uses `dirHandle.values()` to locate the chosen EPUB by name, then saves the report in the file's parent directory. \[Ref: StackOverflow example on directory traversal\]
- Browser security prevents reading the real path from `<input type=file>` (you'll often see `C:\fakepath`). This is why the folder permission step is required for local writes. \[Refs: MDN `<input type=file>`; StackOverflow explanation\]

References:
- MDN: File System API (secure context; permission required) — https://developer.mozilla.org/en-US/docs/Web/API/File_System_API
- Chrome for Developers: File System Access API — https://developer.chrome.com/docs/capabilities/web-apis/file-system-access
- MDN: `<input type="file">` explains `C:\fakepath` — https://developer.mozilla.org/en-US/docs/Web/HTML/Reference/Elements/input/file
- StackOverflow: Directory traversal with `showDirectoryPicker` — https://stackoverflow.com/questions/67979844/accessing-sub-directory-file-content-using-showdirectorypicker
```
