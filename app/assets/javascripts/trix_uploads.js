
// Turn off the default Trix captions
Trix.config.attachments.preview.caption = {
  name: false,
  size: false
};

function uploadAttachment(attachment) {
  // Create our form data to submit
  var file = attachment.file;
  var form = new FormData;
  form.append("Content-Type", file.type);
  console.log(file)
  form.append("file", file);

  form.append('tags', 'browser_upload');
  form.append('upload_preset', 'testUpload')
  // Create our XHR request
  let url ="https://api.cloudinary.com/v1_1/dhnkmpy8d/image/upload"
  var xhr = new XMLHttpRequest;
  xhr.open("POST", url, true);
  xhr.setRequestHeader("X-CSRF-Token", Rails.csrfToken());

  // Report file uploads back to Trix
  xhr.upload.onprogress = function(event) {
    var progress = event.loaded / event.total * 100;
    attachment.setUploadProgress(progress);
  }

  // Tell Trix what url and href to use on successful upload
  xhr.onload = function() {
    if (xhr.status === 201) {
      var data = JSON.parse(xhr.responseText);
      return attachment.setAttributes({
        url: data.image_url,
        href: data.url
      })
    }
  }

  return xhr.send(form);
}



window.ajaxSuccess = function () {
  response = JSON.parse(this.responseText);
  console.log("ajaxSuccess", typeof this.responseText);
  document.getElementById('uploaded').setAttribute("src", response["secure_url"]);
  document.getElementById('results').innerText = this.responseText;
}



// Listen for the Trix attachment event to trigger upload
document.addEventListener("trix-attachment-add", function(event) {
  if (event.attachment.file) {
    // return uploadAttachment(attachment);
    uploadFileAttachment(event.attachment);
  }
});


