//
//setStatus(String message) {
//  setState(() {
//    status = message;
//  });
//}
//
//startUpload() {
//  setStatus('Uploading Image...');
//  if (null == tmpFile) {
//    setStatus(errMessage);
//    return;
//  }
//  String fileName = tmpFile.path.split('/').last;
//  upload(fileName);
//}
//
//upload(String fileName) {
//  http.post(uploadEndPoint, body: {
//    "image": base64Image,
//    "name": fileName,
//  }).then((result) {
//    setStatus(result.statusCode == 200 ? result.body : errMessage);
//  }).catchError((error) {
//    setStatus(error);
//  })