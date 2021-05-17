const express = require("express");
const app = express();
const port = 5002;
// const path = require("path");
const fs = require("fs");

// app.get("/", (req, res) => {
//     const directoryPath = path.join(__dirname, "..", "Desktop");
//     fs.readdir(directoryPath, function (err, files) {
//         //handling error
//         if (err) {
//             return console.log("Unable to scan directory: " + err);
//         }
//         res.send({ files: files });
//     });
// });
app.get("/", function (req, res) {
    const path =
        "../Desktop/MG_THE_PRIEST_2021_Malayalam_HDRip_720p_x264_DD+5_1_192Kbps_&_AAC.mkv";
    const stat = fs.statSync(path);
    const fileSize = stat.size;
    const range = req.headers.range;
    if (range) {
        const parts = range.replace(/bytes=/, "").split("-");
        const start = parseInt(parts[0], 10);
        const end = parts[1] ? parseInt(parts[1], 10) : fileSize - 1;
        const chunksize = end - start + 1;
        const file = fs.createReadStream(path, { start, end });
        const head = {
            "Content-Range": `bytes ${start}-${end}/${fileSize}`,
            "Accept-Ranges": "bytes",
            "Content-Length": chunksize,
            "Content-Type": "video/mp4",
        };
        res.writeHead(206, head);
        file.pipe(res);
    } else {
        const head = {
            "Content-Length": fileSize,
            "Content-Type": "video/mp4",
        };
        res.writeHead(200, head);
        fs.createReadStream(path).pipe(res);
    }
});

app.listen(port, () => {
    console.log(`stream app listening at http://localhost:${port}`);
});
