using Android.App;
using Android.Content.PM;
using Android.OS;
using Microsoft.AspNetCore.Components.WebView.Maui;

namespace Dignicard;

[Activity(Theme = "@style/Maui.SplashTheme", MainLauncher = true, ConfigurationChanges = ConfigChanges.ScreenSize | ConfigChanges.Orientation | ConfigChanges.UiMode | ConfigChanges.ScreenLayout | ConfigChanges.SmallestScreenSize | ConfigChanges.Density)]
public class MainActivity : MauiAppCompatActivity
{
    //protected override void OnCreate(Bundle savedInstanceState)
    //{
    //    base.OnCreate(savedInstanceState);

    //    // Configure WebView settings
    //    var webView = FindViewById<BlazorWebView>(Resource.Id.blazorWebView);
    //    if (webView != null)
    //    {
    //        var settings = webView.Settings;
    //        settings.JavaScriptEnabled = true;
    //        settings.MediaPlaybackRequiresUserGesture = false; // Allow auto camera access
    //    }
    //}
}
