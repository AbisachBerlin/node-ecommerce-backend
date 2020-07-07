const express = require("express")
const path = require('path')
const router = express.Router()
const controller = require("./controller.js")
const auth = require(path.join(path.dirname(require.main.filename), 'middleware/auth.js'))
const adminAuth = require(path.join(path.dirname(require.main.filename), 'middleware/admin-auth.js'))

// User Login Route
router.post("/login", controller.login)
router.post("/register", controller.register)
router.get("/me", auth, controller.me)
router.get("/all", adminAuth, controller.all)

module.exports = router