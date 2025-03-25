window.startVideo = async function (videoElementId) {
    const video = document.getElementById(videoElementId);

    try {
        // Requesting the camera stream
        const stream = await navigator.mediaDevices.getUserMedia({ video: true });
        video.srcObject = stream;
    } catch (error) {
        console.error("Error accessing the camera: ", error);
        alert("Could not access the camera.");
    }
};

window.scanQRCode = async function (videoElementId, canvasElementId) {
    const video = document.getElementById(videoElementId);
    const canvas = document.getElementById(canvasElementId);
    const context = canvas.getContext("2d");

    // Ensure the canvas is the same size as the video
    canvas.width = video.videoWidth;
    canvas.height = video.videoHeight;

    context.drawImage(video, 0, 0, canvas.width, canvas.height);

    // Use a QR code scanning library (like jsQR) to scan the image
    const imageData = context.getImageData(0, 0, canvas.width, canvas.height);
    const qrCode = jsQR(imageData.data, canvas.width, canvas.height);

    if (qrCode) {
        return qrCode.data; // Return the QR code data
    } else {
        return null; // Return null if no QR code is detected
    }
};

