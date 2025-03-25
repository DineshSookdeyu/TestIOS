using System.Diagnostics;
using ZXing.Net.Maui;
using ZXing.Net.Maui.Controls;

namespace Dignicard;

public partial class CameraPage : ContentPage
{
    public CameraPage()
    {
        InitializeComponent();

        CameraBarcodeScannerView.Options = new BarcodeReaderOptions
        {
            Formats = BarcodeFormats.TwoDimensional,
            AutoRotate = true,
            Multiple = false
        };
    }

    private TaskCompletionSource<BarcodeResult> _scanTask = new();

    public Task<BarcodeResult> WaitForResultAsync()
    {
        _scanTask = new TaskCompletionSource<BarcodeResult>();

        if (CameraBarcodeScannerView != null)
        {
            CameraBarcodeScannerView.IsDetecting = true;
        }

        Debug.WriteLine($"Status: {_scanTask.Task.Status}");
        return _scanTask.Task;
    }

    private async void BarcodesDetected(object? sender, BarcodeDetectionEventArgs eventArgs)
    {
        try
        {
            if (_scanTask.Task.IsCompleted) return;

            CameraBarcodeScannerView.IsDetecting = false;
            _scanTask.TrySetResult(eventArgs.Results[0]);
            Debug.WriteLine("Scan result: " + eventArgs.Results[0].Value);

            await MainThread.InvokeOnMainThreadAsync(async () =>
            {
                if (Navigation?.ModalStack.Count > 0)
                {
                    await Navigation.PopModalAsync();
                    Debug.WriteLine("Closed CameraPage modal.");
                }
            });
        }
        catch (Exception e)
        {
            Debug.WriteLine($"Error detecting barcode: {e.Message}");
        }
    }

    private async void OnCloseClicked(object? sender, EventArgs eventArgs)
    {
        try
        {
            CameraBarcodeScannerView.IsDetecting = false;

            if (Application.Current?.MainPage?.Navigation != null)
            {
                await Application.Current.MainPage.Navigation.PopModalAsync();
                Debug.WriteLine("Camera Page Closed.");
            }
            else
            {
                Debug.WriteLine("Go to Main Page.");
            }
        }
        catch (Exception e)
        {
            Debug.WriteLine($"Error closing modal: {e.Message}");
        }
    }
}