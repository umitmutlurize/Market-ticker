const { json } = require('express');
const express=require('express');
const app=express();
require('./db/connection');

app.use(express.json());
app.use(express.urlencoded({extended:true}));


app.get('/',(req,res)=>{
    res.send('Home Screen');
});


const PORT=process.env.PORT||3000;

app.listen(PORT,()=>{console.log('Server listenin on '+PORT);});