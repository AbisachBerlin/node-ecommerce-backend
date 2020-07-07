const express = require('express')
const dotenv = require("dotenv")

// .env configs
dotenv.config({
    path: "./.env"
})

// Database Configs
const db = require('./db.config.js')
// Connect to Database
db.connect(error => {
    // Return if Error
    if (error) return console.log(`MySQL Connection Error: ${error}`)
    // Log if Success
    console.log("MySQL Database Connected")
})


// Start Express Server
const app = express()
app.listen(process.env.APP_PORT, () => console.log(`Server started at http://localhost:${process.env.APP_PORT}`))
// Use json in req and res body
app.use(express.json())
// Set Public Folder
// app.use(express.static('public'))
app.use("/public", express.static('./public'))

// Routes Configuration
app.get('/', (req, res) => res.send('Hello World!'))
app.use("/user", require("./api/user/routes.js"))
app.use("/products", require("./api/products/routes.js"))
app.use("/orders", require("./api/orders/routes.js"))