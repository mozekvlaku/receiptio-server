const express = require("express");
const { exec } = require("child_process");
const fs = require("fs");

const app = express();
app.use(express.text());

app.post("/print", (req, res) => {
    const content = req.body;

    if (!content) {
        return res.status(400).json({ error: "Missing content" });
    }

    const path = "/app/receipts/print.md";
    fs.writeFileSync(path, content);
    console.log('Printing...');

    console.log(content);

    try {
        exec(`receiptio ${path} -c 30 -p generic > /dev/usb/lp0`, (err, stdout, stderr) => {
            if (err) {
                console.error("Print error:", stderr);
                return res.status(500).json({ error: "Print failed" });
            }

            console.log('Print done');
            res.json({ status: "printed", output: stdout });
        });
    } catch (err) {
        console.error("Print error:", err);
    }
});

app.listen(3300, () => {
    console.log("Receipt server running on 3300");
});