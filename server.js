const express = require("express");
const app = express();
const path = require('path')
const cors = require('cors')
app.use(express.static(path.resolve(__dirname,'public')))
app.set('view engine','ejs')
app.use(cors())

const port = 3000;
const userRouter = require('./routes/user');
const verifyRouter = require('./routes/verify')
const centreRouter = require('./routes/centre')
const bodyParser= require('body-parser')
const homeRouter = require('./routes/home')
const dashboard = require('./routes/admin');
const { connect } = require("./utils/connection");
const connection = require("./utils/connection");
const cookieParser = require('cookie-parser')
app.use(bodyParser.json())
app.use(bodyParser.urlencoded({extended:true}));
app.use(cookieParser())



app.use('/api',homeRouter)
app.use('/users',userRouter);
app.use('/login/verify',verifyRouter)
app.use('/admin',dashboard)

//TODO:remove connect and connect only once

app.get('/',(req,res) =>{

    if(req.cookies.logged == 'false'){
       res.redirect('/admin/login')
    }else{

        res.render('home',{
            welcomeMessage:"welcome admin.."
        })
    }
})

app.use(centreRouter)
app.listen(port, () => console.log(`Example app listening on port ${port}!`));

