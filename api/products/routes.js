const express = require("express")
const path = require('path')
const router = express.Router()
const controller = require("./controller.js")
const adminAuth = require(path.join(path.dirname(require.main.filename), 'middleware/admin-auth.js'))

// User Login Route
router.get("/", controller.allProducts)
router.get("/:slug", controller.getbySlug)
router.post("/", adminAuth, controller.addProduct)
router.delete("/:id", adminAuth, controller.deleteProduct)
router.post("/uploadimage", controller.imageUpload)

module.exports = router