; ModuleID = 'marshal_methods.x86.ll'
source_filename = "marshal_methods.x86.ll"
target datalayout = "e-m:e-p:32:32-p270:32:32-p271:32:32-p272:64:64-f64:32:64-f80:32-n8:16:32-S128"
target triple = "i686-unknown-linux-android21"

%struct.MarshalMethodName = type {
	i64, ; uint64_t id
	ptr ; char* name
}

%struct.MarshalMethodsManagedClass = type {
	i32, ; uint32_t token
	ptr ; MonoClass klass
}

@assembly_image_cache = dso_local local_unnamed_addr global [141 x ptr] zeroinitializer, align 4

; Each entry maps hash of an assembly name to an index into the `assembly_image_cache` array
@assembly_image_cache_hashes = dso_local local_unnamed_addr constant [282 x i32] [
	i32 34715100, ; 0: Xamarin.Google.Guava.ListenableFuture.dll => 0x211b5dc => 92
	i32 40744412, ; 1: Xamarin.AndroidX.Camera.Lifecycle.dll => 0x26db5dc => 67
	i32 42639949, ; 2: System.Threading.Thread => 0x28aa24d => 132
	i32 67008169, ; 3: zh-Hant\Microsoft.Maui.Controls.resources => 0x3fe76a9 => 33
	i32 72070932, ; 4: Microsoft.Maui.Graphics.dll => 0x44bb714 => 58
	i32 117431740, ; 5: System.Runtime.InteropServices => 0x6ffddbc => 124
	i32 165246403, ; 6: Xamarin.AndroidX.Collection.dll => 0x9d975c3 => 70
	i32 182336117, ; 7: Xamarin.AndroidX.SwipeRefreshLayout.dll => 0xade3a75 => 88
	i32 195452805, ; 8: vi/Microsoft.Maui.Controls.resources.dll => 0xba65f85 => 30
	i32 199333315, ; 9: zh-HK/Microsoft.Maui.Controls.resources.dll => 0xbe195c3 => 31
	i32 205061960, ; 10: System.ComponentModel => 0xc38ff48 => 107
	i32 254259026, ; 11: Microsoft.AspNetCore.Components.dll => 0xf27af52 => 36
	i32 280992041, ; 12: cs/Microsoft.Maui.Controls.resources.dll => 0x10bf9929 => 2
	i32 317674968, ; 13: vi\Microsoft.Maui.Controls.resources => 0x12ef55d8 => 30
	i32 318968648, ; 14: Xamarin.AndroidX.Activity.dll => 0x13031348 => 63
	i32 336156722, ; 15: ja/Microsoft.Maui.Controls.resources.dll => 0x14095832 => 15
	i32 342366114, ; 16: Xamarin.AndroidX.Lifecycle.Common => 0x146817a2 => 77
	i32 356389973, ; 17: it/Microsoft.Maui.Controls.resources.dll => 0x153e1455 => 14
	i32 379916513, ; 18: System.Threading.Thread.dll => 0x16a510e1 => 132
	i32 385762202, ; 19: System.Memory.dll => 0x16fe439a => 115
	i32 395744057, ; 20: _Microsoft.Android.Resource.Designer => 0x17969339 => 34
	i32 435591531, ; 21: sv/Microsoft.Maui.Controls.resources.dll => 0x19f6996b => 26
	i32 442565967, ; 22: System.Collections => 0x1a61054f => 104
	i32 450948140, ; 23: Xamarin.AndroidX.Fragment.dll => 0x1ae0ec2c => 76
	i32 469710990, ; 24: System.dll => 0x1bff388e => 136
	i32 498788369, ; 25: System.ObjectModel => 0x1dbae811 => 120
	i32 500358224, ; 26: id/Microsoft.Maui.Controls.resources.dll => 0x1dd2dc50 => 13
	i32 503918385, ; 27: fi/Microsoft.Maui.Controls.resources.dll => 0x1e092f31 => 7
	i32 513247710, ; 28: Microsoft.Extensions.Primitives.dll => 0x1e9789de => 52
	i32 525008092, ; 29: SkiaSharp.dll => 0x1f4afcdc => 59
	i32 539058512, ; 30: Microsoft.Extensions.Logging => 0x20216150 => 49
	i32 571435654, ; 31: Microsoft.Extensions.FileProviders.Embedded.dll => 0x220f6a86 => 46
	i32 592146354, ; 32: pt-BR/Microsoft.Maui.Controls.resources.dll => 0x234b6fb2 => 21
	i32 627609679, ; 33: Xamarin.AndroidX.CustomView => 0x2568904f => 74
	i32 627931235, ; 34: nl\Microsoft.Maui.Controls.resources => 0x256d7863 => 19
	i32 662205335, ; 35: System.Text.Encodings.Web.dll => 0x27787397 => 129
	i32 672442732, ; 36: System.Collections.Concurrent => 0x2814a96c => 101
	i32 688181140, ; 37: ca/Microsoft.Maui.Controls.resources.dll => 0x2904cf94 => 1
	i32 690569205, ; 38: System.Xml.Linq.dll => 0x29293ff5 => 134
	i32 706645707, ; 39: ko/Microsoft.Maui.Controls.resources.dll => 0x2a1e8ecb => 16
	i32 709557578, ; 40: de/Microsoft.Maui.Controls.resources.dll => 0x2a4afd4a => 4
	i32 722857257, ; 41: System.Runtime.Loader.dll => 0x2b15ed29 => 125
	i32 759454413, ; 42: System.Net.Requests => 0x2d445acd => 118
	i32 775507847, ; 43: System.IO.Compression => 0x2e394f87 => 111
	i32 777317022, ; 44: sk\Microsoft.Maui.Controls.resources => 0x2e54ea9e => 25
	i32 789151979, ; 45: Microsoft.Extensions.Options => 0x2f0980eb => 51
	i32 804008546, ; 46: Microsoft.AspNetCore.Components.WebView.Maui => 0x2fec3262 => 39
	i32 823281589, ; 47: System.Private.Uri.dll => 0x311247b5 => 121
	i32 830298997, ; 48: System.IO.Compression.Brotli => 0x317d5b75 => 110
	i32 839353180, ; 49: ZXing.Net.MAUI.Controls.dll => 0x3207835c => 98
	i32 865465478, ; 50: zxing.dll => 0x3395f486 => 95
	i32 904024072, ; 51: System.ComponentModel.Primitives.dll => 0x35e25008 => 105
	i32 926902833, ; 52: tr/Microsoft.Maui.Controls.resources.dll => 0x373f6a31 => 28
	i32 928116545, ; 53: Xamarin.Google.Guava.ListenableFuture => 0x3751ef41 => 92
	i32 967690846, ; 54: Xamarin.AndroidX.Lifecycle.Common.dll => 0x39adca5e => 77
	i32 992768348, ; 55: System.Collections.dll => 0x3b2c715c => 104
	i32 999186168, ; 56: Microsoft.Extensions.FileSystemGlobbing.dll => 0x3b8e5ef8 => 48
	i32 1012816738, ; 57: Xamarin.AndroidX.SavedState.dll => 0x3c5e5b62 => 87
	i32 1028951442, ; 58: Microsoft.Extensions.DependencyInjection.Abstractions => 0x3d548d92 => 43
	i32 1029334545, ; 59: da/Microsoft.Maui.Controls.resources.dll => 0x3d5a6611 => 3
	i32 1035644815, ; 60: Xamarin.AndroidX.AppCompat => 0x3dbaaf8f => 64
	i32 1044663988, ; 61: System.Linq.Expressions.dll => 0x3e444eb4 => 113
	i32 1052210849, ; 62: Xamarin.AndroidX.Lifecycle.ViewModel.dll => 0x3eb776a1 => 79
	i32 1082857460, ; 63: System.ComponentModel.TypeConverter => 0x408b17f4 => 106
	i32 1084122840, ; 64: Xamarin.Kotlin.StdLib => 0x409e66d8 => 93
	i32 1098259244, ; 65: System => 0x41761b2c => 136
	i32 1118262833, ; 66: ko\Microsoft.Maui.Controls.resources => 0x42a75631 => 16
	i32 1168523401, ; 67: pt\Microsoft.Maui.Controls.resources => 0x45a64089 => 22
	i32 1173126369, ; 68: Microsoft.Extensions.FileProviders.Abstractions.dll => 0x45ec7ce1 => 44
	i32 1178241025, ; 69: Xamarin.AndroidX.Navigation.Runtime.dll => 0x463a8801 => 84
	i32 1203215381, ; 70: pl/Microsoft.Maui.Controls.resources.dll => 0x47b79c15 => 20
	i32 1234928153, ; 71: nb/Microsoft.Maui.Controls.resources.dll => 0x499b8219 => 18
	i32 1260983243, ; 72: cs\Microsoft.Maui.Controls.resources => 0x4b2913cb => 2
	i32 1273450280, ; 73: Dignicard.dll => 0x4be74f28 => 100
	i32 1293217323, ; 74: Xamarin.AndroidX.DrawerLayout.dll => 0x4d14ee2b => 75
	i32 1324164729, ; 75: System.Linq => 0x4eed2679 => 114
	i32 1373134921, ; 76: zh-Hans\Microsoft.Maui.Controls.resources => 0x51d86049 => 32
	i32 1376866003, ; 77: Xamarin.AndroidX.SavedState => 0x52114ed3 => 87
	i32 1406073936, ; 78: Xamarin.AndroidX.CoordinatorLayout => 0x53cefc50 => 71
	i32 1430672901, ; 79: ar\Microsoft.Maui.Controls.resources => 0x55465605 => 0
	i32 1454105418, ; 80: Microsoft.Extensions.FileProviders.Composite => 0x56abe34a => 45
	i32 1461004990, ; 81: es\Microsoft.Maui.Controls.resources => 0x57152abe => 6
	i32 1462112819, ; 82: System.IO.Compression.dll => 0x57261233 => 111
	i32 1469204771, ; 83: Xamarin.AndroidX.AppCompat.AppCompatResources => 0x57924923 => 65
	i32 1470490898, ; 84: Microsoft.Extensions.Primitives => 0x57a5e912 => 52
	i32 1480492111, ; 85: System.IO.Compression.Brotli.dll => 0x583e844f => 110
	i32 1490325407, ; 86: BlazorBarcodeScanner.ZXing.JS.dll => 0x58d48f9f => 35
	i32 1493001747, ; 87: hi/Microsoft.Maui.Controls.resources.dll => 0x58fd6613 => 10
	i32 1514721132, ; 88: el/Microsoft.Maui.Controls.resources.dll => 0x5a48cf6c => 5
	i32 1521091094, ; 89: Microsoft.Extensions.FileSystemGlobbing => 0x5aaa0216 => 48
	i32 1543031311, ; 90: System.Text.RegularExpressions.dll => 0x5bf8ca0f => 131
	i32 1546581739, ; 91: Microsoft.AspNetCore.Components.WebView.Maui.dll => 0x5c2ef6eb => 39
	i32 1551623176, ; 92: sk/Microsoft.Maui.Controls.resources.dll => 0x5c7be408 => 25
	i32 1622152042, ; 93: Xamarin.AndroidX.Loader.dll => 0x60b0136a => 81
	i32 1623212457, ; 94: SkiaSharp.Views.Maui.Controls => 0x60c041a9 => 61
	i32 1624863272, ; 95: Xamarin.AndroidX.ViewPager2 => 0x60d97228 => 90
	i32 1636350590, ; 96: Xamarin.AndroidX.CursorAdapter => 0x6188ba7e => 73
	i32 1639515021, ; 97: System.Net.Http.dll => 0x61b9038d => 116
	i32 1639986890, ; 98: System.Text.RegularExpressions => 0x61c036ca => 131
	i32 1654881142, ; 99: Microsoft.AspNetCore.Components.WebView => 0x62a37b76 => 38
	i32 1657153582, ; 100: System.Runtime => 0x62c6282e => 127
	i32 1658251792, ; 101: Xamarin.Google.Android.Material.dll => 0x62d6ea10 => 91
	i32 1677501392, ; 102: System.Net.Primitives.dll => 0x63fca3d0 => 117
	i32 1679769178, ; 103: System.Security.Cryptography => 0x641f3e5a => 128
	i32 1729485958, ; 104: Xamarin.AndroidX.CardView.dll => 0x6715dc86 => 69
	i32 1736233607, ; 105: ro/Microsoft.Maui.Controls.resources.dll => 0x677cd287 => 23
	i32 1743415430, ; 106: ca\Microsoft.Maui.Controls.resources => 0x67ea6886 => 1
	i32 1760259689, ; 107: Microsoft.AspNetCore.Components.Web.dll => 0x68eb6e69 => 37
	i32 1766324549, ; 108: Xamarin.AndroidX.SwipeRefreshLayout => 0x6947f945 => 88
	i32 1770582343, ; 109: Microsoft.Extensions.Logging.dll => 0x6988f147 => 49
	i32 1780572499, ; 110: Mono.Android.Runtime.dll => 0x6a216153 => 139
	i32 1782862114, ; 111: ms\Microsoft.Maui.Controls.resources => 0x6a445122 => 17
	i32 1788241197, ; 112: Xamarin.AndroidX.Fragment => 0x6a96652d => 76
	i32 1793755602, ; 113: he\Microsoft.Maui.Controls.resources => 0x6aea89d2 => 9
	i32 1808609942, ; 114: Xamarin.AndroidX.Loader => 0x6bcd3296 => 81
	i32 1813058853, ; 115: Xamarin.Kotlin.StdLib.dll => 0x6c111525 => 93
	i32 1813201214, ; 116: Xamarin.Google.Android.Material => 0x6c13413e => 91
	i32 1818569960, ; 117: Xamarin.AndroidX.Navigation.UI.dll => 0x6c652ce8 => 85
	i32 1828688058, ; 118: Microsoft.Extensions.Logging.Abstractions.dll => 0x6cff90ba => 50
	i32 1842015223, ; 119: uk/Microsoft.Maui.Controls.resources.dll => 0x6dcaebf7 => 29
	i32 1853025655, ; 120: sv\Microsoft.Maui.Controls.resources => 0x6e72ed77 => 26
	i32 1858542181, ; 121: System.Linq.Expressions => 0x6ec71a65 => 113
	i32 1875935024, ; 122: fr\Microsoft.Maui.Controls.resources => 0x6fd07f30 => 8
	i32 1910275211, ; 123: System.Collections.NonGeneric.dll => 0x71dc7c8b => 102
	i32 1939592360, ; 124: System.Private.Xml.Linq => 0x739bd4a8 => 122
	i32 1968388702, ; 125: Microsoft.Extensions.Configuration.dll => 0x75533a5e => 40
	i32 1970169802, ; 126: ZXing.SkiaSharp.dll => 0x756e67ca => 96
	i32 2003115576, ; 127: el\Microsoft.Maui.Controls.resources => 0x77651e38 => 5
	i32 2019465201, ; 128: Xamarin.AndroidX.Lifecycle.ViewModel => 0x785e97f1 => 79
	i32 2025202353, ; 129: ar/Microsoft.Maui.Controls.resources.dll => 0x78b622b1 => 0
	i32 2045470958, ; 130: System.Private.Xml => 0x79eb68ee => 123
	i32 2055257422, ; 131: Xamarin.AndroidX.Lifecycle.LiveData.Core.dll => 0x7a80bd4e => 78
	i32 2066184531, ; 132: de\Microsoft.Maui.Controls.resources => 0x7b277953 => 4
	i32 2072397586, ; 133: Microsoft.Extensions.FileProviders.Physical => 0x7b864712 => 47
	i32 2079903147, ; 134: System.Runtime.dll => 0x7bf8cdab => 127
	i32 2090596640, ; 135: System.Numerics.Vectors => 0x7c9bf920 => 119
	i32 2127167465, ; 136: System.Console => 0x7ec9ffe9 => 108
	i32 2142473426, ; 137: System.Collections.Specialized => 0x7fb38cd2 => 103
	i32 2159891885, ; 138: Microsoft.Maui => 0x80bd55ad => 56
	i32 2169148018, ; 139: hu\Microsoft.Maui.Controls.resources => 0x814a9272 => 12
	i32 2181898931, ; 140: Microsoft.Extensions.Options.dll => 0x820d22b3 => 51
	i32 2192057212, ; 141: Microsoft.Extensions.Logging.Abstractions => 0x82a8237c => 50
	i32 2193016926, ; 142: System.ObjectModel.dll => 0x82b6c85e => 120
	i32 2201107256, ; 143: Xamarin.KotlinX.Coroutines.Core.Jvm.dll => 0x83323b38 => 94
	i32 2201231467, ; 144: System.Net.Http => 0x8334206b => 116
	i32 2207618523, ; 145: it\Microsoft.Maui.Controls.resources => 0x839595db => 14
	i32 2266799131, ; 146: Microsoft.Extensions.Configuration.Abstractions => 0x871c9c1b => 41
	i32 2270573516, ; 147: fr/Microsoft.Maui.Controls.resources.dll => 0x875633cc => 8
	i32 2279755925, ; 148: Xamarin.AndroidX.RecyclerView.dll => 0x87e25095 => 86
	i32 2303942373, ; 149: nb\Microsoft.Maui.Controls.resources => 0x89535ee5 => 18
	i32 2305521784, ; 150: System.Private.CoreLib.dll => 0x896b7878 => 137
	i32 2353062107, ; 151: System.Net.Primitives => 0x8c40e0db => 117
	i32 2364201794, ; 152: SkiaSharp.Views.Maui.Core => 0x8ceadb42 => 62
	i32 2368005991, ; 153: System.Xml.ReaderWriter.dll => 0x8d24e767 => 135
	i32 2371007202, ; 154: Microsoft.Extensions.Configuration => 0x8d52b2e2 => 40
	i32 2395872292, ; 155: id\Microsoft.Maui.Controls.resources => 0x8ece1c24 => 13
	i32 2411328690, ; 156: Microsoft.AspNetCore.Components => 0x8fb9f4b2 => 36
	i32 2427813419, ; 157: hi\Microsoft.Maui.Controls.resources => 0x90b57e2b => 10
	i32 2435356389, ; 158: System.Console.dll => 0x912896e5 => 108
	i32 2442556106, ; 159: Microsoft.JSInterop.dll => 0x919672ca => 53
	i32 2475788418, ; 160: Java.Interop.dll => 0x93918882 => 138
	i32 2480646305, ; 161: Microsoft.Maui.Controls => 0x93dba8a1 => 54
	i32 2550873716, ; 162: hr\Microsoft.Maui.Controls.resources => 0x980b3e74 => 11
	i32 2570120770, ; 163: System.Text.Encodings.Web => 0x9930ee42 => 129
	i32 2592341985, ; 164: Microsoft.Extensions.FileProviders.Abstractions => 0x9a83ffe1 => 44
	i32 2593496499, ; 165: pl\Microsoft.Maui.Controls.resources => 0x9a959db3 => 20
	i32 2605712449, ; 166: Xamarin.KotlinX.Coroutines.Core.Jvm => 0x9b500441 => 94
	i32 2617129537, ; 167: System.Private.Xml.dll => 0x9bfe3a41 => 123
	i32 2620871830, ; 168: Xamarin.AndroidX.CursorAdapter.dll => 0x9c375496 => 73
	i32 2625339995, ; 169: SkiaSharp.Views.Maui.Core.dll => 0x9c7b825b => 62
	i32 2626831493, ; 170: ja\Microsoft.Maui.Controls.resources => 0x9c924485 => 15
	i32 2663698177, ; 171: System.Runtime.Loader => 0x9ec4cf01 => 125
	i32 2692077919, ; 172: Microsoft.AspNetCore.Components.WebView.dll => 0xa075d95f => 38
	i32 2720851842, ; 173: ZXingBlazor => 0xa22ce782 => 99
	i32 2724373263, ; 174: System.Runtime.Numerics.dll => 0xa262a30f => 126
	i32 2732626843, ; 175: Xamarin.AndroidX.Activity => 0xa2e0939b => 63
	i32 2737747696, ; 176: Xamarin.AndroidX.AppCompat.AppCompatResources.dll => 0xa32eb6f0 => 65
	i32 2752995522, ; 177: pt-BR\Microsoft.Maui.Controls.resources => 0xa41760c2 => 21
	i32 2758225723, ; 178: Microsoft.Maui.Controls.Xaml => 0xa4672f3b => 55
	i32 2764765095, ; 179: Microsoft.Maui.dll => 0xa4caf7a7 => 56
	i32 2778768386, ; 180: Xamarin.AndroidX.ViewPager.dll => 0xa5a0a402 => 89
	i32 2785988530, ; 181: th\Microsoft.Maui.Controls.resources => 0xa60ecfb2 => 27
	i32 2795602088, ; 182: SkiaSharp.Views.Android.dll => 0xa6a180a8 => 60
	i32 2801831435, ; 183: Microsoft.Maui.Graphics => 0xa7008e0b => 58
	i32 2806116107, ; 184: es/Microsoft.Maui.Controls.resources.dll => 0xa741ef0b => 6
	i32 2810250172, ; 185: Xamarin.AndroidX.CoordinatorLayout.dll => 0xa78103bc => 71
	i32 2831556043, ; 186: nl/Microsoft.Maui.Controls.resources.dll => 0xa8c61dcb => 19
	i32 2853208004, ; 187: Xamarin.AndroidX.ViewPager => 0xaa107fc4 => 89
	i32 2861189240, ; 188: Microsoft.Maui.Essentials => 0xaa8a4878 => 57
	i32 2892341533, ; 189: Microsoft.AspNetCore.Components.Web => 0xac65a11d => 37
	i32 2909740682, ; 190: System.Private.CoreLib => 0xad6f1e8a => 137
	i32 2911054922, ; 191: Microsoft.Extensions.FileProviders.Physical.dll => 0xad832c4a => 47
	i32 2912489636, ; 192: SkiaSharp.Views.Android => 0xad9910a4 => 60
	i32 2916838712, ; 193: Xamarin.AndroidX.ViewPager2.dll => 0xaddb6d38 => 90
	i32 2919462931, ; 194: System.Numerics.Vectors.dll => 0xae037813 => 119
	i32 2959614098, ; 195: System.ComponentModel.dll => 0xb0682092 => 107
	i32 2965157864, ; 196: Xamarin.AndroidX.Camera.View => 0xb0bcb7e8 => 68
	i32 2978675010, ; 197: Xamarin.AndroidX.DrawerLayout => 0xb18af942 => 75
	i32 2991449226, ; 198: Xamarin.AndroidX.Camera.Core => 0xb24de48a => 66
	i32 3000842441, ; 199: Xamarin.AndroidX.Camera.View.dll => 0xb2dd38c9 => 68
	i32 3038032645, ; 200: _Microsoft.Android.Resource.Designer.dll => 0xb514b305 => 34
	i32 3047751430, ; 201: Xamarin.AndroidX.Camera.Core.dll => 0xb5a8ff06 => 66
	i32 3057625584, ; 202: Xamarin.AndroidX.Navigation.Common => 0xb63fa9f0 => 82
	i32 3059408633, ; 203: Mono.Android.Runtime => 0xb65adef9 => 139
	i32 3059793426, ; 204: System.ComponentModel.Primitives => 0xb660be12 => 105
	i32 3077302341, ; 205: hu/Microsoft.Maui.Controls.resources.dll => 0xb76be845 => 12
	i32 3178803400, ; 206: Xamarin.AndroidX.Navigation.Fragment.dll => 0xbd78b0c8 => 83
	i32 3215347189, ; 207: zxing => 0xbfa64df5 => 95
	i32 3220365878, ; 208: System.Threading => 0xbff2e236 => 133
	i32 3258312781, ; 209: Xamarin.AndroidX.CardView => 0xc235e84d => 69
	i32 3286373667, ; 210: ZXing.Net.MAUI.dll => 0xc3e21523 => 97
	i32 3305363605, ; 211: fi\Microsoft.Maui.Controls.resources => 0xc503d895 => 7
	i32 3316684772, ; 212: System.Net.Requests.dll => 0xc5b097e4 => 118
	i32 3317135071, ; 213: Xamarin.AndroidX.CustomView.dll => 0xc5b776df => 74
	i32 3330690927, ; 214: ZXing.SkiaSharp => 0xc6864f6f => 96
	i32 3340387945, ; 215: SkiaSharp => 0xc71a4669 => 59
	i32 3346324047, ; 216: Xamarin.AndroidX.Navigation.Runtime => 0xc774da4f => 84
	i32 3357674450, ; 217: ru\Microsoft.Maui.Controls.resources => 0xc8220bd2 => 24
	i32 3358260929, ; 218: System.Text.Json => 0xc82afec1 => 130
	i32 3362522851, ; 219: Xamarin.AndroidX.Core => 0xc86c06e3 => 72
	i32 3366347497, ; 220: Java.Interop => 0xc8a662e9 => 138
	i32 3374999561, ; 221: Xamarin.AndroidX.RecyclerView => 0xc92a6809 => 86
	i32 3381016424, ; 222: da\Microsoft.Maui.Controls.resources => 0xc9863768 => 3
	i32 3406629867, ; 223: Microsoft.Extensions.FileProviders.Composite.dll => 0xcb0d0beb => 45
	i32 3428513518, ; 224: Microsoft.Extensions.DependencyInjection.dll => 0xcc5af6ee => 42
	i32 3463511458, ; 225: hr/Microsoft.Maui.Controls.resources.dll => 0xce70fda2 => 11
	i32 3471940407, ; 226: System.ComponentModel.TypeConverter.dll => 0xcef19b37 => 106
	i32 3473156932, ; 227: SkiaSharp.Views.Maui.Controls.dll => 0xcf042b44 => 61
	i32 3476120550, ; 228: Mono.Android => 0xcf3163e6 => 140
	i32 3479583265, ; 229: ru/Microsoft.Maui.Controls.resources.dll => 0xcf663a21 => 24
	i32 3484440000, ; 230: ro\Microsoft.Maui.Controls.resources => 0xcfb055c0 => 23
	i32 3485117614, ; 231: System.Text.Json.dll => 0xcfbaacae => 130
	i32 3500000672, ; 232: Microsoft.JSInterop => 0xd09dc5a0 => 53
	i32 3509114376, ; 233: System.Xml.Linq => 0xd128d608 => 134
	i32 3580758918, ; 234: zh-HK\Microsoft.Maui.Controls.resources => 0xd56e0b86 => 31
	i32 3608519521, ; 235: System.Linq.dll => 0xd715a361 => 114
	i32 3641597786, ; 236: Xamarin.AndroidX.Lifecycle.LiveData.Core => 0xd90e5f5a => 78
	i32 3643446276, ; 237: tr\Microsoft.Maui.Controls.resources => 0xd92a9404 => 28
	i32 3643854240, ; 238: Xamarin.AndroidX.Navigation.Fragment => 0xd930cda0 => 83
	i32 3657292374, ; 239: Microsoft.Extensions.Configuration.Abstractions.dll => 0xd9fdda56 => 41
	i32 3672681054, ; 240: Mono.Android.dll => 0xdae8aa5e => 140
	i32 3676461095, ; 241: Xamarin.AndroidX.Camera.Lifecycle => 0xdb225827 => 67
	i32 3697841164, ; 242: zh-Hant/Microsoft.Maui.Controls.resources.dll => 0xdc68940c => 33
	i32 3724971120, ; 243: Xamarin.AndroidX.Navigation.Common.dll => 0xde068c70 => 82
	i32 3748608112, ; 244: System.Diagnostics.DiagnosticSource => 0xdf6f3870 => 109
	i32 3751582913, ; 245: ZXing.Net.MAUI.Controls => 0xdf9c9cc1 => 98
	i32 3786282454, ; 246: Xamarin.AndroidX.Collection => 0xe1ae15d6 => 70
	i32 3792276235, ; 247: System.Collections.NonGeneric => 0xe2098b0b => 102
	i32 3802395368, ; 248: System.Collections.Specialized.dll => 0xe2a3f2e8 => 103
	i32 3823082795, ; 249: System.Security.Cryptography.dll => 0xe3df9d2b => 128
	i32 3841636137, ; 250: Microsoft.Extensions.DependencyInjection.Abstractions.dll => 0xe4fab729 => 43
	i32 3842894692, ; 251: ZXing.Net.MAUI => 0xe50deb64 => 97
	i32 3849253459, ; 252: System.Runtime.InteropServices.dll => 0xe56ef253 => 124
	i32 3870474158, ; 253: BlazorBarcodeScanner.ZXing.JS => 0xe6b2bfae => 35
	i32 3889960447, ; 254: zh-Hans/Microsoft.Maui.Controls.resources.dll => 0xe7dc15ff => 32
	i32 3896106733, ; 255: System.Collections.Concurrent.dll => 0xe839deed => 101
	i32 3896760992, ; 256: Xamarin.AndroidX.Core.dll => 0xe843daa0 => 72
	i32 3928044579, ; 257: System.Xml.ReaderWriter => 0xea213423 => 135
	i32 3931092270, ; 258: Xamarin.AndroidX.Navigation.UI => 0xea4fb52e => 85
	i32 3955647286, ; 259: Xamarin.AndroidX.AppCompat.dll => 0xebc66336 => 64
	i32 3980434154, ; 260: th/Microsoft.Maui.Controls.resources.dll => 0xed409aea => 27
	i32 3987592930, ; 261: he/Microsoft.Maui.Controls.resources.dll => 0xedadd6e2 => 9
	i32 4025784931, ; 262: System.Memory => 0xeff49a63 => 115
	i32 4046471985, ; 263: Microsoft.Maui.Controls.Xaml.dll => 0xf1304331 => 55
	i32 4068434129, ; 264: System.Private.Xml.Linq.dll => 0xf27f60d1 => 122
	i32 4073602200, ; 265: System.Threading.dll => 0xf2ce3c98 => 133
	i32 4092525758, ; 266: Dignicard => 0xf3eefcbe => 100
	i32 4094352644, ; 267: Microsoft.Maui.Essentials.dll => 0xf40add04 => 57
	i32 4100113165, ; 268: System.Private.Uri => 0xf462c30d => 121
	i32 4102112229, ; 269: pt/Microsoft.Maui.Controls.resources.dll => 0xf48143e5 => 22
	i32 4125707920, ; 270: ms/Microsoft.Maui.Controls.resources.dll => 0xf5e94e90 => 17
	i32 4126470640, ; 271: Microsoft.Extensions.DependencyInjection => 0xf5f4f1f0 => 42
	i32 4127667938, ; 272: System.IO.FileSystem.Watcher => 0xf60736e2 => 112
	i32 4150914736, ; 273: uk\Microsoft.Maui.Controls.resources => 0xf769eeb0 => 29
	i32 4164802419, ; 274: System.IO.FileSystem.Watcher.dll => 0xf83dd773 => 112
	i32 4182413190, ; 275: Xamarin.AndroidX.Lifecycle.ViewModelSavedState.dll => 0xf94a8f86 => 80
	i32 4213026141, ; 276: System.Diagnostics.DiagnosticSource.dll => 0xfb1dad5d => 109
	i32 4271975918, ; 277: Microsoft.Maui.Controls.dll => 0xfea12dee => 54
	i32 4274976490, ; 278: System.Runtime.Numerics => 0xfecef6ea => 126
	i32 4290766699, ; 279: ZXingBlazor.dll => 0xffbfe76b => 99
	i32 4292120959, ; 280: Xamarin.AndroidX.Lifecycle.ViewModelSavedState => 0xffd4917f => 80
	i32 4294648842 ; 281: Microsoft.Extensions.FileProviders.Embedded => 0xfffb240a => 46
], align 4

