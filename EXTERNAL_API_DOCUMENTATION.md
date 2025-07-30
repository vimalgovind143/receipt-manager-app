# External API Call Documentation: Receipt Manager App

This document provides a detailed overview of the external API call made by the Receipt Manager app, including its purpose, file details, and configuration options.

## 1. API Call Overview

The Receipt Manager app makes an external API call to upload receipt images (or other files) to a server for processing. This is a core feature of the app, as it relies on a separate server-side component (the [`receipt-parser-server`](https://github.com/ReceiptManager/receipt-parser-server)) to parse the receipt data.

### 1.1. Purpose

The purpose of the API call is to send a receipt image to the server, which then analyzes the image and returns the parsed receipt data (e.g., store name, total amount, date).

### 1.2. Method & Endpoint

- **Method:** `POST`
- **Endpoint:** `/api/upload`

### 1.3. Data Format

The API call is a `multipart/form-data` request, which is used to send files along with other data.

## 2. File Details & Code Location

The code responsible for making the external API call is located in the `upload_controller.dart` file.

### 2.1. Main File

- **File Path:** `lib/app/pages/upload/upload_controller.dart`
- **Controller Class:** `UploadController`

### 2.2. Key Method

The primary method responsible for the API call is the `send()` method:

```dart
/// Sends the receipt image to the external server for processing.
/// This method constructs a multipart form data request to the /api/upload endpoint.
/// The URL and parameters are dynamically configured based on the app's settings.
Future<InsertReceiptHolder?> send(File image) async {
  try {
    await FlutterUploader().enqueue(
      MultipartFormDataUpload(
        url:
            "${_https ? "https" : "http"}://${_reverseProxy! ? "www." : ""}$_address${_reverseProxy! ? "" : ":8721"}/api/upload?access_token=$_token&grayscale_image=$_grayscaleImage&gaussian_blur=$_gaussianBlur&rotate=$_rotateImage",
        files: [FileItem(path: image.path, field: "file")],
        method: UploadMethod.POST,
      ),
    );
  } catch (e) {
    UserNotifier.fail(S.of(getContext()).failedToUploadReceipt, getContext());
  }
}
```

### 2.3. Triggering the API Call

The API call is triggered from the `sendReceipt()` method in the same file:

```dart
void sendReceipt(File image) async {
  await FlutterUploader().cancelAll();
  await FlutterUploader().clearUploads();
  if (!validArguments()) return;
  await send(image);
  Navigator.pop(getContext());
}
```

This method is called from the UI when the user uploads an image, as seen in `lib/app/pages/upload/image_upload_view.dart`:

```dart
onPressed: () => controller.sendReceipt(widget.image),
```

## 3. Configuration

The API call is highly configurable through the app's settings, which are stored in a Hive database. The configuration options are defined as constants in the `constants.dart` file.

### 3.1. Configuration File

- **File Path:** `lib/app/constants.dart`

### 3.2. Configuration Parameters

The following parameters are used to construct the API request URL and are loaded from the app's settings:

| Constant | Description | Default Value |
|---|---|---|
| `enableHttps` | Determines whether to use `https` or `http` | `true` |
| `serverDomain` / `serverIP` | The address of the receipt parser server | User-defined |
| `reverseProxyField` | Whether to use a reverse proxy (`www.`) | User-defined |
| `apiTokenField` | The authentication token for the API | User-defined |
| `enableGrayscale` | Whether to convert the image to grayscale | `true` |
| `enableGaussianBlur` | Whether to apply a Gaussian blur to the image | `false` |
| `verticalImage` | Whether to rotate the image | `false` |

These settings are loaded in the `initListeners` method of the `UploadController` from the Hive settings box.

## 4. URL Construction

The URL is dynamically constructed using the following pattern:

```
${protocol}://${domain}${port}/api/upload?access_token=${token}&grayscale_image=${grayscale}&gaussian_blur=${blur}&rotate=${rotate}
```

Where:
- `protocol`: "https" or "http" based on `_https` setting
- `domain`: Either "www.${_address}" (reverse proxy) or "${_address}" (direct)
- `port`: ":8721" when not using reverse proxy, empty when using reverse proxy
- Query parameters include authentication token and image processing options

## 5. Dependencies

- **flutter_uploader**: Package used for handling multipart file uploads
- **Hive**: Used for storing and retrieving configuration settings

## 6. Error Handling

The method includes basic error handling that displays a failure notification to the user if the upload fails.

## 7. Summary

The external API call is a fundamental part of the Receipt Manager app's functionality. It is designed to be flexible and configurable, allowing users to connect to their own receipt parser server. The API call is well-structured within the `UploadController` and uses the `flutter_uploader` package to handle the file upload.
