exports.login =  (req, res) => {
    const {email, password } = req.body

    let existingUser = {
        email: "thulani@karabo.co.za", 
        password: "Thapelo"
    };

    try {
        if (existingUser.email === email && existingUser.password === password ) {
            res.json({message: "You are logged in", isAuthenticated: true});
            return
        }

        res.status(404).json({message: "Invalid Credentials Provided", isAuthenticated: false})
    } catch (err) {

    }
  };