// (function() {
//   var HOST = "https://d13txem1unpe48.cloudfront.net/"

//   addEventListener("trix-attachment-add", function(event) {
//     if (event.attachment.file) {
//       uploadFileAttachment(event.attachment)
//     }
//   })

//   function uploadFileAttachment(attachment) {
//     uploadFile(attachment.file, setProgress, setAttributes)

//     function setProgress(progress) {
//       attachment.setUploadProgress(progress)
//     }

//     function setAttributes(attributes) {
//       attachment.setAttributes(attributes)
//     }
//   }

//   function uploadFile(file, progressCallback, successCallback) {
//     var key = createStorageKey(file)
//     var formData = createFormData(key, file)
//     var xhr = new XMLHttpRequest()

//     xhr.open("POST", HOST, true)

//     xhr.upload.addEventListener("progress", function(event) {
//       var progress = event.loaded / event.total * 100
//       progressCallback(progress)
//     })

//     xhr.addEventListener("load", function(event) {
//       if (xhr.status == 204) {
//         var attributes = {
//           url: HOST + key,
//           href: HOST + key + "?content-disposition=attachment"
//         }
//         successCallback(attributes)
//       }
//     })

//     xhr.send(formData)
//   }

//   function createStorageKey(file) {
//     var date = new Date()
//     var day = date.toISOString().slice(0,10)
//     var name = date.getTime() + "-" + file.name
//     return [ "tmp", day, name ].join("/")
//   }

//   function createFormData(key, file) {
//     var data = new FormData()
//     data.append("key", key)
//     data.append("Content-Type", file.type)
//     data.append("file", file)
//     return data
//   }
// })();

// If your code is for ES5
// import cloudinary from "cloudinary-core";

function photo_upload() {

  const cloudName = "dhnkmpy8d";
  const HOST = `https://api.cloudinary.com/v1_1/${cloudName}/upload`;  // const cl = cloudinary.Cloudinary({cloud_name: "dhnkmpy8d", secure: true});

  addEventListener("trix-attachment-add", function(event) {
    console.log("event triggered");
    if (event.attachment.file) {
      // cloudinary.uploader().uploadLarge(event.attachment.file);
      uploadFileAttachment(event.attachment)

      console.log("there's a file");
    };
  });

  function uploadFileAttachment(attachment) {
    uploadFile(attachment.file, setProgress, setAttributes)

    function setProgress(progress) {
      attachment.setUploadProgress(progress)
    }

    function setAttributes(attributes) {
      attachment.setAttributes(attributes)
      // console.log("Attached?");
    }
  }

  function uploadFile(file, progressCallback, successCallback) {
    var key = createStorageKey(file)
    var formData = createFormData(key, file)
    var xhr = new XMLHttpRequest()

    xhr.open("POST", HOST, true)

    xhr.upload.addEventListener("progress", function(event) {
      var progress = event.loaded / event.total * 100
      progressCallback(progress)
    })

    xhr.addEventListener("load", function(event) {
      console.log(xhr.status);
      if (xhr.status == 200) {
        const response = JSON.parse(xhr.responseText);
        console.log(response);
        var attributes = {
          url: response["secure_url"],
          href: response["secure_url"] + "?content-disposition=attachment"
        }
        successCallback(attributes);
      }
    })

    xhr.send(formData)
  }

  function createStorageKey(file) {
    var date = new Date()
    var day = date.toISOString().slice(0,10)
    var name = date.getTime() + "-" + file.name
    return [ "tmp", day, name ].join("/")
  }

  function createFormData(key, file) {
    var data = new FormData()
    data.append("key", key)
    data.append("Content-Type", file.type)
    data.append("upload_preset","ml_default")
    data.append("file", file)
    return data
  }
};

export { photo_upload };