@assembly_image_cache_indices = dso_local local_unnamed_addr constant [282 x i32] [
	i32 92, ; 0
	i32 67, ; 1
	i32 132, ; 2
	i32 33, ; 3
	i32 58, ; 4
	i32 124, ; 5
	i32 70, ; 6
	i32 88, ; 7
	i32 30, ; 8
	i32 31, ; 9
	i32 107, ; 10
	i32 36, ; 11
	i32 2, ; 12
	i32 30, ; 13
	i32 63, ; 14
	i32 15, ; 15
	i32 77, ; 16
	i32 14, ; 17
	i32 132, ; 18
	i32 115, ; 19
	i32 34, ; 20
	i32 26, ; 21
	i32 104, ; 22
	i32 76, ; 23
	i32 136, ; 24
	i32 120, ; 25
	i32 13, ; 26
	i32 7, ; 27
	i32 52, ; 28
	i32 59, ; 29
	i32 49, ; 30
	i32 46, ; 31
	i32 21, ; 32
	i32 74, ; 33
	i32 19, ; 34
	i32 129, ; 35
	i32 101, ; 36
	i32 1, ; 37
	i32 134, ; 38
	i32 16, ; 39
	i32 4, ; 40
	i32 125, ; 41
	i32 118, ; 42
	i32 111, ; 43
	i32 25, ; 44
	i32 51, ; 45
	i32 39, ; 46
	i32 121, ; 47
	i32 110, ; 48
	i32 98, ; 49
	i32 95, ; 50
	i32 105, ; 51
	i32 28, ; 52
	i32 92, ; 53
	i32 77, ; 54
	i32 104, ; 55
	i32 48, ; 56
	i32 87, ; 57
	i32 43, ; 58
	i32 3, ; 59
	i32 64, ; 60
	i32 113, ; 61
	i32 79, ; 62
	i32 106, ; 63
	i32 93, ; 64
	i32 136, ; 65
	i32 16, ; 66
	i32 22, ; 67
	i32 44, ; 68
	i32 84, ; 69
	i32 20, ; 70
	i32 18, ; 71
	i32 2, ; 72
	i32 100, ; 73
	i32 75, ; 74
	i32 114, ; 75
	i32 32, ; 76
	i32 87, ; 77
	i32 71, ; 78
	i32 0, ; 79
	i32 45, ; 80
	i32 6, ; 81
	i32 111, ; 82
	i32 65, ; 83
	i32 52, ; 84
	i32 110, ; 85
	i32 35, ; 86
	i32 10, ; 87
	i32 5, ; 88
	i32 48, ; 89
	i32 131, ; 90
	i32 39, ; 91
	i32 25, ; 92
	i32 81, ; 93
	i32 61, ; 94
	i32 90, ; 95
	i32 73, ; 96
	i32 116, ; 97
	i32 131, ; 98
	i32 38, ; 99
	i32 127, ; 100
	i32 91, ; 101
	i32 117, ; 102
	i32 128, ; 103
	i32 69, ; 104
	i32 23, ; 105
	i32 1, ; 106
	i32 37, ; 107
	i32 88, ; 108
	i32 49, ; 109
	i32 139, ; 110
	i32 17, ; 111
	i32 76, ; 112
	i32 9, ; 113
	i32 81, ; 114
	i32 93, ; 115
	i32 91, ; 116
	i32 85, ; 117
	i32 50, ; 118
	i32 29, ; 119
	i32 26, ; 120
	i32 113, ; 121
	i32 8, ; 122
	i32 102, ; 123
	i32 122, ; 124
	i32 40, ; 125
	i32 96, ; 126
	i32 5, ; 127
	i32 79, ; 128
	i32 0, ; 129
	i32 123, ; 130
	i32 78, ; 131
	i32 4, ; 132
	i32 47, ; 133
	i32 127, ; 134
	i32 119, ; 135
	i32 108, ; 136
	i32 103, ; 137
	i32 56, ; 138
	i32 12, ; 139
	i32 51, ; 140
	i32 50, ; 141
	i32 120, ; 142
	i32 94, ; 143
	i32 116, ; 144
	i32 14, ; 145
	i32 41, ; 146
	i32 8, ; 147
	i32 86, ; 148
	i32 18, ; 149
	i32 137, ; 150
	i32 117, ; 151
	i32 62, ; 152
	i32 135, ; 153
	i32 40, ; 154
	i32 13, ; 155
	i32 36, ; 156
	i32 10, ; 157
	i32 108, ; 158
	i32 53, ; 159
	i32 138, ; 160
	i32 54, ; 161
	i32 11, ; 162
	i32 129, ; 163
	i32 44, ; 164
	i32 20, ; 165
	i32 94, ; 166
	i32 123, ; 167
	i32 73, ; 168
	i32 62, ; 169
	i32 15, ; 170
	i32 125, ; 171
	i32 38, ; 172
	i32 99, ; 173
	i32 126, ; 174
	i32 63, ; 175
	i32 65, ; 176
	i32 21, ; 177
	i32 55, ; 178
	i32 56, ; 179
	i32 89, ; 180
	i32 27, ; 181
	i32 60, ; 182
	i32 58, ; 183
	i32 6, ; 184
	i32 71, ; 185
	i32 19, ; 186
	i32 89, ; 187
	i32 57, ; 188
	i32 37, ; 189
	i32 137, ; 190
	i32 47, ; 191
	i32 60, ; 192
	i32 90, ; 193
	i32 119, ; 194
	i32 107, ; 195
	i32 68, ; 196
	i32 75, ; 197
	i32 66, ; 198
	i32 68, ; 199
	i32 34, ; 200
	i32 66, ; 201
	i32 82, ; 202
	i32 139, ; 203
	i32 105, ; 204
	i32 12, ; 205
	i32 83, ; 206
	i32 95, ; 207
	i32 133, ; 208
	i32 69, ; 209
	i32 97, ; 210
	i32 7, ; 211
	i32 118, ; 212
	i32 74, ; 213
	i32 96, ; 214
	i32 59, ; 215
	i32 84, ; 216
	i32 24, ; 217
	i32 130, ; 218
	i32 72, ; 219
	i32 138, ; 220
	i32 86, ; 221
	i32 3, ; 222
	i32 45, ; 223
	i32 42, ; 224
	i32 11, ; 225
	i32 106, ; 226
	i32 61, ; 227
	i32 140, ; 228
	i32 24, ; 229
	i32 23, ; 230
	i32 130, ; 231
	i32 53, ; 232
	i32 134, ; 233
	i32 31, ; 234
	i32 114, ; 235
	i32 78, ; 236
	i32 28, ; 237
	i32 83, ; 238
	i32 41, ; 239
	i32 140, ; 240
	i32 67, ; 241
	i32 33, ; 242
	i32 82, ; 243
	i32 109, ; 244
	i32 98, ; 245
	i32 70, ; 246
	i32 102, ; 247
	i32 103, ; 248
	i32 128, ; 249
	i32 43, ; 250
	i32 97, ; 251
	i32 124, ; 252
	i32 35, ; 253
	i32 32, ; 254
	i32 101, ; 255
	i32 72, ; 256
	i32 135, ; 257
	i32 85, ; 258
	i32 64, ; 259
	i32 27, ; 260
	i32 9, ; 261
	i32 115, ; 262
	i32 55, ; 263
	i32 122, ; 264
	i32 133, ; 265
	i32 100, ; 266
	i32 57, ; 267
	i32 121, ; 268
	i32 22, ; 269
	i32 17, ; 270
	i32 42, ; 271
	i32 112, ; 272
	i32 29, ; 273
	i32 112, ; 274
	i32 80, ; 275
	i32 109, ; 276
	i32 54, ; 277
	i32 126, ; 278
	i32 99, ; 279
	i32 80, ; 280
	i32 46 ; 281
], align 4

