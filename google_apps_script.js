function doGet() {
  var folderId = '1dfggMks3fl1LoxCFpTK_c_Faqj5lhEYF';
  var folder = DriveApp.getFolderById(folderId);
  var files = folder.getFiles();
  var result = [];
  
  while (files.hasNext()) {
    var file = files.next();
    result.push({
      name: file.getName(),
      url: file.getDownloadUrl(),
      size: file.getSize(),
      type: file.getMimeType(),
      id: file.getId()
    });
  }
  
  return ContentService.createTextOutput(JSON.stringify(result))
    .setMimeType(ContentService.MimeType.JSON);
}
