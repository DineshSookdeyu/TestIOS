window.changeBarcodeReaderLanguage = function () {
    document.querySelectorAll(".zxing-button") // Adjust selector
        .forEach(btn => {
            if (btn.textContent === "扫描") btn.textContent = "Scan";
            // Add more replacements
        });
};

window.fixZXingCamera = function () {
    navigator.mediaDevices.enumerateDevices()
        .then(devices => {
            const videoDevices = devices.filter(d => d.kind === "videoinput");
            if (videoDevices.length > 0) {
                const constraints = { video: { deviceId: videoDevices[0].deviceId } };
                return navigator.mediaDevices.getUserMedia(constraints);
            } else {
                throw new Error("No video devices found");
            }
        })
        .catch(err => console.error("Camera error:", err));
};

window.Helpers = window.Helpers || {};
window.Helpers.setDotNetHelper = function (dotNetHelper) {
    window.dotNetHelper = dotNetHelper;
};

window.BlazorBarcodeScanner = {
    selectedDeviceId: undefined,

    setVideoResolution: function (width, height) {
        var video = document.getElementById("video");
        if (video != null) {
            video.setAttribute("width", width);
            video.setAttribute("height", height);
        }
    },

    setSelectedDeviceId: function (deviceId) {
        BlazorBarcodeScanner.selectedDeviceId = deviceId;
    },

    resetSelectedDeviceId: function () {
        BlazorBarcodeScanner.selectedDeviceId = undefined;
    },

    startDecoding: function (codeReader, dotnethelper) {
        navigator.mediaDevices.enumerateDevices().then(function (devices) {
            var videoSelect = [];
            devices.forEach(function (device) {
                if (device.kind == "videoinput") {
                    videoSelect.push(device);
                }
            });

            var selectedDevice;

            if (BlazorBarcodeScanner.selectedDeviceId == undefined) {
                selectedDevice = videoSelect[videoSelect.length - 1];
            } else {
                selectedDevice = videoSelect.find(x => x.deviceId == BlazorBarcodeScanner.selectedDeviceId);
            }

            codeReader.decodeFromInputVideoDeviceContinuously(selectedDevice.deviceId, 'video', (result, err) => {
                if (result) {
                    dotnethelper.invokeMethodAsync('ReceivedBarcodeAsync', result.text);
                }
            });
        });
    },

    stopDecoding: function (codeReader) {
        codeReader.reset();
    },

    getVideoInputDevices: async function () {
        var devices = await navigator.mediaDevices.enumerateDevices();
        var videoSelect = [];
        devices.forEach(function (device) {
            if (device.kind == "videoinput") {
                videoSelect.push(device);
            }
        });
        return videoSelect;
    },

    // Add the missing function here:
    // Add the missing function here:
    setLastDecodedPictureFormat: function (format) {
        BlazorBarcodeScanner.lastDecodedPictureFormat = format;
        console.log("Last decoded picture format: " + format); // Optional: Keep the console log for debugging
    },

    listVideoInputDevices: async function () {
        var devices = await navigator.mediaDevices.enumerateDevices();
        var videoSelect = [];
        devices.forEach(function (device) {
            if (device.kind == "videoinput") {
                videoSelect.push({
                    deviceId: device.deviceId,
                    label: device.label,
                    groupId: device.groupId
                });
            }
        });
        return videoSelect;
    },

};


window.capturePhoto = async function () {
    try {
        const base64Image = await DotNet.invokeMethodAsync('DigniCard', 'CapturePhoto');
        if (base64Image) {
            DotNet.invokeMethodAsync('DigniCard', 'ReceivePhoto', base64Image);
        } else {
            console.log("Image capture failed or was cancelled.");
        }
    } catch (error) {
        console.error("Error capturing photo:", error);
    }
};


window.setupQRCodeScanner = function () {
    window.scanQRCode = async function () {
        try {
            const qrCodeContent = await DotNet.invokeMethodAsync('DigniCard', 'ScanQRCode');
            return qrCodeContent;
        } catch (error) {
            console.error("Error scanning QR code:", error);
            return "Error scanning QR code.";
        }
    };
};



