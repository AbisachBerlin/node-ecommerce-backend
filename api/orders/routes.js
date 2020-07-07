const express = require("express")
const path = require('path')
const router = express.Router()
const controller = require("./controller.js")
const auth = require(path.join(path.dirname(require.main.filename), 'middleware/auth.js'))
const adminAuth = require(path.join(path.dirname(require.main.filename), 'middleware/admin-auth.js'))


// Order Routes
router.post("/createpayment", controller.createPayment)
router.post("/createorder", controller.createOrder)
router.get("/getorders", auth, controller.getOrders)
router.get("/all", adminAuth, controller.allOrders)

module.exports = router