@marshal_methods_number_of_classes = dso_local local_unnamed_addr constant i32 0, align 4

@marshal_methods_class_cache = dso_local local_unnamed_addr global [0 x %struct.MarshalMethodsManagedClass] zeroinitializer, align 4

; Names of classes in which marshal methods reside
@mm_class_names = dso_local local_unnamed_addr constant [0 x ptr] zeroinitializer, align 4

@mm_method_names = dso_local local_unnamed_addr constant [1 x %struct.MarshalMethodName] [
	%struct.MarshalMethodName {
		i64 0, ; id 0x0; name: 
		ptr @.MarshalMethodName.0_name; char* name
	} ; 0
], align 8

; get_function_pointer (uint32_t mono_image_index, uint32_t class_index, uint32_t method_token, void*& target_ptr)
@get_function_pointer = internal dso_local unnamed_addr global ptr null, align 4

; Functions

; Function attributes: "min-legal-vector-width"="0" mustprogress nofree norecurse nosync "no-trapping-math"="true" nounwind "stack-protector-buffer-size"="8" uwtable willreturn
define void @xamarin_app_init(ptr nocapture noundef readnone %env, ptr noundef %fn) local_unnamed_addr #0
{
	%fnIsNull = icmp eq ptr %fn, null
	br i1 %fnIsNull, label %1, label %2

1: ; preds = %0
	%putsResult = call noundef i32 @puts(ptr @.str.0)
	call void @abort()
	unreachable 

2: ; preds = %1, %0
	store ptr %fn, ptr @get_function_pointer, align 4, !tbaa !3
	ret void
}

