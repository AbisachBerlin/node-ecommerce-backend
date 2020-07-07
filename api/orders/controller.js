const path = require('path');
const db = require(path.join(path.dirname(require.main.filename), 'db.config.js'))

const stripe = require('stripe')(process.env.STRIPE_SECRET_KEY);


exports.createPayment = async (req, res) => {
    await stripe.paymentIntents.create(req.body, (err, result) => {
        if (err) {
            res.json(err)
        } else {
            res.json({
                client_secret: result.client_secret
            })
        }
    });

}

exports.createOrder = async (req, res) => {
    await db.query("SELECT * FROM orders WHERE payment_id = ?", req.body.payment_id, async (error, results) => {
        if (error) return res.status(500).json({
            message: "DB Error"
        })
        if (results.length > 0) return res.status(400).json({
            message: "Payment ID already used"
        })
    })
    await stripe.paymentIntents.retrieve(req.body.payment_id, async (err, paymentIntent) => {
        if (err) {
            return res.json(err.message)
        }
        if (paymentIntent.status === "succeeded") {
            // Create order here
            await db.query('INSERT INTO orders SET ?', req.body, async (error, results) => {
                if (error) return res.status(500).json({
                    message: "DB Error",
                })
                return res.json({
                    message: "success",
                    order_id: results.insertId
                })
            })

        } else {
            return res.json({
                payment: paymentIntent.status
            })
        }
    });

}

exports.getOrders = async (req, res) => {

    await db.query("SELECT * FROM orders WHERE customer_id = ?", req.user.id, (error, results) => {
        if (error) return res.status(500).json({
            message: "DB Error"
        })
        res.json(results)
    })
}

exports.allOrders = async (req, res) => {

    await db.query("SELECT * FROM orders", (error, results) => {
        if (error) return res.status(500).json({
            message: "DB Error"
        })
        res.json(results)
    })
}