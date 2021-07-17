const mongoose= require('mongoose');

mongoose.connect('mongodb+srv://admin:112224448Aa--@cluster0.hg85r.mongodb.net/MarketTicker?retryWrites=true',{
    useCreateIndex:true,
    useNewUrlParser:true,
    useUnifiedTopology:true
}).then((result) => {
    console.log(`Mongo DB Connected`);
}).catch((err) => {
    console.log(`Someting went wrong`);
});