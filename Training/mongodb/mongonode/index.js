const express = require('express');
const app = express();
const { MongoClient } = require('mongodb');



const uri = "mongodb+srv://sri-maddineni:FTyAUhjub2WCgU0B@ecommerce.zlkdwaf.mongodb.net/Ecommerce";
const client = new MongoClient(uri);


async function run() {
    try {
        await client.connect();
        const db = client.db('Learn');
        const collection = db.collection('db');

        // Find the first document in the collection
        const first = await collection.findOne();
        console.log(first);
        return first

    } finally {
        // Close the database connection when finished or an error occurs
        await client.close();
    }
}


run().catch(console.error);

app.get('/', (req, res) => {
    res.send('Hello, world!');
    res.send(run())
});

app.listen(3000, () => {
    console.log('Server is running on port 3000');
});





