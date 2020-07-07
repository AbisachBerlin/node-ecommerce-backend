const path = require('path')
const bcrypt = require("bcryptjs")
const jwt = require("jsonwebtoken")
const db = require(path.join(path.dirname(require.main.filename), 'db.config.js'))

// LOGIN CONTROLLER
exports.login = async (req, res) => {
    const {
        email,
        password
    } = req.body
    // If email or password is missing
    if (!email || !password) {
        return res.status(400).json({
            message: "No Email/Password"
        })
    }

    db.query('SELECT * FROM users WHERE email = ?', [email], async (error, results) => {
        // If login is successful
        if (results.length > 0 && await bcrypt.compare(password, results[0].password)) {
            // Create jwt
            const token = jwt.sign({
                id: results[0].id
            }, process.env.JWT_SECRET_KEY)
            // Remove Password from the result Object
            results[0].password = undefined
            // Send response with user details
            res.json({
                message: "Logged in successfully",
                jwt: token,
                user: results[0]
            })
        } else {
            // If login fails
            res.status(401).json({
                message: "Wrong Email/Password"
            })
        }
    })

}

// REGISTER CONTROLLER
exports.register = (req, res) => {
    const {
        name,
        email,
        password
    } = req.body

    // If any data is missing
    if (!name || !email || !password) {
        return res.status(400).json({
            message: "Fields Missing"
        })
    }

    // Register the User
    db.query('SELECT email FROM users WHERE email = ?', [email], async (error, results) => {
        if (error) {
            console.log(error)
        }
        // If email already exits
        if (results.length > 0) {
            res.json({
                status: "fail",
                message: "Email already exists"
            })
        } else {
            // Successfully inserting data
            let hashedPassword = await bcrypt.hash(password, 8)
            db.query('INSERT INTO users SET ?', {
                name: name,
                email: email,
                password: hashedPassword
            }, (error, results) => {
                if (error) {
                    console.log(error)
                } else {
                    res.json({
                        status: "success",
                        message: "User added Successfully"
                    })
                }
            })
        }
    })

}

// USER DETAILS CONTROLLER aka /ME
exports.me = (req, res) => {
    db.query('SELECT * FROM users WHERE id = ?', [req.user.id], async (error, results) => {
        if (error) return res.status(500)
        const user = {
            id: results[0].id,
            name: results[0].name,
            email: results[0].email
        }
        res.json(user)
    })

}

// GET ALL CUSTOMERS
exports.all = (req, res) => {
    db.query('SELECT * FROM users', async (error, results) => {
        if (error) return res.status(500)
        res.json(results)
    })

}