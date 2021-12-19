const express = require("express");
const fs = require("fs");
const { spawn, spawnSync } = require("child_process");
const path = require("path");
const config = require("./config");
const chokidar = require("chokidar");

// global configs
const movie_path = config.movie_path;
const xxx_path = config.xxx_path;
const series_directory_path = config.series_directory_path;
const series_directory_files_blacklist_extensions =
    config.series_directory_files_blacklist_extensions;
let series_current_ep = config.series_current_ep;

// local configs
const app = express();
const port = 5002;
let series_directory_files = [];
let job_completed = true;

app.use(express.json());
app.use(express.urlencoded({ extended: true }));

// watch for new files addition
const watchSeriesFileChanges = chokidar.watch(series_directory_path);
watchSeriesFileChanges
    .on("add", (event, path) => {
        findFiles();
    })
    .on("unlink", (event, path) => {
        findFiles();
    });

// finding files in series directory
function findFiles() {
    try {
        if (fs.existsSync(series_directory_path)) {
            const files = fs.readdir(
                series_directory_path,
                function (err, files) {
                    series_directory_files = [];
                    for (const file of files) {
                        let flag = false;
                        let extname = path.extname(file);
                        if (extname) {
                            series_directory_files_blacklist_extensions.some(
                                (ext) => {
                                    if (extname == ext) {
                                        flag = true;
                                        return true;
                                    }
                                }
                            );
                            if (!flag) {
                                series_directory_files.push(file);
                            }
                        }
                    }
                }
            );
        }
    } catch (err) {
        console.error("series directory files :: ", err);
    }
}

function playVideos(req, res, path) {
    const fileSize = fs.statSync(path).size;
    const range = req.headers.range;
    if (range) {
        const chunksize = 100 * 10 ** 3; // 100KB
        const start = Number(range.replace(/\D/g, ""));
        const end = Math.min(start + chunksize, fileSize - 1);
        const contentLength = end - start + 1;
        const videoStream = fs.createReadStream(path, { start, end });

        const headers = {
            "Content-Range": `bytes ${start}-${end}/${fileSize}`,
            "Accept-Ranges": "bytes",
            "Content-Length": contentLength,
            "Content-Type": "video/mp4",
        };

        res.writeHead(206, headers);
        videoStream.pipe(res);
    } else {
        res.json({
            status: "invalid request",
        });
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
    playVideos(req, res, movie_path);
});

app.get("/x", function (req, res) {
    playVideos(req, res, xxx_path);
});

app.get("/s", function (req, res) {
    var current_ep_path = path.join(
        series_directory_path,
        series_directory_files[series_current_ep - 1]
    );
    playVideos(req, res, current_ep_path);
});

app.post("/job/start", function (req, res) {
    url = req.body["x-url"];
    if (url) {
        killAll();
        job_completed = false;
        const job = spawn("youtube-dl", [
            url,
            "--no-part",
            "--no-continue",
            "-o",
            xxx_path,
        ]);

        job.stdout.on("data", (data) => {
            // stdout = data.toString("utf8");
            // job_progress = stdout.split(" ")[2];
            console.log(`stdout: ${data}`);
        });
        job.stderr.on("data", (data) => {
            console.log(`stderr: ${data}`);
        });
        job.on("close", (code) => {
            job_completed = true;
            console.log(`child process exited with code ${code}`);
        });

        res.json({
            status: "job started",
        });
    } else {
        res.json({
            status: "invalid request",
        });
    }
});

app.post("/job/stop", function (req, res) {
    killAll();
    res.json({
        status: "job stopped",
    });
});

app.get("/job/status", function (req, res) {
    if (job_completed) {
        res.json({
            status: "job completed",
        });
    } else {
        res.json({
            status: "job in progress",
        });
    }
});

app.post("/series/ep/increment", function (req, res) {
    if (series_current_ep < series_directory_files.length) {
        series_current_ep += 1;
        res.json({
            status: "series episode incremented",
        });
    } else {
        res.json({
            status: "invalid request",
        });
    }
});

app.post("/series/ep/decrement", function (req, res) {
    if (series_current_ep > 1) {
        series_current_ep -= 1;
        res.json({
            status: "series episode decremented",
        });
    } else {
        res.json({
            status: "invalid request",
        });
    }
});

app.post("/series/ep/set", function (req, res) {
    var ep = req.body["s-ep"];
    if (ep) {
        series_directory_files.some((file, index) => {
            if (file.toLowerCase().includes(ep.toLowerCase())) {
                series_current_ep = index + 1;
                return true;
            }
        });
        res.json({
            status: "current series episode updated",
        });
    } else {
        res.json({
            status: "invalid request",
        });
    }
});

app.get("/series/ep/status", function (req, res) {
    res.json({
        status: `current series episode ${series_current_ep} :: ${
            series_directory_files[series_current_ep - 1]
        } :: Total available ${series_directory_files.length}`,
    });
});

app.get("*", function (req, res) {
    res.redirect("/");
});

app.post("*", function (req, res) {
    res.redirect("/");
});

app.listen(port, () => {
    console.log(`Stream is running at port ${port}`);
});
