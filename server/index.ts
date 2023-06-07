import express, { json, urlencoded, Request, Response } from "express";
import cors from "cors"
import swaggerUI from "swagger-ui-express";
import swaggerJSDoc from "swagger-jsdoc";
import userRouter from "./routers/users";

const app = express();
const port = 3000;

const swaggerDefinition = {
    openapi: "3.0.0",
    info: {
        title: "track expenses",
        version: "1.0.0",
    },
    servers: [
        {
            url: "http://localhost:3000",
            description: "Local development server",
        },
    ],
};

const openapiSpecification = swaggerJSDoc({
    swaggerDefinition,
    apis: ["./routers/*.ts"],
});

app.use(cors());
app.use(json());
app.use(urlencoded({ extended: true }));

app.use("/api-docs", swaggerUI.serve, swaggerUI.setup(openapiSpecification));
app.use("/swagger.json", (req: Request, res: Response) => res.json(openapiSpecification).status(200));


app.use("/users", userRouter);

app.listen(port, () => console.log(`Application started on port: ${port}`));