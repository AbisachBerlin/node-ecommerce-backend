const path = require('path')
const db = require(path.join(path.dirname(require.main.filename), 'db.config.js'))
const multer = require("multer")

// Set Storage
const storage = multer.diskStorage({
    destination: path.join(path.dirname(require.main.filename), 'public/uploads'),
    filename: function (req, file, cb) {
        cb(null, Date.now() + "-" + file.originalname)
    }
})
// Initialize Multer
const upload = multer({
    storage: storage,
    limits: {
        fileSize: 5242880 //5 MB limit
    },
    fileFilter: function (req, file, cb) {
        // Allowed Types
        const filetypes = /jpeg|jpg|png/
        // Check Extension
        const extname = filetypes.test(path.extname(file.originalname).toLocaleLowerCase())
        // Check mime type
        const mimetype = filetypes.test(file.mimetype)

        if (extname && mimetype) {
            return cb(null, true)
        } else {
            return cb({
                message: "unsupported file type"
            })
        }
    }
}).single("productImage")


// GET ALL PRODUCTS
exports.allProducts = async (req, res) => {

    await db.query('SELECT * FROM products', async (error, results) => {
        if (error) return res.status(500).json({
            message: "DB Error"
        })
        res.json(results)
    })

}

// GET SINGLE PRODUCT BY SLUG
exports.getbySlug = async (req, res) => {
    const slug = req.params.slug

    await db.query('SELECT * FROM products WHERE slug = ?', [slug], async (error, results) => {
        if (error) return res.status(500).json({
            message: "DB Error"
        })
        if (results.length > 0) {
            res.json(results[0])
        } else {
            res.status(404).json({
                message: "Product with that slug not found"
            })
        }
    })

}

// ADD NEW PRODUCT
exports.addProduct = async (req, res) => {
    const {
        name,
        slug,
        price,
        description,
        image
    } = req.body

    if (!name || !slug || !price || !description || !image) return res.status(400).json({
        message: "Missing Fields"
    })

    await db.query('INSERT INTO products SET ?', req.body, async (error, results) => {
        if (error) return res.status(500).json({
            message: "DB Error"
        })

        res.json({
            message: "Product Successfully Added"
        })
    })

}

// DELETE SINGLE PRODUCT
exports.deleteProduct = async (req, res) => {
    const id = req.params.id

    await db.query('SELECT * FROM products WHERE ID = ?', id, async (error, results) => {
        if (error) return res.status(500).json({
            message: "DB Error"
        })
        if (results.length == 0) return res.status(400).json({
            message: "no such product"
        })

        await db.query('DELETE FROM products WHERE ID = ?', id, async (error, results) => {
            if (error) return res.status(500).json({
                message: "DB Error"
            })
            res.json({
                message: "Product Deleted Successfully"
            })
        })
    })
}

// UPLOAD IMAGE
exports.imageUpload = async (req, res) => {

    upload(req, res, (err) => {
        if (err) return res.status(500).json({
            message: err.message
        })
        if (req.file == undefined) return res.status(400).json({
            message: "File is required"
        })
        res.json({
            message: "Image uploaded successfully",
            url: "/public/uploads/" + req.file.filename
        })
    })
}