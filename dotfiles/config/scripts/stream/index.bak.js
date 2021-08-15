const express = require("express");
const app = express();
const port = 5002;
const fs = require("fs");
const { spawn, spawnSync } = require("child_process");

const movie_path =
    "/home/ananthu/Public/159/Fear.Street.Part.2.1978.2021.480p.NF.WEB-DL.x264.400MB-Pahe.in.mkv";
const xxx_path = "/home/ananthu/.local/share/x.mp4";

app.use(express.json());
app.use(express.urlencoded({ extended: true }));

function playVideos2(req, res, path) {
    const fileSize = fs.statSync(path).size;
    const range = req.headers.range;
    // console.log(`playvideo2 :: ${fileSize} :: ${range}`);
    if (range) {
        const chunksize = 500 * 10 ** 3; // 500KB
        const start = Number(range.replace(/\D/g, ""));
        const end = Math.min(start + chunksize, fileSize - 1);
        const contentLength = end - start + 1;
        // console.log(
        //     `${fileSize} :: ${start} :: ${end} :: ${chunksize} :: ${contentLength}`
        // );
        const videoStream = fs.createReadStream(path, { start, end });

        const headers = {
            "Content-Range": `bytes ${start}-${end}/${fileSize}`,
            "Accept-Ranges": "bytes",
            "Content-Length": contentLength,
            "Content-Type": "video/mp4",
        };

        res.writeHead(206, headers);
        videoStream.pipe(res);
    }
}

function playVideos(req, res, path) {
    const stat = fs.statSync(path);
    const fileSize = stat.size;
    const range = req.headers.range;
    if (range) {
        const parts = range.replace(/bytes=/, "").split("-");
        const start = parseInt(parts[0], 10);
        const end = parts[1] ? parseInt(parts[1], 10) : fileSize;
        const chunksize = end - start;
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
}

function killAll() {
    spawnSync("killall", ["youtube-dl"]);
}

app.get("/", function (req, res) {
    res.json({
        status: "up",
    });
});

app.get("/m", function (req, res) {
    playVideos2(req, res, movie_path);
});

app.get("/x", function (req, res) {
    // let part_file_path = xxx_path + ".part";
    // if (fs.existsSync(part_file_path)) {
    //     playVideos(req, res, part_file_path);
    // } else {
    //     playVideos(req, res, xxx_path);
    // }
    playVideos2(req, res, xxx_path);
});

app.post("/job", function (req, res) {
    killAll();
    url = req.body["x-url"];
    const job = spawn("youtube-dl", [
        url,
        "--no-part",
        "--no-continue",
        "-o",
        xxx_path,
    ]);

    job.stdout.on("data", (data) => {
        console.log(`stdout: ${data}`);
    });
    job.stderr.on("data", (data) => {
        console.log(`stderr: ${data}`);
    });
    job.on("close", (code) => {
        console.log(`child process exited with code ${code}`);
    });

    res.json({
        status: "job started",
    });
});

app.get("/stop", function (req, res) {
    killAll();
    res.json({
        status: "job stopped",
    });
});

app.get("*", function (req, res) {
    res.redirect("/");
});

app.listen(port, () => {
    console.log(`Stream is running at port ${port}`);
});
