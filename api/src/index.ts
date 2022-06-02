import express from "express";
import cookieParser from "cookie-parser";
import cors from "cors";
import routes from "./routes/v1/routes";
import 'dotenv/config';


const app = express();

// middlewares

// cookie parser
app.use(cookieParser());

//cors
app.use(
    cors({
        credentials: true,
        origin: "http://localhost:3001",
    })
);

// parse json request body
app.use(express.json());

// parse urlencoded request body
app.use(express.urlencoded({ extended: true }));

// routes
app.use("/", routes);

// listen to port
app.listen(5000, () => {
    console.log("Server Running at port 5000");
});