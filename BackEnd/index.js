const express = require('express')
const mongoose = require('mongoose')
const app = express()
const path = require('path');
require('dotenv').config({
    override: true,
    path: path.join(__dirname, 'Dev.env')
});
const {Pool, Client} = require ("pg"); 

const pool = new Pool({
    user: process.env.USER,
    host: process.env.HOST,
    database: process.env.DATABASE,
    password: process.env.PASSWORD,
    port: process.env.PORT
});

async function connectMongo(){
    try{
        await mongoose.connect(process.env.URL)
        console.log("Connect to mongoDB")
    }catch(err){
        console.error(err)
    }
}


app.listen(3000, () => {
    connectMongo(); 
    console.log("Server Started!")
})



