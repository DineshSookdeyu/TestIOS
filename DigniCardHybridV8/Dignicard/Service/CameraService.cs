using System;
using System.Collections.Generic;
using System.Linq;
using System.Text;
using System.Threading.Tasks;
using Microsoft.Maui.Media;
using ZXing;
using SkiaSharp;
using ZXing.SkiaSharp;
using ZXing.Common; // Added for SkiaSharp bindings


namespace Dignicard
{

public class CameraService
    {
        public async Task<string> ScanQRCodeAsync()
        {
            try
            {
                if (MediaPicker.Default.IsCaptureSupported)
                {
                    var photo = await MediaPicker.Default.CapturePhotoAsync();

                    if (photo != null)
                    {
                        using var stream = await photo.OpenReadAsync();
                        using var memoryStream = new MemoryStream();
                        await stream.CopyToAsync(memoryStream);
                        byte[] imageBytes = memoryStream.ToArray();

                        // Debugging: Save original image to file
                        string originalFilePath = Path.Combine(FileSystem.CacheDirectory, "original_image.jpg");
                        File.WriteAllBytes(originalFilePath, imageBytes);
                        Console.WriteLine($"Original image saved to: {originalFilePath}");

                        // Load image into SKBitmap
                        SKBitmap skBitmap = SKBitmap.Decode(imageBytes);

                        // Grayscale Conversion
                        SKBitmap grayscaleBitmap = new SKBitmap(skBitmap.Width, skBitmap.Height, SKColorType.Gray8, SKAlphaType.Opaque);
                        using (SKCanvas canvas = new SKCanvas(grayscaleBitmap))
                        using (SKPaint paint = new SKPaint())
                        {
                            float[] colorMatrix = new float[]
                            {
                            0.2126f, 0.7152f, 0.0722f, 0, 0,
                            0.2126f, 0.7152f, 0.0722f, 0, 0,
                            0.2126f, 0.7152f, 0.0722f, 0, 0,
                            0, 0, 0, 1, 0,
                            };
                            paint.ColorFilter = SKColorFilter.CreateColorMatrix(colorMatrix);
                            canvas.DrawBitmap(skBitmap, 0, 0, paint);
                        }

                        // Debugging: Save grayscale image
                        string grayscaleFilePath = Path.Combine(FileSystem.CacheDirectory, "grayscale_image.jpg");
                        using (SKImage grayscaleImage = SKImage.FromBitmap(grayscaleBitmap))
                        using (SKData grayscaleData = grayscaleImage.Encode(SKEncodedImageFormat.Jpeg, 100))
                        {
                            using (Stream fileStream = File.OpenWrite(grayscaleFilePath))
                            {
                                grayscaleData.SaveTo(fileStream);
                            }
                        }
                        Console.WriteLine($"Grayscale image saved to: {grayscaleFilePath}");

                        // Noise Reduction (Gaussian Blur)
                        SKBitmap blurredBitmap = new SKBitmap(grayscaleBitmap.Width, grayscaleBitmap.Height);
                        using (SKCanvas canvas = new SKCanvas(blurredBitmap))
                        using (SKPaint paint = new SKPaint())
                        {
                            paint.ImageFilter = SKImageFilter.CreateBlur(3, 3); // Adjust blur radius as needed
                            canvas.DrawBitmap(grayscaleBitmap, 0, 0, paint);
                        }

                        // Adaptive Thresholding (Enhanced)
                        SKBitmap binaryBitmap = new SKBitmap(blurredBitmap.Width, blurredBitmap.Height);
                        int blockSize = 15; // Increased block size
                        int constant = 7; // Increased constant

                        for (int x = 0; x < blurredBitmap.Width; x++)
                        {
                            for (int y = 0; y < blurredBitmap.Height; y++)
                            {
                                int sum = 0;
                                int count = 0;

                                for (int i = -blockSize / 2; i <= blockSize / 2; i++)
                                {
                                    for (int j = -blockSize / 2; j <= blockSize / 2; j++)
                                    {
                                        int nx = x + i;
                                        int ny = y + j;

                                        if (nx >= 0 && nx < blurredBitmap.Width && ny >= 0 && ny < blurredBitmap.Height)
                                        {
                                            sum += blurredBitmap.GetPixel(nx, ny).Red;
                                            count++;
                                        }
                                    }
                                }

                                int average = sum / count;
                                byte pixel = blurredBitmap.GetPixel(x, y).Red;
                                binaryBitmap.SetPixel(x, y, pixel > average - constant ? SKColors.White : SKColors.Black);
                            }
                        }

                        // Debugging: Save binary image
                        string binaryFilePath = Path.Combine(FileSystem.CacheDirectory, "binary_image.jpg");
                        using (SKImage binaryImage = SKImage.FromBitmap(binaryBitmap))
                        using (SKData binaryData = binaryImage.Encode(SKEncodedImageFormat.Jpeg, 100))
                        {
                            using (Stream fileStream = File.OpenWrite(binaryFilePath))
                            {
                                binaryData.SaveTo(fileStream);
                            }
                        }
                        Console.WriteLine($"Binary image saved to: {binaryFilePath}");

                        // Decode the binary image
                        var barcodeReader = new BarcodeReader()
                        {
                            AutoRotate = true,
                            Options = new DecodingOptions
                            {
                                PossibleFormats = new List<BarcodeFormat> { BarcodeFormat.QR_CODE }
                            }

                        };

                        var results = barcodeReader.Decode(binaryBitmap);

                        if (results != null)
                        {
                            Console.WriteLine($"QR Code Found: {results.Text}");
                            Console.WriteLine($"Barcode Format: {results.BarcodeFormat}");
                            return results.Text; // Return the QR code content
                        }
                        else
                        {
                            Console.WriteLine("No QR code found.");
                            return "No QR code found.";
                        }
                    }
                    else
                    {
                        Console.WriteLine("Photo capture was cancelled or failed.");
                        return "Photo capture was cancelled or failed.";
                    }
                }
                else
                {
                    Console.WriteLine("MediaPicker capture is not supported.");
                    return "MediaPicker capture is not supported.";
                }
            }
            catch (FeatureNotSupportedException fnsEx)
            {
                Console.WriteLine($"ScanQRCodeAsync FeatureNotSupportedException: {fnsEx.Message}");
            }
            catch (PermissionException pEx)
            {
                Console.WriteLine($"ScanQRCodeAsync PermissionException: {pEx.Message}");
            }
            catch (Exception ex)
            {
                Console.WriteLine($"ScanQRCodeAsync Exception: {ex.Message}");
            }

            return null;
        }
    }
}