; Strings
@.str.0 = private unnamed_addr constant [40 x i8] c"get_function_pointer MUST be specified\0A\00", align 1

;MarshalMethodName
@.MarshalMethodName.0_name = private unnamed_addr constant [1 x i8] c"\00", align 1

; External functions

; Function attributes: noreturn "no-trapping-math"="true" nounwind "stack-protector-buffer-size"="8"
declare void @abort() local_unnamed_addr #2

; Function attributes: nofree nounwind
declare noundef i32 @puts(ptr noundef) local_unnamed_addr #1
attributes #0 = { "min-legal-vector-width"="0" mustprogress nofree norecurse nosync "no-trapping-math"="true" nounwind "stack-protector-buffer-size"="8" "stackrealign" "target-cpu"="i686" "target-features"="+cx8,+mmx,+sse,+sse2,+sse3,+ssse3,+x87" "tune-cpu"="generic" uwtable willreturn }
attributes #1 = { nofree nounwind }
attributes #2 = { noreturn "no-trapping-math"="true" nounwind "stack-protector-buffer-size"="8" "stackrealign" "target-cpu"="i686" "target-features"="+cx8,+mmx,+sse,+sse2,+sse3,+ssse3,+x87" "tune-cpu"="generic" }

; Metadata
!llvm.module.flags = !{!0, !1, !7}
!0 = !{i32 1, !"wchar_size", i32 4}
!1 = !{i32 7, !"PIC Level", i32 2}
!llvm.ident = !{!2}
!2 = !{!"Xamarin.Android remotes/origin/release/8.0.4xx @ a8cd27e430e55df3e3c1e3a43d35c11d9512a2db"}
!3 = !{!4, !4, i64 0}
!4 = !{!"any pointer", !5, i64 0}
!5 = !{!"omnipotent char", !6, i64 0}
!6 = !{!"Simple C++ TBAA"}
!7 = !{i32 1, !"NumRegisterParameters", i32 0}
