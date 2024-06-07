const express = require('express');
const { exec } = require('child_process');

const app = express();
const port = 6000;

// Route to trigger execution of shell script
app.get('/deploy/princedeployer/client', (req, res) => {
    exec('sh ./Scripts/client.sh', (err, stdout, stderr) => {
        if (err) {
            console.error(err);
            return res.status(500).json({ msg: 'Error executing script', error: err });
        }
        return res.status(200).send('Client deployed successfully');
    });
});

app.listen(port, () => {
    console.log(`Server is running on port ${port}`);
});