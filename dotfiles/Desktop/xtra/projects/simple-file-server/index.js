const express = require("express");
const app = express();
const port = 3000;
const multer = require("multer");
const path = require("path");

// Set up storage for uploaded files
const storage = multer.diskStorage({
  destination: (req, file, cb) => {
    cb(null, "uploads/");
  },
  filename: (req, file, cb) => {
    console.log(`uploading file ${file}`);
    cb(null, Date.now() + "-" + file.originalname);
  },
});

function progress_middleware(req, res, next) {
  let progress = 0;
  const file_size = req.headers["content-length"];

  // set event listener
  req.on("data", (chunk) => {
    progress += chunk.length;
    const percentage = (progress / file_size) * 100;
    console.log(`file progress ${percentage}`);
  });

  // invoke next middleware
  next();
}

// Create the multer instance
const upload = multer({ storage: storage });

app.post("/up", progress_middleware, upload.array("file"), (req, res) => {
  // Handle the uploaded file
  res.json({ message: "File uploaded successfully!" });
});

app.get("/", (req, res) => {
  console.log(`request received from ip ${req.ip}`);
  res.sendFile(path.join(__dirname, "/index.html"));
});

app.listen(port, () => {
  console.log(`Upload app listening on port ${port}`);
});
