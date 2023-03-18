# MacDetachVolumeOnAppQuit

AppleScript to Detach a specified Volume when a specified App is terminated on MacOS.

### Why ?
Following [this Obsidian forum post](https://forum.obsidian.md/t/can-i-encrypt-a-vault/33645/2), I had an encrypted .dmg to store all my data so I created an automator rule to mount it everytime I launch Obsidian.

This worked pretty well, the only caveat was that I had to manually unmount the drive each time I closed the app, so I used [this StackOverflow thread](https://stackoverflow.com/questions/63786497/is-it-possible-to-run-an-automator-workflow-when-a-program-exits) and this [Snipplr](https://snipplr.com/view/310/unmount-disk-image-dmg-file) to automatically detach when Obsidian terminates.

### Usage
(*This is How I did it on Ventura 13.2.1, I've 0 experience in osx development so there might be a better option*)
- On MacOs, open the script with the ScriptEditor App.
- Replace "Obsidian" by the name of your App
- Replace "ObsidianVolume" by the name of your Volume
- Clik File > Export
- Save as Application and check "Do not quit after execution"

- You can run this at login to always have it running
- If you want to have it running without seeing it in the Dock and in the running Applications:
  - Make sure the App is not running
  - Edit and save the App, checking "Do not sign"
  - Find your newly created App in the finder and Right Click > Show Package Files
  - Go to Content > Info.plist and edit it (with TextEdit or any other file editor)
  - Under the first `<dict>` tag, add (with the same indentation as the other inner tags):
    ```AppleScript
    <key>LSUIElement</key>
    <true/>
    ```
    This will make an agent of your Application, when you will run it again you should not see it in the Dock, nor in running applications anymore.
