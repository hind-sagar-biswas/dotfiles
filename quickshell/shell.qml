import Quickshell
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

