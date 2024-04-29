"use strict";
var __importDefault = (this && this.__importDefault) || function (mod) {
    return (mod && mod.__esModule) ? mod : { "default": mod };
};
Object.defineProperty(exports, "__esModule", { value: true });
exports.handler = void 0;
const dotenv_1 = __importDefault(require("dotenv"));
dotenv_1.default.config();
const handler = async (event) => {
    const customText = event.queryStringParameters?.text || "Hello World";
    return {
        statusCode: 200,
        body: JSON.stringify({
            environment: process.env.LAMBDA_ENVIRONMENT,
            message: process.env.LAMBDA_MESSAGE,
            customText: customText,
        }),
    };
};
exports.handler = handler;
