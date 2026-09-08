import Quickshell
import Quickshell.Io
import Quickshell.Wayland
import QtQuick

Scope {
    // PanelWindow {
    //     exclusionMode: ExclusionMode.Ignore
    //     aboveWindows: false
    //     WlrLayershell.layer: WlrLayer.Background
    //
    //     anchors {
    //         bottom: true
    //         left: true // Aligned to the bottom-left corner
    //     }
    //
    //     margins {
    //         bottom: 10
    //         left: 10
    //     }
    //
    //     implicitWidth: 250  // Match the rough dimensions of your GIF asset
    //     implicitHeight: 250
    //     color: "transparent"
    //
    //     AnimatedImage {
    //         id: runningGif
    //         anchors.fill: parent
    //         fillMode: Image.PreserveAspectFit
    //
    //         // Points directly to the local gif located in the same directory
    //         source: "shikanoko.gif" 
    //     }
    // }

    property var audioData: [0,0,0,0,0,0,0,0,0,0,0,0,0,0,0,0]

    Process {
        id: cavaProc
        command: ["cava", "-p", "/home/shin/.config/quickshell/cava.conf"]
        running: true

        stdout: SplitParser {
            // The invalid 'split' property was removed here. \n is the default.
            onRead: data => {
                if (!data) return;

                let parts = data.split(";");
                let newBars = [];

                for (let i = 0; i < 16; i++) {
                    let val = parseInt(parts[i], 10);
                    newBars.push(isNaN(val) ? 0 : val); 
                }

                audioData = newBars;
            }
        }
    }

    // The Visualizer Window
    PanelWindow {
        exclusionMode: ExclusionMode.Ignore
        aboveWindows: false
        WlrLayershell.layer: WlrLayer.Bottom

        anchors {
            bottom: true
            left: true 
        }

        margins {
            bottom: 50
            left: -1
        }

        implicitWidth: 600 
        implicitHeight: 16* (20+40) // Increased height to fit 12 stacked bars
        color: "transparent"

        Column {
            anchors.left: parent.left
            anchors.bottom: parent.bottom
            spacing: 20

            Repeater {
                model: 16

                Rectangle {
                    height: 40                          // Fixed thickness for each bar
                    width: Math.max(1, audioData[index] * 5)

                    color: "#ffffff"
                    opacity: 0.35
                    radius: 4
                    anchors.left: parent.left

                    // Smoothly animate horizontal width changes
                    Behavior on width {
                        NumberAnimation { duration: 60 } 
                    }
                }
            }
        }
    }
    PanelWindow {
        exclusionMode: ExclusionMode.Ignore
        aboveWindows: false
        WlrLayershell.layer: WlrLayer.Bottom

        anchors {
            bottom: true
            right: true
        }

        margins {
            top: 50
            right: 50
        }

        implicitWidth: 700 
        implicitHeight: 200
        color: "transparent"

        Text {
            id: clock
            anchors.fill: parent
            horizontalAlignment: Text.AlignRight
            verticalAlignment: Text.AlignTop
            color: "#ffffff"

            // --- THE SLICED CUTS LOOK ---
            font.family: "Anurati"
            font.pixelSize: 124         // Massive size looks best for stencil cuts
            font.italic: true          // Slanted

            text: Qt.formatDateTime(new Date(), "HH:mm\nddd, MMM dd")

            Timer {
                interval: 1000
                running: true
                repeat: true
                onTriggered: {
                    clock.text = Qt.formatDateTime(new Date(), "dddd").toUpperCase()
                }
            }
        }
    }
}

