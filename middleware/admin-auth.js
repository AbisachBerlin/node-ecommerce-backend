const jwt = require("jsonwebtoken")

// Authenticate User Token
module.exports = (req, res, next) => {
    const authHeader = req.headers['authorization']
    const token = authHeader && authHeader.split(' ')[1]
    if (token == null) return res.status(400).json({
        message: "no token specified"
    })

    jwt.verify(token, process.env.JWT_SECRET_KEY, (err, user) => {
        if (err) return res.status(403).json({
            message: "Invalid Token"
        })
        req.user = user
        if (req.user.id !== 1) {
            return res.status(403).json({
                message: "Only Admin can do this action"
            })
        }
        next()
    })
}