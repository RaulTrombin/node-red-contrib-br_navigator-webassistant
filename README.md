node-red-contrib-br_navigator-webassistant
=====================

A collection of Node-RED nodes for interfacing with the Blue Robotics's [Navigator](https://bluerobotics.com/store/comm-control-power/control/navigator/) via its [web assistant](https://github.com/RaulTrombin/blueos-navigator-web-assistant).

## Installation / Initial Setup

### In BlueOS (Recommended)

1. Open the [Autopilot Firmware](https://blueos.cloud/docs/blueos/latest/advanced-usage/#autopilot-firmware) page, enable [Pirate Mode](https://blueos.cloud/docs/blueos/latest/advanced-usage/#pirate-mode), and "change board" to SITL
    - This stops the autopilot firmware from trying to operate while the WebAssistant is in use
1. [Reboot](https://blueos.cloud/docs/blueos/latest/advanced-usage/#power) the vehicle computer, and wait for the interface to re-connect
1. Install the "Node-RED" and "Navigator WebAssistant" BlueOS Extensions from the [Extensions manager](https://blueos.cloud/docs/blueos/latest/advanced-usage/#extensions-manager)
1. Open the Node-RED interface once it becomes available in the BlueOS sidebar

### Through NPM

Run the following command in your Node-RED user directory - typically `~/.node-red`

        npm install node-red-contrib-br_navigator-webassistant

## Usage

1. Click the burger menu (in the top right corner), then select "Manage Palette", and Install the `node-red-contrib-br_navigator-webassistant` and `node-red-dashboard` extensions, then Close the palette manager
1. In the Node-RED burger menu (top right), select "Import", then navigate to the "Examples" tab, and import the Navigator WebAssistant "dashboard" example flow
1. Select the Navigator WebAssistant tab at the top, and double-click the green "WebSocket Route" node to configure it
1. Click the pencil icon to edit the URL, and set it to use your vehicle computer's IP address, and the port number of the Navigator Assistant service from BlueOS's [Available Services](https://blueos.cloud/docs/blueos/latest/advanced-usage/#available-services) page
    - e.g. `ws://192.168.2.2:32768/ws`, for a common ROV setup with an IP address of `192.168.2.2`, and a port designation of `32768`
    - An explicit IP address is necessary - mDNS addresses like `blueos.local` are not currently accepted
    - The port designation is currently temporary, and may need to be checked and re-configured each time the web assistant extension starts
1. Click the deep red "Update", "Done", and "Deploy" buttons in the top right corner
    - A green circle and the word "connected" should appear under the WebSocket Route nodes if it is configured correctly
    - If it's not connected, make sure
        1. the autopilot is set to SITL (or turned off / disabled)
        1. the WebSocket URL has the correct values, and no extra spaces or other characters
            - confirm that the port is set to that of the Navigator Assistant service (e.g. not the Node-RED one)
1. Go to the `/ui` endpoint of your Node-RED interface to view the dashboard
    - e.g. `blueos.local/extension/nodered?full_page=true` -> `blueos.local/extension/nodered/ui?full_page=true`
    - the burger menu in the top left can be used to change from data views to output controls
1. Modify the example flow as desired, and/or make your own flow using the appropriate blocks, making sure to deploy again so the dashboard updates

Example
-------
You can create a dashboard and plot sensors data or control navigator hardware.

![example.gif](example.gif)

How install the dashboard example.

![install_example.gif](install_example.gif)
